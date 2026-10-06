
SMODS.Voucher {
    key = 'priority_items',
    pos = { x = 1, y = 0 },
    config = { 
        extra = {
            item_rate0 = 0.35,
            item_rate = 0.45,
            item_rate2 = 0.2
        } 
    },
    loc_txt = {
        name = 'Priority Items',
        text = {
            [1] = 'Further {C:attention}Increases{} the spawn rate',
            [2] = 'of {C:uncommon}Uncommon{} and {C:rare}Rare{} Jokers'
        },
        unlock = {
            [1] = ''
        }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_nx_quality_goods'},
    atlas = 'Vouchers',
    redeem = function(self, card)
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.GAME.common_mod = 0.35               
                    return true
                end
            })),
            extra = {
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.uncommon_mod = 0.45               
                        return true
                    end
                })),
                colour = G.C.BLUE,
                extra = {
                    
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.rare_mod = 0.2               
                            return true
                        end
                    })),
                    colour = G.C.BLUE
                }
            }
        }
    end
}