-- Scroll of Ice Forge
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 1 },
    key = "scroll_iceforge",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 5,
    config = { extra = { has_cast = true, charged = true, reusable = false, spell = 'j_wlt_iceforge', mana_cost = 2, mana_cost_label = '' } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_iceforge
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

-- Ice Forge
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 4, y = 1 },
    key = "iceforge",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = {
        extra_value = -1, -- Allows sell cost to be $0
        extra = { summon = 'j_wlt_fountain_of_mana' }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_fountain_of_mana
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.after then
            local remaining_mana = WLT.MAGIC.cur_mana
            local fountain_search = SMODS.find_card('j_wlt_fountain_of_mana', true)
            local _, fountain = next(fountain_search)
            if not fountain then
                fountain = SMODS.add_card({key = card.ability.extra.summon, stickers = nil})
            end
            fountain.ability.extra.mana = fountain.ability.extra.mana + remaining_mana
            spend_mana(remaining_mana)
        end
        calc_spell_cast(self, card, context)
    end
}

-- Fountain of Mana
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    key = "fountain_of_mana",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_summon',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { mana = 0 }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana)
        end
    end
}
