JokerDisplay.Definitions["j_wlt_scroll_iceforge"] = {
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
JokerDisplay.Definitions["j_wlt_iceforge"] = {
    text = {
        { text = "-" },
        { ref_table = "card.joker_display_values", ref_value = "mana" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    calc_function = function(card)
        card.joker_display_values.mana = (G.GAME.WLT_STATE.cur_mana - G.GAME.WLT_STATE.play_mana)
    end
}
JokerDisplay.Definitions["j_wlt_fountain_of_mana"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mana" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
}
