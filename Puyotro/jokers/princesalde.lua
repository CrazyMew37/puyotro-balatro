
SMODS.Joker{ --Prince Salde
    key = "princesalde",
    config = {
        extra = {
            SaldeMult = 2,
            odds = 12
        }
    },
    loc_txt = {
        ['name'] = 'Prince Salde',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult for every scored',
            [2] = 'card with a {C:green}Fever Seal{}',
            [3] = '{C:green}#2# in #3# {}Chance to give a',
            [4] = 'scored card a {C:green}Fever Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 7
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_rares"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_princesalde') 
        return {vars = {card.ability.extra.SaldeMult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Puyotro_feverseal" then
                return {
                    Xmult = card.ability.extra.SaldeMult
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_080c1077', 1, card.ability.extra.odds, 'j_puyotro_princesalde', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_seal("puyotro_feverseal", true)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}