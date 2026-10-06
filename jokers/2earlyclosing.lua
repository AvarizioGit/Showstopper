
SMODS.Joker{ --Shop Revamp
    key = "2earlyclosing",
    config = {
        extra = {
            roundvar = 0,
            voucher_slots0 = 1,
            booster_slots0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Early Closing',
        ['text'] = {
            [1] = 'After {C:attention}5{} rounds, sell this card',
            [2] = 'to gain {C:attention}+1{} Voucher slots',
            [3] = 'and {C:attention}+1{} Booster slots',
            [4] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/5 rounds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.roundvar}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
            return {
                func = function()
                    card.ability.extra.roundvar = (card.ability.extra.roundvar) + 1
                    return true
                end
            }
        end
        if context.selling_self  and not context.blueprint then
            if to_big((card.ability.extra.roundvar or 0)) >= to_big(5) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Voucher Slots", colour = G.C.BLUE})
                        
                        SMODS.change_voucher_limit(1)
                        return true
                    end,
                    extra = {
                        
                        func = function()
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Booster Slots", colour = G.C.BLUE})
                            
                            SMODS.change_booster_limit(1)
                            return true
                        end,
                        colour = G.C.WHITE
                    }
                }
            end
        end
    end
}