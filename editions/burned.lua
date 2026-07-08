-- Burned
SMODS.Edition({
    key = "burned",
    shader = "wlt_burned",
    loc_txt = {
        name = "Overexposed",
        label = "Overexposed",
        text = {
            "{C:green}Retrigger{} this card"
        }
    },
    discovered = true,
    unlocked = true,
    config = {},
    in_shop = true,
    weight = 800000,
    extra_cost = 4,
    apply_to_float = true
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
