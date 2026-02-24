
SMODS.Joker{ --Baldanders
    key = "baldanders",
    config = {
        extra = {
            StoneMult = 1.25
        }
    },
    loc_txt = {
        ['name'] = 'Baldanders',
        ['text'] = {
            [1] = 'Played {C:attention}Stone Cards{}',
            [2] = 'give {X:red,C:white}X#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true, ["puyotro_puyotro_commons"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.StoneMult}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    Xmult = card.ability.extra.StoneMult
                }
            end
        end
    end
}