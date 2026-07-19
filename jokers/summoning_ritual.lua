reset_wlt_ritual_condition = function()
    G.GAME.current_round.wlt_ritual_card_1 = { rank = 'Ace', suit = 'Spades' }
    G.GAME.current_round.wlt_ritual_card_2 = { rank = 'Ace', suit = 'Spades' }
    local valid_cards = {}
    for _, playing_card in ipairs(G.playing_cards) do
        if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
            valid_cards[#valid_cards + 1] = playing_card
        end
    end
    local ritual_card_1 = pseudorandom_element(valid_cards, 'wlt_ritual' .. G.GAME.round_resets.ante)
    local ritual_card_2 = pseudorandom_element(valid_cards, 'wlt_ritual' .. G.GAME.round_resets.ante)
    if ritual_card_1 then
        G.GAME.current_round.wlt_ritual_card_1.rank = ritual_card_1.base.value
        G.GAME.current_round.wlt_ritual_card_1.suit = ritual_card_1.base.suit
        G.GAME.current_round.wlt_ritual_card_1.id = ritual_card_1.base.id
    end
    if ritual_card_2 then
        G.GAME.current_round.wlt_ritual_card_2.rank = ritual_card_2.base.value
        G.GAME.current_round.wlt_ritual_card_2.suit = ritual_card_2.base.suit
        G.GAME.current_round.wlt_ritual_card_2.id = ritual_card_2.base.id
    end
end


-- Scroll of Summoning Ritual 1
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 2 },
    key = "scroll_ritual_1",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 2,
    config = { extra = { 
        has_cast = true,
        charged = false,
        progress = 0,
        goal = 3,
        reusable = false,
        spell = 'j_wlt_ritual_1',
        mana_cost = 3,
        mana_cost_label = ''
    }},
    in_pool = function(self, args)
        return not G.GAME.pool_flags.wlt_ritual_stage or G.GAME.pool_flags.wlt_ritual_stage == 1
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.spell]
        return { vars = { 
            card.ability.extra.goal,
            card.ability.extra.mana_cost,
            card.ability.extra.progress,
            }}
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.game_over and G.GAME.current_round.discards_used == 0 then
            card.ability.extra.progress = card.ability.extra.progress + 1
            if card.ability.extra.progress >= card.ability.extra.goal then
                card.ability.extra.charged = true
            end
            return {
                message = localize('wlt_chant_ex'),
                colour = G.C.RED
            }
		end
    end
}

-- Summoning Ritual 1
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 2 },
    key = "ritual_1",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = {
        extra_value = -1, -- Allows sell cost to be $0
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.before then
            G.GAME.pool_flags.wlt_ritual_stage = 2
            return {
                message = localize('wlt_draws_nearer')
            }
        end
    end
}

-- Scroll of Summoning Ritual 2
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 3, y = 2 },
    key = "scroll_ritual_2",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 2,
    config = { extra = { 
        has_cast = true,
        charged = false,
        progress = 0,
        goal = 3,
        reusable = false,
        spell = 'j_wlt_ritual_2',
        mana_cost = 5,
        mana_cost_label = ''
    }},
    in_pool = function(self, args)
        return G.GAME.pool_flags.wlt_ritual_stage == 2
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.spell]
        local card_1 = G.GAME.current_round.wlt_ritual_card_1 or { rank = 'Ace', suit = 'Spades' }
        local card_2 = G.GAME.current_round.wlt_ritual_card_2 or { rank = '2', suit = 'Clubs' }
        return { vars = { 
            localize(card_1.rank, 'ranks'),
            localize(card_1.suit, 'suits_plural'),
            localize(card_2.rank, 'ranks'),
            localize(card_2.suit, 'suits_plural'),
            card.ability.extra.mana_cost,
            card.ability.extra.progress,
            card.ability.extra.goal,
            colours = {
                G.C.SUITS[card_1.suit],
                G.C.SUITS[card_2.suit],
            }}}
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
    end,
    calculate = function(self, card, context)
		if context.before and card.ability.extra.progress < card.ability.extra.goal then
		    local c1 = false
            local c2 = false
			for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:get_id() == G.GAME.current_round.wlt_ritual_card_1.id and -- \\
                    playing_card:is_suit(G.GAME.current_round.wlt_ritual_card_1.suit) then
                    c1 = true
                end
                if playing_card:get_id() == G.GAME.current_round.wlt_ritual_card_2.id and -- \\
                    playing_card:is_suit(G.GAME.current_round.wlt_ritual_card_2.suit) then
                    c2 = true
                end
            end
            if c1 and c2 then
                card.ability.extra.progress = card.ability.extra.progress + 1
                if card.ability.extra.progress >= card.ability.extra.goal then
                    card.ability.extra.charged = true
                    return {
                        message = localize('wlt_chant_ex'),
                        colour = G.C.RED
                    }
                end

                return {
                    message = localize('wlt_chant_ex'),
                    colour = G.C.RED
                }
            end
		end
    end
}

-- Summoning Ritual 2
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 4, y = 2 },
    key = "ritual_2",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = {
        extra_value = -1, -- Allows sell cost to be $0
        extra = {}
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.before then
            G.GAME.pool_flags.wlt_ritual_stage = 3
            return {
                message = localize('wlt_draws_nearer')
            }
        end
    end
}

