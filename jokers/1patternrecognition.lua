
SMODS.Joker{ --Pattern Recognition
    key = "1patternrecognition",
    config = {
        extra = {
            multvar = 8
        }
    },
    loc_txt = {
        ['name'] = 'Pattern Recognition',
        ['text'] = {
            [1] = '{C:red}+#1#{} {C:white}Mult{} if played',
            [2] = '{C:white}hand contains{} {C:attention}4{}',
            [3] = 'or more {C:white}cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.multvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(#context.full_hand) >= to_big(4) then
                return {
                    mult = card.ability.extra.multvar
                }
            end
        end
    end
}