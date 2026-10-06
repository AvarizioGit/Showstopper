swp_uti.Sleeve {
    key = 'brown',
    deck_buff = 'b_swp_brown_deck',
    atlas = 'cardsleeves',
    pos = { x = 1, y = 0 },
    config = {
        vouchers = {
            'v_swp_bigger_boosters',
            'v_swp_shelf_extension'
        },
    },
    unlocked = false,
    unlock_condition = { deck = "b_swp_brown_deck", stake = "stake_white" },

    loc_vars = function(self)
        return {
            key = self:loc_key(),
            vars = self:is_buffed() and {
                localize { type = 'name_text', key = 'v_swp_overboost', set = 'Voucher' },
                localize { type = 'name_text', key = 'v_swp_store_renovation', set = 'Voucher' }
            } or {
                localize { type = 'name_text', key = 'v_swp_bigger_boosters', set = 'Voucher' },
                localize { type = 'name_text', key = 'v_swp_shelf_extension', set = 'Voucher' }
            }
        }
    end,
    
    apply = function(self, sleeve)
        if self:is_buffed() then
            G.GAME.used_vouchers.v_swp_overboost = true
            G.GAME.used_vouchers.v_swp_store_renovation = true
            G.GAME.starting_voucher_count = (G.GAME.starting_voucher_count or 0) + 2
            G.E_MANAGER:add_event(Event({
                func = function()
                    Card.apply_to_run(nil, G.P_CENTERS.v_swp_overboost)
                    Card.apply_to_run(nil, G.P_CENTERS.v_swp_store_renovation)
                    return true
                end
            }))
        else
            CardSleeves.Sleeve.apply(self, sleeve)
        end
    end
}
