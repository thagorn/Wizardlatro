-- Crossbow
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 4 },
    key = "crossbow",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { has_cast = true, charged = true, reusable = true, spell = 'j_wlt_ray_of_wood', mana_cost = 0, mana_cost_label = '' } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.spell]
        return { vars = { card.ability.extra.mana_cost } }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
    end,
    calculate = function(self, card, context)
        if context.after then
            card.ability.extra.charged = true
        end
    end
}

-- Ray of Wood
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 4 },
    pixel_size = { w = 40, h = 40 }, -- Actual size = 16 x 16
    key = "ray_of_wood",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { mult = 10 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
            }
        end
    end
}
