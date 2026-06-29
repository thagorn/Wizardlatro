-- Coven of the Meek
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    key = "coven_of_the_meek",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { spell = 'j_wlt_power_of_many', mana_cost = 0, queued = 0 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_power_of_many
        return { vars = { card.ability.extra.mana_cost } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 and not context.blueprint then
            card.ability.extra.queued = card.ability.extra.queued + 1
            return {
                message = localize('wlt_cast_ex')
            }
        end

        if context.after then
            for i = 1, card.ability.extra.queued, 1 do
                spell = SMODS.add_card({key = card.ability.extra.spell, no_edition = "true", stickers = nil})
                spell.ability.extra.fresh = true
                SMODS.calculate_context({cast_spell = true, card = card})
            end
            card.ability.extra.queued = 0
        end
    end
}

-- Power of Many
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 1 },
    key = "power_of_many",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { xmult = 1.3, fresh = false }
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
