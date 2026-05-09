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
-- this function is used to load everything within a folder.-- Jokerforge doesnt use it because it doesnt make loading order easy
local function load_folder(path)
    local files = NFS.getDirectoryItemsInfo(mod_path .. "/" .. path)
    for i = 1, #files do
        local file_name = files[i].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file(path .. file_name))()
        end
    end
end
-- load the jokers
if true then
    assert(SMODS.load_file("jokers/arlenadja.lua"))()
    assert(SMODS.load_file("jokers/rulue.lua"))()
    assert(SMODS.load_file("jokers/schezowegey.lua"))()
    assert(SMODS.load_file("jokers/carbuncle.lua"))()
    assert(SMODS.load_file("jokers/satan.lua"))()
    assert(SMODS.load_file("jokers/dracocentauros.lua"))()
    assert(SMODS.load_file("jokers/suketoudara.lua"))()
    assert(SMODS.load_file("jokers/harpy.lua"))()
    assert(SMODS.load_file("jokers/ragnusthebrave.lua"))()
    assert(SMODS.load_file("jokers/witch.lua"))()
    assert(SMODS.load_file("jokers/doppelgangerarle.lua"))()
    assert(SMODS.load_file("jokers/puyos.lua"))()
    assert(SMODS.load_file("jokers/nuisancepuyos.lua"))()
    assert(SMODS.load_file("jokers/incubus.lua"))()
    assert(SMODS.load_file("jokers/succubus.lua"))()
    assert(SMODS.load_file("jokers/minotauros.lua"))()
    assert(SMODS.load_file("jokers/willowisp.lua"))()
    assert(SMODS.load_file("jokers/mummy.lua"))()
    assert(SMODS.load_file("jokers/parara.lua"))()
    assert(SMODS.load_file("jokers/bansheetrio.lua"))()
    assert(SMODS.load_file("jokers/panotty.lua"))()
    assert(SMODS.load_file("jokers/onionpixie.lua"))()
    assert(SMODS.load_file("jokers/dongurigaeru.lua"))()
    assert(SMODS.load_file("jokers/dapperbones.lua"))()
    assert(SMODS.load_file("jokers/baldanders.lua"))()
    assert(SMODS.load_file("jokers/akuma.lua"))()
    assert(SMODS.load_file("jokers/ringoando.lua"))()
    assert(SMODS.load_file("jokers/risukuma.lua"))()
    assert(SMODS.load_file("jokers/magurosasaki.lua"))()
    assert(SMODS.load_file("jokers/darkarle.lua"))()
    assert(SMODS.load_file("jokers/serilly.lua"))()
    assert(SMODS.load_file("jokers/zohdaimaoh.lua"))()
    assert(SMODS.load_file("jokers/kikimora.lua"))()
    assert(SMODS.load_file("jokers/owlbear.lua"))()
    assert(SMODS.load_file("jokers/fufufu.lua"))()
    assert(SMODS.load_file("jokers/samuraimole.lua"))()
    assert(SMODS.load_file("jokers/honeybee.lua"))()
    assert(SMODS.load_file("jokers/jaan.lua"))()
    assert(SMODS.load_file("jokers/lycanthrope.lua"))()
    assert(SMODS.load_file("jokers/nohoho.lua"))()
    assert(SMODS.load_file("jokers/amitie.lua"))()
    assert(SMODS.load_file("jokers/raffina.lua"))()
    assert(SMODS.load_file("jokers/sig.lua"))()
    assert(SMODS.load_file("jokers/lidelle.lua"))()
    assert(SMODS.load_file("jokers/tartar.lua"))()
    assert(SMODS.load_file("jokers/klug.lua"))()
    assert(SMODS.load_file("jokers/msaccord.lua"))()
    assert(SMODS.load_file("jokers/popoi.lua"))()
    assert(SMODS.load_file("jokers/feli.lua"))()
    assert(SMODS.load_file("jokers/lemres.lua"))()
    assert(SMODS.load_file("jokers/oceanprince.lua"))()
    assert(SMODS.load_file("jokers/otomo.lua"))()
    assert(SMODS.load_file("jokers/yu.lua"))()
    assert(SMODS.load_file("jokers/rei.lua"))()
    assert(SMODS.load_file("jokers/oniko.lua"))()
    assert(SMODS.load_file("jokers/hoho.lua"))()
    assert(SMODS.load_file("jokers/frankensteins.lua"))()
    assert(SMODS.load_file("jokers/hachi.lua"))()
    assert(SMODS.load_file("jokers/ten.lua"))()
    assert(SMODS.load_file("jokers/zero.lua"))()
    assert(SMODS.load_file("jokers/skeletont.lua"))()
    assert(SMODS.load_file("jokers/archan.lua"))()
    assert(SMODS.load_file("jokers/sasoriman.lua"))()
    assert(SMODS.load_file("jokers/chico.lua"))()
    assert(SMODS.load_file("jokers/scylla.lua"))()
    assert(SMODS.load_file("jokers/yellowsatan.lua"))()
    assert(SMODS.load_file("jokers/darkwitch.lua"))()
    assert(SMODS.load_file("jokers/mandrake.lua"))()
    assert(SMODS.load_file("jokers/possessedklug.lua"))()
    assert(SMODS.load_file("jokers/darksig.lua"))()
    assert(SMODS.load_file("jokers/gogotte.lua"))()
    assert(SMODS.load_file("jokers/princesalde.lua"))()
    assert(SMODS.load_file("jokers/ecolo.lua"))()
    assert(SMODS.load_file("jokers/atari.lua"))()
    assert(SMODS.load_file("jokers/roquier.lua"))()
    assert(SMODS.load_file("jokers/seo.lua"))()
    assert(SMODS.load_file("jokers/puubot.lua"))()
    assert(SMODS.load_file("jokers/towa.lua"))()
    assert(SMODS.load_file("jokers/issen.lua"))()
    assert(SMODS.load_file("jokers/paprisu.lua"))()
    assert(SMODS.load_file("jokers/rozatte.lua"))()
    assert(SMODS.load_file("jokers/sultana.lua"))()
    assert(SMODS.load_file("jokers/tee.lua"))()
    assert(SMODS.load_file("jokers/o.lua"))()
    assert(SMODS.load_file("jokers/zed.lua"))()
    assert(SMODS.load_file("jokers/ess.lua"))()
    assert(SMODS.load_file("jokers/jay.lua"))()
    assert(SMODS.load_file("jokers/elle.lua"))()
    assert(SMODS.load_file("jokers/ai.lua"))()
    assert(SMODS.load_file("jokers/ex.lua"))()
    assert(SMODS.load_file("jokers/maskedsatan.lua"))()
    assert(SMODS.load_file("jokers/negakikimora.lua"))()
    assert(SMODS.load_file("jokers/darkschezo.lua"))()
    assert(SMODS.load_file("jokers/redamitie.lua"))()
    assert(SMODS.load_file("jokers/angelicfeli.lua"))()
    assert(SMODS.load_file("jokers/alterecolo.lua"))()
    assert(SMODS.load_file("jokers/ally.lua"))()
    assert(SMODS.load_file("jokers/rafisol.lua"))()
    assert(SMODS.load_file("jokers/squares.lua"))()
    assert(SMODS.load_file("jokers/marle.lua"))()
