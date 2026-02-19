
SMODS.Joker{ --Nohoho
    key = "nohoho",
    config = {
        extra = {
            NohohoChips = 0,
            NohohoIncrease = 10
        }
    },
    loc_txt = {
        ['name'] = 'Nohoho',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+#2#{} Chips',
            [2] = 'per {C:attention}reroll{} in the shop',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.NohohoChips, card.ability.extra.NohohoIncrease}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.NohohoChips
            }
        end
        if context.reroll_shop  then
            return {
                func = function()
                    card.ability.extra.NohohoChips = (card.ability.extra.NohohoChips) + card.ability.extra.NohohoIncrease
                    return true
                end
            }
        end
    end
}