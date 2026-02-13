
SMODS.Joker{ --Rulue
    key = "rulue",
    config = {
        extra = {
            RulueMult = 20
        }
    },
    loc_txt = {
        ['name'] = 'Rulue',
        ['text'] = {
            [1] = '{C:blue}+#1# {}Chips',
            [2] = 'Increases by {C:blue}+10{} Chips every',
            [3] = 'time this card is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
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
        
        return {vars = {card.ability.extra.RulueMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local RulueMult_value = card.ability.extra.RulueMult
            card.ability.extra.RulueMult = (card.ability.extra.RulueMult) + 10
            return {
                chips = RulueMult_value,
                extra = {
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}