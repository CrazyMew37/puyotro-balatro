
SMODS.Joker{ --Will-o-Wisp
    key = "willowisp",
    config = {
        extra = {
            WillOWispChips = 0,
            WillOWispGain = 20
        }
    },
    loc_txt = {
        ['name'] = 'Will-o-Wisp',
        ['text'] = {
            [1] = 'Gains {C:blue}+#2#{} Chips when',
            [2] = 'a card is {C:attention}destroyed{}',
            [3] = '{C:inactive}(Currently{} {C:blue}+#1# {}{C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.WillOWispChips, card.ability.extra.WillOWispGain}}
    end,
    
    calculate = function(self, card, context)
        if context.remove_playing_cards  then
            return {
                func = function()
                    card.ability.extra.WillOWispChips = (card.ability.extra.WillOWispChips) + card.ability.extra.WillOWispGain
                    return true
                end,
                message = "Upgrade!"
            }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                chips = card.ability.extra.WillOWispChips
            }
        end
    end
}