
SMODS.Joker{ --Company Business Card
    key = "2companycard",
    config = {
        extra = {
            payoutvar = 2,
            scalevar = 2,
            odds = 2,
            basevar = 2
        }
    },
    loc_txt = {
        ['name'] = 'Company Business Card',
        ['text'] = {
            [1] = 'Earns {C:gold}$#1#{} at end of round',
            [2] = 'Scored {C:attention}face{} cards has a {C:green}#2# in #3#{} chance',
            [3] = 'to increase payout by {C:gold}$#4#{} when scored',
            [4] = '{C:inactive}(Resets after Boss Blind is defeated){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_2companycard') 
        return {vars = {card.ability.extra.payoutvar, new_numerator, new_denominator, card.ability.extra.scalevar, card.ability.extra.basevar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                if SMODS.pseudorandom_probability(card, 'group_0_e05065ab', 1, card.ability.extra.odds, 'j_nx_2companycard', false) then
                    card.ability.extra.payoutvar = (card.ability.extra.payoutvar) + card.ability.extra.scalevar
                    
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.payoutvar
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.payoutvar), colour = G.C.MONEY})
                    return true
                end
            }
        end
        if context.ante_change  then
            return {
                func = function()
                    card.ability.extra.payoutvar = card.ability.extra.basevar
                    return true
                end
            }
        end
    end
}