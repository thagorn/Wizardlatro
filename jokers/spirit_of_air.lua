-- Spirit of Air
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 6 },
    key = "spirit_of_air",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 7,
    config = { extra = { mana_cost = 1, charges = 0 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana_cost, G.GAME.wlt_soa or 0 } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.wlt_soa = G.GAME.wlt_soa or 0
        G.GAME.wlt_soa_current = G.GAME.wlt_soa_current or 0
    end,
    remove_from_deck = function(self, card, from_debuff)
        if not next(SMODS.find_card("j_wlt_spirit_of_air")) then
            G.GAME.wlt_soa = 0
            G.GAME.wlt_soa_current = 0
        end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            -- Keeps diamonds from immediately retriggering themselves
            G.GAME.wlt_soa_current = G.GAME.wlt_soa
            if context.other_card:is_suit("Diamonds") then
                if WLT.attempt_spend_mana(card.ability.extra.mana_cost) then
                    -- Store retrigger charges from the current card on the joker
                    if not context.other_card.repetition_trigger then
                        -- We're on the first scoring which is before the repetition context
                        -- Store retriggers on the joker until after repetition context
                        sendInfoMessage('test')
                        card.ability.extra.charges = card.ability.extra.charges + 1
                    else
                        -- We're in retrigger scoring which is after the repetition context
                        -- And it's safe to directly update the global retriggers
                        sendInfoMessage('test2')
                        G.GAME.wlt_soa = G.GAME.wlt_soa + 1
                    end

                    return {
                        message = localize('wlt_zzzt'),
                        colour = HEX('fafba5')
                    }
                else
                    return {
                        message = localize('wlt_no_mana_ex'),
                        colour = G.C.RED
                    }
                end
            end
        end
        if context.repetition and context.cardarea == G.play then
            -- Retrigger the number of times we had previously saved up
            if G.GAME.wlt_soa_current > 0 then
                local repetitions = G.GAME.wlt_soa_current
                G.GAME.wlt_soa = G.GAME.wlt_soa - G.GAME.wlt_soa_current
                G.GAME.wlt_soa_current = 0
                return {
                    repetitions = repetitions
                }
            end
            -- Then add any new charges from the initial scoring
            G.GAME.wlt_soa = G.GAME.wlt_soa + card.ability.extra.charges
            card.ability.extra.charges = 0
        end
    end
}
