
SMODS.Joker{ --Parara
    key = "parara",
    config = {
        extra = {
            PararaMoney = 10
        }
    },
    loc_txt = {
        ['name'] = 'Parara',
        ['text'] = {
            [1] = 'Earn {C:money}$#1# {}at the end',
            [2] = 'of the round',
            [3] = 'Amount {C:attention}decreases{} by {C:money}$2{}',
            [4] = 'each round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 1
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PararaMoney}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big((card.ability.extra.PararaMoney or 0)) <= to_big(2) then
                return {
                    func = function()
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
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Extinct!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            else
                local PararaMoney_value = card.ability.extra.PararaMoney
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + PararaMoney_value
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(PararaMoney_value), colour = G.C.MONEY})
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.PararaMoney = (card.ability.extra.PararaMoney) + -2
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            end
        end
    end
}