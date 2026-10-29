
SMODS.Joker{ --Death Sheet
    key = "1deathsheet",
    config = { },
    loc_txt = {
        ['name'] = 'Death Sheet',
        ['text'] = {
            [1] = 'Gives {C:blue}+Chips{} equal to twice',
            [2] = 'the {C:attention}total number{} of runs {C:red}lost{}',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
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
        local losses = G.PROFILES[G.SETTINGS.profile].career_stats.c_losses * 2 or 0
        
        return {vars = { losses }}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local losses = G.PROFILES[G.SETTINGS.profile].career_stats.c_losses * 2 or 0

            return {
                chips = losses
            }
        end
    end
}