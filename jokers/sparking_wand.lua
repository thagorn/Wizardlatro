-- Sparking Wand
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    key = "sparking_wand",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = { spell = nil, mana_cost = 0, odds = 2 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_cast_keyword', set = 'Other', vars = {card.ability.extra.mana_cost } }
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_wlt_sparking_wand')
        return { vars = { numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and SMODS.pseudorandom_probability(card, 'j_wlt_sparking_wand', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    local spell = SMODS.add_card {
                        set = 'Joker',
                        rarity = 'wlt_spell',
                        key_appent = 'wlt_sparking_wand'
                    }
                    card.ability.extra.spell = spell.label
                    spell_cast(card)
                    return true
                end)
            }))
            return {
                message = localize('wlt_cast_ex')
            }
        end
    end
}
