
SMODS.Joker{ --Ally
    key = "ally",
    config = {
        extra = {
            AllyMult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Ally',
        ['text'] = {
            [1] = '{X:mult,C:white}X#1#{} Mult for every',
            [2] = 'scored {C:hearts}Heart{} Card',
            [3] = 'Non-Heart Cards are',
            [4] = 'converted into {C:hearts}Hearts{}',
            [5] = '(But do not apply the',
            [6] = 'Mult at first)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["puyotro_mycustom_jokers"] = true, ["puyotro_puyotro_legendaries"] = true },
    soul_pos = {
        x = 3,
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
        
        return {vars = {card.ability.extra.AllyMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:is_suit("Hearts") then
                return {
                    Xmult = card.ability.extra.AllyMult
                }
            elseif not (context.other_card:is_suit("Hearts")) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        assert(SMODS.change_base(scored_card, "Hearts", nil))
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Suit changed!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            end
        end
    end
}