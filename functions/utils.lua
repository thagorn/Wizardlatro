-- suit_count adapted from Paperback mod
WLT.suit_count = function(scoring_hand, bypass_debuff, flush_calc)

    local suits = {}
    local suit_count = 0
    for k, _ in pairs(SMODS.Suits) do
        suits[k] = false
    end

    -- First find all the suits covered by non-Wild cards
    for _, card in ipairs(scoring_hand) do
        if not SMODS.has_any_suit(card) then
            for suit, found in pairs(suits) do
                if not found and card:is_suit(suit, bypass_debuff, flush_calc) then
                    suit_count = suit_count + 1
                    suits[suit] = true
                    break
                end
            end
        end
    end

    -- Then fill in the rest with Wild cards
    for _, card in ipairs(scoring_hand) do
        if SMODS.has_any_suit(card) then
            for suit, found in pairs(suits) do
                if not found and card:is_suit(suit, bypass_debuff, flush_calc) then
                    suit_count = suit_count + 1
                    suits[suit] = true
                    break
                end
            end
        end
    end

    return suit_count
end

WLT.conjure = function(effect_src, key_append)
    if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        local consumeable_score = pseudorandom(pseudoseed(key_append or 'wlt_conjure'))
        local set, message
        if consumeable_score <= 0.45 then
            set = 'Planet'
            message = localize('k_plus_planet')
        elseif consumeable_score <= 0.9 then
            set = 'Tarot'
            message = localize('k_plus_tarot')
        else
            set = 'Spectral'
            message = localize('k_plus_spectral')
        end
        SMODS.calculate_effect({
            message = message,
            func = (function()
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = set,
                            key_append = key_append or 'wlt_conjure'
                        }
                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer - 1
                        return true
                    end)
                }))
                return true
            end)
        }, effect_src)
    end
end