-- Scroll of Summoning Ritual 3
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 2 },
    key = "scroll_ritual_3",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 2,
    config = { extra = { 
        has_cast = true,
        charged = false,
        common = false,
        uncommon = false,
        rare = false,
        reusable = false,
        spell = 'j_wlt_ritual_3',
        mana_cost = 7,
        mana_cost_label = ''
    }},
    in_pool = function(self, args)
        return G.GAME.pool_flags.wlt_ritual_stage == 3
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.spell]
        local progress = {}
        if not card.ability.extra.common then table.insert(progress, localize('k_common')) end
        if not card.ability.extra.uncommon then table.insert(progress, localize('k_uncommon')) end
        if not card.ability.extra.rare then table.insert(progress, localize('k_rare')) end

        return { vars = { 
            card.ability.extra.mana_cost,
            table.concat(progress, ", ")
        }}
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.mana_cost_label = localize({
                                                type='variable',
                                                key='wlt_mana_cost',
                                                vars={card.ability.extra.mana_cost},
                                            })
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local seenSelf = false
            for i = 1, #G.jokers.cards do
                local joker = G.jokers.cards[i]
                if not seenSelf and joker == card then
                    seenSelf = true
                    goto continue
                end
                if seenSelf and not SMODS.is_eternal(joker) then
                    joker.getting_sliced = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            joker:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                            play_sound('slice1', 0.96 + math.random() * 0.08)

                            local progress = false
                            if not card.ability.extra.common and joker:is_rarity(1) then
                                progress = true
                                card.ability.extra.common = true
                            elseif not card.ability.extra.uncommon and joker:is_rarity(2) then
                                progress = true
                                card.ability.extra.uncommon = true
                            elseif not card.ability.extra.rare and joker:is_rarity(3) then
                                progress = true
                                card.ability.extra.rare = true
                            end
                            if progress then
                                SMODS.calculate_effect({ 
                                    message = localize('wlt_chant_ex'),
                                    colour = G.C.RED
                                }, card)
                            end

                            return true
                        end)
                    }))
                end
                ::continue::
            end
            if card.ability.extra.common and card.ability.extra.uncommon and card.ability.extra.rare then
                card.ability.extra.charged = true
            end
        end
    end
}

-- Summoning Ritual 3
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 2 },
    key = "ritual_3",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_spell',
    cost = 0,
    config = {
        extra_value = -1, -- Allows sell cost to be $0
        extra = { summon = 'j_wlt_djinn' }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.summon]
        return { vars = {} }
    end,
    in_pool = function(self, args)
        return false
    end,
    calculate = function(self, card, context)
        WLT.calc_spell_cast(self, card, context)
        if context.before then
            G.GAME.pool_flags.wlt_ritual_stage = 1
            SMODS.add_card({key = card.ability.extra.summon, stickers = nil})
            return {
                message = localize('wlt_summon_ex')
            }
        end
    end
}

-- Djinn
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 2 },
    key = "djinn",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 'wlt_summon',
    cost = 0,
    config = { 
        extra_value = -1, -- Allows sell cost to be $0
        extra = { 
            joker = 'j_joker',
            joker_name = nil,
            rarity = 'Common',
            max_wishes = 4,
            wishes = 4,
            active = true,
            has_button = true,
            button_text = nil,
            button_colour = G.C.BLUE,
            joker_colour = G.C.RARITY.Common
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.joker]
        return { vars = { 
            card.ability.extra.max_wishes,
            card.ability.extra.joker_name,
            card.ability.extra.wishes,
            colours = {
                card.ability.extra.joker_colour
            }
        }}
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if initial then
            card.ability.extra.button_text = localize('wlt_wish')
            card.ability.extra.joker_colour = G.C.RARITY.Common
        end
        card.ability.extra.joker = SMODS.poll_object({ type = 'Joker', rarities = { card.ability.extra.rarity }, append = 'j_wlt_djinn' })
        card.ability.extra.joker_name = localize({
                                                type = 'name_text',
                                                key = card.ability.extra.joker,
                                                set = 'Joker'
                                            })
    end,
    button_active = function(self, card)
        return card.ability.extra.active
    end,
    button_click = function(self, card)
        if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            local joker_to_create = card.ability.extra.joker
            G.E_MANAGER:add_event(Event({
                func = (function()
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    SMODS.add_card({key = joker_to_create, stickers = nil})
                    return true
                end)
            }))

            card.ability.extra.joker = 'j_wlt_empty'
            card.ability.extra.joker_name = ''
            card.ability.extra.active = false
            card.ability.extra.wishes = card.ability.extra.wishes - 1
            if card.ability.extra.rarity == "Common" then
                card.ability.extra.rarity = "Uncommon"
                card.ability.extra.joker_colour = G.C.RARITY.Uncommon
            elseif card.ability.extra.rarity == "Uncommon" then
                card.ability.extra.rarity = "Rare"
                card.ability.extra.joker_colour = G.C.RARITY.Rare
            elseif card.ability.extra.rarity == "Rare" then
                card.ability.extra.rarity = "Legendary"
                card.ability.extra.joker_colour = G.C.RARITY.Legendary
            elseif card.ability.extra.rarity == "Legendary" then
                SMODS.debuff_card(card, true, 'j_wlt_djinn')
            end
            SMODS.calculate_effect({ 
                message = localize('wlt_poof_ex'),
                colour = G.C.BLUE
            }, card)
        else
            SMODS.calculate_effect({ 
                message = localize('k_no_room_ex')
            }, card)
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.game_over then
            self:set_ability(card, false, false)
            card.ability.extra.active = true
        end
    end
}
