
SMODS.Joker{ --Red Amitie
    key = "redamitie",
    config = {
        extra = {
            RedAmitieMult = 2.4,
            RedAmitieHandSize = 1
        }
    },
    loc_txt = {
        ['name'] = 'Red Amitie',
        ['text'] = {
            [1] = 'Every card scores {X:red,C:white}X#1#{} Mult',
            [2] = '{C:red}-#2#{} Hand Size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 9
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["puyotro_puyotro_jokers"] = true, ["puyotro_puyotro_legendaries"] = true },
    soul_pos = {
        x = 7,
        y = 9
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' and args.source ~= 'jud' 
            or args.source == 'buf' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.RedAmitieMult, card.ability.extra.RedAmitieHandSize}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            return {
                Xmult = card.ability.extra.RedAmitieMult
            }
        end
    end,
    
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.RedAmitieHandSize)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.RedAmitieHandSize)
    end
}