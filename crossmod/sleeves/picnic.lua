swp_uti.Sleeve {
    key = 'picnic',
    deck_buff = 'b_swp_picnic_deck',
    atlas = 'cardsleeves',
    pos = { x = 3, y = 0 },

    unlocked = false,
    unlock_condition = { deck = "b_swp_picnic_deck", stake = "stake_white" },

    loc_vars = function(self)
        return {
            key = self:loc_key()
        }
    end,

    apply = function(self, sleeve)
        if self:is_buffed() then
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 2
            G.GAME.starting_params.discards = G.GAME.starting_params.discards + 2
            return {
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:change_size(2)
                        return true
                    end
                }))
            }
        else
            G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
            G.GAME.starting_params.discards = G.GAME.starting_params.discards + 1
            return {
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:change_size(1)
                        return true
                    end
                }))
            }
        end
    end
}

