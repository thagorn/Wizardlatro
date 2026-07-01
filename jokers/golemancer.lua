
-- Golemancer
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 1 },
    key = "golemancer",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { mult = 2 } },
    tally_stone = function(self)
        local stone_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_stone') then stone_tally = stone_tally + 1 end
            end
        end
        return stone_tally
    end,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone

        local stone_tally = self:tally_stone()
        return { vars = { card.ability.extra.mult, card.ability.extra.mult * stone_tally } }
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_stone') then
                return true
            end
        end
        return false
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.hand and not context.end_of_round and -- \\
            SMODS.has_enhancement(context.other_card, 'm_stone') then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                local stone_tally = self:tally_stone()
                return {
                    mult = card.ability.extra.mult * stone_tally
                }
            end
        end
    end
}
