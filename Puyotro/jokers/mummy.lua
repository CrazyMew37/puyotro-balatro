
SMODS.Joker{ --Mummy
    key = "mummy",
    config = {
        extra = {
            MummyMult = 0,
            MummyGain = 3
        }
    },
    loc_txt = {
        ['name'] = 'Mummy',
        ['text'] = {
            [1] = 'Gains {C:red}+#2#{} Mult when',
            [2] = 'a card is {C:attention}destroyed{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_commons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MummyMult, card.ability.extra.MummyGain}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.MummyMult = (card.ability.extra.MummyMult) + card.ability.extra.MummyGain
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.MummyMult
            }
        end
    end
}