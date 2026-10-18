JokerDisplay.Definitions["j_wlt_mana_spring"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mana" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    calc_function = function(card)
        card.joker_display_values.mana = card.ability.extra.mana * G.GAME.round_resets.hands
    end
}
