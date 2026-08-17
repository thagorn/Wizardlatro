-- Recycling
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 6 },
    key = "recycling",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = {} },
    calculate = function(self, card, context)
        if context.remove_playing_cards then
            local consumeables_space = G.consumeables.config.card_limit - (#G.consumeables.cards + G.GAME.consumeable_buffer)
            if consumeables_space > 0 then
                local recycle_queue = {}
                for _, removed_card in ipairs(context.removed) do
                    if SMODS.has_enhancement(removed_card, 'm_glass') then
                        recycle_queue[#recycle_queue + 1] = 'c_justice'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_steel') then
                        recycle_queue[#recycle_queue + 1] = 'c_chariot'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_wild') then
                        recycle_queue[#recycle_queue + 1] = 'c_lovers'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_gold') then
                        recycle_queue[#recycle_queue + 1] = 'c_devil'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_lucky') then
                        recycle_queue[#recycle_queue + 1] = 'c_magician'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_wlt_crystal') then
                        recycle_queue[#recycle_queue + 1] = 'c_wlt_foresight'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_stone') then
                        recycle_queue[#recycle_queue + 1] = 'c_tower'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_mult') then
                        recycle_queue[#recycle_queue + 1] = 'c_empress'
                    end
                    if SMODS.has_enhancement(removed_card, 'm_bonus') then
                        recycle_queue[#recycle_queue + 1] = 'c_heirophant'
                    end
                end
                if #recycle_queue > 0 then
                    local num = math.min(#recycle_queue, consumeables_space)
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + num
                    for position = 1,num do
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                SMODS.add_card({key=recycle_queue[position]})
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                                SMODS.calculate_effect({
                                    message = localize('wlt_mulch_ex'),
                                    colour = HEX('5c8d19')
                                }, card)
                                return true
                            end)
                        }))
                    end
                    return nil, true -- This is for Joker retrigger purposes
                end
            end
        end
    end
}
