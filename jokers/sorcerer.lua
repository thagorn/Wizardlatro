-- Sorcerer
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 2, y = 7 },
    key = "sorcerer",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { mana_increase = 10, h_plays = -1 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'o_wlt_mana_pool_keyword', set = 'Other' }
        return { vars = { card.ability.extra.mana_increase, card.ability.extra.h_plays } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.h_plays
        WLT.change_max_mana(card.ability.extra.mana_increase)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.h_plays
        WLT.change_max_mana(-card.ability.extra.mana_increase)
    end,
}
