Partner_API.Partner {
    key = "identity",
    unlocked = true,
    discovered = true,
    pos = { x = 4, y = 0 },
    atlas = "partners",
    config = { extra = { chipvar = 0, incvar1 = 1, incvar2 = 2 } },
    link_config = { j_swp_3social = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_3social")) then
            return {
                vars = { card.ability.extra.chipvar, card.ability.extra.incvar2 },
                key = "pnr_swp_identity_buffed"
            }
        else
            return {
                vars = { card.ability.extra.chipvar, card.ability.extra.incvar1 },
            }
        end
    end,

    calculate = function(self, card, context)
        if next(SMODS.find_card("j_swp_3social")) then
            if context.joker_main then
                return {
                    chips = card.ability.extra.chipvar
                }
            end
            if context.individual and context.cardarea == G.play  then
                card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar2
            end
            if context.individual and context.cardarea == G.hand and not context.end_of_round  then
                if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                    return {
                        func = function()
                            card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar2
                            return true
                        end
                    }
                end
            end
            if context.individual and context.cardarea == G.hand and context.end_of_round  then
                if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                    return {
                        func = function()
                            card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar2
                            return true
                        end
                    }
                end
            end
        else
            if context.joker_main then
                return {
                    chips = card.ability.extra.chipvar
                }
            end
            if context.individual and context.cardarea == G.play  then
                card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar1
            end
            if context.individual and context.cardarea == G.hand and not context.end_of_round  then
                if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                    return {
                        func = function()
                            card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar1
                            return true
                        end
                    }
                end
            end
            if context.individual and context.cardarea == G.hand and context.end_of_round  then
                if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                    return {
                        func = function()
                            card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.incvar1
                            return true
                        end
                    }
                end
            end
        end
    end
}