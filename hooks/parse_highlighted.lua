local parse_highlighted_ref = CardArea.parse_highlighted
function CardArea:parse_highlighted()
    if G.GAME.blind then
        calculate_mana(self)
    end
    parse_highlighted_ref(self)
end
