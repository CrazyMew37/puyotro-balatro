
SMODS.Joker{ --Rei
    key = "rei",
    config = {
        extra = {
            xmult0 = 0.5,
            xmult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Rei',
        ['text'] = {
            [1] = '{X:red,C:white}X0.5{} Mult on the First Hand',
            [2] = '{X:red,C:white}X2.5{} Mult on Subsequent Hands'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    Xmult = 0.5
                }
            elseif not (G.GAME.current_round.hands_played == 0) then
                return {
                    Xmult = 2.5
                }
            end
        end
    end
}