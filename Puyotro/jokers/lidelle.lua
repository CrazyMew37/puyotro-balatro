
SMODS.Joker{ --Lidelle
    key = "lidelle",
    config = {
        extra = {
            odds = 12
        }
    },
    loc_txt = {
        ['name'] = 'Lidelle',
        ['text'] = {
            [1] = '{C:green}#1# in #2# {}chance that a',
            [2] = 'scored card is converted',
            [3] = 'into a {C:attention}Lucky Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 4
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_lidelle') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_fd81e95a', 1, card.ability.extra.odds, 'j_puyotro_lidelle', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_lucky)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Poof!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}