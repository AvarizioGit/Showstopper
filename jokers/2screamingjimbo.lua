
SMODS.Joker{ --Screaming Jimbo
    key = "2screamingjimbo",
    config = {
        extra = {
            firstvar = 0,
            scale0 = 1,
            rotation0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Screaming Jimbo',
        ['text'] = {
            [1] = 'Creates {C:attention}2{} random {C:attention}Tags{} if',
            [2] = '{C:attention}Blind{} is beaten in {C:attention}1{} hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 23
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.firstvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                card.ability.extra.firstvar = 1
            elseif not (G.GAME.current_round.hands_played == 0) then
                card.ability.extra.firstvar = 0
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.firstvar or 0)) == to_big(1) then
                local target_card = context.other_card
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                local tag = Tag(selected_tag)
                                if tag.name == "Orbital Tag" then
                                    local _poker_hands = {}
                                    for k, v in pairs(G.GAME.hands) do
                                        if v.visible then
                                            _poker_hands[#_poker_hands + 1] = k
                                        end
                                    end
                                    tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                                end
                                tag:set_ability()
                                add_tag(tag)
                                play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                return true
                            end
                        }))
                        return true
                    end,
                    message = "Created Tag!",
                    extra = {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                                    local tag = Tag(selected_tag)
                                    if tag.name == "Orbital Tag" then
                                        local _poker_hands = {}
                                        for k, v in pairs(G.GAME.hands) do
                                            if v.visible then
                                                _poker_hands[#_poker_hands + 1] = k
                                            end
                                        end
                                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                                    end
                                    tag:set_ability()
                                    add_tag(tag)
                                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                                    return true
                                end
                            }))
                            return true
                        end,
                        message = "Created Tag!",
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card:juice_up(1, 1)
                                return true
                            end,
                            colour = G.C.WHITE,
                            extra = {
                                func = function()
                                    card.ability.extra.firstvar = 0
                                    return true
                                end,
                                colour = G.C.BLUE
                            }
                        }
                    }
                }
            end
        end
    end
}