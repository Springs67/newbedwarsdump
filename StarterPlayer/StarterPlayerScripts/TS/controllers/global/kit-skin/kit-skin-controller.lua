local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.MarketplaceService
local u7 = v5.Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPlayerKitSkin
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "KitSkinController"
    end,
    ["__index"] = u8
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.constructor(p18)
    p18.Name = "KitSkinController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    u8.KnitStart(p19)
end
function u15.equipKitSkin(_, p20, p21) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u3
        [4] = u13
    --]]
    u12.Client:Get("BedwarsEquipKitSkin"):CallServerAsync({
        ["kit"] = p20,
        ["kitSkin"] = p21
    }):andThen(function() --[[ Line: 42 ]] end):catch(function(p22) --[[ Line: 43 ]]
        warn(p22)
    end)
    u9:dispatch({
        ["type"] = "EquipKitSkin",
        ["kit"] = p20,
        ["kitSkin"] = p21
    })
    u3:playSound(u13.ARMOR_UNEQUIP)
end
function u15.purchaseKitSkin(_, p23, p24) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
        [3] = u11
        [4] = u10
        [5] = u6
        [6] = u7
    --]]
    local v25 = u9:getState().Bedwars.ownedKits
    local v26 = table.find(v25, p24) ~= nil
    if not v26 and p24 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You can only purchase this kit skin if you own the " .. u11(p24).name .. " kit."
        })
        return nil
    end
    if not v26 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You can only purchase this kit skin if you own the kit."
        })
        return nil
    end
    local v27 = u10[p23]
    local v28 = v27.product
    if v28 ~= nil then
        v28 = v28.devProductId
    end
    if v28 ~= nil then
        local v29 = u6
        local v30 = u7.LocalPlayer
        local v31 = v27.product
        if v31 ~= nil then
            v31 = v31.devProductId
        end
        v29:PromptProductPurchase(v30, v31)
    end
end
function u15.getKitSkin(_, p32) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    return u14(p32)
end
function u15.getPlayerKitSkinMeta(p33, p34) --[[ Line: 86 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10[p33:getKitSkin(p34)]
end
function u15.getCharacterKitSkinMeta(p35, p36) --[[ Line: 90 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    return u10[p35:getKitSkin(p36)]
end
function u15.isUsingKitSkinModel(_, p37) --[[ Line: 94 ]]
    return p37:GetAttribute("UsingKitSkinModel") == true
end
function u15.ownsKitSkin(_, p38) --[[ Line: 97 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v39 = u9:getState().Bedwars.ownedKitSkins
    return table.find(v39, p38) ~= nil
end
v4.CreateController(u15.new())
return nil