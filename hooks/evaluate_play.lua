local evaluate_play_ref = G.FUNCS.evaluate_play
G.FUNCS.evaluate_play = function(e)

    WLT.spend_mana(G.GAME.WLT_STATE.play_mana)
    WLT.reset_play_mana()

    evaluate_play_ref(e)
end
