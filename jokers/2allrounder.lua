
SMODS.Joker{ --All-rounder
    key = "2allrounder",
    config = {
        extra = {
            incvar = 1
        }
    },
    loc_txt = {
        ['name'] = 'All-rounder',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Hand',
            [2] = '{C:red}+#1#{} Discard',
            [3] = '{C:attention}+#1#{} Hand size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
    pools = { ["nx_nx_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.incvar}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.incvar
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.incvar
        G.hand:change_size(card.ability.extra.incvar)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.incvar
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.incvar
        G.hand:change_size(-card.ability.extra.incvar)
    end
}