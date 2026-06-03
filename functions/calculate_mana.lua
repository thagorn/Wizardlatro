function calculate_mana(cardarea)
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
    if scoring_hand then
        for i, card in ipairs(scoring_hand) do
            if card:is_face(true) then
                mana = mana + 2
            else
                mana = mana + 1
            end
        end
    end
    if mana ~= WLT.MAGIC.mana then
        WLT.MAGIC.mana = mana
        WLT.MAGIC.mana_text = localize({
                                    type='variable',
                                    key='wlt_mana_text',
                                    vars={mana, WLT.MAGIC.max_mana},
                                })
    end
end
