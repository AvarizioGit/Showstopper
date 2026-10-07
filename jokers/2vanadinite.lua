
SMODS.Joker{ --Vanadinite
    key = "2vanadinite",
    config = {
        extra = {
            retrigger = 1
        }
    },
    loc_txt = {
        ['name'] = 'Vanadinite',
        ['text'] = {
            [1] = '{C:attention}Scored{} cards with {C:attention}Red Seal{}',
            [2] = 'are retriggered again'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 6
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
    pools = { ["swp_swp_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.seal == "Red" then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}