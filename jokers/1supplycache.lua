
SMODS.Joker{ --Supply Cache
    key = "1supplycache",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Supply Cache',
        ['text'] = {
            [1] = 'Creates {C:attention}2{} random {C:dark_edition}Negative{}',
            [2] = '{C:attention}Consumables{} when sold',
            [3] = ' ',
            [4] = '{C:inactive}Art: Rozzie{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'Jokers',
    pools = { ["nx_nx_jokers"] = true },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'buf' and args.source ~= 'jud' and args.source ~= 'rif' 
            or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.selling_self  then
            return {
                func = function()
                    
                    for i = 1, 2 do
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.4,
                            func = function()
                                if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                end
                                
                                play_sound('timpani')
                                local sets = {'Tarot', 'Planet', 'Spectral'}
                                local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                SMODS.add_card({ set = random_set, edition = 'e_negative', })                            
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                    end
                    delay(0.6)
                    
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
            }
        end
    end
}