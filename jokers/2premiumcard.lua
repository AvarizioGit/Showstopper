
SMODS.Joker{ --Premium Card
    key = "2premiumcard",
    config = {
        extra = {
            rental_earn = -1,
            numerator = 1,
            denominator = 3
        }
    },
    loc_txt = {
        ['name'] = 'Premium Card',
        ['text'] = {
            [1] = '{C:attention}Cards{} in the shop has a',
            [2] = '{C:green}#2# in #3#{} chance to be {C:attention}Rental{}',
            [3] = '{C:attention}Rental{} stickers now earns',
            [4] = '{C:money}$3{} instead of subtracting'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = swp_uti.chance_vars(card, nil, card.ability.extra.numerator, card.ability.extra.denominator)
        return {vars = {card.ability.extra.rental_earn, card.ability.extra.numerator, card.ability.extra.denominator}}
    end,

    calculate = function(self, card, context) 
        if not context.blueprint and (context.reroll_shop or context.starting_shop) then
            for k, v in pairs(G.shop_jokers.cards) do
                if swp_uti.chance(card, 'j_swp_2premiumcard', card.ability.extra.numerator, card.ability.extra.denominator) then
                    v:set_rental(true)
                    v:juice_up(0.3, 0.5)
                    card:juice_up()
                end
            end
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
      G.GAME.rental_rate = math.max(G.GAME.rental_rate * card.ability.extra.rental_earn)
    end,

    remove_from_deck = function(self, card, from_debuff)
      G.GAME.rental_rate = math.max(G.GAME.rental_rate / card.ability.extra.rental_earn)
    end,

    set_ability = function(self, card, initial)
        card:set_rental(true)
    end,

    --[[
    SMODS.Sticker:take_ownership('rental', {
        loc_txt = {
            name = "Rental",
            text = {
                "Earns {C:money}$3{} at end of round"
            }
        }
    }, true)]]
}