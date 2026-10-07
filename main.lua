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
    key = "Jokers", 
    path = "Jokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "Vouchers", 
    path = "Vouchers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "Decks", 
    path = "Decks.png", 
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
    assert(SMODS.load_file("jokers/1bookmove.lua"))()
    assert(SMODS.load_file("jokers/1disintegratedjoker.lua"))()
    assert(SMODS.load_file("jokers/1patternrecognition.lua"))()
    assert(SMODS.load_file("jokers/1poweredup.lua"))()
    assert(SMODS.load_file("jokers/1smotheredmate.lua"))()
    assert(SMODS.load_file("jokers/1supplycache.lua"))()
    assert(SMODS.load_file("jokers/2allrounder.lua"))()
    assert(SMODS.load_file("jokers/2boosterclearance.lua"))()
    assert(SMODS.load_file("jokers/2clubcard.lua"))()
    assert(SMODS.load_file("jokers/2companycard.lua"))()
    assert(SMODS.load_file("jokers/2earlyclosing.lua"))()
    assert(SMODS.load_file("jokers/2roadrepairs.lua"))()
    assert(SMODS.load_file("jokers/2screamingjimbo.lua"))()
    assert(SMODS.load_file("jokers/2seedpacket.lua"))()
    assert(SMODS.load_file("jokers/2triplet.lua"))()
    assert(SMODS.load_file("jokers/2twinmoons.lua"))()
    assert(SMODS.load_file("jokers/3bluescreen.lua"))()
    assert(SMODS.load_file("jokers/3cargodrop.lua"))()
    assert(SMODS.load_file("jokers/3horse.lua"))()
    assert(SMODS.load_file("jokers/3lotterycard.lua"))()
    assert(SMODS.load_file("jokers/3membership.lua"))()
    assert(SMODS.load_file("jokers/3onemorecard.lua"))()
    assert(SMODS.load_file("jokers/3phoenixpackage.lua"))()
    assert(SMODS.load_file("jokers/3social.lua"))()
    assert(SMODS.load_file("jokers/3studentcard.lua"))()
    assert(SMODS.load_file("jokers/3survey.lua"))()
    assert(SMODS.load_file("jokers/3teslacoil.lua"))()
    assert(SMODS.load_file("jokers/3charlieinferno.lua"))()
    assert(SMODS.load_file("jokers/3virtuoso.lua"))()
    assert(SMODS.load_file("jokers/3voucherclearance.lua"))()
    assert(SMODS.load_file("jokers/3youareanidiot.lua"))()
    assert(SMODS.load_file("jokers/2premiumcard.lua"))()
    assert(SMODS.load_file("jokers/2vanadinite.lua"))()
    assert(SMODS.load_file("jokers/3bismuth.lua"))()
    assert(SMODS.load_file("jokers/3quartz.lua"))()
    assert(SMODS.load_file("jokers/3civilighteterna.lua"))()
end
-- load the vouchers
if true then
    assert(SMODS.load_file("vouchers/quality_goods.lua"))()
    assert(SMODS.load_file("vouchers/priority_items.lua"))()
    assert(SMODS.load_file("vouchers/bigger_boosters.lua"))()
    assert(SMODS.load_file("vouchers/overboost.lua"))()
    assert(SMODS.load_file("vouchers/shelf_extension.lua"))()
    assert(SMODS.load_file("vouchers/store_renovation.lua"))()
    assert(SMODS.load_file("vouchers/powered_cards.lua"))()
    assert(SMODS.load_file("vouchers/charged_cards.lua"))()
end

-- load the decks
if true then
    assert(SMODS.load_file("decks/brown_deck.lua"))()
    assert(SMODS.load_file("decks/mashup_deck.lua"))()
    assert(SMODS.load_file("decks/picnic_deck.lua"))()
end

SMODS.ObjectType({
    key = "swp_food",
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
    key = "swp_swp_jokers",
    cards = {
        ["j_swp_1bookmove"] = true,
        ["j_swp_1disintegratedjoker"] = true,
        ["j_swp_1patternrecognition"] = true,
        ["j_swp_1poweredup"] = true,
        ["j_swp_1smotheredmate"] = true,
        ["j_swp_1supplycache"] = true,
        ["j_swp_2allrounder"] = true,
        ["j_swp_2boosterclearance"] = true,
        ["j_swp_2clubcard"] = true,
        ["j_swp_2companycard"] = true,
        ["j_swp_2earlyclosing"] = true,
        ["j_swp_2roadrepairs"] = true,
        ["j_swp_2screamingjimbo"] = true,
        ["j_swp_2seedpacket"] = true,
        ["j_swp_2triplet"] = true,
        ["j_swp_2twinmoons"] = true,
        ["j_swp_3bluescreen"] = true,
        ["j_swp_3cargodrop"] = true,
        ["j_swp_3horse"] = true,
        ["j_swp_3lotterycard"] = true,
        ["j_swp_3membership"] = true,
        ["j_swp_3onemorecard"] = true,
        ["j_swp_3phoenixpackage"] = true,
        ["j_swp_3social"] = true,
        ["j_swp_3studentcard"] = true,
        ["j_swp_3survey"] = true,
        ["j_swp_3teslacoil"] = true,
        ["j_swp_3charlieinferno"] = true,
        ["j_swp_3virtuoso"] = true,
        ["j_swp_3voucherclearance"] = true,
        ["j_swp_3youareanidiot"] = true,
        ["j_swp_2premiumcard"] = true,
        ["j_swp_2vanadinite"] = true,
        ["j_swp_3bismuth"] = true,
        ["j_swp_3quartz"] = true,
        ["j_swp_3civilighteterna"] = true
    },
})


SMODS.current_mod.optional_features = function()
    return {
        cardareas = {},
        post_trigger = true 
    }
end

swp_uti = {}

SMODS.current_mod.menu_cards = function()
	return {
		{key = 'j_swp_2clubcard'},
	}
end

SMODS.ObjectType({
    key = "swp_suittarot",
    cards = {
        ['c_moon'] = true,
        ['c_sun'] = true,
        ['c_star'] = true,
        ['c_world'] = true
    },
})


SMODS.Atlas({
    key = "partners", 
    path = "partners.png", 
    px = 46,
    py = 58,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "cardsleeves", 
    path = "CardSleeves.png", 
    px = 73,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.load_file("utils/misc.lua")()
SMODS.load_file("utils/definitions.lua")()
SMODS.load_file("utils/crossmod.lua")()
