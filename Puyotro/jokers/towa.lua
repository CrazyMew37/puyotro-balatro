
SMODS.Joker{ --Towa
    key = "towa",
    config = {
        extra = {
            handsplayedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Towa',
        ['text'] = {
            [1] = 'If a round was beaten',
            [2] = 'in {C:attention}one hand{}, create {C:attention}3{}',
            [3] = 'random playing cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
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
        
        return {vars = {(G.GAME.current_round.hands_played or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if to_big(G.GAME.current_round.hands_played) <= to_big(1) then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','puyotro_feverseal'}, pseudoseed('add_card_hand_seal')), true)
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','puyotro_feverseal'}, pseudoseed('add_card_hand_seal')), true)
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card_hand'))
                local base_card = create_playing_card({
                    front = card_front,
                    center = pseudorandom_element({G.P_CENTERS.m_gold, G.P_CENTERS.m_steel, G.P_CENTERS.m_glass, G.P_CENTERS.m_wild, G.P_CENTERS.m_mult, G.P_CENTERS.m_lucky, G.P_CENTERS.m_stone}, pseudoseed('add_card_hand_enhancement'))
                }, G.discard, true, false, nil, true)
                
                base_card:set_seal(pseudorandom_element({'Gold','Red','Blue','Purple','puyotro_feverseal'}, pseudoseed('add_card_hand_seal')), true)
                
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        base_card:start_materialize()
                        G.play:emplace(base_card)
                        return true
                    end
                }))
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.deck.config.card_limit = G.deck.config.card_limit + 1
                                return true
                            end
                        }))
                        draw_card(G.play, G.deck, 90, 'up')
                        SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                    end,
                    message = "Added Card!",
                    extra = {
                        func = function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    G.deck.config.card_limit = G.deck.config.card_limit + 1
                                    return true
                                end
                            }))
                            draw_card(G.play, G.deck, 90, 'up')
                            SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                        end,
                        message = "Added Card!",
                        colour = G.C.GREEN,
                        extra = {
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                                        return true
                                    end
                                }))
                                draw_card(G.play, G.deck, 90, 'up')
                                SMODS.calculate_context({ playing_card_added = true, cards = { base_card } })
                            end,
                            message = "Added Card!",
                            colour = G.C.GREEN
                        }
                    }
                }
            end
        end
    end
}