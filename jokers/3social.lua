
SMODS.Joker{ --Social Security Card
    key = "3social",
    config = {
        extra = {
            Chipsvar = 0
        }
    },
    loc_txt = {
        ['name'] = 'Social Security Card',
        ['text'] = {
            [1] = 'This Joker gains {C:blue}+3{} Chips when',
            [2] = 'a card or Joker is {C:attention}triggered{}',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 16
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
        
        return {vars = {card.ability.extra.Chipsvar}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.Chipsvar
            }
        end
        if context.individual and context.cardarea == G.play  then
            card.ability.extra.Chipsvar = (card.ability.extra.Chipsvar) + 3
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_steel"] == true then
                return {
                    func = function()
                        card.ability.extra.Chipsvar = (card.ability.extra.Chipsvar) + 3
                        return true
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.hand and context.end_of_round  then
            if SMODS.get_enhancements(context.other_card)["m_gold"] == true then
                return {
                    func = function()
                        card.ability.extra.Chipsvar = (card.ability.extra.Chipsvar) + 3
                        return true
                    end
                }
            end
        end
        if context.post_trigger  then
            return {
                func = function()
                    card.ability.extra.Chipsvar = (card.ability.extra.Chipsvar) + 3
                    return true
                end
            }
        end
    end
}