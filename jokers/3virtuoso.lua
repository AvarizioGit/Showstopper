
SMODS.Joker{ --Virtuoso
    key = "3virtuoso",
    config = {
        extra = {
            scorevaar = 1,
            chips0 = 50,
            mult0 = 8,
            xmult0 = 1.5,
            dollars0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Virtuoso',
        ['text'] = {
            [1] = '{C:enhanced}Enhanced{} cards gives between {C:blue}+#2#{}',
            [2] = 'Chips, {C:red}+#3#{} Mult, {X:red,C:white}X#4#{} Mult, {C:gold}$#5#{}, and',
            [3] = '{C:attention}all effects{} at once when {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 24
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.scorevaar, card.ability.extra.chips0, card.ability.extra.mult0, card.ability.extra.xmult0, card.ability.extra.dollars0}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.scorevaar or 0)) == to_big(1)) then
                card.ability.extra.scorevaar = pseudorandom('RANGE:1|5', 1, 5)
                return {
                    chips = card.ability.extra.chips0
                }
            elseif ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.scorevaar or 0)) == to_big(2)) then
                card.ability.extra.scorevaar = pseudorandom('RANGE:1|5', 1, 5)
                return {
                    mult = card.ability.extra.mult0
                }
            elseif ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.scorevaar or 0)) == to_big(3)) then
                card.ability.extra.scorevaar = pseudorandom('RANGE:1|5', 1, 5)
                return {
                    Xmult = card.ability.extra.xmult0
                }
            elseif ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.scorevaar or 0)) == to_big(4)) then
                card.ability.extra.scorevaar = pseudorandom('RANGE:1|5', 1, 5)
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.dollars0
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif ((function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() and to_big((card.ability.extra.scorevaar or 0)) == to_big(5)) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound("explosion_release1")
                        
                        return true
                    end,
                }))
                card.ability.extra.scorevaar = pseudorandom('RANGE:1|5', 1, 5)
                return {
                    chips = card.ability.extra.chips0,
                    extra = {
                        mult = card.ability.extra.mult0,
                        extra = {
                            Xmult = card.ability.extra.xmult0,
                            extra = {
                                
                                func = function()
                                    
                                    local current_dollars = G.GAME.dollars
                                    local target_dollars = G.GAME.dollars + card.ability.extra.dollars0
                                    local dollar_value = target_dollars - current_dollars
                                    ease_dollars(dollar_value)
                                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(2), colour = G.C.MONEY})
                                    return true
                                end,
                                colour = G.C.MONEY
                            }
                        }
                    }
                }
            end
        end
    end
}