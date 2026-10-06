
SMODS.Joker{ --Powered Up
    key = "1poweredup",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Powered Up',
        ['text'] = {
            [1] = '{C:attention}Mult Cards{} and',
            [2] = '{C:attention}Bonus Cards{} are',
            [3] = '{C:attention}100%{} more effective'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },

    add_to_deck = function(self, card)
        G.P_CENTERS.m_mult.config.mult =
            G.P_CENTERS.m_mult.config.mult + 4

        G.P_CENTERS.m_bonus.config.bonus =
            G.P_CENTERS.m_bonus.config.bonus + 30
    end,

    remove_from_deck = function(self, card)
        G.P_CENTERS.m_mult.config.mult =
            G.P_CENTERS.m_mult.config.mult - 4

        G.P_CENTERS.m_bonus.config.bonus =
            G.P_CENTERS.m_bonus.config.bonus - 30
    end,
}