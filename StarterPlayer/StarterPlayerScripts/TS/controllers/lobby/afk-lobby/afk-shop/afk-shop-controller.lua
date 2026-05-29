local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ComponentUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v6.Signal
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.RunService
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "npc-spawn-component").NpcSpawnComponent
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-lobby", "afk-shop-utils").AfkShopUtils
local u21 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 26 ]]
        return "AfkShopController"
    end,
    ["__index"] = u14
})
u21.__index = u21
function u21.new(...) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    local v22 = u21
    local v23 = setmetatable({}, v22)
    return v23:constructor(...) or v23
end
function u21.constructor(p24) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u18
        [3] = u9
    --]]
    u14.constructor(p24)
    p24.Name = "AfkShopController"
    p24.eventRemotes = u18.Client:GetNamespace("AfkPlace")
    p24.afkDataSignal = u9.new()
end
function u21.KnitStart(u25) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
        [3] = u13
        [4] = u4
        [5] = u17
        [6] = u20
        [7] = u15
    --]]
    u14.KnitStart(u25)
    for v26, u27 in u11:GetTagged("AfkNPC") do
        local _ = v26 - 1
        task.delay(u13:IsStudio() and 3 or 0, function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u27
                [3] = u17
                [4] = u20
            --]]
            local v28 = u4:getComponent(u27, u17)
            if v28 ~= nil then
                v28:setNametag(u20.name)
            end
        end)
        u25:mountAfkApp(u27)
    end
    u25.eventRemotes:Get("AfkDataUpdate"):Connect(function(p29) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u15
        --]]
        u25.afkData = p29
        u15:dispatch({
            ["type"] = "SetAfkDataAll",
            ["afkData"] = p29
        })
        u25.afkDataSignal:Fire(p29)
    end)
end
function u21.mountAfkApp(_, p30) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u20
        [3] = u12
        [4] = u5
        [5] = u19
        [6] = u2
        [7] = u16
    --]]
    u8.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 12,
        ["HoldDuration"] = 0,
        ["ObjectText"] = "Open Shop",
        ["ActionText"] = u20.name,
        ["Parent"] = p30
    }).Triggered:Connect(function(p31) --[[ Line: 76 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u19
            [4] = u2
            [5] = u16
        --]]
        if p31 == u12.LocalPlayer then
            u5:playSound(u19.UI_OPEN)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u16.AFK_APP, {})
        end
    end)
end
function u21.purchaseItem(p32, p33) --[[ Line: 83 ]]
    return p32.eventRemotes:Get("PurchaseShopItem"):CallServer(p33)
end
v7.CreateController(u21.new())
return nil