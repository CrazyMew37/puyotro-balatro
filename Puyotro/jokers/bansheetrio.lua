
SMODS.Joker{ --Banshee Trio
    key = "bansheetrio",
    config = {
        extra = {
            BansheeMult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Banshee Trio',
        ['text'] = {
            [1] = 'Gains {C:red}+1{} Mult for',
            [2] = 'every scored {C:attention}3{}',
            [3] = '{C:inactive}(Currently{} {C:red}+#1# {}{C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        
        return {vars = {card.ability.extra.BansheeMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 3 then
                card.ability.extra.BansheeMult = (card.ability.extra.BansheeMult) + 1
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                mult = card.ability.extra.BansheeMult
            }
        end
    end
}