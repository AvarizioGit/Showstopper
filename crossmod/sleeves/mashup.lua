swp_uti.Sleeve {
    key = 'mashup',
    deck_buff = 'b_swp_mashup_deck',
    atlas = 'cardsleeves',
    pos = { x = 0, y = 0 },

    loc_vars  = function(self)
        return {
            key = self:loc_key(),
        }
    end,

    unlocked = false,
    unlock_condition = { deck = "b_swp_mashup_deck", stake = "stake_white" },

    apply = function(self, sleeve)
        if self:is_buffed() then
            swp_uti.add_tag('tag_top_up', nil, false)
            swp_uti.add_tag('tag_uncommon', nil, false)
            swp_uti.add_tag('tag_rare', nil, false)
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Uncommon' })
                        local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Rare' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end
}