
SMODS.Joker{ --Bluescreen
    key = "3bluescreen",
    config = {
        extra = {
            repetitions0 = 1,
            repetitions = 1,
            repetitions2 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bluescreen',
        ['text'] = {
            [1] = 'Retrigger {C:attention}scored{} and {C:attention}held in hand{}',
            [2] = 'cards with {C:blue}Blue{} attributes',
            [3] = '{C:inactive}({}{C:blue}Clubs{}{C:inactive},{} {C:blue}Bonus{}{C:inactive},{} {C:blue}Foil{}{C:inactive},{} {C:blue}Blue Seals{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 13
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
    pools = { ["nx_nx_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or context.other_card.edition and context.other_card.edition.key == "e_foil" or context.other_card.seal == "Blue") then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.repetition and context.cardarea == G.hand and not context.end_of_round and (next(context.card_effects[1]) or #context.card_effects > 1)  then
            if (context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or context.other_card.edition and context.other_card.edition.key == "e_foil" or context.other_card.seal == "Blue") then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.repetition and context.cardarea == G.hand and context.end_of_round and (next(context.card_effects[1]) or #context.card_effects > 1)  then
            if (context.other_card:is_suit("Clubs") or SMODS.get_enhancements(context.other_card)["m_bonus"] == true or context.other_card.edition and context.other_card.edition.key == "e_foil" or context.other_card.seal == "Blue") then
                return {
                    repetitions = 1,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}