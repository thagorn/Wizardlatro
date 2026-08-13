-- Spirit of Magic
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 4, y = 6 },
    key = "spirit_of_magic",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { mana_gain = 2, mana_cost = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost, card.ability.extra.mana_gain } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("wlt_Octarine") then
            if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                WLT.update_current_mana(card.ability.extra.mana_gain)
                SMODS.calculate_effect({
                    message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana_gain } },
                    colour = G.ARGS.LOC_COLOURS.wlt_mana
                }, context.other_card)
            else
                return {
                    message = localize('wlt_no_mana_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
