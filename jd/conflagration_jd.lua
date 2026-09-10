JokerDisplay.Definitions["j_wlt_wand_conflagration"] = {
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
JokerDisplay.Definitions["j_wlt_conflagration"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    },
    reminder_text = {
        { text = "(" },
        { text = "burns cards", colour = G.C.RED, scale = 0.35 },
        { text = ")" },
    },
    calc_function = function(card)
        local count = 0
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
            end
        end
        card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
    end
}
