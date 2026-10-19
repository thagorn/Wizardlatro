JokerDisplay.Definitions["j_wlt_power_of_three"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mana" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = localize((G.GAME.current_round.wlt_three_card or {}).rank or 'Ace', 'ranks')
    end,
}
