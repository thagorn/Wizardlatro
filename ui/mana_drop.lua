local create_mana_sprite = function()
    local m_s = SMODS.create_sprite(
                    0,
                    0,
                    G.CARD_W * 0.5,
                    G.CARD_H * 0.5,
                    SMODS.get_atlas("wlt_ui"),
                    { x = 0, y = 0 }
                )
    m_s.states.drag.can = false
    m_s.states.hover.can = false
    m_s.states.collide.can = false
    return m_s
end

local create_soul_sprite = function()
    local s_s = SMODS.create_sprite(
                    0,
                    0,
                    G.CARD_W * 0.5,
                    G.CARD_H * 0.5,
                    SMODS.get_atlas("wlt_ui"),
                    { x = 1, y = 0 }
                )
    s_s.states.drag.can = false
    s_s.states.hover.can = false
    s_s.states.collide.can = false
    return s_s
end

WLT.create_mana_UI = function()
    local m_s = create_mana_sprite()
    local s_s = create_soul_sprite()
    G.mana_ui = UIBox{
            definition = 
                {n=G.UIT.ROOT, config = 
                    {
                        align = 'cm',
                        colour = adjust_alpha(G.C.L_BLACK, 0.5),
                        padding = '0.1',
                        r = 0.1,
                        hover = true,
                    }, nodes =
                    {
                        {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes =
                            {
                                {n=G.UIT.O, config={id = 'mana_drop', object = m_s}},
                                {n=G.UIT.B, config={h = 0, w = 0.1}},
                                {n=G.UIT.O, config={id = 'soul_drop', object = s_s}},
                            }
                        }
                    }
                },
                config = {}
            }
    -- Mana value text
    UIBox{
            definition = 
                {n=G.UIT.ROOT, config= {align = 'cm', colour = G.C.CLEAR}, nodes={
                    {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                        {n=G.UIT.O, config={align = 'cm', object = 
                            DynaText({scale = 0.6,
                                string = {{ref_table = G.GAME.WLT_STATE, ref_value = 'cur_mana'}},
                                colours = { G.C.WHITE }
                            })
                        }}
                    }}
                }},
                config = {
                    align = 'cm',
                    offset = { x = 0, y = 0.18 },
                    major = G.mana_ui:get_UIE_by_ID('mana_drop')
                }
            }
    -- Soul value text
    UIBox{
            definition = 
                {n=G.UIT.ROOT, config= {align = 'cm', colour = G.C.CLEAR}, nodes={
                    {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                        {n=G.UIT.O, config={align = 'cm', object = 
                            DynaText({scale = 0.6,
                                string = {{ref_table = G.GAME.WLT_STATE, ref_value = 'cur_soul'}},
                                colours = { G.C.WHITE }
                            })
                        }}
                    }}
                }},
                config = {
                    align = 'cm',
                    offset = { x = 0, y = 0.18 },
                    major = G.mana_ui:get_UIE_by_ID('soul_drop')
                }
            }
end

WLT.position_mana_UI = function()
    -- Position it above the deck CardArea
    -- Centered left/right
    G.mana_ui.T.x = G.TILE_W - (G.deck.T.w / 2) - (G.mana_ui.T.w / 2) - 0.5
    G.mana_ui.T.y = G.TILE_H - G.deck.T.h - G.mana_ui.T.h - 0.5

    G.mana_ui:hard_set_VT()
end
