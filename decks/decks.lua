WLT.calc_mana_decks = function(self, back, context)
    if context.end_of_round and context.game_over == false and context.main_eval then
        WLT.set_remaining_mana()
    end
end

WLT.apply_mana_decks = function(self, back)
    WLT.initialize_state(self.config.max_mana, self.config.max_soul)
end

SMODS.Back({
    key = "mana",
    pos = { x = 1, y = 0 },
    atlas = "cards",
    config = { max_mana = 5, max_soul = 5 },
    loc_vars = function(self, info_queue, back)
        return { vars = { 
            localize { type = 'name_text', key = 'j_wlt_mana_droplet', set = 'Joker' },
            self.config.ante_scaling,
        } }
    end,
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
        WLT.apply_mana_decks(self, back)
    end,
    calculate = WLT.calc_mana_decks,
})

SMODS.Back({
    key = "archmage",
    pos = { x = 3, y = 0 },
    atlas = "cards",
    config = {
        max_mana = 5,
        max_soul = 5,
        ante_scaling = 2,
        consumables = { 'c_wlt_foresight', 'c_wlt_foresight' }
    },
    loc_vars = function(self, info_queue, back)
        return { vars = { 
            localize { type = 'name_text', key = self.config.consumables[1], set = 'Tarot' },
            self.config.ante_scaling,
        } }
    end,
    apply = function(self, back)
        WLT.apply_mana_decks(self, back)
    end,
    initial_deck = {
        ranks = { 'King', 'Queen', 'Jack', '10', '9', '8', '7', '6', '5', '4' },
        suits = { 'Hearts', 'Clubs', 'Spades', 'Diamonds', 'wlt_Octarine' }
    },
    calculate = WLT.calc_mana_decks,
})

SMODS.Back({
    key = "test",
    pos = { x = 2, y = 0 },
    atlas = "cards",
    config = { 
        max_mana = 5,
        max_soul = 5,
        consumables = {},
    },
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.add_card({key="j_wlt_mana_potion", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_mana_droplet", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_blueprint", no_edition="true", stickers=nil})
                SMODS.add_card({key="j_wlt_pot_of_gold", no_edition="true", stickers=nil})
                SMODS.change_free_rerolls(100)
                return true
            end
        }))
        WLT.apply_mana_decks(self, back)
    end,
    initial_deck = {
        ranks = { 'Ace', 'King', '2', '3', '4', '5' },
        suits = { 'Hearts', 'Clubs', 'Spades', 'Diamonds', 'wlt_Octarine' }
    },
    calculate = WLT.calc_mana_decks,
})
