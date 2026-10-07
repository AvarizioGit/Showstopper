
SMODS.Joker{ --You Are An Idiot!
    key = "3youareanidiot",
    config = {
        extra = {
            chipvar = 50,
            multvar = 8,
            moneyvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'You Are An Idiot!',
        ['text'] = {
            [1] = '{C:attention}Face cards{} gives {C:blue}+#1#{}',
            [2] = 'Chips, {C:red}+#2#{} Mult, and',
            [3] = 'earns {C:money}$#3#{} when scored',
            [4] = '{C:attention}Non-face cards{} are debuffed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 15
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.chipvar, card.ability.extra.multvar, card.ability.extra.moneyvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_face() then
                return {
                    chips = card.ability.extra.chipvar,
                    extra = {
                        mult = card.ability.extra.multvar,
                        extra = {
                            
                            func = function()
                                
                                local current_dollars = G.GAME.dollars
                                local target_dollars = G.GAME.dollars + card.ability.extra.moneyvar
                                local dollar_value = target_dollars - current_dollars
                                ease_dollars(dollar_value)
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.moneyvar), colour = G.C.MONEY})
                                return true
                            end,
                            colour = G.C.MONEY
                        }
                    }
                }
            end
        end
    end,

	update = function(self, card, dt)
		if G.deck and card.added_to_deck then
			for i, v in pairs(G.deck.cards) do
				if not v:is_face() then
					v:set_debuff(true)
				end
			end
		end
		if G.hand and card.added_to_deck then
			for i, v in pairs(G.hand.cards) do
				if not v:is_face() then
					v:set_debuff(true)
				end
			end
		end
	end,
}