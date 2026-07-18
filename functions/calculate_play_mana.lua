calculate_play_mana_card = function(card, scoring_hand)
    local mana = 0
    
    if SMODS.never_scores(card) then
        mana = 0
    elseif card:is_face(true) then
        mana = 2
    elseif not SMODS.has_no_rank(card) then
        mana = 1
    end

    local modifiers = {}
    SMODS.calculate_context({play_mana = true, other_card = card, scoring_hand = scoring_hand}, modifiers)

    for _, eval in pairs(modifiers) do
        if type(eval) == 'table' then
            for key, eval2 in pairs(eval) do
                if key == 'invert' or (type(eval2) == 'table' and eval2.invert) then
                    mana = mana * -1
                end
            end
        end
    end

    return mana
end

function calculate_play_mana(cardarea)
    local selected_cards = cardarea.highlighted
    local text,disp_text,poker_hands,scoring_hand,non_loc_disp_text = G.FUNCS.get_poker_hand_info(selected_cards)
    
    --Add all the pure bonus cards to the scoring hand
    local pures = {}
    for i=1, #selected_cards do
        if next(find_joker('Splash')) then
            scoring_hand[i] = selected_cards[i]
        else
            if selected_cards[i].ability.effect == 'Stone Card' then
                local inside = false
                for j=1, #scoring_hand do
                    if scoring_hand[j] == selected_cards[i] then
                        inside = true
                    end
                end
                if not inside then table.insert(pures, selected_cards[i]) end
            end
        end
    end
    for i=1, #pures do
        table.insert(scoring_hand, pures[i])
    end
    local mana = 0
    if scoring_hand and #scoring_hand > 0 then
        for i, card in ipairs(scoring_hand) do
            mana = mana + calculate_play_mana_card(card, scoring_hand)
        end
        set_play_mana(mana)
    else
        reset_play_mana()
    end

end
