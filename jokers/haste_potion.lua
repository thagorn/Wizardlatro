-- Haste potion
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 4, y = 0 },
    key = "haste_potion",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 8,
    config = { extra = { hand_loss = 0, hand_loss_mod = 1, repetitions = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hand_loss, card.ability.extra.hand_loss_mod } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_loss
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_loss
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if G.GAME.round_resets.hands <= card.ability.extra.hand_loss_mod then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('wlt_drank_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.hand_loss = card.ability.extra.hand_loss + card.ability.extra.hand_loss_mod
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_loss_mod
                return {
                    message = localize { type = 'variable', key = 'wlt_hand_minus', vars = { card.ability.extra.hand_loss_mod } },
                    colour = G.C.ATTENTION
                }
            end
        end
        if context.repetition and context.cardarea == G.play then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
}
