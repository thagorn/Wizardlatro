local function create_mana_sprite()
    local m_s = SMODS.create_sprite(
                    0,
                    0,
                    G.CARD_W,
                    G.CARD_H,
                    SMODS.get_atlas("wlt_decks"), -- TODO
                    { x = 0, y = 0 }
                )
    m_s.states.drag.can = false
    m_s.states.hover.can = false
    m_s.states.collide.can = false
    return m_s
end

function create_mana_UI()
    local m_s = create_mana_sprite()
    mana_ui = UIBox{
            definition = 
                {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.BLUE, padding = 0.2}, nodes={
                    {n=G.UIT.R, config = {align = 'cm', maxw = 1}, nodes={
                        {n=G.UIT.O, config={object=m_s}}
                    }}
                }},
                config = {}
            }
    return mana_ui
end

function position_mana_UI()
    -- Position it above the deck CardArea
    G.mana_ui.T.x = G.TILE_W - G.mana_ui.T.w - 0.5
    G.mana_ui.T.y = G.TILE_H - G.deck.T.h - G.mana_ui.T.h - 0.25

    G.mana_ui:hard_set_VT()
end
