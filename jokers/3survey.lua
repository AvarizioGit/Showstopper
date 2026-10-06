
SMODS.Joker{ --Survey
    key = "3survey",
    config = {
        extra = {
            repetitions0 = 1,
            odds = 11,
            repetitions = 11,
            odds2 = 10,
            repetitions2 = 10,
            odds3 = 9,
            repetitions3 = 9,
            odds4 = 8,
            repetitions4 = 8,
            odds5 = 7,
            repetitions5 = 7,
            odds6 = 6,
            repetitions6 = 6,
            odds7 = 5,
            repetitions7 = 5,
            odds8 = 4,
            repetitions8 = 4,
            odds9 = 3,
            repetitions9 = 3,
            odds10 = 2,
            repetitions10 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Survey',
        ['text'] = {
            [1] = 'Cards has a {C:green}#1# in (their rank){} chance to',
            [2] = '{C:attention}retrigger{} the amount of their rank'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 16
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_3survey')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_nx_3survey')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_nx_3survey')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_nx_3survey')
        local new_numerator5, new_denominator5 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds5, 'j_nx_3survey')
        local new_numerator6, new_denominator6 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds6, 'j_nx_3survey')
        local new_numerator7, new_denominator7 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds7, 'j_nx_3survey')
        local new_numerator8, new_denominator8 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds8, 'j_nx_3survey')
        local new_numerator9, new_denominator9 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds9, 'j_nx_3survey')
        local new_numerator10, new_denominator10 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds10, 'j_nx_3survey')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4, new_numerator5, new_denominator5, new_numerator6, new_denominator6, new_numerator7, new_denominator7, new_numerator8, new_denominator8, new_numerator9, new_denominator9, new_numerator10, new_denominator10}}
    end,
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_08c7d11d', 1, card.ability.extra.odds, 'j_nx_3survey', false) then
                            
                            return {repetitions = 11}
                        end
                        return true
                    end
                }
            elseif (context.other_card:get_id() == 10 or context.other_card:is_face()) then
                if SMODS.pseudorandom_probability(card, 'group_0_1525a41f', 1, card.ability.extra.odds2, 'j_nx_3survey', false) then
                    
                    return {repetitions = 10}
                end
            elseif context.other_card:get_id() == 9 then
                if SMODS.pseudorandom_probability(card, 'group_0_76b503c1', 1, card.ability.extra.odds3, 'j_nx_3survey', false) then
                    
                    return {repetitions = 9}
                end
            elseif context.other_card:get_id() == 8 then
                if SMODS.pseudorandom_probability(card, 'group_0_32ea72f8', 1, card.ability.extra.odds4, 'j_nx_3survey', false) then
                    
                    return {repetitions = 8}
                end
            elseif context.other_card:get_id() == 7 then
                if SMODS.pseudorandom_probability(card, 'group_0_970fcbea', 1, card.ability.extra.odds5, 'j_nx_3survey', false) then
                    
                    return {repetitions = 7}
                end
            elseif context.other_card:get_id() == 6 then
                if SMODS.pseudorandom_probability(card, 'group_0_a3af979f', 1, card.ability.extra.odds6, 'j_nx_3survey', false) then
                    
                    return {repetitions = 6}
                end
            elseif context.other_card:get_id() == 5 then
                if SMODS.pseudorandom_probability(card, 'group_0_69558d90', 1, card.ability.extra.odds7, 'j_nx_3survey', false) then
                    
                    return {repetitions = 5}
                end
            elseif context.other_card:get_id() == 4 then
                if SMODS.pseudorandom_probability(card, 'group_0_878d0bee', 1, card.ability.extra.odds8, 'j_nx_3survey', false) then
                    
                    return {repetitions = 4}
                end
            elseif context.other_card:get_id() == 3 then
                if SMODS.pseudorandom_probability(card, 'group_0_1b6cb013', 1, card.ability.extra.odds9, 'j_nx_3survey', false) then
                    
                    return {repetitions = 3}
                end
            elseif context.other_card:get_id() == 2 then
                if SMODS.pseudorandom_probability(card, 'group_0_dfc41c97', 1, card.ability.extra.odds10, 'j_nx_3survey', false) then
                    
                    return {repetitions = 2}
                end
            end
        end
    end
}