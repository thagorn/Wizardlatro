-- Mana potion
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 1, y = 0 },
    key = "mana_potion",
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 5,
    config = { extra = {
        uses = 5,
        mana = 5,
        has_button = true,
        button_text = nil,
        button_colour = G.C.BLUE
    } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mana, card.ability.extra.uses } }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        if initial then
            card.ability.extra.button_text = localize('wlt_drink')
        end
    end,
    button_active = function(self, card)
        return true
    end,
    button_click = function(self, card)
        WLT.update_current_mana(card.ability.extra.mana)
        SMODS.calculate_effect({
            message = localize { type = 'variable', key = 'wlt_mana_plus', vars = { card.ability.extra.mana } },
            colour = G.ARGS.LOC_COLOURS.wlt_mana
        }, card)
        card.ability.extra.uses = card.ability.extra.uses - 1
        if card.ability.extra.uses == 0 then
           SMODS.destroy_cards(card, nil, nil, true)
           SMODS.calculate_effect({
               message = localize('wlt_drank_ex'),
               colour = G.C.RED
           }, card)
        end
    end
}
