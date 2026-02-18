
SMODS.Joker{ --Scylla
    key = "scylla",
    config = {
        extra = {
            ChicoMult = 1,
            money÷5 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Scylla',
        ['text'] = {
            [1] = '{X:blue,C:white}X0.1{} Chips for every {C:money}$5{} you have',
            [2] = '{C:inactive}(Currently {}{X:blue,C:white}X#1# {} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 6
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
        
        return {vars = {card.ability.extra.ChicoMult, (math.floor(lenient_bignum(G.GAME.dollars / 5)) or 0)}}
    end,
    
    calculate = function(self, card, context)
        if (context.end_of_round or context.reroll_shop or context.buying_card or
            context.selling_card or context.ending_shop or context.starting_shop or 
            context.ending_booster or context.skipping_booster or context.open_booster or
            context.skip_blind or context.before or context.pre_discard or context.setting_blind or
        context.using_consumeable)   then
            local ChicoMult_value = card.ability.extra.ChicoMult
            return {
                func = function()
                    card.ability.extra.ChicoMult = math.floor(lenient_bignum(G.GAME.dollars / 5))
                    return true
                end,
                extra = {
                    func = function()
                        card.ability.extra.ChicoMult = (card.ability.extra.ChicoMult) / 10
                        return true
                    end,
                    colour = G.C.MULT,
                    extra = {
                        func = function()
                            card.ability.extra.ChicoMult = (card.ability.extra.ChicoMult) + 1
                            return true
                        end,
                        colour = G.C.GREEN
                    }
                }
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            local ChicoMult_value = card.ability.extra.ChicoMult
            card.ability.extra.ChicoMult = math.floor(lenient_bignum(G.GAME.dollars / 5))
            card.ability.extra.ChicoMult = (card.ability.extra.ChicoMult) / 10
            card.ability.extra.ChicoMult = (card.ability.extra.ChicoMult) + 1
            return {
                x_chips = ChicoMult_value
            }
        end
    end
}