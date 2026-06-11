calc_spell_cast = function(self, card, context)
    if context.after and not context.blueprint then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
            message = localize('wlt_cast_ex')
        }
    end
end

-- Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 1 }, -- TODO
    key = "fireball",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1, -- TODO
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { xmult = 2 }
    },
    in_pool = function(self, args)
        return false
    end,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        calc_spell_cast(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
}
