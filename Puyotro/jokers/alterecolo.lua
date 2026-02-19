
SMODS.Joker{ --Alter Ecolo
    key = "alterecolo",
    config = {
        extra = {
            echips0_min = NaN,
            echips0_max = 1.77,
            xmult0_min = NaN,
            xmult0_max = 1.77
        }
    },
    loc_txt = {
        ['name'] = 'Alter Ecolo',
        ['text'] = {
            [1] = '{C:dark_edition}?!?!?!{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
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
            return {
                e_chips = pseudorandom('RANGE:1.07|1.77', 1.07, 1.77),
                extra = {
                    Xmult = pseudorandom('RANGE:1.07|1.77', 1.07, 1.77)
                }
            }
        end
    end
}