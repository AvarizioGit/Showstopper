
SMODS.Joker{ --Red Seal Steel King
    key = "3redsealsteelking",
    config = {
        extra = {
            steel_odds = 4,
            seal_odds = 8
        }
    },
    loc_txt = {
        ['name'] = 'Red Seal Steel King',
        ['text'] = {
            [1] = 'Played {C:attention}Kings{} has a {C:green}#1# in #3#{}',
            [2] = 'chance to become {C:attention}Steel{} and',
            [3] = '{C:green}#2# in #4#{} chance to get a {C:attention}Red Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        local numerator1, denominator1 = swp_uti.chance_vars(card, 'steel_apply', nil, card.ability.extra.steel_odds)
        local numerator2, denominator2 = swp_uti.chance_vars(card, 'seal_apply', nil, card.ability.extra.seal_odds)

        return {vars = {
            numerator1,
            numerator2,
            denominator1,
            denominator2
        }
    }
    end,

    calculate = function(self, card, context)
        if context.initial_scoring_step then
            for _, played_card in ipairs(context.full_hand) do
                if played_card:get_id() == 13 then
                    if swp_uti.chance(card, 'steel_apply', card.ability.extra.num, card.ability.extra.steel_odds) then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                            
                            played_card:set_ability(G.P_CENTERS.m_steel)
                            return true
                        end
                        }))
                    end
                    if swp_uti.chance(card, 'seal_apply', card.ability.extra.num, card.ability.extra.seal_odds) then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                            
                            played_card:set_seal("Red", true)
                            return true
                        end
                        }))
                    end
                end
            end
        end
    end
}