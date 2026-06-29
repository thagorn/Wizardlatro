calc_spell_cast = function(self, card, context)
    if context.after and not context.blueprint then
        SMODS.destroy_cards(card, nil, nil, true)
        return {
            message = localize('wlt_cast_ex')
        }
    end
end
