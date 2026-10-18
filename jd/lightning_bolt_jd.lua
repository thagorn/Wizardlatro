JokerDisplay.Definitions["j_wlt_wand_lightning_bolt"] = {
    text = {
        { text = "-" },
        { ref_table = "card.ability.extra", ref_value = "mana_cost" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.GREEN },
        { text = ")" },
    },
    calc_function = function(card)
        if card.ability.extra.charged then
            card.joker_display_values.localized_text = 'Charged'
        else
            card.joker_display_values.localized_text = 'Not Charged'
        end
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
            if card.ability.extra.charged then
                reminder_text.children[2].config.colour = G.C.GREEN
            else
                reminder_text.children[2].config.colour = G.C.GREY
            end
        end
    end,
}
JokerDisplay.Definitions["j_wlt_lightning_bolt"] = {
    retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
        if held_in_hand then return 0 end
        return JokerDisplay.in_scoring(playing_card, scoring_hand) and joker_card.ability.extra.repetitions * JokerDisplay.calculate_joker_triggers(joker_card) or 0
    end,
}
