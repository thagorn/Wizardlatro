SMODS.Suit {
    key = 'Octarine',
    card_key = 'O',
    pos = { y = 0 },
    ui_pos = { x = 0, y = 0 },
    sort_id = 5,
    lc_atlas = 'suits',
    lc_ui_atlas = 'suits_ui',
    lc_colour = HEX('7C58FF'),
    hc_atlas = 'suits',
    hc_ui_atlas = 'suits_ui',
    hc_colour = HEX('7C58FF'),
    in_pool = function(self, args)
        -- in_pool overrides the back's initial_deck definition
        if G.GAME.selected_back_key and -- \\
            (G.GAME.selected_back_key.name == 'b_wlt_test' or -- \\
            G.GAME.selected_back_key.name == 'b_wlt_archmage') then
            return true
        end
        if args.initial_deck then
            return false
        end
        return true
    end
}
