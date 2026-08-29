JokerDisplay.Definitions["j_wlt_archmage"] = {
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "count",          colour = G.C.ORANGE },
        { text = "x" },
        { ref_table = "card.joker_display_values", ref_value = "localized_text", colour = G.C.GREEN },
        { text = ")" },
    },
    calc_function = function(card)
        local count = 0
        if G.jokers then
            for _, joker_card in ipairs(G.jokers.cards) do
                if joker_card.config.center.rarity and joker_card.config.center.rarity == 'wlt_spell' then
                    count = count + 1
                end
            end
        end
        card.joker_display_values.count = count
        card.joker_display_values.localized_text = localize("k_wlt_spell")
    end,
    mod_function = function(card, mod_joker)
        return { x_mult = (card.config.center.rarity == 'wlt_spell' and mod_joker.ability.extra.xmult ^ JokerDisplay.calculate_joker_triggers(mod_joker) or nil) }
    end
}
