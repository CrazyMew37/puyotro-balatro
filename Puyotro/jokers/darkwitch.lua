
SMODS.Joker{ --Dark Witch
    key = "darkwitch",
    config = {
        extra = {
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Dark Witch',
        ['text'] = {
            [1] = '{C:tarot}Tarot Cards{} have a',
            [2] = '{C:green}#1# in #2# {}chance to',
            [3] = 'create a {C:attention}Negative{}',
            [4] = '{C:spectral}Spectral Card{} on use'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_darkwitch') 
        return {vars = {new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' then
                if SMODS.pseudorandom_probability(card, 'group_0_71f6af41', 1, card.ability.extra.odds, 'j_puyotro_darkwitch', false) then
                    SMODS.calculate_effect({func = function()
                        
                        for i = 1, 1 do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    SMODS.add_card({ set = 'Spectral', edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                        end
                        return true
                    end}, card)
                end
            end
        end
    end
}