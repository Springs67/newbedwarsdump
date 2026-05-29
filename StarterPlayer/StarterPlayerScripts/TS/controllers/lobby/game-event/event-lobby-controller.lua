local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ComponentUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.CollectionService
local u12 = v10.Players
local u13 = v10.RunService
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "npc-spawn-component").NpcSpawnComponent
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "EventLobbyController"
    end,
    ["__index"] = u14
})
u19.__index = u19
function u19.new(...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    local v20 = u19
    local v21 = setmetatable({}, v20)
    return v21:constructor(...) or v21
end
function u19.constructor(p22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p22)
    p22.Name = "EventLobbyController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u17
        [4] = u11
        [5] = u13
        [6] = u4
        [7] = u16
        [8] = u7
    --]]
    u14.KnitStart(p23)
    local v24 = u9.entries(u17)
    local function v42(p25) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u13
            [3] = u4
            [4] = u16
            [5] = u7
        --]]
        local u26 = p25[1]
        local u27 = p25[2]
        if not u27.active then
            return nil
        end
        local v28 = u11:GetTagged(u27.npcCollectionTag)
        local function v31(u29) --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u4
                [3] = u16
                [4] = u27
                [5] = u7
                [6] = u26
            --]]
            task.delay(u13:IsStudio() and 3 or 0, function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u29
                    [3] = u16
                    [4] = u27
                --]]
                local v30 = u4:getComponent(u29, u16)
                if v30 ~= nil then
                    v30:setNametag(u27.name, u27.subtitle)
                end
            end)
            u7.Controllers.EventLobbyController:mountEventApp(u29, u26)
        end
        for v32, v33 in v28 do
            v31(v33, v32 - 1, v28)
        end
        local v34 = u27.shops
        local function v39(p35) --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u7
                [3] = u26
            --]]
            local v36 = p35.collectionTag
            if v36 ~= "" and v36 then
                for v37, v38 in u11:GetTagged(p35.collectionTag) do
                    local _ = v37 - 1
                    u7.Controllers.EventLobbyController:mountEventShop(v38, u26)
                end
            end
        end
        for v40, v41 in v34 do
            v39(v41, v40 - 1, v34)
        end
    end
    for v43, v44 in v24 do
        v42(v44, v43 - 1, v24)
    end
end
function u19.mountEventApp(_, p45, u46) --[[ Line: 85 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u12
        [4] = u5
        [5] = u18
        [6] = u2
        [7] = u15
    --]]
    local v47 = u17[u46]
    u8.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 12,
        ["HoldDuration"] = 0,
        ["ObjectText"] = "Open Event",
        ["ActionText"] = v47.name,
        ["Parent"] = p45
    }).Triggered:Connect(function(p48) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u18
            [4] = u2
            [5] = u15
            [6] = u46
        --]]
        if p48 == u12.LocalPlayer then
            u5:playSound(u18.UI_OPEN)
            local v49 = {
                ["event"] = u46
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u15.EVENT_APP, v49)
        end
    end)
end
function u19.mountEventShop(_, p50, u51) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u8
        [3] = u12
        [4] = u5
        [5] = u18
        [6] = u2
        [7] = u15
    --]]
    local v52 = u17[u51]
    u8.Controllers.ProximityPromptController:createProximityPrompt({
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 11,
        ["HoldDuration"] = 0,
        ["ObjectText"] = "Open Shop",
        ["ActionText"] = v52.name .. "Shop",
        ["Parent"] = p50
    }).Triggered:Connect(function(p53) --[[ Line: 114 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u18
            [4] = u2
            [5] = u15
            [6] = u51
        --]]
        if p53 == u12.LocalPlayer then
            u5:playSound(u18.UI_OPEN)
            local v54 = {
                ["tab"] = "shop",
                ["event"] = u51
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u15.EVENT_APP, v54)
        end
    end)
end
u7.CreateController(u19.new())
return nil