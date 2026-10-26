SMODS.Tag {
    key = 'encore',
    config = {},
    loc_txt = {
        ['name'] = 'Encore Tag',
        ['text'] = {
            [1] = 'Creates a {C:rare}Rare{}',
            [2] = '{C:showstopper,E:1}Showstopper{} Joker',
            [3] = '{C:inactive}(Must have room){}'
        }
    },
    discovered = false,
    atlas = 'Tags',
    pos = { x = 1, y = 0 },

    apply = function(self, tag, context)
        if context.type == 'immediate' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            
            tag:yep('+', G.C.PURPLE, function()
                local joker_pool = {}

                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Joker'
                    and v.rarity == 3
                    and k:find('^j_swp_') then
                        joker_pool[#joker_pool + 1] = k
                    end
                end

                if #joker_pool > 0 then
                    local chosen_joker = pseudorandom_element(
                        joker_pool,
                        pseudoseed('swp_encore_tag')
                    )

                    SMODS.add_card({
                        set = 'Joker',
                        key = chosen_joker
                    })
                end

                G.CONTROLLER.locks[lock] = nil
                return true
            end)

            tag.triggered = true
            return true
        end
    end
}