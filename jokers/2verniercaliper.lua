
SMODS.Joker{ --Vernier Caliper
    key = "2verniercaliper",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Vernier Caliper',
        ['text'] = {
            [1] = 'All {C:attention}Poker Hands{}',
            [2] = 'additionally counts as',
            [3] = 'containing a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },

    calculate = function(self, card, context)
        if context.evaluate_poker_hand then
            local poker_hands = {}

            for k, v in pairs(context.poker_hands) do
                poker_hands[k] = v
            end

            if not next(poker_hands["Straight"]) then
                poker_hands["Straight"] = {
                    context.scoring_hand
                }
            end

            return {
                replace_poker_hands = poker_hands
            }
        end
    end
}