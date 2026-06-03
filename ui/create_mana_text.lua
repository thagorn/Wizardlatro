function mana_text_definition(mana, max_mana)
    return {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR, padding = 0.2}, nodes={
            {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={id='wlt_mana_text_hand', object = DynaText({scale = 0.5, string = 
                    {{ref_table = WLT.MAGIC, ref_value = 'mana_text'}}
                    , maxw = 9, colours = {SMODS.Gradients['wlt_mana']},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }},
            {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                {n=G.UIT.O, config={object = DynaText({scale = 0.6, string = localize('wlt_soul_warning'), maxw = 9, colours = {SMODS.Gradients['wlt_soul']},float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})}},
            }}
        }}
end

function create_mana_text(game)
    if WLT.MAGIC.mana > 0 then
        if not game.mana_text then 
            game.mana_text = UIBox{
                definition = mana_text_definition(WLT.MAGIC.mana, WLT.MAGIC.max_mana), 
                config = {
                    align = 'cm',
                    offset ={x=0,y=-3.1}, 
                    major = G.play,
                  }
              }
              game.mana_text.attention_text = true
              game.mana_text.states.collide.can = false
              G.GAME.blind.children.animatedSprite:juice_up(0.05, 0.02)
              play_sound('chips1', math.random()*0.1 + 0.55, 0.12)
        end
    else
        if game.mana_text then 
            game.mana_text:remove()
            game.mana_text = nil
        end
    end
end
