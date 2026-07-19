-- Wand of Bonfire
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 5 },
    key = "wand_bonfire",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 3,
    cost = 8,
    config = { extra = { has_cast = true, charged = true, reusable = true, spell = 'j_wlt_bonfire', mana_cost = 8, mana_cost_label = '' } },
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
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.charged = true
        end
    end
}

-- Bonfire
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 5 },
    key = "bonfire",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { xmult = 1.5 }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS['e_wlt_burned']
        return { vars = { card.ability.extra.xmult } }
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round then
            WLT.burn_card(context.other_card)
            return {
                xmult = card.ability.extra.xmult,
            }
        end
    end
}
