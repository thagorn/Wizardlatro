discard_cards_from_highlighted_ref = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e, hook)

    WLT.reset_play_mana()

    discard_cards_from_highlighted_ref(e, hook)
end
