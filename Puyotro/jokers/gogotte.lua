
SMODS.Joker{ --Gogotte
    key = "gogotte",
    config = {
        extra = {
            GogotteHands = 6,
            GogotteMult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Gogotte',
        ['text'] = {
            [1] = '{X:red,C:white}X#2#{} Mult for the',
            [2] = 'next {C:attention}#1# {}hand(s)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.GogotteHands, card.ability.extra.GogotteMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            card.ability.extra.GogotteHands = (card.ability.extra.GogotteHands) + -1
            return {
                Xmult = card.ability.extra.GogotteMult
            }
        end
        if context.after and context.cardarea == G.jokers  then
            if to_big((card.ability.extra.GogotteHands or 0)) <= to_big(0) then
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