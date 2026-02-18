
SMODS.Joker{ --Succubus
    key = "succubus",
    config = {
        extra = {
            chips0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Succubus',
        ['text'] = {
            [1] = '{C:blue}+20{} Chips for each',
            [2] = 'played card that is',
            [3] = '{C:spades}Spades{} or {C:hearts}Hearts{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 1
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
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:is_suit("Spades") or context.other_card:is_suit("Hearts")) then
                return {
                    chips = 20
                }
            end
        end
    end
}