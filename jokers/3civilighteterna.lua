
SMODS.Joker{ --Civilight Eterna
    key = "3civilighteterna",
    config = {
        extra = {
            negative_weight = 10
        }
    },
    loc_txt = {
        ['name'] = 'Civilight Eterna',
        ['text'] = {
            [1] = '{C:dark_edition}Negative{} {C:attention}Jokers{} appears',
            [2] = '{C:attention}#1#X{} more often',
            [3] = '{C:dark_edition}+1{} Joker slot'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 13
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["swp_swp_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.negative_weight}}
    end,

    SMODS.Edition:take_ownership('e_negative', {
        get_weight = function(self)
            local weight = self.weight
            local civeterna_rate = 0
            for k, v in pairs(SMODS.find_card('j_swp_3civilighteterna', true)) do
                civeterna_rate = civeterna_rate + v.ability.extra.negative_weight
            end

            if civeterna_rate > 0  then
                weight = weight * civeterna_rate
            end
      
            return weight
        end
    }, true),

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - 1
    end
}