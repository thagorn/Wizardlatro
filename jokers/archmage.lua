-- Archmage
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 1 },
    key = "archmage",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 3,
    cost = 8,
    config = { extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker:is_rarity("wlt_spell") then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
