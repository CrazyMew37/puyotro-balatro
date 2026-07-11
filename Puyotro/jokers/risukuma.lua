
SMODS.Joker{ --Risukuma
    key = "risukuma",
    config = {
        extra = {
            RisukumaMult = 1,
            RisukumaGain = 0.1,
            goldsealedcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Risukuma',
        ['text'] = {
            [1] = '{X:red,C:white}X#2#{} Mult for every',
            [2] = '{C:gold}Gold Seal{} in full deck',
            [3] = '{C:inactive}(Currently{} {X:red,C:white}X#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        
    return {vars = {card.ability.extra.RisukumaMult, card.ability.extra.RisukumaGain, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.seal == 'Gold' then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local RisukumaMult_value = card.ability.extra.RisukumaMult
        card.ability.extra.RisukumaMult = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if card.seal == 'Gold' then count = count + 1 end end; return count end)()
            card.ability.extra.RisukumaMult = (card.ability.extra.RisukumaMult) * card.ability.extra.RisukumaGain
            card.ability.extra.RisukumaMult = (card.ability.extra.RisukumaMult) + 1
            return {
                Xmult = RisukumaMult_value
            }
        end
    end
}