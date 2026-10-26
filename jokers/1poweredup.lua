
SMODS.Joker{ --Powered Up
    key = "1poweredup",
    config = {
        extra = { mult = 8, bonus = 60 }
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
    pools = { ["swp_swp_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = { card.ability.extra.mult, card.ability.extra.bonus}}
    end,

    add_to_deck = function(self, card)
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_mult') then
                _card.ability.mult = card.ability.extra.mult
            end
        end
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_bonus') then
                _card.ability.bonus = card.ability.extra.bonus
            end
        end
    end,

    remove_from_deck = function(self, card)
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_mult') then
                _card.ability.mult = G.P_CENTERS.m_mult.config.mult
            end
        end
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_bonus') then
                _card.ability.bonus = G.P_CENTERS.m_bonus.config.bonus
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_ability and context.new == 'm_mult' then
            context.other_card.ability.mult = card.ability.extra.mult
        end
        if context.setting_ability and context.new == 'm_bonus' then
            context.other_card.ability.bonus = card.ability.extra.bonus
        end
    end
}