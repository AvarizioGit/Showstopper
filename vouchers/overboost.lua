
SMODS.Voucher {
    key = 'overboost',
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = 'Over-Boost',
        text = {
            [1] = '{C:attention}+1{} card options in {C:attention}Booster Packs{}',
            [2] = '{C:attention}+1{} selection chances in {C:attention}Booster Packs{}'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_nx_bigger_boosters'},
    atlas = 'Vouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) +1
                    return true
                end
            }))
            ,
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.modifiers.booster_choice_mod = (G.GAME.modifiers.booster_choice_mod or 0) +1
                        return true
                    end
                }))
                ,
                colour = G.C.BLUE
            }
        }
    end
}