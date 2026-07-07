-- Foresight
SMODS.Consumable {
    key = "foresight",
    set = "Tarot",
    pos = { x = 0, y = 0 },
    atlas = "consumeables",
    config = { max_highlighted = 1, mod_conv = 'm_wlt_crystal' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
}
