
SMODS.Joker{ --Bismuth
    key = "3bismuth",
    config = {
        extra = {xmult = 0.1}
    },
    loc_txt = {
        ['name'] = 'Bismuth',
        ['text'] = {
            [1] = 'If {C:attention}played{} hand contains a {C:dark_edition}Polychrome{}',
            [2] = 'card, played{C:dark_edition} non-Polychrome{} cards',
            [3] = 'permanently gains {X:red,C:white}X0.1{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.initial_scoring_step then
            local has_polychrome = false
            for _, played_card in ipairs(context.full_hand) do
                if played_card.edition and played_card.edition.polychrome then
                    has_polychrome = true
                    break
                end
            end
            if has_polychrome then
                local juice = false
                for _, played_card in ipairs(context.full_hand) do
                    if not (played_card.edition and played_card.edition.polychrome) then
                        played_card.ability.perma_x_mult = (played_card.ability.perma_x_mult or 0) + card.ability.extra.xmult
                        played_card:juice_up()
                        juice = true
                    end
                end
                if juice then
                    return {
                        message = localize("k_upgrade_ex"),
                        colour = G.C.MULT
                    }
                end
            end
        end
    end
}