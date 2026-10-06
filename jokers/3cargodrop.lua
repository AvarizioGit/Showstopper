
SMODS.Joker{ --Cargo Drop
    key = "3cargodrop",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Cargo Drop',
        ['text'] = {
            [1] = 'Creates a {C:dark_edition}Negative{} {C:attention}Supply Cache{}',
            [2] = 'when Blind is selected',
            [3] = ' ',
            [4] = '{C:inactive}Art: Rozzie{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 11
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                func = function()
                    
                    local created_joker = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_swp_1supplycache' })
                            if joker_card then
                                joker_card:set_edition("e_negative", true)
                                
                            end
                            
                            return true
                        end
                    }))
                    
                    if created_joker then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                    end
                    return true
                end
            }
        end
    end
}