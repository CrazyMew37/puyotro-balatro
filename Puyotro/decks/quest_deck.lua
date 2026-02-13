
SMODS.Back {
    key = 'quest_deck',
    pos = { x = 4, y = 0 },
    config = {
        extra = {
            booster_slots0 = 1
        },
    },
    loc_txt = {
        name = 'Quest Deck',
        text = {
            [1] = '{C:attention}+1{} Booster Pack Slot',
            [2] = 'Begin with a random',
            [3] = '{C:attention}Puyotro Joker{}',
            [4] = 'Gain Another {C:attention}Puyotro',
            [5] = 'Joker{} after beating a',
            [6] = '{C:attention}Boss Blind{}',
            [7] = '{s:0.8}(Doesn\'t create Legendary{}',
            [8] = '{s:0.8}Puyotro Jokers){}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('timpani')
                    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                        local new_joker = SMODS.add_card({ set = 'puyotro_puyotro_quest_deck_jokers' })
                        if new_joker then
                        end
                        G.GAME.joker_buffer = 0
                    end
                    return true
                end
            }))
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'puyotro_puyotro_quest_deck_jokers' })
                    if new_joker then
                    end
                    G.GAME.joker_buffer = 0
                end
                return true
            end
        }))
        return {
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    
                    SMODS.change_booster_limit(1)
                    return true
                end
            }))
        }
    end
}