JokerDisplay.Definitions["j_wlt_hedge_wizard"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
        card.joker_display_values.mult = card.ability.extra.mult * (G.GAME.spell_casts or 0)
    end,
}
