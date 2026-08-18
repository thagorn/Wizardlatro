-- Faerie Circle
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 6 },
    key = "faerie_circle",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(self, 1, 4, 'j_wlt_faerie_circle')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
		if context.setting_blind and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'j_wlt_faerie_circle'
                            }
                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                            return true
                        end)
                    }))
                    SMODS.calculate_effect({ message = localize('k_plus_spectral'), colour = G.C.SPECTRAL }, -- \\
                        context.blueprint_card or card)
                    return true
                end)
            }))
            return nil, true -- This is for Joker retrigger purposes
        end
        if context.stay_flipped and context.to_area == G.hand and
            SMODS.pseudorandom_probability(card, 'j_wlt_faerie_circle', 1, 4) then
            return {
                stay_flipped = true
            }
        end
    end,
}
