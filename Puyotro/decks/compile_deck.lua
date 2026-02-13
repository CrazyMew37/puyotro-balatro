
SMODS.Back {
    key = 'compile_deck',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 1.5
        },
    },
    loc_txt = {
        name = 'Compile Deck',
        text = {
            [1] = 'Numbered Cards start',
            [2] = 'as {C:attention}Puyo Cards{}',
            [3] = 'Face Cards and Aces',
            [4] = 'start as {C:attention}Nuisance Cards{}',
            [5] = '{C:red}X1.5{} Blind Size'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 2 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 2 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 3 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 3 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 4 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 4 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 5 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 5 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 6 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 6 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 7 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 7 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 8 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 8 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 9 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 9 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 10 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                    if v:get_id() == 10 then
                        v:set_ability('m_puyotro_puyocard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 11 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                    if v:get_id() == 11 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 12 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                    if v:get_id() == 12 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 13 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                    if v:get_id() == 13 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 14 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                    if v:get_id() == 14 then
                        v:set_ability('m_puyotro_nuisancecard')
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.5
                return true
            end
        }))
    end
}