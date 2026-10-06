
SMODS.Joker{ --One More Card
    key = "3onemorecard",
    config = {
        extra = {
            handsizevar = 0,
            cslvar = 1,
            incvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'One More Card',
        ['text'] = {
            [1] = '{C:attention}+#2#{} Card Selection Limit',
            [2] = 'Gains {C:attention}+#3#{} Hand size when',
            [3] = 'a {C:attention}Boss Blind{} is defeated',
            [4] = '{C:inactive}(Currently{} {C:attention}+#1#{} {C:inactive}Hand size){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 11
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
        
        return {vars = {card.ability.extra.handsizevar, card.ability.extra.cslvar, card.ability.extra.incvar}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.incvar).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(card.ability.extra.incvar)
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.handsizevar = (card.ability.extra.handsizevar) + card.ability.extra.incvar
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(card.ability.extra.cslvar)
        SMODS.change_discard_limit(card.ability.extra.cslvar)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-card.ability.extra.cslvar)
        SMODS.change_discard_limit(-card.ability.extra.cslvar)
    end
}