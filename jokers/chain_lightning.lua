-- Wand of Chain Lightning
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 3 },
    key = "wand_chain_lightning",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { 
        has_cast = true,
        charged = true,
        reusable = true,
        spell = 'j_wlt_chain_lightning',
        base_mana_cost = 1,
        mana_cost_multiplier = 2,
        mana_cost = 1,
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
        if context.cast_spell and (card == context.card) then
            card.ability.extra.charged = true
            card.ability.extra.mana_cost = card.ability.extra.mana_cost * card.ability.extra.mana_cost_multiplier
            self:set_ability(card, false, false)
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.mana_cost = card.ability.extra.base_mana_cost
            self:set_ability(card, false, false)
        end
    end
}

-- Chain Lightning
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 3 },
    key = "chain_lightning",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { repetitions = 1, position = 0 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    calculate = function(self, card, context)
        calc_spell_cast(self, card, context)
        if context.before then
            card.ability.extra.position = pseudorandom('j_wlt_chain_lightning', 1, #context.scoring_hand)
        end
        if context.repetition and context.cardarea == G.play and context.other_card == context.scoring_hand[card.ability.extra.position] then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}
