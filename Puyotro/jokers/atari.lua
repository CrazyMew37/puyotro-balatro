
SMODS.Joker{ --Atari
    key = "atari",
    config = {
        extra = {
            handsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Atari',
        ['text'] = {
            [1] = 'When finishing a round,',
            [2] = 'creates a number of {C:attention}Negative{}',
            [3] = '{C:tarot}Tarot Cards{} equal to the',
            [4] = 'amount of {C:blue}hands{} left'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_rares"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {(G.GAME.current_round.hands_left or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.current_round.hands_left) > to_big(0) then
                return {
                    func = function()
                        
                        for i = 1, G.GAME.current_round.hands_left do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Tarot', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            end
        end
    end
}