local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-type")
local v4 = v3.UgcCategory
local v5 = v3.UgcType
local v6 = {}
local v7 = v5.GRIM_REAPER_KIT_SHOULDER_BUDDY
local v8 = {
    ["name"] = "Grim Reaper Kit Shoulder Buddy",
    ["assetId"] = 17735885308,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v7] = v8
local v9 = v5.AERY_KIT_SHOULDER_BUDDY
local v10 = {
    ["name"] = "Aery Kit Shoulder Buddy",
    ["assetId"] = 139207473906297,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.AERY_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_AERY_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v9] = v10
local v11 = v5.MILO_KIT_SHOULDER_BUDDY
local v12 = {
    ["name"] = "Milo Kit Shoulder Buddy",
    ["assetId"] = 85878373312999,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.MILO_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_MILO_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v11] = v12
local v13 = v5.NYX_KIT_SHOULDER_BUDDY
local v14 = {
    ["name"] = "Nyx Kit Shoulder Buddy",
    ["assetId"] = 137030930196196,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.NYX_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_NYX_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v13] = v14
local v15 = v5.RAVEN_KIT_SHOULDER_BUDDY
local v16 = {
    ["name"] = "Raven Kit Shoulder Buddy",
    ["assetId"] = 87517201817150,
    ["basePrice"] = 100,
    ["robuxStoreDisablePurchase"] = true,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.RAVEN_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_RAVEN_KIT_SHOULDER_BUDDY_UGC_STROKE
    },
    ["limited"] = {
        ["quantity"] = 1000
    }
}
v6[v15] = v16
local v17 = v5.SKOLL_KIT_SHOULDER_BUDDY
local v18 = {
    ["name"] = "Skoll Kit Shoulder Buddy",
    ["assetId"] = 103770103510987,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.SKOLL_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_SKOLL_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v17] = v18
local v19 = v5.VOID_KNIGHT_KIT_SHOULDER_BUDDY
local v20 = {
    ["name"] = "Void Knight Kit Shoulder Buddy",
    ["assetId"] = 128906372679170,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.VOID_KNIGHT_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_VOID_KNIGHT_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v19] = v20
local v21 = v5.YUZI_KIT_SHOULDER_BUDDY
local v22 = {
    ["name"] = "Yuzi Kit Shoulder Buddy",
    ["assetId"] = 91502113426689,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.YUZI_KIT_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_YUZI_KIT_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v21] = v22
local v23 = v5.DODO_BIRD_SHOULDER_BUDDY
local v24 = {
    ["name"] = "Dodo Bird Shoulder Buddy",
    ["assetId"] = 111333616336442,
    ["basePrice"] = 65,
    ["category"] = v4.SHOULDER_ACCESSORY,
    ["image"] = {
        ["render"] = v2.DODO_BIRD_SHOULDER_BUDDY_UGC_RENDER,
        ["stroke"] = v2.SOLID_DODO_BIRD_SHOULDER_BUDDY_UGC_STROKE
    }
}
v6[v23] = v24
return {
    ["UgcMeta"] = v6
}