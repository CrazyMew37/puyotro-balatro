
SMODS.Joker{ --Rei
    key = "rei",
    config = {
        extra = {
            ReiDecrease = 0.5,
            ReiMult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Rei',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult on the First Hand',
            [2] = '{X:red,C:white}X#2#{} Mult on Subsequent Hands'
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ReiDecrease, card.ability.extra.ReiMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if G.GAME.current_round.hands_played == 0 then
                return {
                    Xmult = card.ability.extra.ReiDecrease
                }
            elseif not (G.GAME.current_round.hands_played == 0) then
                return {
                    Xmult = card.ability.extra.ReiMult
                }
            end
        end
    end
}