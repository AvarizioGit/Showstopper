

SMODS.Voucher {
    key = 'bigger_boosters',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Bigger Boosters',
        text = {
            [1] = '{C:attention}+1{} card options',
            [2] = 'in {C:attention}Booster Packs{}'
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
                    G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) +1
                    return true
                end
            }))
            
        }
    end
}