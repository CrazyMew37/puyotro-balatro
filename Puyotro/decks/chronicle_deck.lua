
SMODS.Back {
    key = 'chronicle_deck',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            all_blinds_size0 = 1.75
        },
    },
    loc_txt = {
        name = 'Chronicle Deck',
        text = {
            [1] = 'Begin with an {C:money}Eternal{}',
            [2] = 'Ally and Rafisol',
            [3] = 'Begin with no {C:hearts}Heart{} Cards',
            [4] = '{C:attention}{C:red}X1.75{}{} Blind Size',
            [5] = 'Must Beat Ante {C:attention}10{} to Win'
        },
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    atlas = 'CustomDecks',
    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            func = function()
                play_sound('timpani')
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_puyotro_ally' })
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
                    local new_joker = SMODS.add_card({ set = 'Joker', key = 'j_puyotro_rafisol' })
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
                for k, v in pairs(G.playing_cards) do
                    for i=#G.playing_cards, 1, -1 do
                        if G.playing_cards[i]:is_suit('Hearts') then
                            G.playing_cards[i]:remove()
                        end
                    end
                end
                G.GAME.starting_deck_size = #G.playing_cards
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.75
                return true
            end
        }))
        local ante = G.GAME.win_ante + 2
        local int_part, frac_part = math.modf(ante)
        local rounded = int_part + (frac_part >= 0.5 and 1 or 0)
        G.GAME.win_ante = rounded
    end
}