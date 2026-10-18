JokerDisplay.Definitions["j_wlt_pot_of_gold"] = {
    text = {
        { text = "+$" },
        { ref_table = "card.ability.extra", ref_value = "dollars" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" }
    },
    calc_function = function(card)
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
    end
}
