Partner_API.Partner {
    key = "poll",
    unlocked = true,
    discovered = true,
    pos = { x = 3, y = 0 },
    atlas = "partners",
    config = { extra = { rep1 = 1, rep2 = 2, numerator = 1, denominator = 3 } },
    link_config = { j_swp_3survey = 1 },

    loc_vars = function(self, info_queue, card)
        if next(SMODS.find_card("j_swp_3survey")) then
            return {
                key = "pnr_swp_poll_buffed",
                vars = { card.ability.extra.numerator, card.ability.extra.denominator}
            }
        end
        
        local numerator, denominator = swp_uti.chance_vars(card, nil, card.ability.extra.numerator, card.ability.extra.denominator)

        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if next(SMODS.find_card("j_swp_3survey")) then
                if swp_uti.chance(card, 'poll', card.ability.extra.numerator, card.ability.extra.denominator) then
                    
                    return {
                        repetitions = 2,
                        message = localize('k_again_ex')
                    }
                end
            else
                if swp_uti.chance(card, 'poll', card.ability.extra.numerator, card.ability.extra.denominator) then
                    
                    return {
                        repetitions = 1,
                        message = localize('k_again_ex')
                    }
                end
            end
        end
    end
}





