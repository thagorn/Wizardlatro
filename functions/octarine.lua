WLT.is_octarine = function(card)
    return not SMODS.has_no_suit(card) and card.config.card.suit == 'wlt_Octarine'
end

function Card:wlt_base_chips()
    local base_chips = self.base.nominal
    if WLT.is_octarine(self) then
        base_chips = 0
    end
    return base_chips
end

function Card:wlt_base_mult()
    local base_mult = 0
    if WLT.is_octarine(self) then
        base_mult = self.base.nominal
    end
    return base_mult
end
