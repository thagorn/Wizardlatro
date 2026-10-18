JokerDisplay.Definitions["j_wlt_crystal_wizard"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text" },
        { text = " mana" },
    },
    text_config = { colour = HEX('5044c1') },
    calc_function = function(card)
        local crystal_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_wlt_crystal') then crystal_tally = crystal_tally + 1 end
            end
        end
        card.joker_display_values.localized_text = crystal_tally
    end,
}
