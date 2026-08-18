SMODS.PokerHand {
    key = 'Rainbow Five',
    visible = false,
    chips = 160,
    mult = 12,
    l_chips = 50,
    l_mult = 3,
    example = {
        { 'S_7', true },
        { 'D_7', true },
        { 'wlt_O_7', true },
        { 'C_7', true },
        { 'H_7', true },
    },
    evaluate = function(parts)
        if not next(parts._5) or not next(parts.wlt_rainbow) then
            return {}
        end
        return {
            SMODS.merge_lists(parts.wlt_rainbow, parts._5)
        }
    end
}
