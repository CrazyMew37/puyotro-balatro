
SMODS.Joker{ --Sasori Man
    key = "sasoriman",
    config = {
        extra = {
            SasoriMinus = -3,
            SasoriMult = 1.25,
            SasoriMinusDecrease = -3,
            SasoriMultIncrease = 0.25
        }
    },
    loc_txt = {
        ['name'] = 'Sasori Man',
        ['text'] = {
            [1] = '{C:red}#1# {}Mult, {X:red,C:white}#2# {} Mult',
            [2] = 'Values increase by {C:red}#3#{}',
            [3] = 'and {X:red,C:white}X#4#{} respectively',
            [4] = 'every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_rares"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SasoriMinus, card.ability.extra.SasoriMult, card.ability.extra.SasoriMinusDecrease, card.ability.extra.SasoriMultIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                func = function()
                    card.ability.extra.SasoriMinus = (card.ability.extra.SasoriMinus) + card.ability.extra.SasoriMinusDecrease
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.SasoriMult = (card.ability.extra.SasoriMult) + card.ability.extra.SasoriMultIncrease
                        return true
                    end,
                    message = "Downgrade/Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.SasoriMinus,
                extra = {
                    Xmult = card.ability.extra.SasoriMult
                }
            }
        end
    end
}