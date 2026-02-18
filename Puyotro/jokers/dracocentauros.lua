
SMODS.Joker{ --Draco Centauros
    key = "dracocentauros",
    config = {
        extra = {
            dollars0 = 8
        }
    },
    loc_txt = {
        ['name'] = 'Draco Centauros',
        ['text'] = {
            [1] = 'If the winning score is at',
            [2] = 'least {C:attention}twice{} the size of',
            [3] = 'the {C:attention}blind{}, then earn {C:money}$8{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(2) then
                return {
                    
                    func = function()
                        
                        local current_dollars = G.GAME.dollars
                        local target_dollars = G.GAME.dollars + 8
                        local dollar_value = target_dollars - current_dollars
                        ease_dollars(dollar_value)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(8), colour = G.C.MONEY})
                        return true
                    end
                }
            end
        end
    end
}