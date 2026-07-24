-- Wand of Time Stretch
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 3 },
    key = "wand_time_stretch",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 8,
    config = { extra = { 
        has_cast = true,
        charged = true,
        reusable = true,
        spell = 'j_wlt_time_stretch',
        base_mana_cost = 1,
        mana_cost = 1,
        mana_cost_multiplier = 2,
        mana_cost_label = ''
    } },
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
        if context.cast_spell and (card == context.card) then
            card.ability.extra.mana_cost = card.ability.extra.mana_cost * card.ability.extra.mana_cost_multiplier
            self:set_ability(card, false, false)
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.mana_cost = card.ability.extra.base_mana_cost
            self:set_ability(card, false, false)
        end
    end
}

-- Time Stretch
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 3 },
    pixel_size = { w = 60, h = 50 }, -- Actual size 52 x 36
    key = "time_stretch",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { hands = 1 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands } }
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.before then
            ease_hands_played(card.ability.extra.hands)
            return {
                message = localize { type = 'variable', key = 'a_hands', vars = { card.ability.extra.hands } }
            }
        end
    end
}
