
SMODS.Joker{ --Seed Packet
    key = "2seedpacket",
    config = {
        extra = {
            slotvar = 1,
            multvar = 1.5,
            freejokerslots = 0,
            dollars0 = 5
        }
    },
    loc_txt = {
        ['name'] = 'Seed Packet',
        ['text'] = {
            [1] = 'Creates a {C:attention}Joker{} for {C:gold}$5{}',
            [2] = 'when {C:attention}Blind{} is selected',
            [3] = '{C:attention}Jokers{} gives {X:red,C:white}X#2#{} Mult',
            [4] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)

        local info_queue_0 = G.P_CENTERS["j_joker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_joker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.slotvar, card.ability.extra.multvar, ((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and (G.jokers and G.jokers.cards or {}) or {}))}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  and not context.blueprint then
            if (to_big(((G.jokers and G.jokers.config.card_limit or 0) - #(G.jokers and G.jokers.cards or {}))) >= to_big(1) and to_big(G.GAME.dollars) > to_big(5)) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars - 5
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(5), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        func = function()
                            
                            local created_joker = false
                            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                                created_joker = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local joker_card = SMODS.add_card({ set = 'Joker', key = 'j_joker' })
                                        if joker_card then
                                            
                                            
                                        end
                                        G.GAME.joker_buffer = 0
                                        return true
                                    end
                                }))
                            end
                            if created_joker then
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
                            end
                            return true
                        end,
                        colour = G.C.BLUE
                    }
                }
            end
        end
        if context.other_joker  then
            if context.other_joker.config.center.key == "j_joker" then
                return {
                    Xmult = card.ability.extra.multvar
                }
            end
        end
    end
}