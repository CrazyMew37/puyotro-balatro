
SMODS.Booster {
    key = 'puyopuyopack',
    loc_txt = {
        name = "Puyo Puyo Pack",
        text = {
            [1] = 'Choose {C:attention}1{} of {C:attention}4{} Puyotro Cards'
        },
        group_name = "puyotro_boosters"
    },
    config = { extra = 4, choose = 1 },
    cost = 6,
    weight = 0.4,
    atlas = "CustomBoosters",
    pos = { x = 0, y = 0 },
    kind = 'Puyo Puyo Pack',
    group_key = "puyotro_boosters",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        local weights = {
            5,
            1,
            3,
            0.95,
            0.05
        }
        local total_weight = 0
        for _, weight in ipairs(weights) do
            total_weight = total_weight + weight
        end
        local random_value = pseudorandom('puyotro_puyopuyopack_card') * total_weight
        local cumulative_weight = 0
        local selected_index = 1
        for j, weight in ipairs(weights) do
            cumulative_weight = cumulative_weight + weight
            if random_value <= cumulative_weight then
                selected_index = j
                break
            end
        end
        if selected_index == 1 then
            return {
                set = "puyotro_puyotro_commons",
                rarity = "Common",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "puyotro_puyopuyopack"
            }
        elseif selected_index == 2 then
            return {
                set = "puyotro_puyotro_commons",
                rarity = "Common",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "puyotro_puyopuyopack"
            }
        elseif selected_index == 3 then
            return {
                set = "puyotro_puyotro_uncommons",
                rarity = "Uncommon",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "puyotro_puyopuyopack"
            }
        elseif selected_index == 4 then
            return {
                set = "puyotro_puyotro_rares",
                rarity = "Rare",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "puyotro_puyopuyopack"
            }
        elseif selected_index == 5 then
            return {
                set = "puyotro_puyotro_legendaries",
                rarity = "Legendary",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "puyotro_puyopuyopack"
            }
        end
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("66ff66"))
        ease_background_colour({ new_colour = HEX('66ff66'), special_colour = HEX("00cc00"), contrast = 2 })
    end,
    particles = function(self)
        -- No particles for joker packs
        end,
    }
    
    
    SMODS.Booster {
        key = 'puyopuyopack2',
        loc_txt = {
            name = "Puyo Puyo Pack",
            text = {
                [1] = 'Choose {C:attention}1{} of {C:attention}4{} Puyotro Cards'
            },
            group_name = "puyotro_boosters"
        },
        config = { extra = 4, choose = 1 },
        cost = 6,
        weight = 0.4,
        atlas = "CustomBoosters",
        pos = { x = 1, y = 0 },
        kind = 'Puyo Puyo Pack',
        group_key = "puyotro_boosters",
        discovered = true,
        loc_vars = function(self, info_queue, card)
            local cfg = (card and card.ability) or self.config
            return {
                vars = { cfg.choose, cfg.extra }
            }
        end,
        create_card = function(self, card, i)
            local weights = {
                5,
                1,
                3,
                0.95,
                0.05
            }
            local total_weight = 0
            for _, weight in ipairs(weights) do
                total_weight = total_weight + weight
            end
            local random_value = pseudorandom('puyotro_puyopuyopack2_card') * total_weight
            local cumulative_weight = 0
            local selected_index = 1
            for j, weight in ipairs(weights) do
                cumulative_weight = cumulative_weight + weight
                if random_value <= cumulative_weight then
                    selected_index = j
                    break
                end
            end
            if selected_index == 1 then
                return {
                    set = "puyotro_puyotro_commons",
                    rarity = "Common",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "puyotro_puyopuyopack2"
                }
            elseif selected_index == 2 then
                return {
                    set = "puyotro_puyotro_commons",
                    rarity = "Common",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "puyotro_puyopuyopack2"
                }
            elseif selected_index == 3 then
                return {
                    set = "puyotro_puyotro_uncommons",
                    rarity = "Uncommon",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "puyotro_puyopuyopack2"
                }
            elseif selected_index == 4 then
                return {
                    set = "puyotro_puyotro_rares",
                    rarity = "Rare",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "puyotro_puyopuyopack2"
                }
            elseif selected_index == 5 then
                return {
                    set = "puyotro_puyotro_legendaries",
                    rarity = "Legendary",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key_append = "puyotro_puyopuyopack2"
                }
            end
        end,
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, HEX("66ff66"))
            ease_background_colour({ new_colour = HEX('66ff66'), special_colour = HEX("00cc00"), contrast = 2 })
        end,
        particles = function(self)
            -- No particles for joker packs
            end,
        }
        
        
        SMODS.Booster {
            key = 'jumbo_puyo_puyo_pack',
            loc_txt = {
                name = "Jumbo Puyo Puyo Pack",
                text = {
                    [1] = 'Choose {C:attention}1{} of {C:attention}8{} Puyotro Cards'
                },
                group_name = "puyotro_boosters"
            },
            config = { extra = 8, choose = 1 },
            cost = 9,
            weight = 0.4,
            atlas = "CustomBoosters",
            pos = { x = 2, y = 0 },
            kind = 'Puyo Puyo Pack',
            group_key = "puyotro_boosters",
            discovered = true,
            loc_vars = function(self, info_queue, card)
                local cfg = (card and card.ability) or self.config
                return {
                    vars = { cfg.choose, cfg.extra }
                }
            end,
            create_card = function(self, card, i)
                local weights = {
                    5,
                    1,
                    3,
                    0.95,
                    0.05
                }
                local total_weight = 0
                for _, weight in ipairs(weights) do
                    total_weight = total_weight + weight
                end
                local random_value = pseudorandom('puyotro_jumbo_puyo_puyo_pack_card') * total_weight
                local cumulative_weight = 0
                local selected_index = 1
                for j, weight in ipairs(weights) do
                    cumulative_weight = cumulative_weight + weight
                    if random_value <= cumulative_weight then
                        selected_index = j
                        break
                    end
                end
                if selected_index == 1 then
                    return {
                        set = "puyotro_puyotro_commons",
                        rarity = "Common",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "puyotro_jumbo_puyo_puyo_pack"
                    }
                elseif selected_index == 2 then
                    return {
                        set = "puyotro_puyotro_commons",
                        rarity = "Common",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "puyotro_jumbo_puyo_puyo_pack"
                    }
                elseif selected_index == 3 then
                    return {
                        set = "puyotro_puyotro_uncommons",
                        rarity = "Uncommon",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "puyotro_jumbo_puyo_puyo_pack"
                    }
                elseif selected_index == 4 then
                    return {
                        set = "puyotro_puyotro_rares",
                        rarity = "Rare",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "puyotro_jumbo_puyo_puyo_pack"
                    }
                elseif selected_index == 5 then
                    return {
                        set = "puyotro_puyotro_legendaries",
                        rarity = "Legendary",
                        area = G.pack_cards,
                        skip_materialize = true,
                        soulable = true,
                        key_append = "puyotro_jumbo_puyo_puyo_pack"
                    }
                end
            end,
            ease_background_colour = function(self)
                ease_colour(G.C.DYN_UI.MAIN, HEX("66ff66"))
                ease_background_colour({ new_colour = HEX('66ff66'), special_colour = HEX("00cc00"), contrast = 2 })
            end,
            particles = function(self)
                -- No particles for joker packs
                end,
            }
            
            
            SMODS.Booster {
                key = 'mega_puyo_puyo_pack',
                loc_txt = {
                    name = "Mega Puyo Puyo Pack",
                    text = {
                        [1] = 'Choose {C:attention}2{} of {C:attention}8{} Puyotro Cards'
                    },
                    group_name = "puyotro_boosters"
                },
                config = { extra = 8, choose = 2 },
                cost = 12,
                weight = 0.1,
                atlas = "CustomBoosters",
                pos = { x = 3, y = 0 },
                kind = 'Puyo Puyo Pack',
                group_key = "puyotro_boosters",
                discovered = true,
                loc_vars = function(self, info_queue, card)
                    local cfg = (card and card.ability) or self.config
                    return {
                        vars = { cfg.choose, cfg.extra }
                    }
                end,
                create_card = function(self, card, i)
                    local weights = {
                        5,
                        1,
                        3,
                        0.95,
                        0.05
                    }
                    local total_weight = 0
                    for _, weight in ipairs(weights) do
                        total_weight = total_weight + weight
                    end
                    local random_value = pseudorandom('puyotro_mega_puyo_puyo_pack_card') * total_weight
                    local cumulative_weight = 0
                    local selected_index = 1
                    for j, weight in ipairs(weights) do
                        cumulative_weight = cumulative_weight + weight
                        if random_value <= cumulative_weight then
                            selected_index = j
                            break
                        end
                    end
                    if selected_index == 1 then
                        return {
                            set = "puyotro_puyotro_commons",
                            rarity = "Common",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "puyotro_mega_puyo_puyo_pack"
                        }
                    elseif selected_index == 2 then
                        return {
                            set = "puyotro_puyotro_commons",
                            rarity = "Common",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "puyotro_mega_puyo_puyo_pack"
                        }
                    elseif selected_index == 3 then
                        return {
                            set = "puyotro_puyotro_uncommons",
                            rarity = "Uncommon",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "puyotro_mega_puyo_puyo_pack"
                        }
                    elseif selected_index == 4 then
                        return {
                            set = "puyotro_puyotro_rares",
                            rarity = "Rare",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "puyotro_mega_puyo_puyo_pack"
                        }
                    elseif selected_index == 5 then
                        return {
                            set = "puyotro_puyotro_legendaries",
                            rarity = "Legendary",
                            area = G.pack_cards,
                            skip_materialize = true,
                            soulable = true,
                            key_append = "puyotro_mega_puyo_puyo_pack"
                        }
                    end
                end,
                ease_background_colour = function(self)
                    ease_colour(G.C.DYN_UI.MAIN, HEX("66ff66"))
                    ease_background_colour({ new_colour = HEX('66ff66'), special_colour = HEX("00cc00"), contrast = 2 })
                end,
                particles = function(self)
                    -- No particles for joker packs
                    end,
                }
                