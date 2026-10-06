
SMODS.Voucher {
    key = 'shelf_extension',
    pos = { x = 4, y = 0 },
    config = { 
        extra = {
            booster_slots0 = 1
        } 
    },
    loc_txt = {
        name = 'Shelf Extension',
        text = {
            [1] = '{C:attention}+1{} Booster Slot'
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
    atlas = 'Vouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_booster_limit(1)
                    return true
                end
            }))
        }
    end
}