
SMODS.Joker{ --Ragnus the Brave
    key = "ragnusthebrave",
    config = {
        extra = {
            RagnusMult = 1.5,
            currentscoringmult = 0,
            currentscoringchips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Ragnus the Brave',
        ['text'] = {
            [1] = '{X:red,C:white}X#1# {} Mult if Mult',
            [2] = '{C:attention}exceeds{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 0
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_commons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RagnusMult, mult, hand_chips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big(mult) > to_big(hand_chips) then
                return {
                    Xmult = card.ability.extra.RagnusMult
                }
            end
        end
    end
}