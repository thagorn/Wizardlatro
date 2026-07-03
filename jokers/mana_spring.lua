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
