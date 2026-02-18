
SMODS.Joker{ --Red Amitie
    key = "redamitie",
    config = {
        extra = {
            odds = 3,
            xmult0 = 2.4
        }
    },
    loc_txt = {
        ['name'] = 'Red Amitie',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for each',
            [2] = 'card to score {X:red,C:white}X2.4{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 2, card.ability.extra.odds, 'j_puyotro_redamitie') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_b0985ab3', 2, card.ability.extra.odds, 'j_puyotro_redamitie', false) then
                    SMODS.calculate_effect({Xmult = 2.4}, card)
                end
            end
        end
    end
}