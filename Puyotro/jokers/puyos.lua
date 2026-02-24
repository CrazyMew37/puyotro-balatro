
SMODS.Joker{ --Puyos
    key = "puyos",
    config = {
        extra = {
            PuyoMult = 0.7,
            PuyoIncrease = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Puyos',
        ['text'] = {
            [1] = '{X:blue,C:white}X#1# {} Chips',
            [2] = 'Increases by {X:blue,C:white}X#2# {}',
            [3] = 'Chips every time this',
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
        
        return {vars = {card.ability.extra.PuyoMult, card.ability.extra.PuyoIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local PuyoMult_value = card.ability.extra.PuyoMult
            card.ability.extra.PuyoMult = (card.ability.extra.PuyoMult) + card.ability.extra.PuyoIncrease
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound("puyotro_puyoplace")
                    
                    return true
                end,
            }))
            return {
                x_chips = PuyoMult_value,
                extra = {
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}