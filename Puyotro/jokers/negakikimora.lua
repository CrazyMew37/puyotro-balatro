
SMODS.Joker{ --Nega Kikimora
    key = "negakikimora",
    config = {
        extra = {
            MaskedSatanLevelUp = 2
        }
    },
    loc_txt = {
        ['name'] = 'Nega Kikimora',
        ['text'] = {
            [1] = 'Cards are given a',
            [2] = 'random {C:enhanced}Enhancement{},',
            [3] = '{C:enhanced}Edition{}, and {C:enhanced}Seal{} when',
            [4] = 'they are scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
    pools = { ["puyotro_puyotro_jokers"] = true },
    soul_pos = {
        x = 3,
        y = 9
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
        
        return {vars = {card.ability.extra.MaskedSatanLevelUp}}
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()
                    
                    local enhancement_pool = {}
                    for _, enhancement in pairs(G.P_CENTER_POOLS.Enhanced) do
                        if enhancement.key ~= 'm_stone' then
                            enhancement_pool[#enhancement_pool + 1] = enhancement
                        end
                    end
                    local random_enhancement = pseudorandom_element(enhancement_pool, 'edit_card_enhancement')
                    scored_card:set_ability(random_enhancement)
                    local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                    if random_seal then
                        scored_card:set_seal(random_seal, true)
                    end
                    local edition = pseudorandom_element({'e_foil','e_holo','e_polychrome','e_negative'}, 'random edition')
                    if random_edition then
                        scored_card:set_edition(random_edition, true)
                    end
                    card_eval_status_text(scored_card, 'extra', nil, nil, nil, {message = "Card Modified!", colour = G.C.ORANGE})
                    return true
                end
            }))
        end
    end
}