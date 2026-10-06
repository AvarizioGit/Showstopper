Partner_API.Partner {
    key = "blackcard",
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 1 },
    atlas = "partners",
    link_config = { j_swp_3membership = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_3membership")) then
            return {
                key = "pnr_swp_blackcard_buffed"
            }
        end
    end,

    calculate = function(self, card, context)
        if next(SMODS.find_card("j_swp_3membership")) then
            if context.end_of_round and context.game_over == false and context.main_eval  then
                if (G.GAME.blind:get_type() == 'Small' or G.GAME.blind:get_type() == 'Big') then
                    swp_uti.add_tag('tag_coupon', nil, false)
                end
            end
        else
            if context.end_of_round and context.game_over == false and context.main_eval  then
                if (G.GAME.blind:get_type() == 'Small') then
                    swp_uti.add_tag('tag_coupon', nil, false)
                end
            end
        end
    end
}