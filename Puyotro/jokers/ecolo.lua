
SMODS.Joker{ --Ecolo
    key = "ecolo",
    config = {
        extra = {
            chips0_min = NaN,
            chips0_max = 210,
            mult0_min = NaN,
            mult0_max = 28,
            xchips0_min = NaN,
            xchips0_max = 2.7,
            xmult0_min = NaN,
            xmult0_max = 2.7
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
        x = 9,
        y = 3
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
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = pseudorandom('RANGE:-70|210', -70, 210),
                extra = {
                    mult = pseudorandom('RANGE:-7|28', -7, 28),
                    extra = {
                        x_chips = pseudorandom('RANGE:0.35|2.7', 0.35, 2.7),
                        colour = G.C.DARK_EDITION,
                        extra = {
                            Xmult = pseudorandom('RANGE:0.35|2.7', 0.35, 2.7)
                        }
                    }
                }
            }
        end
    end
}