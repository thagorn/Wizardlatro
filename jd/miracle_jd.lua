JokerDisplay.Definitions["j_wlt_scroll_miracle"] = {
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
JokerDisplay.Definitions["j_wlt_miracle"] = {
    reminder_text = {
        { text = "Sell me!" },
    },
    reminder_text_config = { colour = G.C.GREEN, scale = 0.35 },
}
