-- Aethereal
SMODS.Edition({
    key = "aethereal",
    shader = "wlt_aethereal",
    disable_base_shader = true,
    disable_shadow = true,
    discovered = true,
    unlocked = true,
    config = {},
    in_shop = true,
    weight = 3,
    extra_cost = 4,
    apply_to_float = true,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
    in_pool = function(self, args)
        -- allows standard packs and card creation but not jokers
        return string.find(args.source, 'standard_edition')
    end,
    calculate = function(self, card, context)
        if context.play_mana and context.other_card == card then
            return {
                invert = true
            }
        end
    end
})
