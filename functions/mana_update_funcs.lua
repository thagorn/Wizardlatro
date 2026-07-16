function change_max_mana(change)
    set_max_mana(WLT.MAGIC.max_mana + change)
end

function set_max_mana(new_mana)
    WLT.MAGIC.max_mana = new_mana
end

function set_current_mana(new_mana)
    WLT.MAGIC.cur_mana = math.max(new_mana, 0)
end

function spend_mana(change)
    SMODS.calculate_context({spend_mana = true, spent_mana = change})
    update_current_mana(-1 * change)
end

function update_current_mana(change)
    new_mana = WLT.MAGIC.cur_mana + change
    if new_mana < 0 then
        spend_soul(-1 * new_mana)
    end
    set_current_mana(new_mana)
end

function set_remaining_mana()
    WLT.MAGIC.rem_mana = WLT.MAGIC.cur_mana
    set_current_mana(WLT.MAGIC.max_mana)
end

function spend_soul(change)
    update_current_soul(-1 * change)
end

function update_current_soul(change)
    new_soul = WLT.MAGIC.cur_soul + change
    set_current_soul(new_soul)
    if new_soul <= 0 then
        end_round()
    end
end

function set_current_soul(new_soul)
    WLT.MAGIC.cur_soul = math.max(new_soul, 0)
end

function reset_play_mana()
    set_play_mana(0)
    WLT.MAGIC.show_play_mana = false
    destroy_mana_text()
end

function set_play_mana(new_mana)
    WLT.MAGIC.show_play_mana = true
    if new_mana ~= WLT.MAGIC.play_mana then
        WLT.MAGIC.play_mana = new_mana
        WLT.MAGIC.play_mana_text = localize({
                                        type='variable',
                                        key='wlt_mana_text',
                                        vars={WLT.MAGIC.play_mana, WLT.MAGIC.cur_mana},
                                    })
        if new_mana > WLT.MAGIC.cur_mana then
            WLT.MAGIC.play_soul_warning = localize({
                                            type='variable',
                                            key='wlt_soul_warning',
                                        })
        else
            WLT.MAGIC.play_soul_warning = ''
        end
    end
end
