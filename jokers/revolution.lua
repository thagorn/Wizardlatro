local card_is_face_ref = Card.is_face
function Card:is_face(from_boss, ...)
    local orig = card_is_face_ref(self, from_boss, ...)
    if next(SMODS.find_card("j_wlt_revolution")) then
        --invert the result
        return not orig
    end
    return orig
end

-- Revolution
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 3 },
    key = "revolution",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 5,
    config = { extra = { } },
}
