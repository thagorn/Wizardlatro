G.FUNCS.on_button = function(e, mute, nosave)
    e.config.button = nil
    local card = e.config.ref_table
    local area = card.area
    local prev_state = G.STATE
    local dont_dissolve = nil
    local delay_fac = 1
    
    card:click()
    card.config.center:button_click(card)

    return true
end

function Card:can_button(any_state, skip_check)
    if not self.config.center:button_active(self) then
        return false
    end
    return true
end

G.FUNCS.can_button = function(e)
    if e.config.ref_table:can_button() then
        e.config.colour = e.config.ref_table.ability.extra.button_colour or G.C.RED
        e.config.button = 'on_button'
    else
      e.config.colour = G.C.UI.BACKGROUND_INACTIVE
      e.config.button = nil
    end
end


function create_other_button(card)
    local other = nil
    if (type(card.ability.extra) == "table") and card.ability.extra.has_button then
        other =
        {n=G.UIT.C, config={align = "cr"}, nodes={
          
          {n=G.UIT.C, config={ref_table = card, align = "cr",maxw = 1.25, padding = 0.1, r=0.08, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'on_button', func = 'can_button'}, nodes={

            {n=G.UIT.R, config={align = "cm"}, nodes={
                {n=G.UIT.B, config = {w=0.1,h=0.6}},
                {n=G.UIT.T, config={ref_table = card.ability.extra, ref_value = 'button_text', colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
            }}
          }}
        }}
    end
    return other
end
