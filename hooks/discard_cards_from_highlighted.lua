discard_cards_from_highlighted_ref = G.FUNCS.discard_cards_from_highlighted
G.FUNCS.discard_cards_from_highlighted = function(e, hook)

    set_play_mana(0)
    destroy_mana_text()

    discard_cards_from_highlighted_ref(e, hook)
end
