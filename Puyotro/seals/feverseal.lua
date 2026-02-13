
SMODS.Seal {
    key = 'feverseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult0 = 3
        }
    },
    badge_colour = HEX('6dd230'),
    loc_txt = {
        name = 'Fever Seal',
        label = 'Fever Seal',
        text = {
            [1] = '{X:red,C:white}X3{} Mult if played on the',
            [2] = 'final hand of a round'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and to_big(G.GAME.current_round.hands_left) == to_big(0) then
            return {
                Xmult = 3
            }
        end
    end
}