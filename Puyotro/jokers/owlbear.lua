
SMODS.Joker{ --Owlbear
    key = "owlbear",
    config = {
        extra = {
            OwlbearUses = 3,
            hands0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Owlbear',
        ['text'] = {
            [1] = 'If your {C:blue}hands{} reach {C:attention}0{},',
            [2] = 'then gain {C:blue}+1{} hand',
            [3] = '(Can be used {C:attention}#1# {}more',
                [4] = 'times before',
            [5] = '{C:attention}self-destructing{})'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.OwlbearUses}}
    end,
    
    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if to_big(G.GAME.current_round.hands_left) <= to_big(0) then
                return {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Set to "..tostring(1).." Hands", colour = G.C.BLUE})
                        G.GAME.current_round.hands_left = 1
                        return true
                    end,
                    extra = {
                        func = function()
                            card.ability.extra.OwlbearUses = (card.ability.extra.OwlbearUses) + -1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            elseif to_big((card.ability.extra.OwlbearUses or 0)) <= to_big(0) then
                return {
                    func = function()
                        local target_joker = card
                        
                        if target_joker then
                            if target_joker.ability.eternal then
                                target_joker.ability.eternal = nil
                            end
                            target_joker.getting_sliced = true
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                                    return true
                                end
                            }))
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Extinct!", colour = G.C.RED})
                        end
                        return true
                    end
                }
            end
        end
    end
}