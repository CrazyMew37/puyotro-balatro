
SMODS.Joker{ --Oniko
    key = "oniko",
    config = {
        extra = {
            blind_size0 = 0.8,
            chips0 = -30,
            mult0 = -6
        }
    },
    loc_txt = {
        ['name'] = 'Oniko',
        ['text'] = {
            [1] = 'Reduces Blind',
            [2] = 'Requirements by {C:attention}20%{}',
            [3] = '{C:blue}-30{} Chips, {C:red}-6{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.setting_blind  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.8).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.8
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = -30,
                extra = {
                    mult = -6
                }
            }
        end
    end
}