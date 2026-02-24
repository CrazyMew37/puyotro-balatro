
SMODS.Joker{ --Panotty
    key = "panotty",
    config = {
        extra = {
            PanottyChips = 120,
            PanottyMult = 24,
            PuyoNeeded = 4,
            NuisanceNeeded = 6
        }
    },
    loc_txt = {
        ['name'] = 'Panotty',
        ['text'] = {
            [1] = '{C:blue}+#1#{} Chips if you have at',
            [2] = 'least {C:attention}#3#{} Puyo Cards',
            [3] = '{C:red}+#2#{} Mult if you have at',
            [4] = 'least {C:attention}#4#{} Nuisance Cards'
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
        
        return {vars = {card.ability.extra.PanottyChips, card.ability.extra.PanottyMult, card.ability.extra.PuyoNeeded, card.ability.extra.NuisanceNeeded}}
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
                return to_big(count) >= to_big(card.ability.extra.PuyoNeeded)
            end)() then
                return {
                    chips = card.ability.extra.PanottyChips
                }
            elseif (function()
                local count = 0
                for _, playing_card in pairs(G.playing_cards or {}) do
                    if SMODS.get_enhancements(playing_card)["m_puyotro_nuisancecard"] == true then
                        count = count + 1
                    end
                end
                return to_big(count) >= to_big(card.ability.extra.NuisanceNeeded)
            end)() then
                return {
                    mult = card.ability.extra.PanottyMult
                }
            end
        end
    end
}