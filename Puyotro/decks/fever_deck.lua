
SMODS.Back {
    key = 'fever_deck',
    pos = { x = 1, y = 0 },
    config = {
    },
    loc_txt = {
        name = 'Fever Deck',
        text = {
            [1] = '{C:red}{C:blue}-1{}{} Hand',
            [2] = '{C:red}+2{} Discards',
            [3] = 'Face Cards and Aces',
            [4] = 'have {C:green}Fever Seals{}'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
        end
    end,
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                for k, v in pairs(G.playing_cards) do
                    if v:get_id() == 11 then
                        v:set_seal("puyotro_feverseal", true, true)
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
                        v:set_seal("puyotro_feverseal", true, true)
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
                        v:set_seal("puyotro_feverseal", true, true)
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
                        v:set_seal("puyotro_feverseal", true, true)
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.GAME.starting_params.hands = G.GAME.starting_params.hands - 1
        G.GAME.starting_params.discards = G.GAME.starting_params.discards + 2
    end
}
