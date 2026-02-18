
SMODS.Joker{ --Marle
    key = "marle",
    config = {
        extra = {
            echips0 = 4
        }
    },
    loc_txt = {
        ['name'] = 'Marle',
        ['text'] = {
            [1] = '{X:enhanced,C:white}^4{} Chips if played hand',
            [2] = 'is a {C:attention}High Card{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
    pools = { ["puyotro_puyotro_jokers"] = true },
    soul_pos = {
        x = 9,
        y = 10
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if context.scoring_name == "High Card" then
                return {
                    e_chips = 4
                }
            end
        end
    end
}