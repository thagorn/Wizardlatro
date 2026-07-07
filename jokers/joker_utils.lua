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

transform_card = function(playing_card, ability, sound)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = (function()
            playing_card:flip()
            play_sound('card1', 0.6)
            playing_card:juice_up(0.3, 0.3)
            return true
        end)
    }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.1,
        func = (function()
            playing_card:set_ability(ability)
            if sound then
                play_sound(sound, 0.6)
            end
            return true
        end)
    }))
    delay(0.2)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = (function()
            playing_card:flip()
            play_sound('card1', 0.6)
            playing_card:juice_up(0.3, 0.3)
            return true
        end)
    }))
end

SMODS.current_mod.reset_game_globals = function(run_start)
    reset_wlt_power_of_three()
    reset_wlt_ritual_condition()
end
