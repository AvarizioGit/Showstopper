
SMODS.Joker{ --Triplet
    key = "2triplet",
    config = {
        extra = {
            chips0 = 33,
            xmult0 = 1.33
        }
    },
    loc_txt = {
        ['name'] = 'Triplet',
        ['text'] = {
            [1] = 'Played {C:attention}3s{} gives {C:blue}+33{} Chips and',
            [2] = '{X:red,C:white}X1.33{} Mult when scored if',
            [3] = 'hand contains three {C:attention}3s{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 3 and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:get_id() == 3 then
                        count = count + 1
                    end
                end
                return count >= 3
            end)()) then
                return {
                    chips = 33,
                    extra = {
                        Xmult = 1.33
                    }
                }
            end
        end
    end
}