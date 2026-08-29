JokerDisplay.Definitions["j_wlt_amnesia_potion"] = {
    reminder_text = {
        { text = "(" },
        { ref_table = "card.ability.extra",              ref_value = "uses" },
        { text = "/" },
        { ref_table = "card.joker_display_values", ref_value = "start_count" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.start_count = card.joker_display_values.start_count or card.ability.extra.uses
    end,
    style_function = function(card, text, reminder_text, extra)
        local children = reminder_text and reminder_text.children
        if not children then return end

        local colour = (card.ability.extra == 1) and G.C.RED or G.C.UI.TEXT_INACTIVE
        for i = 2, 4 do
            local child = children[i]
            if child then child.config.colour = colour end
        end
    end,
}
