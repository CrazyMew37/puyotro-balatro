
SMODS.Joker{ --Squares
    key = "squares",
    config = {
        extra = {
            SquaresAmount = 2,
            handsplayedthisround = 0
        }
    },
    loc_txt = {
        ['name'] = 'Squares',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^#1#{} Chips if played hand',
            [2] = 'is a {C:attention}Five of a Kind{},',
            [3] = '{C:attention}Flush House{}, or {C:attention}Flush Five{}',
            [4] = 'Makes {C:attention}3{} copies of the',
            [5] = '{C:attention}first played card{} each',
            [6] = 'round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 10
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_legendaries"] = true },
    soul_pos = {
        x = 7,
        y = 10
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' 
            or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SquaresAmount, (G.GAME.current_round.hands_played or 0)}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (context.scoring_name == "Five of a Kind" or context.scoring_name == "Flush House" or context.scoring_name == "Flush Five") then
                return {
                    e_chips = card.ability.extra.SquaresAmount
                }
            end
        end
        if context.individual and context.cardarea == G.play  then
            if (context.other_card == context.scoring_hand[1] and to_big(G.GAME.current_round.hands_played) <= to_big(0)) then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copied_card)
                G.hand:emplace(copied_card)
                playing_card_joker_effects({true})
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                return {
                    message = "Copied Card to Hand!",
                    extra = {
                        message = "Copied Card to Hand!",
                        colour = G.C.GREEN,
                        extra = {
                            message = "Copied Card to Hand!",
                            colour = G.C.GREEN
                        }
                    }
                }
            end
        end
    end
}