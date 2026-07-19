-- Health potion
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 4 },
    key = "health_potion",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { soul_gain = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.soul_gain } }
    end,
    calculate = function(self, card, context)
        if context.selling_self then
            play_sound('highlight1', 0.9 + math.random() * 0.1, 0.8)
            WLT.update_current_soul(card.ability.extra.soul_gain)
        end
    end
}
