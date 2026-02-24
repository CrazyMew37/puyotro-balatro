
SMODS.Joker{ --Ecolo
    key = "ecolo",
    config = {
        extra = {
            chips0_min = NaN,
            chips0_max = 207,
            mult0_min = NaN,
            mult0_max = 27,
            xchips0_min = NaN,
            xchips0_max = 1.7,
            xmult0_min = NaN,
            xmult0_max = 1.7
        }
    },
    loc_txt = {
        ['name'] = 'Ecolo',
        ['text'] = {
            [1] = '???'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_rares"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = pseudorandom('RANGE:7|207', 7, 207),
                extra = {
                    mult = pseudorandom('RANGE:7|27', 7, 27),
                    extra = {
                        x_chips = pseudorandom('RANGE:1.07|1.7', 1.07, 1.7),
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = pseudorandom('RANGE:1.07|1.7', 1.07, 1.7)
                        }
                    }
                }
            }
        end
    end
}