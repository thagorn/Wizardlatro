-- Astromancer
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 0 }, -- TODO
    key = "astromancer",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 3,
    cost = 8,
    config = { extra = { } },
    calculate = function(self, card, context)
        if context.before then
            for _, consumeable in ipairs(G.consumeables.cards) do
                if consumeable and type(consumeable) == 'table' and consumeable.ability.consumeable.hand_type == context.scoring_name then
                    return {
                        level_up = true,
                        message = localize('k_level_up_ex')
                    }
                end
            end
        end
    end
}
