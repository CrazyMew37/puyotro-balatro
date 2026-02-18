
SMODS.Joker{ --Rozatte
    key = "rozatte",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Rozatte',
        ['text'] = {
            [1] = '{C:green}#1# in #2# {}chance to',
            [2] = '{C:attention}average{} Chips and Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_rozatte') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b14f8ea3', 1, card.ability.extra.odds, 'j_puyotro_rozatte', false) then
                    SMODS.calculate_effect({balance = true}, card)
                end
            end
        end
    end
}