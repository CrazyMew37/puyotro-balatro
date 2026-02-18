
SMODS.Joker{ --Dark Arle
    key = "darkarle",
    config = {
        extra = {
            ArleMult = 4,
            ArleChips = -7
        }
    },
    loc_txt = {
        ['name'] = 'Dark Arle',
        ['text'] = {
            [1] = '{C:red}+#1# {}Mult, {C:blue}#2# {}Chips',
            [2] = 'Increases by {C:red}+4{} Mult and',
            [3] = 'decreases by {C:blue}-7{} Chips',
            [4] = 'every time this card is',
            [5] = 'triggered'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.ArleMult, card.ability.extra.ArleChips}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local ArleMult_value = card.ability.extra.ArleMult
            local ArleChips_value = card.ability.extra.ArleChips
            card.ability.extra.ArleMult = (card.ability.extra.ArleMult) + 4
            card.ability.extra.ArleChips = (card.ability.extra.ArleChips) + -7
            return {
                mult = ArleMult_value,
                extra = {
                    message = "Upgrade! (Mult)",
                    colour = G.C.GREEN,
                    extra = {
                        chips = ArleChips_value,
                        colour = G.C.CHIPS,
                        extra = {
                            message = "Downgrade! (Chips)",
                            colour = G.C.GREEN
                        }
                    }
                }
            }
        end
    end
}