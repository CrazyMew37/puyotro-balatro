
SMODS.Joker{ --Zed
    key = "zed",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Zed',
        ['text'] = {
            [1] = '{X:blue,C:white}X3{} Chips if played hand',
            [2] = 'contains a {C:attention}Straight{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
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
            if next(context.poker_hands["Straight"]) then
                return {
                    x_chips = 3
                }
            end
        end
    end
}