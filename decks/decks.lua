SMODS.Atlas({
    key = "decks",
    path = "jokers.png", -- TODO
    px = 71,
    py = 95
})

SMODS.Back({
    key = "mana",
    pos = { x = 0, y = 0 },
    atlas = "decks",
    apply = function(self)
        G.E_MANAGER:add_event(Event({
            func = function()
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                return true
            end
        }))
    end,
})
