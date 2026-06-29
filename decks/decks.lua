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
    config = { 
        max_mana = 5,
        consumables = { "c_jupiter" },
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({key="j_wlt_mana_potion", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_blueprint", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_wand_lightning_bolt", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_archmage", no_edition="true", stickers=nil})
                return true
            end
        }))
        apply_mana_decks(self, back)
        sendInfoMessage(inspectDepth(G.ARGS.LOC_COLOURS))
    end,
    calculate = calc_mana_decks,
})
