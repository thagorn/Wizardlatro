-- Burned
SMODS.Edition({
    key = "burned",
    shader = "wlt_burned",
    disable_base_shader = true,
    disable_shadow = true,
    discovered = true,
    unlocked = true,
    config = {},
    never_scores = true,
    in_shop = false,
    weight = 0,
    extra_cost = 0,
    apply_to_float = true,
    in_pool = function(self, args)
        return false
    end,
})


-- TEMP TODO

SMODS.Consumable {
    key = 'burned_card',
	set = 'Tarot',
    pos = { x = 0, y = 0 },
    atlas = "consumeables",
    config = { max_highlighted = 1, mod_conv = 'e_wlt_burned' },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.mod_conv]
        return { vars = { card.ability.max_highlighted, localize { type = 'name_text', set = 'Enhanced', key = card.ability.mod_conv } } }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                local target_card = G.hand.highlighted[1]
                target_card:set_edition(card.ability.mod_conv, true)
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
    end
}
