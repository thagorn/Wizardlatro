reset_wlt_power_of_three = function()
    G.GAME.current_round.wlt_three_card = { rank = 'Ace' }
    local valid_pot_cards = {}
	local all_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_rank(playing_card) then
            local count = all_cards[playing_card.base.id]
            if count and count > 2 then 
                valid_pot_cards[#valid_pot_cards + 1] = playing_card
            elseif count then 
                all_cards[playing_card.base.id] = count + 1
            else
                all_cards[playing_card.base.id] = 1
            end
        end
    end
    local pot_card = pseudorandom_element(valid_pot_cards, 'wlt_pot' .. G.GAME.round_resets.ante)
    if pot_card then
        G.GAME.current_round.wlt_three_card.rank = pot_card.base.value
        G.GAME.current_round.wlt_three_card.id = pot_card.base.id
    end
end

-- Power of Three
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 3 },
    key = "power_of_three",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { mana_gain = 1, mana = 0, rank = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.mana,
            card.ability.extra.mana_gain,
            localize((G.GAME.current_round.wlt_three_card or {}).rank or 'Ace', 'ranks')
        }}
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local valid_hand = false
            for _, toak in ipairs(context.poker_hands['Three of a Kind']) do
                valid_hand = true
                for _, toak_card in ipairs(toak) do
                    if not (toak_card:get_id() == G.GAME.current_round.wlt_three_card.id) then
                        valid_hand = false
                    end
                end
            end

            if valid_hand then
                card.ability.extra.mana = card.ability.extra.mana + card.ability.extra.mana_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.ARGS.LOC_COLOURS.wlt_mana
                }
            end
        end
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana)
            return {
                message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
                colour = G.ARGS.LOC_COLOURS.wlt_mana
            }
        end
    end
}
