-- Magic
SMODS.Consumable {
    key = "magic",
    set = "Tarot",
    pos = { x = 1, y = 0 },
    atlas = "consumeables",
    discovered = true,
    config = { max_highlighted = 3, suit_conv = 'wlt_Octarine' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_octarine', set = 'Other'}
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { 
            card.ability.max_highlighted,
            localize(card.ability.suit_conv, 'suits_plural'),
            colours = {
                G.C.SUITS[card.ability.suit_conv]
            },
        } }
    end,
}
