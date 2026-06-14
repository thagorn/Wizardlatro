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
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
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
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_blueprint", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_wand_fireball", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_scroll_iceforge", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_wizard_staff", no_edition="true", stickers=nil})
                return true
            end
        }))
        apply_mana_decks(self, back)
    end,
    calculate = calc_mana_decks,
})
