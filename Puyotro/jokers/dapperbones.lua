
SMODS.Joker{ --Dapper Bones
    key = "dapperbones",
    config = {
        extra = {
            DapperMult = 1,
            DapperValue = 1,
            enhancedcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Dapper Bones',
        ['text'] = {
            [1] = '{C:red}+#2#{} Mult for every',
            [2] = '{C:attention}Enhanced card{} in your',
            [3] = 'deck',
            [4] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 2
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
        
    return {vars = {card.ability.extra.DapperMult, card.ability.extra.DapperValue, (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local DapperMult_value = card.ability.extra.DapperMult
        card.ability.extra.DapperMult = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
            card.ability.extra.DapperMult = (card.ability.extra.DapperMult) * card.ability.extra.DapperValue
            return {
                mult = DapperMult_value
            }
        end
    end
}