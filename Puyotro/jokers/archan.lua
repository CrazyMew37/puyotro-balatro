
SMODS.Joker{ --Archan
    key = "archan",
    config = {
        extra = {
            ArchanMult = 5,
            odds = 4
        }
    },
    loc_txt = {
        ['name'] = 'Archan',
        ['text'] = {
            [1] = '{C:green}#2# in #3# {}chance for {X:red,C:white}X#1#{} Mult'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_quest_deck_jokers"] = true },
    
    loc_vars = function(self, info_queue, card)
        
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_puyotro_archan') 
        return {vars = {card.ability.extra.ArchanMult, new_numerator, new_denominator}}
    end,
    
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_aa50cdb1', 1, card.ability.extra.odds, 'j_puyotro_archan', false) then
                    SMODS.calculate_effect({Xmult = card.ability.extra.ArchanMult}, card)
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Bullseye!", colour = G.C.WHITE})
                end
            end
        end
    end
}