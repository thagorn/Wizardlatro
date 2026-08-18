-- Spirit of Earth
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 6 },
    key = "spirit_of_earth",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { chips = 20, mana_cost = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
            if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                context.other_card.ability.perma_bonus = (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            else
                return {
                    message = localize('wlt_no_mana_ex'),
                    colour = G.C.RED
                }
            end
        end
    end
}
