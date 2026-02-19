
SMODS.Joker{ --Suketoudara
    key = "suketoudara",
    config = {
        extra = {
            SukeHands = 1,
            SukeDiscards = 2,
            SukeHandSize = 1
        }
    },
    loc_txt = {
        ['name'] = 'Suketoudara',
        ['text'] = {
            [1] = '{C:blue}+#1# {}Hand, {C:attention}+#3# {}Hand Size',
            [2] = '{C:red}-#2# {}Discards',
            [3] = '{C:inactive,s:0.75}(Fiiish!){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.SukeHands, card.ability.extra.SukeDiscards, card.ability.extra.SukeHandSize}}
    end,
    
    calculate = function(self, card, context)
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.SukeHands
        G.GAME.round_resets.discards = math.max(1, G.GAME.round_resets.discards - card.ability.extra.SukeDiscards)
        G.hand:change_size(card.ability.extra.SukeHandSize)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.SukeHands
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.SukeDiscards
        G.hand:change_size(-card.ability.extra.SukeHandSize)
    end
}