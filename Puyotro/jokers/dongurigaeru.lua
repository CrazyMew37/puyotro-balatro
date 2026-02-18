
SMODS.Joker{ --Donguri Gaeru
    key = "dongurigaeru",
    config = {
        extra = {
            odds = 2
        }
    },
    loc_txt = {
        ['name'] = 'Donguri Gaeru',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance to swap',
            [2] = '{C:blue}Chips{} with {C:red}Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_dongurigaeru') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_3c8b7962', 1, card.ability.extra.odds, 'j_puyotro_dongurigaeru', false) then
                    SMODS.calculate_effect({swap = true}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Swap!", colour = G.C.CHIPS})
                end
            end
        end
    end
}