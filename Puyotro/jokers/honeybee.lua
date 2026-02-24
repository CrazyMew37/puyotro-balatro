
SMODS.Joker{ --Honey Bee
    key = "honeybee",
    config = {
        extra = {
            blind_size0 = 0.96
        }
    },
    loc_txt = {
        ['name'] = 'Honey Bee',
        ['text'] = {
            [1] = 'Reduces the requirements of',
            [2] = 'a blind by {C:attention}4%{} for each hand',
            [3] = '{C:inactive}(Does so multiplicatively){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_uncommons"] = true },
    
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers  then
            return {
                
                func = function()
                    if G.GAME.blind.in_blind then
                        
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(0.96).." Blind Size", colour = G.C.GREEN})
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.96
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                        G.HUD_blind:recalculate()
                        return true
                    end
                end
            }
        end
    end
}