-- Scroll of Miracle
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 5 },
    key = "scroll_miracle",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { has_cast = true, charged = true, reusable = false, spell = 'j_wlt_miracle', mana_cost = 3, mana_cost_label = '' } },
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
}

-- Miracle
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 5 },
    key = "miracle",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { pack = 'p_wlt_aethereal_normal_1' }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.pack]
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        calc_spell_cast(self, card, context)
        if context.selling_self then
            local lock = card.ID
			G.CONTROLLER.locks[lock] = true
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = (function()
					local booster = SMODS.create_card { key = card.ability.extra.pack, area = G.play }
					booster.T.x = G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2
					booster.T.y = G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2
					booster.T.w = G.CARD_W * 1.27
					booster.T.h = G.CARD_H * 1.27
					booster.cost = 0
                    -- Just means the booster wasn't purchased
					booster.from_tag = true
                    -- Add the selected card to hand not deck
                    booster.config.center.select_card = 'hand'
                    -- Don't put hand back in deck when finishing booster
                    booster.config.center.wlt_skip_draw = true
					G.FUNCS.use_card({ config = { ref_table = booster } })
					booster:start_materialize()
					G.CONTROLLER.locks[lock] = nil
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
    end
}
