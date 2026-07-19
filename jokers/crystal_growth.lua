-- Crystal Growth
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 4 },
    key = "crystal_growth",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { transform = 3, progress = 0, h_size = 3 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_wlt_crystal']

        return { vars = { card.ability.extra.h_size, card.ability.extra.transform } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    calculate = function(self, card, context)
        if context.hand_drawn and card.ability.extra.progress < card.ability.extra.transform then
		    for i = 1, #context.hand_drawn do
                local playing_card = context.hand_drawn[i]
                if not SMODS.has_enhancement(playing_card, 'm_wlt_crystal') then
                    WLT.transform_card(playing_card, 'm_wlt_crystal', 'coin7')

                    card.ability.extra.progress = card.ability.extra.progress + 1
                    if card.ability.extra.progress >= card.ability.extra.transform then
                        break
                    end
                end
            end
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.progress = 0
        end
    end
}
