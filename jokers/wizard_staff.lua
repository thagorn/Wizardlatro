-- Wizard Staff
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 0 },
    key = "wizard_staff",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 5,
    config = { extra = { has_cast = true,
                        charged = false,
                        reusable = true,
                        spell = 'j_wlt_empty',
                        spell_name = '',
                        mana_cost = 0,
                        mana_cost_label = ''
                    } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = { card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.spell]
        return { vars = { card.ability.extra.spell_name } }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
            card.ability.extra.spell_name = localize({
                                                    type = 'name_text',
                                                    key = card.ability.extra.spell,
                                                    set = 'Joker'
                                                })
    end,
    calculate = function(self, card, context)
        if context.cast_spell then
            if not (card == context.card) then
                card.ability.extra.spell = context.card.ability.extra.spell
                card.ability.extra.mana_cost = context.card.ability.extra.mana_cost
                card.ability.extra.charged = true
            else
                card.ability.extra.spell = 'j_wlt_empty'
                card.ability.extra.mana_cost = 0
            end
            self:set_ability(card, false, false)
        end
    end
}
