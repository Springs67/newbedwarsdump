local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.WatchCollectionTag
local u4 = v2.WatchPlayerCharacter
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.Workspace
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "SceneManagerController"
    end,
    ["__index"] = u11
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
        [1] = u11
    --]]
    u11.constructor(p16)
    p16.Name = "SceneManagerController"
end
function u13.KnitStart(u17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u12
        [3] = u6
        [4] = u4
        [5] = u8
        [6] = u3
        [7] = u9
        [8] = u10
        [9] = u5
    --]]
    u11.KnitStart(u17)
    u12.Client:WaitFor("SceneStarted"):expect():Connect(function(p18) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u6
            [3] = u4
            [4] = u8
            [5] = u3
            [6] = u9
            [7] = u10
            [8] = u5
        --]]
        if u17.activeSceneKey == p18.sceneKey then
            return nil
        end
        local u19 = false
        local u20 = u6.new()
        u20:GiveTask(u4(u8.LocalPlayer, function(u21) --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
            --]]
            if not u21.PrimaryPart then
                u21:GetPropertyChangedSignal("PrimaryPart"):Wait()
            end
            if u19 then
                return nil
            end
            u21.PrimaryPart.Anchored = true
            u20:GiveTask(function() --[[ Line: 54 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                if u21.PrimaryPart then
                    u21.PrimaryPart.Anchored = false
                end
            end)
        end))
        local v22 = p18.sceneKey
        local v23 = u8.LocalPlayer.UserId
        u20:GiveTask((u3("S-" .. v22 .. tostring(v23), function(p24) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u8
            --]]
            u19 = true
            u20:DoCleaning()
            u20:GiveTask(p24)
            p24.CanCollide = true
            local v25 = u8.LocalPlayer.Character
            if v25 ~= nil then
                local v26 = v25.PrimaryPart
                if v26 ~= nil then
                    v26:PivotTo(p24.CFrame + Vector3.new(0, 4, 0))
                end
            end
        end)))
        u17.activeSceneKey = p18.sceneKey
        u17.loadedAssets = u9:WaitForChild(u17.activeSceneKey)
        u10.SceneStarted:fire(p18.sceneKey, u17.loadedAssets)
        task.delay(1.5, function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u5
            --]]
            u5.Controllers.SceneLoadingScreenController:removeLoadingScreen()
        end)
    end)
    u12.Client:Get("PromptSceneStarted"):SendToServer()
end
u5.CreateController(u13.new())
return nil