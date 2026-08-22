-- Potion of Amnesia
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 6 },
    key = "amnesia_potion",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = {
        uses = 2,
        has_button = true,
        button_text = nil,
        button_colour = G.C.MONEY
    } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.uses } }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if initial then
            card.ability.extra.button_text = localize('wlt_drink')
        end
    end,
    button_active = function(self, card)
        if G.STATE == G.STATES.SHOP then
            return true
        end
        return false
    end,
    button_click = function(self, card)
        G.GAME.current_round.reroll_cost_increase = 0
        G.GAME.current_round.reroll_cost = G.GAME.round_resets.reroll_cost
        SMODS.calculate_effect({
            message = localize('wlt_huh_q'),
            colour = G.C.UI.TEXT_INACTIVE
        }, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        if card.ability.extra.uses == 0 then
           SMODS.destroy_cards(card, nil, nil, true)
           SMODS.calculate_effect({
               message = localize('wlt_drank_ex'),
               colour = G.C.RED
           }, card)
        end
    end
}
