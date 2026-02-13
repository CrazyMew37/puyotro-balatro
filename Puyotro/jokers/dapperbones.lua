
SMODS.Joker{ --Dapper Bones
    key = "dapperbones",
    config = {
        extra = {
            enhancedcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dapper Bones',
        ['text'] = {
            [1] = '{C:red}+1{} Mult for every',
            [2] = '{C:attention}Enhanced card{} in your',
            [3] = 'deck',
            [4] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
        
    return {vars = {(function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
            mult = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
            }
        end
    end
}