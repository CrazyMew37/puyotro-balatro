
SMODS.Joker{ --Possessed Klug
    key = "possessedklug",
    config = {
        extra = {
            odds = 12
        }
    },
    loc_txt = {
        ['name'] = 'Possessed Klug',
        ['text'] = {
            [1] = '{C:green}#1# in #2# {}chance that a scored card',
            [2] = 'is converted into a {C:attention}Bonus Card{}',
            [3] = '{C:green}#1# in #2# {}chance that a scored card',
            [4] = 'is converted into a {C:attention}Mult Card{}',
            [5] = '{C:green}#1# in #2# {}chance that a scored card',
            [6] = 'is destroyed'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 6
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_possessedklug')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_puyotro_possessedklug')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_puyotro_possessedklug')
        return {vars = {new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fd81e95a', 1, card.ability.extra.odds, 'j_puyotro_possessedklug', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_bonus)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Poof!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
                if SMODS.pseudorandom_probability(card, 'group_1_6155c66e', 1, card.ability.extra.odds, 'j_puyotro_possessedklug', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_mult)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Poof!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
                if SMODS.pseudorandom_probability(card, 'group_2_dca04116', 1, card.ability.extra.odds, 'j_puyotro_possessedklug', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
    end
}