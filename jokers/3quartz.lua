
SMODS.Joker{ --Quartz
    key = "3quartz",
    config = {
        extra = { xmult = 3, odds = 6 }
    },
    loc_txt = {
        ['name'] = 'Quartz',
        ['text'] = {
            [1] = '{C:attention}Glass Cards{} now gives',
            [2] = '{X:red,C:white}X3{} Mult and have a',
            [3] = '{C:green}1 in 6{} to be destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        local numerator, denominator = swp_uti.chance_vars(card, nil, 1, card.ability.extra.odds)
        return {vars = {localize({set = 'Enhanced', key = 'm_glass', type = 'name_text'}), card.ability.extra.xmult, card.ability.extra.odds}}
    end,

    add_to_deck = function(self, card, from_debuff)
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_glass') then
                _card.ability.Xmult = card.ability.extra.xmult
                _card.ability.x_mult = card.ability.extra.xmult
                _card.ability.extra = card.ability.extra.odds
            end
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        for _, _card in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(_card, 'm_glass') then
                _card.ability.x_mult = G.P_CENTERS.m_glass.config.Xmult
                _card.ability.Xmult = G.P_CENTERS.m_glass.config.Xmult
                _card.ability.extra = G.P_CENTERS.m_glass.config.extra
            end
        end
    end,

    calculate = function(self, card, context)
        if context.setting_ability and context.new == 'm_glass' then
            context.other_card.ability.Xmult = card.ability.extra.xmult
            context.other_card.ability.x_mult = card.ability.extra.xmult
            context.other_card.ability.extra = card.ability.extra.odds
        end
    end
}