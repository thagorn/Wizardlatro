SMODS.PokerHand {
    key = 'Rainbow House',
    visible = false,
    chips = 120,
    mult = 10,
    l_chips = 50,
    l_mult = 4,
    example = {
        { 'S_A', true },
        { 'D_A', true },
        { 'wlt_O_A', true },
        { 'C_5', true },
        { 'H_5', true },
    },
    evaluate = function(parts)
        if #parts._3 < 1 or #parts._2 < 2 or not next(parts.wlt_rainbow) then
            return {}
        end
        return {
            SMODS.merge_lists(parts.wlt_rainbow, parts._all_pairs)
        }
    end
}
