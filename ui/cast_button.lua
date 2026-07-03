G.FUNCS.on_cast = function(e, mute, nosave)
    e.config.button = nil
    local card = e.config.ref_table
    
    card:click()
    card.ability.extra.charged = false
    if not card.ability.extra.reusable then
        SMODS.debuff_card(card, true, 'scroll')
    end
    spend_mana(card.ability.extra.mana_cost)
    SMODS.add_card({key = card.ability.extra.spell, no_edition = "true", stickers = nil})

    spell_cast(card)

    return true
end

function Card:can_cast(any_state, skip_check)
    if not (G.STATE == G.STATES.SELECTING_HAND) then
        return false
    end
    if not self.ability.extra.charged then
        return false
    end
    if not (self.ability.extra.mana_cost <= WLT.MAGIC.cur_mana) then
        return false
    end
    return true
end

G.FUNCS.can_cast = function(e)
    if e.config.ref_table:can_cast() then
        e.config.colour = G.C.RED
        e.config.button = 'on_cast'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
end


function create_cast_button(card)
    local cast = nil
    if (type(card.ability.extra) == "table") and card.ability.extra.has_cast then
        cast =
        {n=G.UIT.C, config={align = "cr"}, nodes={
          
          {n=G.UIT.C, config={ref_table = card, align = "cr",maxw = 1.25, padding = 0.1, r=0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'on_cast', func = 'can_cast'}, nodes={

            {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.B, config = {w=0.1,h=0.6}},
                {n=G.UIT.T, config={text = localize('wlt_cast'),colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
            }},
            {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.B, config = {w=0.2,h=0}},
                {n=G.UIT.T, config={ref_table = card.ability.extra, ref_value = 'mana_cost_label',colour = SMODS.Gradients['wlt_mana'], scale = 0.4, shadow = true}}
            }}
          }}
        }}
    end
    return cast
end
