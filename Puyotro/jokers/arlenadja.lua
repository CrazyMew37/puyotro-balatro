
SMODS.Joker{ --Arle Nadja
    key = "arlenadja",
    config = {
        extra = {
            ArleMult = 4,
            ArleIncrease = 2
        }
    },
    loc_txt = {
        ['name'] = 'Arle Nadja',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult',
            [2] = 'Increases by {C:red}+#2# {}Mult every',
            [3] = 'time this card is triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_commons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ArleMult, card.ability.extra.ArleIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local ArleMult_value = card.ability.extra.ArleMult
            card.ability.extra.ArleMult = (card.ability.extra.ArleMult) + card.ability.extra.ArleIncrease
            return {
                mult = ArleMult_value,
                extra = {
                    message = "Upgrade!",
                    colour = G.C.GREEN
                }
            }
        end
    end
}