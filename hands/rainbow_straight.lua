SMODS.PokerHand {
    key = 'Rainbow Straight',
    visible = false,
    chips = 140,
    mult = 13,
    l_chips = 40,
    l_mult = 5,
    example = {
        { 'S_J', true },
        { 'D_T', true },
        { 'wlt_O_9', true },
        { 'C_8', true },
        { 'H_7', true },
    },
    evaluate = function(parts)
        if not next(parts._straight) or not next(parts.wlt_rainbow) then
            return {}
        end
        return {
            SMODS.merge_lists(parts.wlt_rainbow, parts._straight)
        }
    end,
    modify_display_text = function(self, cards, scoring_hand)
        local pride = true
        for j = 1, #scoring_hand do
            local rank = SMODS.Ranks[scoring_hand[j].base.value]
            pride = pride and (rank.key == 'Ace' or rank.key == '10' or rank.face)
        end
        if pride then
            return 'wlt_Pride'
        end
    end
}
