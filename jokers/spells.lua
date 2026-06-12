calc_spell_cast = function(self, card, context)
    if context.after and not context.blueprint then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
            message = localize('wlt_cast_ex')
        }
    end
end

-- Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 1 }, -- TODO
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

-- Ice Forge
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 1 }, -- TODO
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
                fountain = SMODS.add_card({key = card.ability.extra.summon, no_edition = "true", stickers = nil})
            end
            fountain.ability.extra.mana = fountain.ability.extra.mana + remaining_mana
            spend_mana(remaining_mana)
        end
        calc_spell_cast(self, card, context)
    end
}
