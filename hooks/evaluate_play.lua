local evaluate_play_ref = G.FUNCS.evaluate_play
G.FUNCS.evaluate_play = function(e)

    spend_mana(WLT.MAGIC.play_mana)
    reset_play_mana()

    evaluate_play_ref(e)
end
