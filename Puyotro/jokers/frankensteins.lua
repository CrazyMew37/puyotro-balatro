
SMODS.Joker{ --Frankensteins
    key = "frankensteins",
    config = {
        extra = {
            xmult0 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Frankensteins',
        ['text'] = {
            [1] = '{X:red,C:white}X2{} Mult if played hand',
            [2] = 'has scoring {C:spades}Spades{} and {C:clubs}Clubs{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if ((function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Spades") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)() and (function()
                local count = 0
                for _, playing_card in pairs(context.scoring_hand or {}) do
                    if playing_card:is_suit("Clubs") then
                        count = count + 1
                    end
                end
                return count >= 1
            end)()) then
                return {
                    Xmult = 2
                }
            end
        end
    end
}