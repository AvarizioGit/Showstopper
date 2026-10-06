
SMODS.Voucher {
    key = 'charged_cards',
    pos = { x = 3, y = 1 },
    config = { 
        extra = {
            dollars0 = 5
        } 
    },
    loc_txt = {
        name = 'Charged Cards',
        text = {
            [1] = 'Played cards on {C:attention}first{}',
            [2] = 'played hand gives {X:red,C:white}X1.25{}',
            [3] = 'Mult when {C:attention}scored{}'
        },
        unlock = {
            [1] = 'Unlocked by default.'
        }
    },
    cost = 10,
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_nx_powered_cards'},
    atlas = 'Vouchers',
    calculate = function(self,card,context)
        if context.individual and context.cardarea == G.play then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    Xmult = 1.25,
                    card = context.other_card
                }
            end
        end
    end
}