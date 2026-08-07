SMODS.PokerHandPart {
    key = 'rainbow',
    func = function(hand)
        if #hand < 5 then
            return {}
        end
        if WLT.suit_count(hand, false, true) >= 5 then
            for _, card in ipairs(hand) do
                sendInfoMessage(card.config.card_key)
            end
            return { hand }
        end
        return {}
    end
}

SMODS.PokerHand {
    key = 'Rainbow',
    visible = false,
    chips = 40,
    mult = 5,
    l_chips = 30,
    l_mult = 3,
    example = {
        { 'S_A', true },
        { 'D_K', true },
        { 'wlt_O_T', true },
        { 'C_5', true },
        { 'H_4', true },
    },
    evaluate = function(parts)
        return parts.wlt_rainbow
    end
}
