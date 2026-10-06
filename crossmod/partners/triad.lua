Partner_API.Partner {
    key = "triad",
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    atlas = "partners",
    config = { extra = { chips = 33, xchips = 1.2 } },
    link_config = { j_swp_2triplet = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_2triplet")) then
            return {
                vars = { card.ability.extra.xchips },
                key = "pnr_swp_triad_buffed"
            }
        else
            return {
                vars = { card.ability.extra.chips }
            }
        end
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_2triplet" then 
                        return true
                    end
                end
            end)()) and context.other_card:get_id() == 3) then
                return {
                    chips = card.ability.extra.chips
                }
            elseif ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_2triplet" then 
                        return true
                    end
                end
            end)() and context.other_card:get_id() == 3) then
                return {
                    x_chips = card.ability.extra.xchips
                }
            end
        end
    end
}