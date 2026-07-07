-- Crystal Wizard
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 4 },
    key = "crystal_wizard",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { mana = 1 } },
    tally_crystal = function(self)
        local crystal_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wlt_crystal') then crystal_tally = crystal_tally + 1 end
            end
        end
        return crystal_tally
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['m_wlt_crystal']

        local crystal_tally = self:tally_crystal()
        return { vars = { card.ability.extra.mana, card.ability.extra.mana * crystal_tally } }
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
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana * self:tally_crystal())
            return {
                message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
                colour = G.ARGS.LOC_COLOURS.wlt_mana
            }
        end
    end
}
