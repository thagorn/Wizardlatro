-- Available in SMODS 1814 but backported here for BMP compatability
function WLT.is_playing_card(card) 
    if not type(card) == "table" then return false end
    local set = (card.ability or {}).set or ((card.config or {}).center or {}).set
    return card.playing_card or set == "Default" or set == "Enhanced"
end
