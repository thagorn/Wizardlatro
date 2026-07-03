-- Graduation
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 4, y = 4 },
    key = "graduation",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        if context.discard and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 2 and context.other_card == context.full_hand[1] then
            if (SMODS.has_no_rank(context.full_hand[1])) or (SMODS.has_no_rank(context.full_hand[2])) then
                return {
                    message = localize('k_nope_ex')
                }
            end
            local grad_card = context.full_hand[1]
            local target_rank = context.full_hand[2].base.value
            assert(SMODS.change_base(grad_card, nill, target_rank, true))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = (function()
                    grad_card:set_sprites(nil, grad_card.config.card)
                    return true
                end)
            }))
            return {
                message = localize('wlt_poof_ex'),
                message_card = grad_card,
                delay = 0.45
            }
        end
    end
}
