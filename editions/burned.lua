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
