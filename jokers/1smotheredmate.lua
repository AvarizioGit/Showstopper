
SMODS.Joker{ --Smothered Mate
    key = "1smotheredmate",
    config = {
        extra = {
            trigswitch = 0,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Smothered Mate',
        ['text'] = {
            [1] = 'Earn {C:gold}$5{} if played hand',
            [2] = 'contains a scoring {C:attention}King{} that',
            [3] = 'is not the {C:attention}first/last{} card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.trigswitch}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 13 and not (context.other_card == context.scoring_hand[1]) and not (context.other_card == context.scoring_hand[#context.scoring_hand])) then
                card.ability.extra.trigswitch = 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.trigswitch or 0)) == to_big(1) then
                card.ability.extra.trigswitch = 0
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
    end
}