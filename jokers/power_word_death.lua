-- Power Word Death
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 9, y = 4 },
    key = "power_word_death",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.c_death
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.game_over and SMODS.last_hand.scoring_name == 'High Card' then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card({key='c_death'})
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                        return true
                    end)
                }))
                return nil, true -- This is for Joker retrigger purposes
            end
        end
    end
}
