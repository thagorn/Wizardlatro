-- Mana droplet
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    key = "mana_droplet",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 2,
    config = { extra = { mana = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana } }
    end,
    calculate = function(self, card, context)
        if context.before then
            WLT.update_current_mana(card.ability.extra.mana)
            return {
                message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
                colour = G.ARGS.LOC_COLOURS.wlt_mana
            }
        end
    end
}
