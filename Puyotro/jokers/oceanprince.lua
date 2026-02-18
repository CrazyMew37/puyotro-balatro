
SMODS.Joker{ --Ocean Prince
    key = "oceanprince",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ocean Prince',
        ['text'] = {
            [1] = 'If it\'s the {C:attention}final hand{}',
            [2] = 'of a round, then apply',
            [3] = '{C:green}Fever Seal{} to any cards',
            [4] = 'held in hand'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if to_big(G.GAME.current_round.hands_left) <= to_big(0) then
                return {
                    func = function()
                        context.other_card:set_seal("puyotro_feverseal", true)
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}