
SMODS.Seal {
    key = 'feverseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            FeverMult = 3
        }
    },
    badge_colour = HEX('6dd230'),
    loc_txt = {
        name = 'Fever Seal',
        label = 'Fever Seal',
        text = {
            [1] = '{X:red,C:white}X#1#{} Mult if played on the',
            [2] = 'final hand of a round'
        }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.seal.extra.FeverMult}}
    end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play and to_big(G.GAME.current_round.hands_left) == to_big(0) then
            return {
                Xmult = card.ability.seal.extra.FeverMult
            }
        end
    end
}