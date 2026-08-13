-- Spirit of Air
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 6 },
    key = "spirit_of_air",
    blueprint_compat = false, -- can't keep track of charges on joker with BP, maybe move them to GAME object?
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { charges = 0, cur_charges = 0, mana_cost = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost, card.ability.extra.charges } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            -- Keeps diamonds from immediately retriggering themselves
            card.ability.extra.cur_charges = card.ability.extra.charges
            if context.other_card:is_suit("Diamonds") then
                if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                    card.ability.extra.charges = card.ability.extra.charges + 1
                else
                    return {
                        message = localize('wlt_no_mana_ex'),
                        colour = G.C.RED
                    }
                end
            end
        end
        if context.repetition and context.cardarea == G.play and card.ability.extra.cur_charges > 0 then
            local repetitions = card.ability.extra.cur_charges
            card.ability.extra.charges = 0
            return {
                repetitions = repetitions
            }
        end
    end
}
