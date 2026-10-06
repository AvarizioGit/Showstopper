
SMODS.Voucher {
    key = 'store_renovation',
    pos = { x = 5, y = 0 },
    config = { 
        extra = {
            booster_slots0 = 1,
            voucher_slots0 = 1
        } 
    },
    loc_txt = {
        name = 'Store Renovation',
        text = {
            [1] = '{C:attention}+1{} Booster Slot',
            [2] = '{C:attention}+1{} Voucher Slot'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_nx_shelf_extension'},
    atlas = 'Vouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_booster_limit(1)
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        
                        SMODS.change_voucher_limit(1)
                        return true
                    end
                })),
                colour = G.C.WHITE
            }
        }
    end
}