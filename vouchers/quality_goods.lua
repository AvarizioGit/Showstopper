
SMODS.Voucher {
    key = 'quality_goods',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0.5,
            item_rate = 0.375,
            item_rate2 = 0.125
        } 
    },
    loc_txt = {
        name = 'Quality Goods',
        text = {
            [1] = '{C:attention}Increases{} the spawn rate of',
            [2] = '{C:uncommon}Uncommon{} and {C:rare}Rare{} Jokers',
            [3] = ''
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'Vouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.common_mod = 0.5               
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.uncommon_mod = 0.375               
                        return true
                    end
                })),
                colour = G.C.BLUE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.rare_mod = 0.125               
                            return true
                        end
                    })),
                    colour = G.C.BLUE
                }
            }
        }
    end
}