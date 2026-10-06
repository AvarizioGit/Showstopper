
SMODS.Joker{ --Book Move
    key = "1bookmove",
    config = {
        extra = {
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Book Move',
        ['text'] = {
            [1] = 'If {C:attention}first played hand{} is a single card',
            [2] = '{C:blue}+1{} hand for the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (to_big(#context.full_hand) == to_big(1) and G.GAME.current_round.hands_played == 0) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                        
                        G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                        return true
                    end
                }
            end
        end
    end
}