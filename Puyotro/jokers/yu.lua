
SMODS.Joker{ --Yu
    key = "yu",
    config = {
        extra = {
            YuMult = 2.5,
            xmult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Yu',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult',
            [2] = '{X:red,C:white}X0{} Mult on Final Hand',
            [3] = 'of round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.YuMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) > to_big(0) then
                return {
                    Xmult = card.ability.extra.YuMult
                }
            elseif to_big(G.GAME.current_round.hands_left) <= to_big(0) then
                return {
                    Xmult = 0
                }
            end
        end
    end
}