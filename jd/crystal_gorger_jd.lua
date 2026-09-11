JokerDisplay.Definitions["j_wlt_crystal_gorger"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
    },
    calc_function = function(card)
        local count = 0
        local valid = true
        local text, _, scoring_hand = JokerDisplay.evaluate_hand()
        if text ~= 'Unknown' then
            for _, scoring_card in pairs(scoring_hand) do
                if SMODS.has_enhancement(scoring_card, 'm_wlt_crystal') then
                    count = count + 1
                else
                    valid = false
                end
            end
        end

        if not valid or count < 1 then
            card.joker_display_values.valid = false
            card.joker_display_values.localized_text = "(" .. localize("jdis_inactive") .. ")"
        else
            card.joker_display_values.valid = true
            card.joker_display_values.localized_text = "+" .. count .. " mana pool"
        end
    end,
    style_function = function(card, text, reminder_text, extra)
        if text and text.children[1] then
            if card.joker_display_values.valid then
                text.children[1].config.colour = HEX('5044c1')
                text.children[1].config.scale = 0.4
            else
                text.children[1].config.colour = G.C.GREY
                text.children[1].config.scale = 0.3
            end
        end
    end,
}
