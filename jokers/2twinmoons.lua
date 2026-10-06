
SMODS.Joker{ --Twin Moons
    key = "2twinmoons",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Twin Moons',
        ['text'] = {
            [1] = '{C:attention}Poker Hand{} level ups',
            [2] = 'are {C:attention}twice{} as effective',
            [3] = '{C:inactive}({}{C:red}+2{} {C:chips}+25{} {C:inactive}-->{} {C:red}+4{} {C:chips}+50{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 9
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
    pools = { ["nx_nx_jokers"] = true },
    
    add_to_deck = function(self, card, from_debuff)
        for _, hand in pairs(G.GAME.hands) do
            hand.l_mult = hand.l_mult * 2
            hand.l_chips = hand.l_chips * 2
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for _, hand in pairs(G.GAME.hands) do
            hand.l_mult = hand.l_mult / 2
            hand.l_chips = hand.l_chips / 2
        end
    end
}