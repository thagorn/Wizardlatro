WLT.burn_card = function(card)
    WLT.burn_queue[#WLT.burn_queue + 1] = card
end

WLT.burn_queued_cards = function()
    local destroyed_cards = {}
    for _, card in ipairs(WLT.burn_queue) do
        if (card.edition and card.edition['wlt_burned']) then
            destroyed_cards[#destroyed_cards + 1] = card
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    -- TODO: Needs better sound design
                    play_sound('crumple'..math.random(1, 5), math.random()*0.2 + 0.9,0.5)
                    card:set_edition('e_wlt_burned', false, true)
                    return true
                end
            }))
        end
    end
    SMODS.destroy_cards(destroyed_cards)
    WLT.burn_queue = {}
end
