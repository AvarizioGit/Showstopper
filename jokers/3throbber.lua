
SMODS.Joker{ --Throbber
    key = "3throbber",
    config = {
        extra = {
            triglimit = 3,
        }
    },
    loc_txt = {
        ['name'] = 'Throbber',
        ['text'] = {
            [1] = 'If {C:attention}played{} hand only has {C:attention}1{} card',
            [2] = 'Gives {X:red,C:white}X0{} Mult {C:attention}after scoring{}',
            [3] = 'and gain {C:blue}+1{} hand this round',
            [4] = '{C:inactive,s:0.8}(May trigger {C:attention,s:0.8}#1#{C:inactive,s:0.8} times this round)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.triglimit}}
    end,
    
    calculate = function(self, card, context)
        if context.final_scoring_step and not context.blueprint then
            if (to_big(#context.full_hand) == to_big(1) and to_big((card.ability.extra.triglimit or 0)) > to_big(0)) then
                card.ability.extra.triglimit = math.max(0, (card.ability.extra.triglimit) - 1)
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end,
                    extra = {
                        Xmult = 0
                    }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.triglimit = 3
                    return true
                end
            }
        end
    end
}