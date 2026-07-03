spell_cast = function(card)
    if not G.GAME.spell_casts then
        G.GAME.spell_casts = 0
    end
    G.GAME.spell_casts = G.GAME.spell_casts + 1
    SMODS.calculate_context({cast_spell = true, card = card})
end
