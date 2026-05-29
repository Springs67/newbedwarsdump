local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").UILayers
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u11 = v1.import(script, script.Parent.Parent, "ui", "halloween-ability-initial-selection-app").HalloweenAbilityInitialSelectionApp
local u12 = v1.import(script, script.Parent.Parent, "ui", "halloween-ability-view-app").HalloweenAbilityViewApp
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "HalloweenAbilityAllKitsTreeController"
    end,
    ["__index"] = u8
})
u13.__index = u13
function u13.new(...) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u5
    --]]
    u8.constructor(p16)
    p16.Name = "HalloweenAbilityAllKitsTreeController"
    p16.speedMaid = u5.new()
end
function u13.KnitStart(u17) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u10
        [3] = u4
        [4] = u2
        [5] = u11
        [6] = u7
        [7] = u9
        [8] = u6
        [9] = u12
        [10] = u3
    --]]
    u8.KnitStart(u17)
    u10.Client:GetNamespace("Halloween2025Remotes"):Get("SpeedRegistered"):Connect(function(u18) --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u4
        --]]
        u17.speedMaid:DoCleaning()
        u17.speedMaid:GiveTask(function() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u18
            --]]
            u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = u18.speedMultiplier
            })
        end)
    end)
    u10.Client:GetNamespace("Halloween2024Remotes"):Get("GiveSkillUpgrade"):Connect(function(_) --[[ Line: 43 ]] end)
    u10.Client:GetNamespace("Halloween2024Remotes"):Get("ShowInitialKitSelection"):Connect(function(_) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u11
        --]]
        local v19 = {
            ["appId"] = "HalloweenAbilityInitialSelectionApp",
            ["app"] = u11
        }
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(v19, {})
    end)
    u7.AbilityUsed:connect(function(p20) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u2
            [4] = u12
            [5] = u3
        --]]
        if p20:isCancelled() then
            return nil
        end
        if p20.ability ~= u9.HALLOWEEN_VIEW_ABILITIES then
            return nil
        end
        if p20.userCharacter ~= u6.LocalPlayer.Character then
            return nil
        end
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
            ["appId"] = "HalloweenAbilityViewApp",
            ["app"] = u12,
            ["layer"] = u3.MAIN
        }, {
            ["AppId"] = "HalloweenAbilityViewApp"
        })
    end)
end
u4.CreateController(u13.new())
return nil