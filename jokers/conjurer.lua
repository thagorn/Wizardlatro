-- Conjurer
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 4 },
    key = "conjurer",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { mult = 4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * (G.GAME.spell_casts or 0) } }
    end,
    calculate = function(self, card, context)
        if context.cast_spell and not context.blueprint then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult * G.GAME.spell_casts } }
            }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * (G.GAME.spell_casts or 0)
            }
        end
    end
}
