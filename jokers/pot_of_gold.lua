-- Pot of Gold
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 6 },
    key = "pot_of_gold",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { dollars = 0, dollar_inc = 1, poker_hand = 'wlt_Rainbow' } },
    loc_vars = function(self, info_queue, card)
        return { vars = { 
            card.ability.extra.dollars,
            card.ability.extra.dollar_inc,
            localize(card.ability.extra.poker_hand, 'poker_hands')
        } }
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint and next(context.poker_hands[card.ability.extra.poker_hand]) then
            card.ability.extra.dollars = card.ability.extra.dollars + card.ability.extra.dollar_inc
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MONEY
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars
    end
}
