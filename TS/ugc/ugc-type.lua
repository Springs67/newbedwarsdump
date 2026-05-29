local v1 = {}
local v2 = setmetatable({}, {
    ["__index"] = v1
})
v2.SHOULDER_ACCESSORY = "shoulder_accessory"
v1.shoulder_accessory = "SHOULDER_ACCESSORY"
local v3 = {}
local v4 = setmetatable({}, {
    ["__index"] = v3
})
v4.GRIM_REAPER_KIT_SHOULDER_BUDDY = "grim_reaper_kit_shoulder_buddy"
v3.grim_reaper_kit_shoulder_buddy = "GRIM_REAPER_KIT_SHOULDER_BUDDY"
v4.AERY_KIT_SHOULDER_BUDDY = "aery_kit_shoulder_buddy"
v3.aery_kit_shoulder_buddy = "AERY_KIT_SHOULDER_BUDDY"
v4.MILO_KIT_SHOULDER_BUDDY = "milo_kit_shoulder_buddy"
v3.milo_kit_shoulder_buddy = "MILO_KIT_SHOULDER_BUDDY"
v4.NYX_KIT_SHOULDER_BUDDY = "nyx_kit_shoulder_buddy"
v3.nyx_kit_shoulder_buddy = "NYX_KIT_SHOULDER_BUDDY"
v4.RAVEN_KIT_SHOULDER_BUDDY = "raven_kit_shoulder_buddy"
v3.raven_kit_shoulder_buddy = "RAVEN_KIT_SHOULDER_BUDDY"
v4.SKOLL_KIT_SHOULDER_BUDDY = "skoll_kit_shoulder_buddy"
v3.skoll_kit_shoulder_buddy = "SKOLL_KIT_SHOULDER_BUDDY"
v4.VOID_KNIGHT_KIT_SHOULDER_BUDDY = "void_knight_kit_shoulder_buddy"
v3.void_knight_kit_shoulder_buddy = "VOID_KNIGHT_KIT_SHOULDER_BUDDY"
v4.YUZI_KIT_SHOULDER_BUDDY = "yuzi_kit_shoulder_buddy"
v3.yuzi_kit_shoulder_buddy = "YUZI_KIT_SHOULDER_BUDDY"
v4.DODO_BIRD_SHOULDER_BUDDY = "dodo_bird_shoulder_buddy"
v3.dodo_bird_shoulder_buddy = "DODO_BIRD_SHOULDER_BUDDY"
return {
    ["UgcCategory"] = v2,
    ["UgcType"] = v4
}