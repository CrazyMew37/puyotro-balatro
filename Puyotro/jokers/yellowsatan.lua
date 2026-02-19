
SMODS.Joker{ --Yellow Satan
    key = "yellowsatan",
    config = {
        extra = {
            SatanChips = 1,
            SatanMult = 1,
            SatanMoney = 0,
            SatanChipIncrease = 0.2,
            SatanMultIncrease = 0.2,
            SatanMoneyIncrease = 1
        }
    },
    loc_txt = {
        ['name'] = 'Yellow Satan',
        ['text'] = {
            [1] = 'Gains {C:blue}X#4#{} Chips, {X:red,C:white}X#5#{} Mult,',
            [2] = 'and {C:money}$#6#{} Payout for every',
            [3] = '{C:attention}destroyed{} card',
            [4] = '(Currently {X:blue,C:white}X#1# {} Chips, {X:red,C:white}X#2# {} Mult,',
            [5] = 'and {C:money}$#3# {}Payout)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 9,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SatanChips, card.ability.extra.SatanMult, card.ability.extra.SatanMoney, card.ability.extra.SatanChipIncrease, card.ability.extra.SatanMultIncrease, card.ability.extra.SatanMoneyIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.SatanChips = (card.ability.extra.SatanChips) + card.ability.extra.SatanChipIncrease
                    return true
                end,
                message = "Upgrade! (Chips)",
                extra = {
                    func = function()
                        card.ability.extra.SatanMult = (card.ability.extra.SatanMult) + card.ability.extra.SatanMultIncrease
                        return true
                    end,
                    message = "Upgrade! (Mult)",
                    colour = G.C.GREEN,
                    extra = {
                        func = function()
                            card.ability.extra.SatanMoney = (card.ability.extra.SatanMoney) + card.ability.extra.SatanMoneyIncrease
                            return true
                        end,
                        message = "Upgrade! (Payout)",
                        colour = G.C.GREEN
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                x_chips = card.ability.extra.SatanChips,
                extra = {
                    Xmult = card.ability.extra.SatanMult
                }
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
            return {
                
                func = function()
                    
                    local current_dollars = G.GAME.dollars
                    local target_dollars = G.GAME.dollars + card.ability.extra.SatanMoney
                    local dollar_value = target_dollars - current_dollars
                    ease_dollars(dollar_value)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.SatanMoney), colour = G.C.MONEY})
                    return true
                end
            }
        end
    end
}