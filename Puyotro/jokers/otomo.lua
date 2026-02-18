
SMODS.Joker{ --Otomo
    key = "otomo",
    config = {
        extra = {
            mult0 = 6
        }
    },
    loc_txt = {
        ['name'] = 'Otomo',
        ['text'] = {
            [1] = '{C:red}+6{} Mult for each scoring',
            [2] = 'card with a {C:attention}Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal ~= nil then
                return {
                    mult = 6
                }
            end
        end
    end
}