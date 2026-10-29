
SMODS.Joker{ --Hardhat
    key = "2hardhat",
    config = {
        extra = {
            chipvar = 75
        }
    },
    loc_txt = {
        ['name'] = 'Hardhat',
        ['text'] = {
            [1] = '{C:attention}Steel{} and {C:attention}Stone{} cards gives',
            [2] = '{C:blue}+#1#{} Chips when {C:attention}held in hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (SMODS.get_enhancements(context.other_card)["m_steel"] == true or SMODS.get_enhancements(context.other_card)["m_stone"] == true) then
                return {
                    chips = card.ability.extra.chipvar
                }
            end
        end
    end
}