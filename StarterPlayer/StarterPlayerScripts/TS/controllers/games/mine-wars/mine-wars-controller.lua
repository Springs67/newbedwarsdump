local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ComponentUtil
local u4 = v2.WatchPlayerCharacter
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u9 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "components", "billboard").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 18 ]]
        return "MineWarsController"
    end,
    ["__index"] = u9
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
        [1] = u9
        [2] = u11
    --]]
    u9.constructor(p16, { u11.MINE_WARS })
    p16.Name = "MineWarsController"
end
function u13.KnitStart(p17) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    u9.KnitStart(p17)
end
function u13.onGameInit(p18) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u8
        [3] = u12
        [4] = u5
        [5] = u7
        [6] = u3
        [7] = u10
        [8] = u4
        [9] = u6
    --]]
    u9.onGameInit(p18)
    u8.MatchStateChange:connect(function(p19) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u5
            [3] = u7
            [4] = u3
            [5] = u10
        --]]
        if p19.matchState ~= u12.PRE then
            return nil
        end
        for _, v20 in u5.Controllers.TeamController:getTeams() do
            if v20.members[u7.LocalPlayer.UserId] == nil then
                for _, v21 in { "item_shop", "upgrade_shop" } do
                    local v22 = u5.Controllers.ShopkeeperController:getShopkeeperModel(v21, v20.id)
                    if v22 then
                        local v23 = u3:extractComponent(v22, u10, true)
                        if v23 then
                            local v24 = v23.instance:WaitForChild("roact_billboard")
                            if v24 then
                                v24.AlwaysOnTop = false
                            end
                        end
                    end
                end
            end
        end
    end)
    u8.MatchStateChange:connect(function(p25) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u7
        --]]
        if p25.matchState ~= u12.RUNNING then
            return nil
        end
        local v26 = u7.LocalPlayer
        local v27 = v26.Character
        if not v27 then
            return nil
        end
        local v28 = v27:FindFirstChildOfClass("Humanoid")
        if not v28 then
            return nil
        end
        v26.CameraMaxZoomDistance = 14
        v26.CameraMinZoomDistance = 0.5
        if v28 then
            v28.CameraOffset = Vector3.new(0, 0, 0)
        end
        v26.CameraMaxZoomDistance = 0.5
        v26.CameraMaxZoomDistance = 14
    end)
    u4(u7.LocalPlayer, function(u29, u30) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u6
        --]]
        task.spawn(function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u29
                [3] = u30
            --]]
            u30:GiveTask((u6("PointLight", {
                ["Range"] = 12,
                ["Brightness"] = 1.25,
                ["Color"] = Color3.fromRGB(255, 222, 150),
                ["Parent"] = u29:WaitForChild("HumanoidRootPart")
            })))
        end)
    end)
end
u5.CreateController(u13.new())
return nil