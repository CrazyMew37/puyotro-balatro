
SMODS.Joker{ --Dark Sig
    key = "darksig",
    config = {
        extra = {
            odds = 4,
            xchips0 = 1.24
        }
    },
    loc_txt = {
        ['name'] = 'Dark Sig',
        ['text'] = {
            [1] = '{C:green}#1# in #2# {}chance for each',
            [2] = 'card to score {X:blue,C:white}X1.24{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_darksig') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_dec85cae', 1, card.ability.extra.odds, 'j_puyotro_darksig', false) then
                    SMODS.calculate_effect({x_chips = 1.24}, card)
                end
            end
        end
    end
}