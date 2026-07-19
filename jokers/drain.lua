-- Wand of Draining
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 0 },
    key = "wand_draining",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { has_cast = true, charged = true, reusable = true, spell = 'j_wlt_drain', mana_cost = 3, mana_cost_label = '' } },
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

-- Drain
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 0 },
    key = "drain",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { rank_change = 1 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.rank_change } }
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.before then
            for _, played_card in ipairs(context.scoring_hand) do
                assert(SMODS.modify_rank(played_card, card.ability.extra.rank_change, true))
				G.E_MANAGER:add_event(Event({
					func = function()
						played_card:set_sprites(nil, played_card.config.card)
						return true
					end
				}))
            end
            for _, hand_card in ipairs(G.hand.cards) do
                assert(SMODS.modify_rank(hand_card, -1 * card.ability.extra.rank_change, true))
				G.E_MANAGER:add_event(Event({
					func = function()
						hand_card:set_sprites(nil, hand_card.config.card)
						return true
					end
				}))
            end
            return {
                message = localize('wlt_drained_ex'),
                colour = HEX('230933')
            }
        end
    end
}
