-- Satchel
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 6 },
    key = "satchel",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { c_size = 2 } },
    loc_vars = function(self, info_queue, card)

        return { vars = { card.ability.extra.c_size } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.consumeables:change_size(card.ability.extra.c_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.consumeables:change_size(-card.ability.extra.c_size)
    end,
}
