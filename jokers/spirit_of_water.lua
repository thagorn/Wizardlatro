-- Spirit of Water
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 6 },
    key = "spirit_of_water",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { mana_cost = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then
            if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                WLT.conjure(context.other_card, 'j_wlt_spirit_of_water')
                return nil, true -- This is for Joker retrigger purposes
            else
                return {
                    message = localize('wlt_no_mana_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
