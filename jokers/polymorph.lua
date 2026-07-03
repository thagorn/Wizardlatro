-- Scroll of Polymorph
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 2 },
    key = "scroll_polymorph",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { has_cast = true, charged = true, reusable = false, spell = 'j_wlt_polymorph', mana_cost = 3, mana_cost_label = '' } },
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

-- Polymorph
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 2 },
    key = "polymorph",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = {}
    },
    calculate = function(self, card, context)
        calc_spell_cast(self, card, context)
        if context.destroying_card and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.3,
                func = (function()
                    local new_card = SMODS.add_card({set = 'Enhanced', key_append = 'j_wlt_polymorph'})
                    SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                    return true
                end)
            }))
            delay(0.1)
            return {
                message = localize('wlt_poof_ex'),
                remove = true
            }
        end
    end
}
