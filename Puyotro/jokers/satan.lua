
SMODS.Joker{ --Satan
    key = "satan",
    config = {
        extra = {
            levels0 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Satan',
        ['text'] = {
            [1] = 'When a card is {C:attention}destroyed{},',
            [2] = '{C:attention}level up{} a random {C:attention}poker{}',
            [3] = '{C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            local available_hands = {}
            for hand, value in pairs(G.GAME.hands) do
                if value.visible and value.level >= to_big(1) then
                    table.insert(available_hands, hand)
                end
            end
            local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
            level_up_hand(card, target_hand, true, 1)
            return {
                message = "Level Up!"
            }
        end
    end
}