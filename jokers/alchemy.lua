-- Alchemy
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 0 },
    key = "alchemy",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function(self, card)
        return G.GAME.WLT_STATE.rem_mana * card.ability.extra.dollars
    end
}
