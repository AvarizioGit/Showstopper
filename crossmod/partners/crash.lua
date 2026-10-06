Partner_API.Partner {
    key = "crash",
    unlocked = true,
    discovered = true,
    pos = { x = 2, y = 0 },
    atlas = "partners",
    config = { extra = { chips = 10, xchips = 0.05 } },
    link_config = { j_swp_3bluescreen = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_3bluescreen")) then
            return {
                vars = { card.ability.extra.xchips },
                key = "pnr_swp_crash_buffed"
            }
        else
            return {
                vars = { card.ability.extra.chips }
            }
        end
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.end_of_round  then
            if ((context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or context.other_card.edition and context.other_card.edition.key == "foil" or context.other_card.seal == "Blue")) and (not ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_3bluescreen" then 
                        return true
                    end
                end
            end)())) then
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
                context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            elseif ((context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or context.other_card.edition and context.other_card.edition.key == "foil" or context.other_card.seal == "Blue")) and ((function()
                for i, v in pairs(G.jokers.cards) do
                    if v.config.center.key == "j_swp_3bluescreen" then 
                        return true
                    end
                end
            end)()) then
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips or 0
                context.other_card.ability.perma_x_chips = context.other_card.ability.perma_x_chips + card.ability.extra.xchips
                return {
                    extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }, card = card
                }
            end
        end
    end
}