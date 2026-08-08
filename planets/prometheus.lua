-- Prometheus
SMODS.Consumable {
    key = "prometheus",
    set = "Planet",
    pos = { x = 2, y = 1 },
    atlas = "consumeables",
	discovered = true,
    config = { 
        hand_type = 'wlt_Rainbow Five',
        softlock = true,
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands[card.ability.hand_type].level,
                localize(card.ability.hand_type, 'poker_hands'),
                G.GAME.hands[card.ability.hand_type].l_mult,
                G.GAME.hands[card.ability.hand_type].l_chips,
                colours = { (G.GAME.hands[card.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[card.ability.hand_type].level)]) }
            }
        }
    end,
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_wlt_moon'), G.C.SECONDARY_SET.Planet, G.C.PLANET, 1.2)
    end
}
