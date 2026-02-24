
SMODS.Joker{ --Minotauros
    key = "minotauros",
    config = {
        extra = {
            MinoChips = 100,
            MinoMult = -8
        }
    },
    loc_txt = {
        ['name'] = 'Minotauros',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips',
            [2] = '{C:red}#2#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.MinoChips, card.ability.extra.MinoMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.MinoChips,
                extra = {
                    mult = card.ability.extra.MinoMult
                }
            }
        end
    end
}