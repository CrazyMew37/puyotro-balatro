
SMODS.Joker{ --Rafisol
    key = "rafisol",
    config = {
        extra = {
            rafisolmult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Rafisol',
        ['text'] = {
            [1] = 'Played {C:hearts}Hearts{} are destroyed',
            [2] = 'Gains {X:mult,C:white}X1{} Mult for',
            [3] = 'every destroyed {C:hearts}Hearts{}',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1# {} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 6
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
    pools = { ["puyotro_cm37jokers_jokers"] = true },
    soul_pos = {
        x = 1,
        y = 6
    },
    in_pool = function(self, args)
        return (
            not args 
            or args.source ~= 'sho' 
            or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
        )
        and true
    end,
    
    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.rafisolmult}}
    end,
    
    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if context.other_card:is_suit("Hearts") then
                context.other_card.should_destroy = true
                card.ability.extra.rafisolmult = (card.ability.extra.rafisolmult) + 1
                return {
                    message = "Upgrade!",
                    extra = {
                        message = "Destroyed!",
                        colour = G.C.RED
                    }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            return {
                Xmult = card.ability.extra.rafisolmult
            }
        end
    end
}