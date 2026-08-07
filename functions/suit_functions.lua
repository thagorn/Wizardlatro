-- Adapted from Paperback mod
WLT.suit_count = function(scoring_hand, bypass_debuff, flush_calc)

    local suits = {}
    local suit_count = 0
    for k, _ in pairs(SMODS.Suits) do
        suits[k] = false
    end

    -- First find all the suits covered by non-Wild cards
    for _, card in ipairs(scoring_hand) do
        if not SMODS.has_any_suit(card) then
            for suit, found in pairs(suits) do
                if not found and card:is_suit(suit, bypass_debuff, flush_calc) then
                    suit_count = suit_count + 1
                    suits[suit] = true
                    break
                end
            end
        end
    end

    -- Then fill in the rest with Wild cards
    for _, card in ipairs(scoring_hand) do
        if SMODS.has_any_suit(card) then
            for suit, found in pairs(suits) do
                if not found and card:is_suit(suit, bypass_debuff, flush_calc) then
                    suit_count = suit_count + 1
                    suits[suit] = true
                    break
                end
            end
        end
    end

    return suit_count
end