end
-- load the consumables
if true then
    assert(SMODS.load_file("consumables/nasugrave.lua"))()
    assert(SMODS.load_file("consumables/zombie.lua"))()
    assert(SMODS.load_file("consumables/Tome of Sealing.lua"))()
    assert(SMODS.load_file("consumables/cometpuyo.lua"))()
end
-- load the enhancements
if true then
    assert(SMODS.load_file("enhancements/puyocard.lua"))()
    assert(SMODS.load_file("enhancements/nuisancecard.lua"))()
end

-- load the seals
if true then
    assert(SMODS.load_file("seals/feverseal.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/compile_deck.lua"))()
    assert(SMODS.load_file("decks/fever_deck.lua"))()
    assert(SMODS.load_file("decks/suzuran_deck.lua"))()
    assert(SMODS.load_file("decks/chronicle_deck.lua"))()
    assert(SMODS.load_file("decks/quest_deck.lua"))()
end


-- load boosters
assert(SMODS.load_file("boosters.lua"))()
--load sounds
assert(SMODS.load_file("sounds.lua"))()
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
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_nuisancepuyos"] = true,
        ["j_puyotro_incubus"] = true,
        ["j_puyotro_succubus"] = true,
        ["j_puyotro_minotauros"] = true,
        ["j_puyotro_willowisp"] = true,
        ["j_puyotro_mummy"] = true,
        ["j_puyotro_parara"] = true,
        ["j_puyotro_bansheetrio"] = true,
        ["j_puyotro_panotty"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_baldanders"] = true,
        ["j_puyotro_akuma"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_darkarle"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_zohdaimaoh"] = true,
        ["j_puyotro_kikimora"] = true,
        ["j_puyotro_owlbear"] = true,
        ["j_puyotro_fufufu"] = true,
        ["j_puyotro_samuraimole"] = true,
        ["j_puyotro_honeybee"] = true,
        ["j_puyotro_jaan"] = true,
        ["j_puyotro_lycanthrope"] = true,
        ["j_puyotro_nohoho"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_oniko"] = true,
        ["j_puyotro_hoho"] = true,
        ["j_puyotro_frankensteins"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_zero"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_archan"] = true,
        ["j_puyotro_sasoriman"] = true,
        ["j_puyotro_chico"] = true,
        ["j_puyotro_scylla"] = true,
        ["j_puyotro_yellowsatan"] = true,
        ["j_puyotro_darkwitch"] = true,
        ["j_puyotro_mandrake"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_gogotte"] = true,
        ["j_puyotro_princesalde"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_paprisu"] = true,
        ["j_puyotro_rozatte"] = true,
        ["j_puyotro_sultana"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ai"] = true,
        ["j_puyotro_ex"] = true,
        ["j_puyotro_maskedsatan"] = true,
        ["j_puyotro_negakikimora"] = true,
        ["j_puyotro_darkschezo"] = true,
        ["j_puyotro_redamitie"] = true,
        ["j_puyotro_angelicfeli"] = true,
        ["j_puyotro_alterecolo"] = true,
        ["j_puyotro_squares"] = true,
        ["j_puyotro_marle"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_quest_deck_jokers",
    cards = {
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_nuisancepuyos"] = true,
        ["j_puyotro_incubus"] = true,
        ["j_puyotro_succubus"] = true,
        ["j_puyotro_minotauros"] = true,
        ["j_puyotro_willowisp"] = true,
        ["j_puyotro_mummy"] = true,
        ["j_puyotro_parara"] = true,
        ["j_puyotro_bansheetrio"] = true,
        ["j_puyotro_panotty"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_baldanders"] = true,
        ["j_puyotro_akuma"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_darkarle"] = true,
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_zohdaimaoh"] = true,
        ["j_puyotro_kikimora"] = true,
        ["j_puyotro_owlbear"] = true,
        ["j_puyotro_fufufu"] = true,
        ["j_puyotro_samuraimole"] = true,
        ["j_puyotro_honeybee"] = true,
        ["j_puyotro_jaan"] = true,
        ["j_puyotro_lycanthrope"] = true,
        ["j_puyotro_nohoho"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_oniko"] = true,
        ["j_puyotro_hoho"] = true,
        ["j_puyotro_frankensteins"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_zero"] = true,
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_archan"] = true,
        ["j_puyotro_sasoriman"] = true,
        ["j_puyotro_chico"] = true,
        ["j_puyotro_scylla"] = true,
        ["j_puyotro_yellowsatan"] = true,
        ["j_puyotro_darkwitch"] = true,
        ["j_puyotro_mandrake"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_gogotte"] = true,
        ["j_puyotro_princesalde"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_paprisu"] = true,
        ["j_puyotro_rozatte"] = true,
        ["j_puyotro_sultana"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ai"] = true,
        ["j_puyotro_ex"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_commons",
    cards = {
        ["j_puyotro_arlenadja"] = true,
        ["j_puyotro_rulue"] = true,
        ["j_puyotro_schezowegey"] = true,
        ["j_puyotro_carbuncle"] = true,
        ["j_puyotro_satan"] = true,
        ["j_puyotro_dracocentauros"] = true,
        ["j_puyotro_suketoudara"] = true,
        ["j_puyotro_harpy"] = true,
        ["j_puyotro_ragnusthebrave"] = true,
        ["j_puyotro_witch"] = true,
        ["j_puyotro_doppelgangerarle"] = true,
        ["j_puyotro_puyos"] = true,
        ["j_puyotro_nuisancepuyos"] = true,
        ["j_puyotro_incubus"] = true,
        ["j_puyotro_succubus"] = true,
        ["j_puyotro_minotauros"] = true,
        ["j_puyotro_willowisp"] = true,
        ["j_puyotro_mummy"] = true,
        ["j_puyotro_parara"] = true,
        ["j_puyotro_bansheetrio"] = true,
        ["j_puyotro_panotty"] = true,
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_dongurigaeru"] = true,
        ["j_puyotro_dapperbones"] = true,
        ["j_puyotro_baldanders"] = true,
        ["j_puyotro_akuma"] = true,
        ["j_puyotro_ringoando"] = true,
        ["j_puyotro_risukuma"] = true,
        ["j_puyotro_magurosasaki"] = true,
        ["j_puyotro_darkarle"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_Food",
    cards = {
        ["j_puyotro_onionpixie"] = true,
        ["j_puyotro_gogotte"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_uncommons",
    cards = {
        ["j_puyotro_serilly"] = true,
        ["j_puyotro_zohdaimaoh"] = true,
        ["j_puyotro_kikimora"] = true,
        ["j_puyotro_owlbear"] = true,
        ["j_puyotro_fufufu"] = true,
        ["j_puyotro_samuraimole"] = true,
        ["j_puyotro_honeybee"] = true,
        ["j_puyotro_jaan"] = true,
        ["j_puyotro_lycanthrope"] = true,
        ["j_puyotro_nohoho"] = true,
        ["j_puyotro_amitie"] = true,
        ["j_puyotro_raffina"] = true,
        ["j_puyotro_sig"] = true,
        ["j_puyotro_lidelle"] = true,
        ["j_puyotro_tartar"] = true,
        ["j_puyotro_klug"] = true,
        ["j_puyotro_msaccord"] = true,
        ["j_puyotro_popoi"] = true,
        ["j_puyotro_feli"] = true,
        ["j_puyotro_lemres"] = true,
        ["j_puyotro_oceanprince"] = true,
        ["j_puyotro_otomo"] = true,
        ["j_puyotro_yu"] = true,
        ["j_puyotro_rei"] = true,
        ["j_puyotro_oniko"] = true,
        ["j_puyotro_hoho"] = true,
        ["j_puyotro_frankensteins"] = true,
        ["j_puyotro_hachi"] = true,
        ["j_puyotro_ten"] = true,
        ["j_puyotro_zero"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_rares",
    cards = {
        ["j_puyotro_skeletont"] = true,
        ["j_puyotro_archan"] = true,
        ["j_puyotro_sasoriman"] = true,
        ["j_puyotro_chico"] = true,
        ["j_puyotro_scylla"] = true,
        ["j_puyotro_yellowsatan"] = true,
        ["j_puyotro_darkwitch"] = true,
        ["j_puyotro_mandrake"] = true,
        ["j_puyotro_possessedklug"] = true,
        ["j_puyotro_darksig"] = true,
        ["j_puyotro_gogotte"] = true,
        ["j_puyotro_princesalde"] = true,
        ["j_puyotro_ecolo"] = true,
        ["j_puyotro_atari"] = true,
        ["j_puyotro_roquier"] = true,
        ["j_puyotro_seo"] = true,
        ["j_puyotro_puubot"] = true,
        ["j_puyotro_towa"] = true,
        ["j_puyotro_issen"] = true,
        ["j_puyotro_paprisu"] = true,
        ["j_puyotro_rozatte"] = true,
        ["j_puyotro_sultana"] = true,
        ["j_puyotro_tee"] = true,
        ["j_puyotro_o"] = true,
        ["j_puyotro_zed"] = true,
        ["j_puyotro_ess"] = true,
        ["j_puyotro_jay"] = true,
        ["j_puyotro_elle"] = true,
        ["j_puyotro_ai"] = true,
        ["j_puyotro_ex"] = true
    },
})

SMODS.ObjectType({
    key = "puyotro_puyotro_legendaries",
    cards = {
        ["j_puyotro_maskedsatan"] = true,
        ["j_puyotro_negakikimora"] = true,
        ["j_puyotro_darkschezo"] = true,
        ["j_puyotro_redamitie"] = true,
        ["j_puyotro_angelicfeli"] = true,
        ["j_puyotro_alterecolo"] = true,
        ["j_puyotro_ally"] = true,
        ["j_puyotro_rafisol"] = true,
        ["j_puyotro_squares"] = true,
        ["j_puyotro_marle"] = true
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