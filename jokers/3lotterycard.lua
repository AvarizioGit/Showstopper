
SMODS.Joker{ --Lottery Card
    key = "3lotterycard",
    config = {
        extra = {
            odds = 2,
            odds2 = 4,
            odds3 = 6,
            odds4 = 8,
            chipvar = 30,
            multvar = 15,
            xmultvar = 2,
            moneyvar = 10
        }
    },
    loc_txt = {
        ['name'] = 'Lottery Card',
        ['text'] = {
            [1] = 'Cards {C:attention}held in hand{} has a',
            [2] = '{C:green}#1# in #2#{} chance to give {C:blue}+30{} Chips',
            [3] = '{C:green}#3# in #4#{} chance to give {C:red}+15{} Mult',
            [4] = '{C:green}#5# in #6#{} chance to give {X:red,C:white}X2{} Mult',
            [5] = '{C:green}#7# in #8#{} chance to give {C:money}$10{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 14
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_3lotterycard')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_nx_3lotterycard')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_nx_3lotterycard')
        local new_numerator4, new_denominator4 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds4, 'j_nx_3lotterycard')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3, new_numerator4, new_denominator4}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_2e1bbcc5', 1, card.ability.extra.odds, 'j_nx_3lotterycard', false) then
                    SMODS.calculate_effect({chips = 30}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_1_a04cad8b', 1, card.ability.extra.odds2, 'j_nx_3lotterycard', false) then
                    SMODS.calculate_effect({mult = 15}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_2_64b00725', 1, card.ability.extra.odds3, 'j_nx_3lotterycard', false) then
                    SMODS.calculate_effect({Xmult = 2}, card)
                end
                if SMODS.pseudorandom_probability(card, 'group_3_0a6b15bf', 1, card.ability.extra.odds4, 'j_nx_3lotterycard', false) then
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + 10
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(10), colour = G.C.MONEY})
                            return true
                        end}, card)
                    end
                end
            end
        end
    }