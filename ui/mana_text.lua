local mana_text_definition = function()
    return {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, padding = 0.2}, nodes={
            {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={id='wlt_mana_text_hand', object = DynaText({scale = 0.5, string = 
                    {{ref_table = G.GAME.WLT_STATE, ref_value = 'play_mana_text'}}
                    , maxw = 9, colours = {SMODS.Gradients['wlt_mana']},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }},
            {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={object = DynaText({scale = 0.6, string = {{ref_table = G.GAME.WLT_STATE, ref_value = 'play_soul_warning'}}, maxw = 9, colours = {SMODS.Gradients['wlt_soul']},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }}
        }}
end

WLT.destroy_mana_text = function()
    if G.wlt_mana_text then
        G.wlt_mana_text:remove()
        G.wlt_mana_text = nil
     end
end

WLT.create_mana_text = function(game)
    if G.GAME.WLT_STATE.show_play_mana then
        if not game.wlt_mana_text then 
            game.wlt_mana_text = UIBox{
                definition = mana_text_definition(), 
                config = {
                    align = 'cm',
                    offset ={x=0,y=-3.1}, 
                    major = G.play,
                  }
              }
              game.wlt_mana_text.attention_text = true
              game.wlt_mana_text.states.collide.can = false
              G.GAME.blind.children.animatedSprite:juice_up(0.05, 0.02)
              play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
        end
    else
        WLT.destroy_mana_text()
    end
end
