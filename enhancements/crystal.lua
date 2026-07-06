-- Crystal
SMODS.Enhancement {
    key = "crystal",
    pos = { x = 0, y = 0 },
    atlas = "cards",
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    config = { extra = { mana = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana } }
    end,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            update_current_mana(card.ability.extra.mana)
            return {
                message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
                colour = G.ARGS.LOC_COLOURS.wlt_mana
            }
        end
    end,
}

-- TODO CrysTower
SMODS.Consumable {
    key = "crystower",
    set = "Tarot",
    pos = { x = 6, y = 1 },
    config = { max_highlighted = 1, mod_conv = 'm_wlt_crystal' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,

}
