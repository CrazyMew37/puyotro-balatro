
SMODS.Joker{ --Ringo Ando
    key = "ringoando",
    config = {
        extra = {
            RingoMult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Ringo Ando',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult for every',
            [2] = '{C:red}Red Seal{} held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RingoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Red" then
                return {
                    Xmult = card.ability.extra.RingoMult
                }
            end
        end
    end
}