
SMODS.Joker{ --Club Card
    key = "2clubcard",
    config = {
        extra = {
            chipvar = 7
        }
    },
    loc_txt = {
        ['name'] = 'Club Card',
        ['text'] = {
            [1] = 'Played {C:clubs}Clubs{} permanently',
            [2] = 'adds {C:blue}+#1#{} Chips for the played',
            [3] = '{C:attention}Poker Hand{} when{C:attention} scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
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
        
        return {vars = {card.ability.extra.chipvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Clubs") then

                local hand = context.scoring_name
        
                if hand and G.GAME.hands[hand] then
                    G.GAME.hands[hand].chips = G.GAME.hands[hand].chips + card.ability.extra.chipvar
                end

                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(5), colour = G.C.CHIPS})
            end
        end
    end
}