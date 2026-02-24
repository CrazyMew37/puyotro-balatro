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
    key = "CustomBoosters", 
    path = "CustomBoosters.png", 
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

local jokerIndexList = {8,76,80,12,79,21,88,31,69,95,20,66,52,34,87,47,94,49,61,11,59,56,19,14,10,2,72,73,43,15,83,100,38,58,28,77,33,36,42,51,5,67,84,41,90,39,48,62,26,40,54,57,97,71,55,32,27,30,92,99,85,7,78,13,81,96,18,44,63,17,29,64,22,9,74,82,65,93,35,60,75,89,91,53,98,24,37,23,1,25,46,50,16,70,6,4,3,68,86,45}

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


local function load_boosters_file()
    local mod_path = SMODS.current_mod.path
    assert(SMODS.load_file("boosters.lua"))()
end

load_boosters_file()
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
        ["j_puyotro_akuma"] = true,
        ["j_puyotro_alterecolo"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_angelicfeli"] = true,
        ["j_puyotro_archan"] = true,
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_baldanders"] = true,
        ["j_puyotro_bansheetrio"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_chico"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_darkarle"] = true,
        ["j_puyotro_darkschezo"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_darkwitch"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_ex"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_frankensteins"] = true,
        ["j_puyotro_fufufu"] = true,
        ["j_puyotro_gogotte"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_hoho"] = true,
        ["j_puyotro_honeybee"] = true,
        ["j_puyotro_incubus"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_jaan"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_kikimora"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_lycanthrope"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_mandrake"] = true,
        ["j_puyotro_marle"] = true,
        ["j_puyotro_maskedsatan"] = true,
        ["j_puyotro_minotauros"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_mummy"] = true,
        ["j_puyotro_negakikimora"] = true,
        ["j_puyotro_nohoho"] = true,
        ["j_puyotro_nuisancepuyos"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_oniko"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_owlbear"] = true,
        ["j_puyotro_panotty"] = true,
        ["j_puyotro_paprisu"] = true,
        ["j_puyotro_parara"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_princesalde"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_redamitie"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_rozatte"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_samuraimole"] = true,
        ["j_puyotro_sasoriman"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_scylla"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_squares"] = true,
        ["j_puyotro_succubus"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_sultana"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_willowisp"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_yellowsatan"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_zero"] = true,
        ["j_puyotro_zohdaimaoh"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_quest_deck_jokers",
    cards = {
        ["j_puyotro_ai"] = true,
        ["j_puyotro_akuma"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_archan"] = true,
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_baldanders"] = true,
        ["j_puyotro_bansheetrio"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_chico"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_darkarle"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_darkwitch"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_ex"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_frankensteins"] = true,
        ["j_puyotro_fufufu"] = true,
        ["j_puyotro_gogotte"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_hoho"] = true,
        ["j_puyotro_honeybee"] = true,
        ["j_puyotro_incubus"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_jaan"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_kikimora"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_lycanthrope"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_mandrake"] = true,
        ["j_puyotro_minotauros"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_mummy"] = true,
        ["j_puyotro_nohoho"] = true,
        ["j_puyotro_nuisancepuyos"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_oniko"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_owlbear"] = true,
        ["j_puyotro_panotty"] = true,
        ["j_puyotro_paprisu"] = true,
        ["j_puyotro_parara"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_princesalde"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_rozatte"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_samuraimole"] = true,
        ["j_puyotro_sasoriman"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_scylla"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_succubus"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_sultana"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_willowisp"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_yellowsatan"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_zero"] = true,
        ["j_puyotro_zohdaimaoh"] = true
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