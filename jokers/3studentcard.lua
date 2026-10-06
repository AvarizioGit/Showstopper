
SMODS.Joker{ --Student ID Card
    key = "3studentcard",
    config = {
        extra = {
            rankvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'Student ID Card',
        ['text'] = {
            [1] = 'Played {C:attention}3s{} and {C:attention}4s{} become {C:attention}Jacks{}',
            [2] = 'or {C:attention}Queens{} when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 16
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
    pools = { ["nx_nx_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rankvar}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if ((context.other_card:get_id() == 3 or context.other_card:get_id() == 4)) and (to_big((card.ability.extra.rankvar or 0)) == to_big(1)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Jack"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.rankvar = pseudorandom('RANGE:1|2', 1, 2)
            elseif ((context.other_card:get_id() == 4 or context.other_card:get_id() == 3)) and (to_big((card.ability.extra.rankvar or 0)) == to_big(2)) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, nil, "Queen"))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                card.ability.extra.rankvar = pseudorandom('RANGE:1|2', 1, 2)
            end
        end
    end
}