-- TODO: if mana deck
local update_selecting_hand_ref = Game.update_selecting_hand
function Game:update_selecting_hand(dt)

    create_mana_text(self)

    update_selecting_hand_ref(self, dt)
end
