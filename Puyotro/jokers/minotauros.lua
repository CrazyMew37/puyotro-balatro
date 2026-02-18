
SMODS.Joker{ --Minotauros
    key = "minotauros",
    config = {
        extra = {
            chips0 = 80,
            mult0 = -8
        }
    },
    loc_txt = {
        ['name'] = 'Minotauros',
        ['text'] = {
            [1] = '{C:blue}+80{} Chips',
            [2] = '{C:red}-8{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = 80,
                extra = {
                    mult = -8
                }
            }
        end
    end
}