
SMODS.Joker{ --Akuma
    key = "akuma",
    config = {
        extra = {
            AkumaChips = 25
        }
    },
    loc_txt = {
        ['name'] = 'Akuma',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips for every',
            [2] = 'scored card with an',
            [3] = '{C:attention}enhancement{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
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
        
        return {vars = {card.ability.extra.AkumaChips}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (function()
                local enhancements = SMODS.get_enhancements(context.other_card)
                for k, v in pairs(enhancements) do
                    if v then
                        return true
                    end
                end
                return false
            end)() then
                return {
                    chips = card.ability.extra.AkumaChips
                }
            end
        end
    end
}