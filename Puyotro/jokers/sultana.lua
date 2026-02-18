
SMODS.Joker{ --Sultana
    key = "sultana",
    config = {
        extra = {
            sell_value0 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Sultana',
        ['text'] = {
            [1] = 'When a Joker or Consumable',
            [2] = 'is {C:attention}sold{}, this card {C:attention}gains{} {C:money}$3{}',
            [3] = 'of sell value'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 8
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.selling_card  then
            return {
                func = function()local my_pos = nil
                    for i = 1, #G.jokers.cards do
                        if G.jokers.cards[i] == card then
                            my_pos = i
                            break
                        end
                    end
                    local target_card = G.jokers.cards[my_pos]
                    target_card.ability.extra_value = (card.ability.extra_value or 0) + 3
                    target_card:set_cost()
                    return true
                end,
                message = "+"..tostring(3).." Sell Value"
            }
        end
    end
}