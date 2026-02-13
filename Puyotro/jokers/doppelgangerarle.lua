
SMODS.Joker{ --Doppelganger Arle
    key = "doppelgangerarle",
    config = {
        extra = {
            ArleMult = 4,
            odds = 25,
            odds2 = 1000
        }
    },
    loc_txt = {
        ['name'] = 'Doppelganger Arle',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult...?',
            [2] = 'Every time this card is',
            [3] = 'triggered, increases by',
            [4] = '{C:red}+2{} Mult...?'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_doppelgangerarle')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_puyotro_doppelgangerarle')
        return {vars = {card.ability.extra.ArleMult, new_numerator, new_denominator, new_numerator2, new_denominator2}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                local ArleMult_value = card.ability.extra.ArleMult
                card.ability.extra.ArleMult = (card.ability.extra.ArleMult) + 2
                return {
                    mult = ArleMult_value,
                    extra = {
                        message = "Upgrade!",
                        colour = G.C.GREEN
                    }
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_c86e439e', 1, card.ability.extra.odds, 'j_puyotro_doppelgangerarle', false) then
                            SMODS.calculate_effect({Xmult = card.ability.extra.ArleMult}, card)
                        end
                        if SMODS.pseudorandom_probability(card, 'group_1_824fbd6b', 1, card.ability.extra.odds2, 'j_puyotro_doppelgangerarle', false) then
                            SMODS.calculate_effect({e_mult = card.ability.extra.ArleMult}, card)
                        end
                        return true
                    end
                }
            end
        end
    end
}