
SMODS.Joker{ --Clockwork Conrad
    key = "2clockworkconrad",
    config = {
        extra = {
            chipvar = 30,
            multvar = 3,
            moneyvar = 1,
            xmultvar = 1.2,
            chipmod = 10,
            multmod = 1,
            moneymod = 0.5,
            xmultmod = 0.05,
            countdown = 5,
            scale0 = 1,
            rotation0 = 1,
            scale = 1,
            rotation = 1
        }
    },
    loc_txt = {
        ['name'] = 'Clockwork Conrad',
        ['text'] = {
            [1] = '{C:attention}First{} scored card gives {C:blue}+#1#{} Chips',
            [2] = '{C:attention}Second{} scored card gives {C:red}+#2#{} Mult',
            [3] = '{C:attention}Third{} scored card earns {C:gold}$#3#{}',
            [4] = '{C:attention}Fourth{} scored card gives {X:red,C:white}X#4#{} Mult',
            [5] = '{C:inactive}(Upgrades after {}{C:attention}#9#{} {C:inactive}hands){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 7
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
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipvar, card.ability.extra.multvar, card.ability.extra.moneyvar, card.ability.extra.xmultvar, card.ability.extra.chipmod, card.ability.extra.multmod, card.ability.extra.moneymod, card.ability.extra.xmultmod, card.ability.extra.countdown}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[1] then
                return {
                    chips = card.ability.extra.chipvar
                }
            elseif context.other_card == context.scoring_hand[2] then
                return {
                    mult = card.ability.extra.multvar
                }
            elseif context.other_card == context.scoring_hand[3] then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + card.ability.extra.moneyvar
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.moneyvar), colour = G.C.MONEY})
                        return true
                    end
                }
            elseif context.other_card == context.scoring_hand[4] then
                return {
                    Xmult = card.ability.extra.xmultvar
                }
            end
        end
        if context.before and context.cardarea == G.jokers  and not context.blueprint then
            if to_big((card.ability.extra.countdown or 0)) > to_big(1) then
                return {
                    func = function()
                        card.ability.extra.countdown = math.max(0, (card.ability.extra.countdown) - 1)
                        return true
                    end,
                    extra = {
                        message = "Tick!",
                        colour = G.C.WHITE
                    }
                }
            elseif to_big((card.ability.extra.countdown or 0)) <= to_big(1) then
                return {
                    func = function()
                        card.ability.extra.countdown = 5
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.chipvar = (card.ability.extra.chipvar) + card.ability.extra.chipmod
                            return true
                        end,
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                card.ability.extra.multvar = (card.ability.extra.multvar) + card.ability.extra.multmod
                                return true
                            end,
                            colour = G.C.GREEN,
                            extra = {
                                func = function()
                                    card.ability.extra.moneyvar = (card.ability.extra.moneyvar) + card.ability.extra.moneymod
                                    return true
                                end,
                                colour = G.C.GREEN,
                                extra = {
                                    func = function()
                                        card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + card.ability.extra.xmultmod
                                        return true
                                    end,
                                    colour = G.C.GREEN,
                                    extra = {
                                        message = "Tock!",
                                        colour = G.C.WHITE
                                    }
                                }
                            }
                        }
                    }
                }
            end
        end
    end
}