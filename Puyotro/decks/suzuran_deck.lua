
SMODS.Back {
    key = 'suzuran_deck',
    pos = { x = 2, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Suzuran Deck',
        text = {
            [1] = 'Begin with an',
            [2] = '{C:attention}Eternal Ringo{}, {C:attention}Maguro{},',
            [3] = 'and {C:attention}Risukuma{}',
            [4] = '{C:attention}+1{} Joker Slot',
            [5] = '{C:attention}Creates{} a specific',
            [6] = '{C:spectral}Negative {C:spectral}Spectral{} Card{}',
            [7] = 'at the end of each round',
            [8] = '({C:attention}Small Blinds{} give {C:purple}Medium{}',
                [9] = '{C:attention}Big Blinds{} give {C:gold}Talisman{}',
            [10] = '{C:attention}Boss Blinds{} give {C:red}Deja Vu{})'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.GAME.blind:get_type() == 'Small' then
                for i = 1, 1 do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', key = 'c_medium'
                            })
                            return true
                        end
                    }))
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.GAME.blind:get_type() == 'Big' then
                for i = 1, 1 do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', key = 'c_talisman'
                            })
                            return true
                        end
                    }))
                end
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval then
            if G.GAME.blind.boss then
                for i = 1, 1 do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            end
                            
                            
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Spectral', edition = 'e_negative', key = 'c_deja_vu'
                            })
                            return true
                        end
                    }))
                end
            end
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_puyotro_ringoando' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_puyotro_risukuma' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_puyotro_magurosasaki' })
                    if new_joker then
                        new_joker:add_sticker('eternal', true)
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        G.GAME.starting_params.joker_slots = G.GAME.starting_params.joker_slots + 1
    end
}