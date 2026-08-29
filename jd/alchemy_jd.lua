JokerDisplay.Definitions["j_wlt_alchemy"] = {
    text = {
        { text = "+$" },
        { ref_table = "card.joker_display_values", ref_value = "dollars" },
    },
    text_config = { colour = G.C.GOLD },
    reminder_text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" }
    },
    calc_function = function(card)
        card.joker_display_values.dollars = (G.GAME.WLT_STATE.cur_mana - G.GAME.WLT_STATE.play_mana) * card.ability.extra.dollars
        card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
    end
}
