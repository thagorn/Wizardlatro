JokerDisplay.Definitions["j_wlt_graduation"] = {
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.is_active = G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0
        card.joker_display_values.active_text = localize("jdis_" ..
            (card.joker_display_values.is_active and "active" or "inactive"))
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children and reminder_text.children[2] then
            reminder_text.children[2].config.colour = card.joker_display_values.is_active and G.C.GREEN or
                G.C.UI.TEXT_INACTIVE
        end
    end
}
