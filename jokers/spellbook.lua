-- Spellbook
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 5 },
    key = "spellbook",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 8,
    config = { extra = {} },
    calculate = function(self, card, context)
        if context.modify_shop_card or context.modify_booster_card then
            local joker = context.card
            if joker.ability.set == 'Joker' and type(joker.ability.extra) == 'table' and --\\
                joker.ability.extra.has_cast and not joker.ability.extra.reusable then
                joker:set_edition("e_negative", true)
                joker.cost = 0
            end
        end
    end
}
