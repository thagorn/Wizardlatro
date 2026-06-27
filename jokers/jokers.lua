-- Mana droplet
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    key = "mana_droplet",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { mana = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana } }
    end,
    calculate = function(self, card, context)
        if context.before then
            update_current_mana(card.ability.extra.mana)
        end
    end
}

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
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
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
        end
    end
}

-- Alchemy
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 0 },
    key = "alchemy",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { dollars = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calc_dollar_bonus = function(self, card)
        return WLT.MAGIC.rem_mana * card.ability.extra.dollars
    end
}

-- Mana Spring
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 0 },
    key = "mana_spring",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { mana = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana } }
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            update_current_mana(card.ability.extra.mana * G.GAME.current_round.hands_left)
        end
    end
}

-- Wizard Tower
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 0 },
    key = "wizard_tower",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { chips = 0, chip_mod = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_mod, card.ability.extra.chips } }
    end,
    calculate = function(self, card, context)
        if context.spend_mana and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + (card.ability.extra.chip_mod * context.spent_mana)
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

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
