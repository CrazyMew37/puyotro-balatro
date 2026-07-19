
SMODS.Joker{ --Jaan
    key = "jaan",
    config = {
        extra = {
            JaanMult = 4,
            JaanIncrease = 4
        }
    },
    loc_txt = {
        ['name'] = 'Jaan',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult',
            [2] = 'Mult increases by {C:red}+#2#{}',
            [3] = 'the further {C:attention}right{}',
            [4] = 'this joker is'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_uncommons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.JaanMult, card.ability.extra.JaanIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local JaanMult_value = card.ability.extra.JaanMult
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    card.ability.extra.JaanMult = i
                    break
                end
            end
            card.ability.extra.JaanMult = (card.ability.extra.JaanMult) * card.ability.extra.JaanIncrease
            return {
                mult = JaanMult_value
            }
        end
    end
}