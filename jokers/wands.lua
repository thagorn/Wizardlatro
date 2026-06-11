-- Wand of Fireball
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 6, y = 1 }, -- TODO
    key = "wand_fireball",
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { consumeable = { max_highlighted = 5 }, extra = { mana_cost = 2 } }, -- TODO
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
        info_queue[#info_queue + 1] = G.P_CENTERS.j_wlt_fireball
    end,
    calculate = function(self, card, context)
        if context.selling_self then -- TODO
            return {
                remove = false,
                message = "ss"
            }
        end
        if context.joker_type_destroyed and self == context.card then -- TODO
            return {
                no_destroy = true,
                message = "jtd"
            }
        end
    end
}
