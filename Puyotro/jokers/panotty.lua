
SMODS.Joker{ --Panotty
    key = "panotty",
    config = {
        extra = {
            PanottyChips = 0,
            PanottyMult = 0,
            chips0 = 120,
            mult0 = 20
        }
    },
    loc_txt = {
        ['name'] = 'Panotty',
        ['text'] = {
            [1] = '{C:blue}+120{} Chips if you have at',
            [2] = 'least {C:attention}8{} Puyo Cards',
            [3] = '{C:red}+20{} Mult if you have at',
            [4] = 'least {C:attention}8{} Nuisance Cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
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
        
        return {vars = {card.ability.extra.PanottyChips, card.ability.extra.PanottyMult}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if SMODS.get_enhancements(playing_card)["m_puyotro_puyocard"] == true then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(8)
            end)() then
                return {
                    chips = 120
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if SMODS.get_enhancements(playing_card)["m_puyotro_nuisancecard"] == true then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(8)
            end)() then
                return {
                    mult = 20
                }
            end
        end
    end
}