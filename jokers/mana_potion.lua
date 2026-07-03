-- Mana potion
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 0 },
    key = "mana_potion",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { mana_loss = 4, mana = 20 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana, card.ability.extra.mana_loss } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.game_over and not context.blueprint then
            if card.ability.extra.mana <= card.ability.extra.mana_loss then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('wlt_drank_ex'),
                    colour = G.C.RED
                }
            else
                card.ability.extra.mana = card.ability.extra.mana - card.ability.extra.mana_loss
                return {
                    message = localize { type = 'variable', key = 'wlt_mana_minus', vars = { card.ability.extra.mana_loss } },
                    colour = G.ARGS.LOC_COLOURS.wlt_mana
                }
            end
        end
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana)
            return {
                message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
                colour = G.ARGS.LOC_COLOURS.wlt_mana
            }
        end
    end
}
