SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomEnhancements", 
    path = "CustomEnhancements.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {4,44,46,6,45,11,52,18,38,57,10,35,30,9,7,41,42,24,48,3,36,49,23,53,21,27,32,16,22,29,31,58,40,17,55,60,50,33,8,12,5,43,47,34,56,19,54,28,59,14,20,13,1,15,26,39,2,37,51,25}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {2,4,3,1}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end


local enhancementIndexList = {2,1}

local function load_enhancements_folder()
    local mod_path = SMODS.current_mod.path
    local enhancements_path = mod_path .. "/enhancements"
    local files = NFS.getDirectoryItemsInfo(enhancements_path)
    for i = 1, #enhancementIndexList do
        local file_name = files[enhancementIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("enhancements/" .. file_name))()
        end
    end
end


local sealIndexList = {1}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end


local deckIndexList = {2,3,5,1,4}

local function load_decks_folder()
    local mod_path = SMODS.current_mod.path
    local decks_path = mod_path .. "/decks"
    local files = NFS.getDirectoryItemsInfo(decks_path)
    for i = 1, #deckIndexList do
        local file_name = files[deckIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("decks/" .. file_name))()
        end
    end
end

assert(SMODS.load_file("sounds.lua"))()
load_jokers_folder()
load_consumables_folder()
load_enhancements_folder()
load_seals_folder()
load_decks_folder()
SMODS.ObjectType({
    key = "puyotro_food",
    cards = {
        ["j_gros_michel"] = true,
        ["j_egg"] = true,
        ["j_ice_cream"] = true,
        ["j_cavendish"] = true,
        ["j_turtle_bean"] = true,
        ["j_diet_cola"] = true,
        ["j_popcorn"] = true,
        ["j_ramen"] = true,
        ["j_selzer"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_jokers",
    cards = {
        ["j_puyotro_ai"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_ex"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_marle"] = true,
        ["j_puyotro_maskedsatan"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_redamitie"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_squares"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_zero"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_quest_deck_jokers",
    cards = {
        ["j_puyotro_ai"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_ex"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_zero"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_mycustom_jokers",
    cards = {
        ["j_puyotro_ally"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_cm37jokers_jokers",
    cards = {
        ["j_puyotro_rafisol"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end