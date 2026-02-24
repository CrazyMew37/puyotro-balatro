
SMODS.Joker{ --Schezo Wegey
    key = "schezowegey",
    config = {
        extra = {
            SchezoMoney = 2,
            SchezoIncrease = 1
        }
    },
    loc_txt = {
        ['name'] = 'Schezo Wegey',
        ['text'] = {
            [1] = 'Earn {C:money}$#1# {}at the end of',
            [2] = 'the round, output increases',
            [3] = 'by {C:money}#2# {}each round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
        
        return {vars = {card.ability.extra.SchezoMoney, card.ability.extra.SchezoIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            local SchezoMoney_value = card.ability.extra.SchezoMoney
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + SchezoMoney_value
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(SchezoMoney_value), colour = G.C.MONEY})
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.SchezoMoney = (card.ability.extra.SchezoMoney) + card.ability.extra.SchezoIncrease
                        return true
                    end,
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}