
SMODS.Joker{ --Angelic Feli
    key = "angelicfeli",
    config = {
        extra = {
            FeliExpo = 1.5,
            odds = 8
        }
    },
    loc_txt = {
        ['name'] = 'Angelic Feli',
        ['text'] = {
            [1] = 'Played {C:attention}Stone Cards{} score {X:enhanced,C:white}^#1#{} Mult',
            [2] = '{C:green}#2# in #3# {}chance to convert scoring',
            [3] = 'cards into {C:attention}Stone Cards{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    pools = { ["puyotro_puyotro_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 9
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_angelicfeli') 
        return {vars = {card.ability.extra.FeliExpo, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    e_mult = card.ability.extra.FeliExpo
                }
            elseif true then
                if SMODS.pseudorandom_probability(card, 'group_0_8d04ea1c', 1, card.ability.extra.odds, 'j_puyotro_angelicfeli', false) then
                    local scored_card = context.other_card
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            
                            scored_card:set_ability(G.P_CENTERS.m_stone)
                            card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                            return true
                        end
                    }))
                    
                end
            end
        end
    end
}