function set_max_mana(new_mana)
    WLT.MAGIC.max_mana = new_mana
end

function set_current_mana(new_mana)
    WLT.MAGIC.cur_mana = math.max(new_mana, 0)
    sendInfoMessage(string.format('current mana: %d', WLT.MAGIC.cur_mana))
end

function spend_mana(change)
    sendInfoMessage(string.format('spending mana: %d', change))
    SMODS.calculate_context({spend_mana = true, spent_mana = change})
    update_current_mana(-1 * change)
end

function update_current_mana(change)
    sendInfoMessage(string.format('mana change requested: %d', change))
    new_mana = WLT.MAGIC.cur_mana + change
    -- TODO: soul interaction here
    set_current_mana(new_mana)
end

function set_remaining_mana()
    WLT.MAGIC.rem_mana = WLT.MAGIC.cur_mana
    set_current_mana(WLT.MAGIC.max_mana)
end

function set_play_mana(new_mana)
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
