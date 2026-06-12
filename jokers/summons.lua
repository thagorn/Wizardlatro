-- Fountain of Mana
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 1 }, -- TODO
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
        return { vars = { card.ability.extra.mana, colours = { HEX('1400CE') } } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana)
        end
    end
}
