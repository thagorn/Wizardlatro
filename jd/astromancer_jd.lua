JokerDisplay.Definitions["j_wlt_astromancer"] = {
    text = {
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.GREEN },
    },
    calc_function = function(card)
        local hands = ""
        local count = 0
        for _, consumeable in ipairs(G.consumeables.cards) do
            if consumeable and type(consumeable) == 'table' and consumeable.ability.consumeable.hand_type then
                if count > 0 then
                    hands = hands .. ",\r\n"
                end
                count = count + 1
                hands = hands .. localize(consumeable.ability.consumeable.hand_type, 'poker_hands')
            end
        end
        card.joker_display_values.localized_text = hands
    end,
}
