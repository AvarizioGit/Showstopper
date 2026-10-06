
SMODS.Back {
    key = 'mashup_deck',
    pos = { x = 3, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Mashup Deck',
        text = {
            [1] = 'Start with a random',
            [2] = '{C:common}Common{}, {C:uncommon}Uncommon{}',
            [3] = 'and {C:rare}Rare{} Joker'
        },
        unlock = {
            [1] = 'Win a run with',
            [2] = '{C:attention}#1#{} on {V:1}#2# or',
            [3] = '{C:attention}#3#{} on {V:1}#4# or',
            [4] = '{C:attention}#4#{} on {V:1}#6#'
        },
    },
    unlocked = false,
    atlas = 'Decks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                    local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
    end,

    locked_loc_vars = function(self, info_queue, back)
        local red_deck = localize("k_unknown")
        if G.P_CENTERS["b_red"].unlocked then
            red_deck = localize { type = "name_text", set = "Back", key = "b_red" }
        end
        local blue_deck = localize("k_unknown")
        if G.P_CENTERS["b_blue"].unlocked then
            blue_deck = localize { type = "name_text", set = "Back", key = "b_blue" }
        end
        local green_deck = localize("k_unknown")
        if G.P_CENTERS["b_green"].unlocked then
            green_deck = localize { type = "name_text", set = "Back", key = "b_green" }
        end

        return {
            vars = {
                red_deck,
                localize { type = "name_text", set = "Stake", key = "stake_blue" },
                blue_deck,
                localize { type = "name_text", set = "Stake", key = "stake_green" },
                green_deck,
                localize { type = "name_text", set = "Stake", key = "stake_red" },
                colours = {
                    get_stake_col(5),
                    get_stake_col(3),
                    get_stake_col(2)
                }
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == "win_stake" and (get_deck_win_stake("b_red") >= 5) or (get_deck_win_stake("b_blue") >= 3) or (get_deck_win_stake("b_green") >= 2)
    end
}