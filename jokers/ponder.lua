-- Ponder
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 8, y = 3 },
    key = "ponder",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { active = false, cards = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cards } }
    end,
    calculate = function(self, card, context)
        if context.before then
            card.ability.extra.active = true
        end
        if card.ability.extra.active and context.drawing_cards then
            card.ability.extra.active = false
            return {
                cards_to_draw = card.ability.extra.cards
            }
        end
        if context.end_of_round and context.main_eval and not context.game_over then
            card.ability.extra.active = false
        end
    end
}
