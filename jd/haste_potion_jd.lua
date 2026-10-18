JokerDisplay.Definitions["j_wlt_haste_potion"] = {
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "uses" },
        { text = "/" },
        { ref_table = "card.joker_display_values", ref_value = "start_count" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.start_count = G.GAME.round_resets.hands + card.ability.extra.hand_loss
        card.joker_display_values.uses = G.GAME.round_resets.hands
    end,
    style_function = function(card, text, reminder_text, extra)
        local children = reminder_text and reminder_text.children
        if not children then return end

        local colour = (card.joker_display_values.uses == 1) and G.C.RED or G.C.UI.TEXT_INACTIVE
        for i = 2, 4 do
            local child = children[i]
            if child then child.config.colour = colour end
        end
    end,
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return JokerDisplay.in_scoring(playing_card, scoring_hand) and joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end,
}
