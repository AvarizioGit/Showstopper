Partner_API.Partner {
    key = "agency",
    unlocked = true,
    discovered = true,
    pos = { x = 1, y = 0 },
    atlas = "partners",
    config = { extra = { money = 1 } },
    link_config = { j_swp_2companycard = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_2companycard")) then
            return {
                key = "pnr_swp_agency_buffed",
                vars = { card.ability.extra.money }
            }
        else
            return {
                vars = { card.ability.extra.money }
            }
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_2companycard" then 
                        return true
                    end
                end
            end)()) and context.other_card:is_face() and (function()
                for i = 1, #context.scoring_hand do
                    local scoring_card = context.scoring_hand[i]
                    if scoring_card:is_face() then
                        return scoring_card == context.other_card
                    end
                end
                return false
            end)()) then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.money
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
            elseif ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_2companycard" then 
                        return true
                    end
                end
            end)() and context.other_card:is_face()) then
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars or 0
                context.other_card.ability.perma_p_dollars = context.other_card.ability.perma_p_dollars + card.ability.extra.money
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.MONEY }, card = card
                }
            end
        end
    end
}