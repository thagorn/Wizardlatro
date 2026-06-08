SMODS.Atlas({
    key = "decks",
    path = "jokers.png", -- TODO
    px = 71,
    py = 95
})

calc_mana_decks = function(self, back, context)
    if context.end_of_round and context.game_over == false and context.main_eval then
        set_remaining_mana()
    end
end

apply_mana_decks = function(self, back)
    set_max_mana(self.config.max_mana)
    set_current_mana(self.config.max_mana)
end

SMODS.Back({
    key = "mana",
    pos = { x = 0, y = 0 },
    atlas = "decks",
    config = { max_mana = 5 },
    apply = function(self, back)
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
        apply_mana_decks(self, back)
    end,
    calculate = calc_mana_decks,
})

SMODS.Back({
    key = "test",
    pos = { x = 0, y = 1 },
    atlas = "decks",
    config = { max_mana = 5 },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_wlt_mana_droplet", nil, k ~= 1)
                add_joker("j_blueprint", nil, k ~= 1)
                add_joker("j_wlt_wizard_tower", nil, k ~= 1)
                return true
            end
        }))
        apply_mana_decks(self, back)
    end,
    calculate = calc_mana_decks,
})
