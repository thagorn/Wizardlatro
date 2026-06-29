-- Wizard Tower
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    key = "wizard_tower",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { chips = 0, chip_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_mod, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.spend_mana and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chip_mod * context.spent_mana)
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
