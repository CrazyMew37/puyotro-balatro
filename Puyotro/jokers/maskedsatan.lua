
SMODS.Joker{ --Masked Satan
    key = "maskedsatan",
    config = {
        extra = {
            MaskedSatanLevelUp = 2,
            odds = 12
        }
    },
    loc_txt = {
        ['name'] = 'Masked Satan',
        ['text'] = {
            [1] = '{C:green}#2# in #3# {}chance to {C:attention}destroy{}',
            [2] = 'a played card, destroyed',
            [3] = 'cards level up your most',
            [4] = 'played hand by {C:attention}#1# {}(Level',
                [5] = 'increase goes up by {C:attention}1{} for',
            [6] = 'every successful trigger)'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 9
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_maskedsatan') 
        return {vars = {card.ability.extra.MaskedSatanLevelUp, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_4a2aa8a5', 1, card.ability.extra.odds, 'j_puyotro_maskedsatan', false) then
                    context.other_card.should_destroy = true
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end
            end
        end
        if context.remove_playing_cards  then
            local MaskedSatanLevelUp_value = card.ability.extra.MaskedSatanLevelUp
            local temp_played = 0
            local temp_order = math.huge
            local target_hand
            for hand, value in pairs(G.GAME.hands) do 
                if value.played > temp_played and value.visible then
                    temp_played = value.played
                    temp_order = value.order
                    target_hand = hand
                elseif value.played == temp_played and value.visible then
                    if value.order < temp_order then
                        temp_order = value.order
                        target_hand = hand
                    end
                end
            end
            
            level_up_hand(card, target_hand, true, MaskedSatanLevelUp_value)
            return {
                message = "Level Up!",
                extra = {
                    func = function()
                        card.ability.extra.MaskedSatanLevelUp = (card.ability.extra.MaskedSatanLevelUp) + 1
                        return true
                    end,
                    colour = G.C.GREEN
                }
            }
        end
    end
}