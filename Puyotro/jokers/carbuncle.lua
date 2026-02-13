
SMODS.Joker{ --Carbuncle
    key = "carbuncle",
    config = {
        extra = {
            CarbuncleMult = 24,
            CarbuncleChips = 80,
            CarbuncleMoney = 4,
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Carbuncle',
        ['text'] = {
            [1] = '{C:green}#4# in #5# {}chance for {C:red}+#1# {}Mult',
            [2] = '{C:green}#4# in #5# {}chance for {C:blue}+#2# {}Chips',
            [3] = '{C:green}#4# in #5# {}chance to earn {C:money}$#3# {}',
            [4] = 'Each trigger increases their',
            [5] = 'value by {C:red}+6{}/{C:blue}+20{}/{C:money}$1{} respectively'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_carbuncle')
        local new_numerator2, new_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds2, 'j_puyotro_carbuncle')
        local new_numerator3, new_denominator3 = SMODS.get_probability_vars(card, 1, card.ability.extra.odds3, 'j_puyotro_carbuncle')
        return {vars = {card.ability.extra.CarbuncleMult, card.ability.extra.CarbuncleChips, card.ability.extra.CarbuncleMoney, new_numerator, new_denominator, new_numerator2, new_denominator2, new_numerator3, new_denominator3}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_5acbe18a', 1, card.ability.extra.odds, 'j_puyotro_carbuncle', false) then
                    local CarbuncleMult_value = card.ability.extra.CarbuncleMult
                    card.ability.extra.CarbuncleMult = (card.ability.extra.CarbuncleMult) + 6
                    SMODS.calculate_effect({mult = CarbuncleMult_value}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgrade! (Mult)", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_1_b7a3e2fb', 1, card.ability.extra.odds, 'j_puyotro_carbuncle', false) then
                    local CarbuncleChips_value = card.ability.extra.CarbuncleChips
                    card.ability.extra.CarbuncleChips = (card.ability.extra.CarbuncleChips) + 20
                    SMODS.calculate_effect({chips = CarbuncleChips_value}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgrade! (Chips)", colour = G.C.GREEN})
                end
                if SMODS.pseudorandom_probability(card, 'group_2_391c3d93', 1, card.ability.extra.odds, 'j_puyotro_carbuncle', false) then
                    local CarbuncleMoney_value = card.ability.extra.CarbuncleMoney
                    card.ability.extra.CarbuncleMoney = (card.ability.extra.CarbuncleMoney) + 1
                    SMODS.calculate_effect({
                        func = function()
                            
                            local current_dollars = G.GAME.dollars
                            local target_dollars = G.GAME.dollars + CarbuncleMoney_value
                            local dollar_value = target_dollars - current_dollars
                            ease_dollars(dollar_value)
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(CarbuncleMoney_value), colour = G.C.MONEY})
                            return true
                        end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Upgrade! (Money)", colour = G.C.GREEN})
                    end
                end
            end
        end
    }