
SMODS.Joker{ --Puyos
    key = "puyos",
    config = {
        extra = {
            PuyoMult = 0.7
        }
    },
    loc_txt = {
        ['name'] = 'Puyos',
        ['text'] = {
            [1] = '{X:red,C:white}X#1# {} Mult',
            [2] = 'Increases by {X:red,C:white}X0.1{}',
            [3] = 'Mult every time this',
            [4] = 'card is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.PuyoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local PuyoMult_value = card.ability.extra.PuyoMult
            card.ability.extra.PuyoMult = (card.ability.extra.PuyoMult) + 0.1
            return {
                Xmult = PuyoMult_value
            }
        end
    end
}