
SMODS.Joker{ --Disintegrated Joker
    key = "1disintegratedjoker",
    config = {
        extra = {
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Disintegrated Joker',
        ['text'] = {
            [1] = 'Earn {C:gold}$5{} when a playing',
            [2] = 'card is {C:attention}destroyed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + 5
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}