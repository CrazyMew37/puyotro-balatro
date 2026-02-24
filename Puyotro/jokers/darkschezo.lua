
SMODS.Joker{ --Dark Schezo
    key = "darkschezo",
    config = {
        extra = {
            DarkSchezoMult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Dark Schezo',
        ['text'] = {
            [1] = 'Multiplies money by {X:money,C:white}X#1#{}',
            [2] = 'at the end of the round',
            [3] = '(Triggers {C:attention}before{} payout)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 9
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
        x = 5,
        y = 9
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
        
        return {vars = {card.ability.extra.DarkSchezoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars * card.ability.extra.DarkSchezoMult
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.DarkSchezoMult), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}