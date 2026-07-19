WLT.initialize_state = function(max_mana, max_soul)
    G.GAME.WLT_STATE = {
        play_mana = 0,
        show_play_mana = false,
        play_mana_text = '',
        play_soul_warning = '',
        cur_mana = max_mana,
        max_mana = max_mana,
        rem_mana = 0,
        cur_soul = max_soul,
    }
end

WLT.change_max_mana = function(change)
    WLT.set_max_mana(G.GAME.WLT_STATE.max_mana + change)
end

WLT.set_max_mana = function(new_mana)
    G.GAME.WLT_STATE.max_mana = new_mana
end

WLT.set_current_mana = function(new_mana)
    G.GAME.WLT_STATE.cur_mana = math.max(new_mana, 0)
end

WLT.spend_mana = function(change)
    SMODS.calculate_context({spend_mana = true, spent_mana = change})
    WLT.update_current_mana(-1 * change)
end

WLT.update_current_mana = function(change)
    new_mana = G.GAME.WLT_STATE.cur_mana + change
    if new_mana < 0 then
        WLT.spend_soul(-1 * new_mana)
    end
    WLT.set_current_mana(new_mana)
end

WLT.set_remaining_mana = function()
    G.GAME.WLT_STATE.rem_mana = G.GAME.WLT_STATE.cur_mana
    WLT.set_current_mana(G.GAME.WLT_STATE.max_mana)
end

WLT.spend_soul = function(change)
    WLT.update_current_soul(-1 * change)
end

WLT.update_current_soul = function(change)
    new_soul = G.GAME.WLT_STATE.cur_soul + change
    WLT.set_current_soul(new_soul)
    if new_soul <= 0 then
        end_round()
    end
end

WLT.set_current_soul = function(new_soul)
    G.GAME.WLT_STATE.cur_soul = math.max(new_soul, 0)
end

WLT.reset_play_mana = function()
    WLT.set_play_mana(0)
    G.GAME.WLT_STATE.show_play_mana = false
    WLT.destroy_mana_text()
end

WLT.set_play_mana = function(new_mana)
    G.GAME.WLT_STATE.show_play_mana = true
    if new_mana ~= G.GAME.WLT_STATE.play_mana then
        G.GAME.WLT_STATE.play_mana = new_mana
        G.GAME.WLT_STATE.play_mana_text = localize({
                                        type='variable',
                                        key='wlt_mana_text',
                                        vars={G.GAME.WLT_STATE.play_mana, G.GAME.WLT_STATE.cur_mana},
                                    })
        if new_mana > G.GAME.WLT_STATE.cur_mana then
            G.GAME.WLT_STATE.play_soul_warning = localize({
                                            type='variable',
                                            key='wlt_soul_warning',
                                        })
        else
            G.GAME.WLT_STATE.play_soul_warning = ''
        end
    end
end
