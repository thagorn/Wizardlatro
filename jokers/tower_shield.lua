-- Tower Shield
SMODS.Joker {
    atlas = "jokers",
    pos = { x = 5, y = 4 },
    key = "tower_shield",
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    rarity = 1,
    cost = 6,
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.before then
            local firstStone = nil
            for i = 1, #context.scoring_hand do
                local playing_card = context.scoring_hand[i]
                if SMODS.has_enhancement(playing_card, 'm_stone') then
                    if not firstStone then
                        firstStone = playing_card
                        goto continue
                    end
                    if firstStone then
                        firstStone.ability.perma_bonus = (firstStone.ability.perma_bonus or 0) +
                                                        (playing_card.ability.perma_bonus or 0) +
                                                        (playing_card.ability.bonus or 0)
                        SMODS.destroy_cards(playing_card)
                        SMODS.calculate_effect({
                            message = localize('k_upgrade_ex'),
                            colour = G.C.CHIPS
                        }, firstStone)
                    end
                end
                ::continue::
            end
        end
    end
}
