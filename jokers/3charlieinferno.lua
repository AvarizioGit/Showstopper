
SMODS.Joker{ --The Mult Goes to Heaven, The Chips Goes to Hell
    key = "3charlieinferno",
    config = {
        extra = {
            xmultvar = 1.2,
            chipredvar = -30,
            xmultinc = 0.2,
            basemultvar = 1.2,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'The Mult Goes to Heaven, The Chips Goes to Hell',
        ['text'] = {
            [1] = '{C:attention}Scored{} cards gives {X:red,C:white}X#1#{} Mult and',
            [2] = 'increases by {X:red,C:white}X#3#{} every trigger',
            [3] = '{C:green}#5# in #6#{} chance to reset the Mult',
            [4] = 'value and lose {C:red}#2#{} Chips when {C:attention}scored{}',
            [5] = '{C:inactive}(Mult value resets each hand){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 12
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_nx_3charlieinferno') 
        return {vars = {card.ability.extra.xmultvar, card.ability.extra.chipredvar, card.ability.extra.xmultinc, card.ability.extra.basemultvar, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                local xmultvar_value = card.ability.extra.xmultvar
                card.ability.extra.xmultvar = (card.ability.extra.xmultvar) + card.ability.extra.xmultinc
                return {
                    Xmult = xmultvar_value
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_2c9b6b4a', 1, card.ability.extra.odds, 'j_nx_3charlieinferno', false) then
                            card.ability.extra.xmultvar = card.ability.extra.basemultvar
                            SMODS.calculate_effect({chips = card.ability.extra.chipredvar}, card)
                        end
                        return true
                    end
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            return {
                func = function()
                    card.ability.extra.xmultvar = card.ability.extra.basemultvar
                    return true
                end
            }
        end
    end
}