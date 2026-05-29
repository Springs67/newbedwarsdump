local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.SoundManager
local u6 = v3.WatchCollectionTag
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.Workspace
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "HotAirBalloonController"
    end,
    ["__index"] = u14
})
u20.__index = u20
function u20.new(...) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u20
    --]]
    local v21 = u20
    local v22 = setmetatable({}, v21)
    return v22:constructor(...) or v22
end
function u20.constructor(p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p23)
    p23.Name = "HotAirBalloonController"
    p23.activeHotAirBalloonPilots = {}
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u19
        [3] = u16
        [4] = u10
        [5] = u8
        [6] = u5
        [7] = u17
        [8] = u18
        [9] = u2
        [10] = u15
        [11] = u12
        [12] = u4
        [13] = u11
        [14] = u13
    --]]
    u14.KnitStart(u24)
    u24:watchHotAirBalloonVehicle(u19.HOT_AIR_BALLOON)
    u16.Client:Get("HotAirBalloonPlayerMount"):Connect(function(u25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u8
            [3] = u5
            [4] = u17
            [5] = u24
            [6] = u18
            [7] = u2
            [8] = u15
            [9] = u12
            [10] = u4
            [11] = u11
            [12] = u13
        --]]
        local v26 = u25.player
        local v27 = u10.LocalPlayer.UserId
        local v28 = u8.new()
        if v26.UserId ~= v27 then
            return nil
        end
        u5:playSound(u17.HOT_AIR_BALLOON_MOUNT, {
            ["volumeMultiplier"] = 0.7
        })
        if u24.activeHotAirBalloonPilots[u25.player.UserId] ~= nil then
            local v29 = u24.activeHotAirBalloonPilots[u25.player.UserId]
            if v29 ~= nil then
                v29:DoCleaning()
            end
            u24.activeHotAirBalloonPilots[u25.player.UserId] = nil
        end
        if not u18.isLobbyServer() then
            v28:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u15.HOT_AIR_BALLOON_TNT, {
                ["abilityType"] = "ItemPrimary",
                ["clickToTrigger"] = false,
                ["abilityButton"] = {
                    ["icon"] = "rbxassetid://17332947490"
                }
            }):expect())
        end
        local u30 = nil
        v28:GiveTask(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            local v31 = u30
            if v31 ~= nil then
                v31:Destroy()
            end
        end)
        v28:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 82 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u30
                [3] = u4
                [4] = u11
                [5] = u13
            --]]
            local v32 = u25.vehicle:FindFirstChild("Root")
            if v32 ~= nil then
                v32 = v32:FindFirstChild("Cannon")
            end
            if v32 == nil then
                local v33 = u30
                if v33 ~= nil then
                    v33:Destroy()
                end
                return nil
            end
            local v34 = RaycastParams.new()
            v34.FilterType = Enum.RaycastFilterType.Exclude
            v34.FilterDescendantsInstances = { u25.vehicle }
            local v35 = u4:raycast(v32.Position, Vector3.new(0, -1000, 0), v34)
            local v36
            if v35 == nil then
                v36 = v35
            else
                v36 = v35.Instance
            end
            if not v36 then
                local v37 = u30
                if v37 ~= nil then
                    v37:Destroy()
                end
                return nil
            end
            local v38 = v35.Position.Y - v32.Position.Y
            if math.abs(v38) < 10 then
                local v39 = u30
                if v39 ~= nil then
                    v39:Destroy()
                end
                return nil
            end
            if not u30 then
                u30 = u11.Assets.Effects.TNTTarget:Clone()
                u30.Parent = u13
                u30.Transparency = 0.5
                u30:WaitForChild("Decal").Transparency = 0.3
            end
            u30.Position = v35.Position
        end))
        u24.activeHotAirBalloonPilots[v26.UserId] = v28
    end)
    u16.Client:Get("HotAirBalloonPlayerDismount"):Connect(function(p40) --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if u24.activeHotAirBalloonPilots[p40.player.UserId] ~= nil then
            local v41 = u24.activeHotAirBalloonPilots[p40.player.UserId]
            if v41 ~= nil then
                v41:DoCleaning()
            end
            u24.activeHotAirBalloonPilots[p40.player.UserId] = nil
        end
    end)
end
function u20.watchHotAirBalloonVehicle(_, p42) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    u6(p42, function(p43) --[[ Line: 146 ]]
        if not p43.PrimaryPart then
            p43:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
    end)
end
v7.CreateController(u20.new())
return nil