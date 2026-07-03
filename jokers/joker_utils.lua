calc_spell_cast = function(self, card, context)
    if context.after and not context.blueprint then
        if card.ability.extra.fresh then
            -- Solves some race conditions so spells don't immediately
            -- destroy themselves if they are created in context.after
            card.ability.extra.fresh = false
        else
            SMODS.destroy_cards(card, nil, nil, true)
            return {
                message = localize('wlt_cast_ex')
            }
        end
    end
end

SMODS.current_mod.reset_game_globals = function(run_start)
    reset_wlt_power_of_three()
    reset_wlt_ritual_condition()
end
