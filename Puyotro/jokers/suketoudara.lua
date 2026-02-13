
SMODS.Joker{ --Suketoudara
    key = "suketoudara",
    config = {
        extra = {
            hands0 = 1,
            discards0 = 2,
            hand_size0 = 1,
            hand_size = 1
        }
    },
    loc_txt = {
        ['name'] = 'Suketoudara',
        ['text'] = {
            [1] = '{C:blue}+1{} Hand, {C:attention}+1{} Hand Size',
            [2] = '{C:red}-2{} Discards',
            [3] = '{C:inactive,s:0.75}(Fiiish!){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hands", colour = G.C.GREEN})
                    
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
                    return true
                end,
                extra = {
                    
                    func = function()
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Discards", colour = G.C.RED})
                        G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 2
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
        if context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(1)
                    return true
                end
            }
        end
        if context.selling_self  then
            return {
                
                func = function()
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(1).." Hand Limit", colour = G.C.BLUE})
                    
                    G.hand:change_size(-1)
                    return true
                end
            }
        end
    end
}