
SMODS.Joker{ --Joker Crossing
    key = "2jokercrossing",
    config = {
        extra = {
            xmult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Joker Crossing',
        ['text'] = {
            [1] = 'If played {C:attention}Poker hand{} is above level {C:attention}5{}',
            [2] = 'Held {C:attention}Jokers{} gives {X:red,C:white}X#1#{} Mult each'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 7
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
    pools = { ["swp_swp_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.xmult}}
    end,

    calculate = function(self, card, context)
        if context.other_joker then
            local hand = G.GAME.hands[context.scoring_name]

            if hand and hand.level > 5 then
                return {
                    Xmult = card.ability.extra.xmult
                }
            end
        end
    end,
}