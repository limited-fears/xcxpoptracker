-- entry point for all lua code of the pack
-- more info on the lua API: https://github.com/black-sliver/PopTracker/blob/master/doc/PACKS.md#lua-interface
ENABLE_DEBUG_LOG = true
-- get current variant
local variant = Tracker.ActiveVariantUID
-- check variant info
IS_ITEMS_ONLY = variant:find("itemsonly")

print("-- Example Tracker --")
print("Loaded variant: ", variant)
if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

-- Utility Script for helper functions etc.
ScriptHost:LoadScript("scripts/utils.lua")

-- Logic
ScriptHost:LoadScript("scripts/logic/logic.lua")

-- Custom Items
ScriptHost:LoadScript("scripts/custom_items/class.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlus.lua")
ScriptHost:LoadScript("scripts/custom_items/progressiveTogglePlusWrapper.lua")

-- Items
Tracker:AddItems("items/items.jsonc")
Tracker:AddItems("items/affinity.jsonc")
Tracker:AddItems("items/classes.jsonc")
Tracker:AddItems("items/Fldskills.jsonc")
Tracker:AddItems("items/enemies.jsonc")

if not IS_ITEMS_ONLY then -- <--- use variant info to optimize loading
    -- Maps
    Tracker:AddMaps("maps/maps.jsonc")
    -- Locations
    Tracker:AddLocations("locations/locations.jsonc")
    Tracker:AddLocations("locations/barracks/barracks.jsonc")
    Tracker:AddLocations("locations/Manon Ship/manonship.jsonc")
    Tracker:AddLocations("locations/Cauldros/cauldros.jsonc")
    Tracker:AddLocations("locations/NLA/nla.jsonc")
    Tracker:AddLocations("locations/Noctilum/noctilum.jsonc")
    Tracker:AddLocations("locations/Oblivia/oblivia.jsonc")
    Tracker:AddLocations("locations/Primordia/primordia.jsonc")
    Tracker:AddLocations("locations/Sylum/sylum.jsonc")
    Tracker:AddLocations("locations/World Map/worldmap.jsonc")
end

-- Layout
Tracker:AddLayouts("layouts/items.jsonc")
Tracker:AddLayouts("layouts/tracker.jsonc")
Tracker:AddLayouts("layouts/broadcast.jsonc")
Tracker:AddLayouts("layouts/maps.jsonc")
Tracker:AddLayouts("layouts/classes.jsonc")
Tracker:AddLayouts("layouts/fldskills.jsonc")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
