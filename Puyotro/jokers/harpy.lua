
SMODS.Joker{ --Harpy
    key = "harpy",
    config = {
        extra = {
            HarpySwitch = 0,
            xchips0 = 1.5,
            xmult0 = 0.75,
            xchips = 0.75,
            xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Harpy',
        ['text'] = {
            [1] = 'Swaps between {X:chips,C:white}X1.5{} Chips, {X:mult,C:white}X0.75{}',
            [2] = 'Mult and {X:blue,C:white}X0.75{} Chips, {X:mult,C:white}X1.5{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.HarpySwitch}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.HarpySwitch or 0)) == to_big(0) then
                card.ability.extra.HarpySwitch = 1
                return {
                    x_chips = 1.5,
                    extra = {
                        Xmult = 0.75
                    }
                }
            elseif to_big((card.ability.extra.HarpySwitch or 0)) == to_big(1) then
                card.ability.extra.HarpySwitch = 0
                return {
                    x_chips = 0.75,
                    extra = {
                        Xmult = 1.5
                    }
                }
            end
        end
    end
}