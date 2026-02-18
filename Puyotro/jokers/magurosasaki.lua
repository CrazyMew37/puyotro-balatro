
SMODS.Joker{ --Maguro Sasaki
    key = "magurosasaki",
    config = {
        extra = {
            xmult0 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Maguro Sasaki',
        ['text'] = {
            [1] = '{X:red,C:white}X1.5{} Mult for every',
            [2] = '{C:purple}Purple Seal{} held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Purple" then
                return {
                    Xmult = 1.5
                }
            end
        end
    end
}