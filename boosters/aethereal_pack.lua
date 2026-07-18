-- Aethereal Pack
SMODS.Booster {
    pos = { x = 0, y = 6 }, -- TODO
    key = "aethereal_normal_1",
    kind = 'wlt_aethereal',
    group_key = "k_wlt_aethereal_pack",
	discovered = true,
    weight = 0,
    cost = 4,
    config = { extra = 3, choose = 1 },
    ease_background_colour = function(self)
        ease_background_colour_blind(G.STATES.STANDARD_PACK)
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 3,
            speed = 0.2,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.BLACK, G.C.RED },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        local seal = SMODS.poll_seal({ mod = 10 })
        return {
            set = "Playing Card",
            edition = 'e_wlt_aethereal',
            seal = seal,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "wlt_aethereal_pack"
        }
    end,
}
