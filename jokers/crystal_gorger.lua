-- Crystal Gorger
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 4 },
    key = "crystal_gorger",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { mana = 1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_wlt_crystal']
        info_queue[#info_queue + 1] = { key = 'o_wlt_mana_pool_keyword', set = 'Other' }
        return { vars = { card.ability.extra.mana } }
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_wlt_crystal') then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
        if context.before then
            local all_crystal = true
            for i = 1, #context.scoring_hand do
                if not SMODS.has_enhancement(context.scoring_hand[i], 'm_wlt_crystal') then
                    all_crystal = false
                    break
                end
            end
            if all_crystal then
                for i = 1, #context.scoring_hand do
                    local playing_card = context.scoring_hand[i]
                    SMODS.destroy_cards(playing_card)
                    SMODS.calculate_effect({
                        message = localize('wlt_munch_ex'),
                        colour = HEX('8c75e1')
                    }, card)
                end
                local mana_increase = #context.scoring_hand * card.ability.extra.mana
                change_max_mana(mana_increase)
                return {
                    message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { mana_increase } },
                    colour = G.ARGS.LOC_COLOURS.wlt_mana
                }
            end
        end
    end
}
