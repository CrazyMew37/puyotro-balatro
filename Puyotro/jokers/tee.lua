
SMODS.Joker{ --Tee
    key = "tee",
    config = {
        extra = {
            xchips0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Tee',
        ['text'] = {
            [1] = '{X:blue,C:white}X3{} Chips if played hand',
            [2] = 'contains a {C:attention}Three of a Kind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 4
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
            if next(context.poker_hands["Three of a Kind"]) then
                return {
                    x_chips = 3
                }
            end
        end
    end
}