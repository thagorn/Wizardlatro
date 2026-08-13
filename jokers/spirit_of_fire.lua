-- Spirit of Fire
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 6 },
    key = "spirit_of_fire",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { Xmult = 1.5, mana_cost = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost, card.ability.extra.Xmult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") then
            if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                return {
                    xmult = card.ability.extra.Xmult
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
