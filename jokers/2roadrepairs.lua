
SMODS.Joker{ --Road Repairs
    key = "2roadrepairs",
    config = {
        extra = {
            roundvar = 0,
            hand_size0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Road Repairs',
        ['text'] = {
            [1] = 'After {C:attention}4{} rounds, sell this',
            [2] = 'card to gain {C:attention}+2{} Hand size',
            [3] = '{C:inactive}(Currently{} {C:attention}#1#{}{C:inactive}/4 rounds){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
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
            if to_big((card.ability.extra.roundvar or 0)) >= to_big(4) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hand Limit", colour = G.C.BLUE})
                        
                        G.hand:change_size(2)
                        return true
                    end
                }
            end
        end
    end
}