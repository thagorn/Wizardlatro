local evaluate_play_ref = G.FUNCS.evaluate_play
G.FUNCS.evaluate_play = function(e)

    spend_mana(WLT.MAGIC.play_mana)
    set_play_mana(0)
    destroy_mana_text()

    evaluate_play_ref(e)
end
