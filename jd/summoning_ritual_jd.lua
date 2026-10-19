JokerDisplay.Definitions["j_wlt_scroll_ritual_1"] = {
    extra = {
        {
            { text = "(" },
            { ref_table = "card.ability.extra", ref_value = "progress" },
            { text = "/" },
            { ref_table = "card.ability.extra", ref_value = "goal" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.ORANGE, scale = 0.3 },
    text = {
        { text = "-" },
        { ref_table = "card.ability.extra", ref_value = "mana_cost" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    reminder_text = {
        { text = "(1/1)" },
    },
    reminder_text_config = { colour = G.C.UI.TEXT_INACTIVE }
}
JokerDisplay.Definitions["j_wlt_ritual_1"] = {
}
JokerDisplay.Definitions["j_wlt_scroll_ritual_2"] = {
    extra = {
        {
            { text = "(" },
            { ref_table = "card.ability.extra", ref_value = "progress" },
            { text = "/" },
            { ref_table = "card.ability.extra", ref_value = "goal" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.ORANGE, scale = 0.3 },
    text = {
        { text = "-" },
        { ref_table = "card.ability.extra", ref_value = "mana_cost" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    reminder_text = {
        { text = "(1/1)" },
    },
    reminder_text_config = { colour = G.C.UI.TEXT_INACTIVE }
}
JokerDisplay.Definitions["j_wlt_ritual_2"] = {
}
JokerDisplay.Definitions["j_wlt_scroll_ritual_3"] = {
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "progress" },
            { text = "/3)" },
        }
    },
    extra_config = { colour = G.C.ORANGE, scale = 0.3 },
    text = {
        { text = "-" },
        { ref_table = "card.ability.extra", ref_value = "mana_cost" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    reminder_text = {
        { text = "(1/1)" },
    },
    reminder_text_config = { colour = G.C.UI.TEXT_INACTIVE },
    calc_function = function(card)
        local progress = 0
        if card.ability.extra.common then
            progress = progress + 1
        end
        if card.ability.extra.uncommon then
            progress = progress + 1
        end
        if card.ability.extra.rare then
            progress = progress + 1
        end
        card.joker_display_values.progress = progress
    end
}
JokerDisplay.Definitions["j_wlt_ritual_3"] = {
}
JokerDisplay.Definitions["j_wlt_djinn"] = {
    text = {
        { text = "(" },
        { ref_table = "card.ability.extra", ref_value = "wishes" },
        { text = "/" },
        { ref_table = "card.ability.extra", ref_value = "max_wishes" },
        { text = ")" },
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.ability.extra", ref_value = "joker_name", colour = G.C.RARITY.Common },
        { text = ")" },
    },
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[2] then
            reminder_text.children[2].config.colour = card.ability.extra.joker_colour
        end
    end,
}
