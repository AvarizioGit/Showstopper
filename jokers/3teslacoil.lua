
SMODS.Joker{ --Tesla Coil
    key = "3teslacoil",
    config = {extra = {enhancement = 'm_steel'}},
    loc_txt = {
        ['name'] = 'Tesla Coil',
        ['text'] = {
            [1] = 'Cards {C:attention}held in hand{}',
            [2] = 'gives {X:red,C:white}X1.25{} Mult',
            [3] = 'for each {C:attention}Steel Card{}',
            [4] = 'adjacent to itself'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 15
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
    attributes = {'enhancements'},
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {localize({set = 'Enhanced', key = card.ability.extra.enhancement, type = 'name_text'})}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.hand and not context.end_of_round then
            local card = context.other_card

            for i, v in ipairs(G.hand.cards) do
                if v == card then
                    local left = G.hand.cards[i - 1]
                    local right = G.hand.cards[i + 1]

                    if (left and SMODS.has_enhancement(left, 'm_steel')) and (right and SMODS.has_enhancement(right, 'm_steel')) then
                        return {
                            xmult = 1.25,
                            extra = {
                                xmult = 1.25
                            }
                        }
                    elseif (left and SMODS.has_enhancement(left, 'm_steel')) or (right and SMODS.has_enhancement(right, 'm_steel')) then
                        return {
                            xmult = 1.25
                        }
                    end
                end
            end
        end
    end
}