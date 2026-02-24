
SMODS.Joker{ --Lycanthrope
    key = "lycanthrope",
    config = {
        extra = {
            LycanChips = 3
        }
    },
    loc_txt = {
        ['name'] = 'Lycanthrope',
        ['text'] = {
            [1] = '{X:chips,C:white}X#1#{} Chips on the',
            [2] = 'final hand of the round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_uncommons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.LycanChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(G.GAME.current_round.hands_left) > to_big(0) then
                return {
                    x_chips = card.ability.extra.LycanChips
                }
            end
        end
    end
}