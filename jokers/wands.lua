-- Wand of Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 1 }, -- TODO
    key = "wand_fireball",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { has_cast = true, charged = true, spell = 'j_wlt_fireball', mana_cost = 2, mana_cost_label = '' } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost, colours = { HEX('1400CE')} } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_fireball
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            card.ability.extra.charged = true
        end
    end
}
