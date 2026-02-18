
SMODS.Joker{ --Mandrake
    key = "mandrake",
    config = {
        extra = {
            xchips0 = 1.15
        }
    },
    loc_txt = {
        ['name'] = 'Mandrake',
        ['text'] = {
            [1] = '{C:attention}Wild Cards{} are given',
            [2] = '{C:attention}Polychrome.{} Scoring {C:attention}Wild{}',
            [3] = '{C:attention}Polychrome Cards{} gain an',
            [4] = 'additional {X:chips,C:white}x1.15{} Chips'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_wild"] == true and not (context.other_card.edition and context.other_card.edition.key == "polychrome")) then
                local scored_card = context.other_card
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                        scored_card:set_edition("e_polychrome", true)
                        card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                        return true
                    end
                }))
            elseif (SMODS.get_enhancements(context.other_card)["m_wild"] == true and context.other_card.edition and context.other_card.edition.key == "polychrome") then
                return {
                    x_chips = 1.15
                }
            end
        end
    end
}