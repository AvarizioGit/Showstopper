
SMODS.Joker{ --PFD
    key = "3pfd",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Process Flow Diagram',
        ['text'] = {
            [1] = 'Creates the next {C:attention}Tag{} in Collection',
            [2] = 'order at the {C:attention}end of round{}',
            [3] = '{C:inactive}(Next: {C:attention}#1#{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 16
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
    
    -- Retrieve and sort the Tag pool
    get_ordered_tags = function(self)
        local tags = {}

        for _, tag in ipairs(G.P_CENTER_POOLS.Tag or {}) do
            if tag and tag.key and not tag.wip and not tag.demo then
                tags[#tags + 1] = tag
            end
        end

        table.sort(tags, function(a, b)
            return (a.order or 0) < (b.order or 0)
        end)

        return tags
    end,

    loc_vars = function(self, info_queue, card)
        local tags = self:get_ordered_tags()
        local index = card.ability.extra.tag_index or 1

        if #tags > 0 then
            index = ((index - 1) % #tags) + 1
        end

        local tag = tags[index]

        return {
            vars = {
                tag and localize({
                    type = 'name_text',
                    set = 'Tag',
                    key = tag.key
                }) or 'Loading...'
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.individual and not context.repetition and not context.game_over then

            local tags = self:get_ordered_tags()
            local count = #tags

            if count == 0 then
                return
            end

            local index = card.ability.extra.tag_index or 1

            index = ((index - 1) % count) + 1

            local tag = tags[index]

            return {
                message = localize({
                    type = 'name_text',
                    set = 'Tag',
                    key = tag.key
                }),
                colour = G.C.BLUE,

                func = function()
                    add_tag(Tag(tag.key))

                    card.ability.extra.tag_index = (index % count) + 1
                end
            }
        end
    end
}