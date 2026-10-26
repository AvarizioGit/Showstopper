
SMODS.Joker{ --Blair Joke
    key = "3blairjoke",
    config = {
        extra = {
            mult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Blair Joke',
        ['text'] = {
            [1] = 'A {C:attention}random{} card in {C:attention}deck{}',
            [2] = 'permanently gains {C:red}+#1#{} Mult',
            [3] = 'when a {C:tarot}Tarot{} card is used',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable
        and context.consumeable
        and context.consumeable.ability.set == "Tarot" then

            local deck_cards = {}

            for _, v in ipairs(G.deck.cards) do
                if v then
                    table.insert(deck_cards, v)
                end
            end

            if #deck_cards > 0 then
                local target = pseudorandom_element(
                    deck_cards,
                    pseudoseed("blair_joke")
                )

                target.ability.perma_mult =
                    (target.ability.perma_mult or 0)
                    + card.ability.extra.mult

                target:juice_up(0.3, 0.5)

                return {
                    message = localize({
                        type = "variable",
                        key = "a_mult",
                        vars = { card.ability.extra.mult }
                    }),
                    colour = G.C.MULT
                }
            end
        end
    end
}
