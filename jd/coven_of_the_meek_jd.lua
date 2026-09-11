JokerDisplay.Definitions["j_wlt_coven_of_the_meek"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "count", retrigger_type = "mult" },
        { text = " members" },
    },
	text_config = { scale = 0.35 },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text_three",  colour = G.C.ORANGE },
        { text = ")" },
    },
    calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:get_id() and scoring_card:get_id() == 3 then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text_three = localize("3", "ranks")
    end
}

JokerDisplay.Definitions["j_wlt_power_of_many"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" }
            }
        }
    },
}
