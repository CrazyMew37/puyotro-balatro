
SMODS.Joker{ --Harpy
    key = "harpy",
    config = {
        extra = {
            HarpySwitch = 0,
            HarpyUp = 1.5,
            HarpyDown = 0.75
        }
    },
    loc_txt = {
        ['name'] = 'Harpy',
        ['text'] = {
            [1] = 'Swaps between {X:chips,C:white}X#2# {} Chips, {X:mult,C:white}X#3# {}',
            [2] = 'Mult and {X:blue,C:white}X#3# {} Chips, {X:mult,C:white}X#2# {} Mult'
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
        
        return {vars = {card.ability.extra.HarpySwitch, card.ability.extra.HarpyUp, card.ability.extra.HarpyDown}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if to_big((card.ability.extra.HarpySwitch or 0)) == to_big(0) then
                card.ability.extra.HarpySwitch = 1
                return {
                    x_chips = card.ability.extra.HarpyUp,
                    extra = {
                        Xmult = card.ability.extra.HarpyDown
                    }
                }
            elseif to_big((card.ability.extra.HarpySwitch or 0)) == to_big(1) then
                card.ability.extra.HarpySwitch = 0
                return {
                    x_chips = card.ability.extra.HarpyDown,
                    extra = {
                        Xmult = card.ability.extra.HarpyUp
                    }
                }
            end
        end
    end
}