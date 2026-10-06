
SMODS.Back {
    key = 'picnic_deck',
    pos = { x = 9, y = 0 },
    config = {
        extra = {
            hand_size0 = 1
        },
    },
    loc_txt = {
        name = 'Picnic Deck',
        text = {
            [1] = '{C:dark_edition}+1{} Joker slot',
            [2] = '{C:attention}+1{} Hand size',
            [3] = '{C:red}+1{} Discards'
        },
        unlock = {
            [1] = 'Win a run',
            [2] = 'with {C:attention}#1#{}',
            [3] = 'on {V:1}#2#'
        },
    },
    unlocked = false,
    atlas = 'Decks',
    apply = function(self, back)
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
    end,

    locked_loc_vars = function(self, info_queue, back)
        local black_deck = localize("k_unknown")
        if G.P_CENTERS["b_red"].unlocked then
            black_deck = localize { type = "name_text", set = "Back", key = "b_black" }
        end

        return {
            vars = {
                black_deck,
                localize { type = "name_text", set = "Stake", key = "stake_gold" },
                colours = {
                    get_stake_col(8)
                }
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == "win_stake" and (get_deck_win_stake("b_black") >= 8)
    end
}