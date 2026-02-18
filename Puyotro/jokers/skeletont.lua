
SMODS.Joker{ --Skeleton T
    key = "skeletont",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Skeleton T',
        ['text'] = {
            [1] = 'Prevents Death if Chips',
            [2] = 'scored are at least {C:attention}80%{}',
            [3] = 'of required Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
            if to_big(G.GAME.chips / G.GAME.blind.chips) >= to_big(0.8) then
                return {
                    saved = true,
                    message = "Macha!"
                }
            end
        end
    end
}