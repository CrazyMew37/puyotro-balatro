
SMODS.Joker{ --Ex
    key = "ex",
    config = {
        extra = {
            TetrisMult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Ex',
        ['text'] = {
            [1] = '{X:blue,C:white}X#1#{} Chips if played hand',
            [2] = 'contains a {C:attention}Straight Flush{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.TetrisMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if next(context.poker_hands["Straight Flush"]) then
                return {
                    x_chips = card.ability.extra.TetrisMult
                }
            end
        end
    end
}