
SMODS.Joker{ --Witch
    key = "witch",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Witch',
        ['text'] = {
            [1] = 'Scoring cards that have a',
            [2] = '{C:purple}Purple Seal{} will create a',
            [3] = 'random {C:tarot}Tarot Card{}',
            [4] = '{C:inactive}(Must Have Room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 0
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
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Purple" then
                for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            play_sound('timpani')
                            SMODS.add_card({ set = 'Tarot', })                            
                            card:juice_up(0.3, 0.5)
                            return true
                        end
                    }))
                end
                delay(0.6)
                return {
                    message = created_consumable and localize('k_plus_tarot') or nil
                }
            end
        end
    end
}