
SMODS.Joker{ --Phoenix Package
    key = "3phoenixpackage",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Phoenix Package',
        ['text'] = {
            [1] = '{C:attention}Sell{} this Joker during a {C:attention}Boss Blind{} to',
            [2] = '{C:green}instantly{} win the current {C:attention}Boss Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 22
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_self  then
            if G.GAME.blind.boss then
                G.E_MANAGER:add_event(Event({
                    blocking = false,
                    func = function()
                        if G.STATE == G.STATES.SELECTING_HAND then
                            G.GAME.chips = G.GAME.blind.chips
                            G.STATE = G.STATES.HAND_PLAYED
                            G.STATE_COMPLETE = true
                            end_round()
                            return true
                        end
                    end
                }))
                return {
                    message = "Win!"
                }
            end
        end
    end
}
