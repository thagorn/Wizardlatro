JokerDisplay.Definitions["j_wlt_succession_crisis"] = {
    text = {
        {
            border_nodes = {
                { text = "X" },
                { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
            }
        }
    },
    calc_function = function(card)
        local count = 0
        local text, poker_hands, scoring_hand = JokerDisplay.evaluate_hand()
        if poker_hands and poker_hands['Pair'] then
            for _, pair in ipairs(poker_hands['Pair']) do
                for _, paired_card in ipairs(pair) do
                    if paired_card:is_face(true) then
                        card.joker_display_values.x_mult = 0
                        return
                    end
                end
            end
        end
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if scoring_card:is_face(false) then
                    count = count + JokerDisplay.calculate_card_triggers(scoring_card, scoring_hand)
                end
            end
        end
        card.joker_display_values.x_mult = card.ability.extra.xmult ^ count
    end
}
