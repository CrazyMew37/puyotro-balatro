
SMODS.Joker{ --Kikimora
    key = "kikimora",
    config = {
        extra = {
            KikimoraMult = 2.5
        }
    },
    loc_txt = {
        ['name'] = 'Kikimora',
        ['text'] = {
            [1] = '{X:red,C:white}X#1#{} Mult if a {C:attention}scored{} card has',
            [2] = 'an {C:enhanced}edition{}, {C:enhanced}enhancement{}, or {C:enhanced}seal{}',
            [3] = '{C:attention}Removes{} the {C:enhanced}modifier{} of the scored',
            [4] = 'card that triggered this joker',
            [5] = '{s:0.7}(Prioritizes Editions, then Enhancements, then Seals){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.KikimoraMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.edition ~= nil then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    Xmult = card.ability.extra.KikimoraMult
                }
            elseif (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.c_base)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    Xmult = card.ability.extra.KikimoraMult
                }
            elseif context.other_card.seal ~= nil then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_ability(G.P_CENTERS.c_base)
                        scored_card:set_seal(nil)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
                return {
                    Xmult = card.ability.extra.KikimoraMult
                }
            end
        end
    end
}