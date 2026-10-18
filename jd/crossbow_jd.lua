JokerDisplay.Definitions["j_wlt_crossbow"] = {
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
JokerDisplay.Definitions["j_wlt_ray_of_wood"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT }
}
