
SMODS.Joker{ --Paprisu
    key = "paprisu",
    config = {
        extra = {
            PaprisuAmount = 2
        }
    },
    loc_txt = {
        ['name'] = 'Paprisu',
        ['text'] = {
            [1] = 'Creates {C:attention}#1#{} random',
            [2] = '{C:attention}Negative Consumables{} at the',
            [3] = '{C:attention}start{} of each {C:attention}Boss Blind{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 7
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
        
        return {vars = {card.ability.extra.PaprisuAmount}}
    end,
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                        
                        for i = 1, card.ability.extra.PaprisuAmount do
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.4,
                                func = function()
                                    if G.consumeables.config.card_limit > #G.consumeables.cards + G.GAME.consumeable_buffer then
                                        G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                    end
                                    
                                    play_sound('timpani')
                                    local sets = {'Tarot', 'Planet', 'Spectral'}
                                    local random_set = pseudorandom_element(sets, 'random_consumable_set')
                                    SMODS.add_card({ set = random_set, edition = 'e_negative', })                            
                                    card:juice_up(0.3, 0.5)
                                    return true
                                end
                            }))
                        end
                        delay(0.6)
                        
                        if created_consumable then
                            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                        end
                        return true
                    end
                }
            end
        end
    end
}