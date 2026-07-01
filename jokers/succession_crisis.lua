-- Succession Crisis
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 7, y = 3 },
    key = "succession_crisis",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = { xmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult } }
    end,
    crisis = function(self, pairtable, debuff)
        for _, pair in ipairs(pairtable) do
            for _, paired_card in ipairs(pair) do
                -- need to pass true here to be able to find them again after debuffing them
                if paired_card:is_face(true) then
                    SMODS.debuff_card(paired_card, debuff, 'j_wlt_succession_crisis')
                end
            end
        end
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            self:crisis(context.poker_hands['Pair'], true)
        end
		if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.after and not context.blueprint then
            return {
                func = function() -- This is for timing purposes so that the cards look debuffed during scoring animations
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            self:crisis(context.poker_hands['Pair'], false)
                            return true
                        end
                    }))
                end
            }
        end
    end
}
