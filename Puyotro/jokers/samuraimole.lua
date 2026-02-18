
SMODS.Joker{ --Samurai Mole
    key = "samuraimole",
    config = {
        extra = {
            hand_size_increase = '2',
            mult0 = 15
        }
    },
    loc_txt = {
        ['name'] = 'Samurai Mole',
        ['text'] = {
            [1] = '{C:red}+15{} Mult',
            [2] = '{C:attention}-2{} Hand Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = 15
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-2)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(2)
    end
}