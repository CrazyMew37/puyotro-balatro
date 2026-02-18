
SMODS.Joker{ --Serilly
    key = "serilly",
    config = {
        extra = {
            xchips0 = 2,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'Serilly',
        ['text'] = {
            [1] = '{X:blue,C:white}X2{} Chips',
            [2] = '{C:green}#1# in #2# {}chance this card',
            [3] = 'is {C:attention}destroyed{} each hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_serilly') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                return {
                    x_chips = 2
                    ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_31218980', 1, card.ability.extra.odds, 'j_puyotro_serilly', false) then
                            local target_joker = card
                            
                            if target_joker then
                                if target_joker.ability.eternal then
                                    target_joker.ability.eternal = nil
                                end
                                target_joker.getting_sliced = true
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                        return true
                                    end
                                }))
                                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Stay away!", colour = G.C.RED})
                            end
                            
                        end
                        return true
                    end
                }
            end
        end
    end
}