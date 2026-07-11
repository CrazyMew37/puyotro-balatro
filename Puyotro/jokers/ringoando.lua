
SMODS.Joker{ --Ringo Ando
    key = "ringoando",
    config = {
        extra = {
            RingoMult = 1,
            RingoGain = 0.1,
            redsealedcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ringo Ando',
        ['text'] = {
            [1] = '{X:red,C:white}X#2#{} Mult for every',
            [2] = '{C:red}Red Seal{} in full deck',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_commons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
    return {vars = {card.ability.extra.RingoMult, card.ability.extra.RingoGain, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.seal == 'Red' then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local RingoMult_value = card.ability.extra.RingoMult
        card.ability.extra.RingoMult = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.seal == 'Red' then count = count + 1 end end; return count end)()
            card.ability.extra.RingoMult = (card.ability.extra.RingoMult) * card.ability.extra.RingoGain
            card.ability.extra.RingoMult = (card.ability.extra.RingoMult) + 1
            return {
                Xmult = RingoMult_value
            }
        end
    end
}