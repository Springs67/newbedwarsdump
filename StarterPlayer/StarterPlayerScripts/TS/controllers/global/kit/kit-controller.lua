local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchPlayer
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u6 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-shop").BedwarsKitShop
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util")
local u14 = v13.doesPlayerHaveExtraKitAttribute
local u15 = v13.getKitArrayFromCommaSeparatedString
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "KitController"
    end,
    ["__index"] = u7
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7.constructor(p19)
    p19.Name = "KitController"
end
function u16.KnitStart(u20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u6
        [4] = u5
        [5] = u8
    --]]
    u7.KnitStart(u20)
    u2(function(u21) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u6
            [3] = u5
            [4] = u8
        --]]
        local u22 = u20:getActiveKits(u21)
        u21:GetAttributeChangedSignal("PlayingAsKits"):Connect(function() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u21
                [3] = u22
                [4] = u6
                [5] = u5
                [6] = u8
            --]]
            local v23 = u20:getActiveKits(u21)
            for _, v24 in u22 do
                if table.find(v23, v24) == nil then
                    u6.KitUnequip:fire(u21, v24)
                end
            end
            for _, v25 in v23 do
                if table.find(u22, v25) == nil then
                    u6.KitEquip:fire(u21, v25)
                end
            end
            u22 = v23
            if u21 == u5.LocalPlayer then
                u8:dispatch({
                    ["type"] = "SetBedwarsKit",
                    ["kit"] = u20:getPrimaryActiveKit(u21)
                })
            end
        end)
        if u22 and #u22 > 0 then
            for _, v26 in u22 do
                u6.KitEquip:fire(u21, v26)
                if u21 == u5.LocalPlayer then
                    u8:dispatch({
                        ["type"] = "SetBedwarsKit",
                        ["kit"] = u20:getPrimaryActiveKit(u21)
                    })
                end
            end
        end
    end)
end
function u16.getActiveKits(_, p27) --[[ Line: 74 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u15
    --]]
    local v28 = p27:GetAttribute("PlayingAsKits")
    if v28 == nil then
        return { u10.NONE }
    end
    local v29 = u15(v28)
    return #v29 == 0 and { u10.NONE } or v29
end
function u16.getPrimaryActiveKit(p30, p31) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    local v32 = p30:getActiveKits(p31)
    if #v32 > 0 then
        return v32[1]
    else
        return u10.NONE
    end
end
function u16.isUsingKit(p33, p34, p35) --[[ Line: 92 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    if p34 == nil then
        return false
    end
    local v36 = p33:getActiveKits(p34)
    return table.find(v36, p35) ~= nil and true or (u14(p34, p35) and true or false)
end
function u16.isUsingKitModel(_, p37) --[[ Line: 106 ]]
    local v38 = p37:GetAttribute("UsingKitSkinModel")
    if v38 == nil then
        v38 = false
    end
    return v38
end
function u16.getKitSkin(_, p39) --[[ Line: 113 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    if not p39:IsA("Player") then
        return p39:GetAttribute("KitSkin") or u9.DEFAULT
    end
    local v40 = p39.Character
    if v40 ~= nil then
        v40 = v40:GetAttribute("KitSkin")
    end
    if v40 == nil then
        v40 = u9.DEFAULT
    end
    return v40
end
function u16.watchLocalKit(p41, u42) --[[ Line: 128 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
    --]]
    local v43 = u4.new()
    v43:GiveTask(u6.KitEquip:connect(function(u44) --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u42
        --]]
        if u44.player ~= u5.LocalPlayer then
            return nil
        end
        task.spawn(function() --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u44
            --]]
            u42(u44.kit)
        end)
    end))
    u42(p41:getPrimaryActiveKit(u5.LocalPlayer))
    return v43
end
function u16.watchKit(p45, u46) --[[ Line: 141 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
    --]]
    local v47 = u4.new()
    v47:GiveTask(u6.KitEquip:connect(function(u48) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        task.spawn(function() --[[ Line: 144 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u48
            --]]
            u46(u48.player, u48.kit)
        end)
    end))
    for _, u49 in u5:GetPlayers() do
        local u50 = p45:getPrimaryActiveKit(u49)
        if u50 then
            task.spawn(function() --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u49
                    [3] = u50
                --]]
                u46(u49, u50)
            end)
        end
    end
    return v47
end
function u16.isKitFree(_, p51) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u8
    --]]
    return u11(p51).freeKit or u12.FreeKitRotation.kitAvailableThisWeek(p51, u8:getState().Bedwars.freeKitLevel)
end
function u16.ownsKit(_, p52) --[[ Line: 161 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v53 = u8:getState().Bedwars.ownedKits
    return table.find(v53, p52) ~= nil
end
v3.CreateController(u16.new())
return nil