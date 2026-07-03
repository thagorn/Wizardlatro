-- Wand of Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 1 },
    key = "wand_fireball",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { has_cast = true, charged = true, reusable = true, spell = 'j_wlt_fireball', mana_cost = 2, mana_cost_label = '' } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_fireball
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
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.charged = true
        end
    end
}

-- Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 1 },
    key = "fireball",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { xmult = 2 }
    },
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
