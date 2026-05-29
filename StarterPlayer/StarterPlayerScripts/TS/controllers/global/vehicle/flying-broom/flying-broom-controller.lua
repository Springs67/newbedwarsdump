local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ExpireMap
local u4 = v2.SoundManager
local u5 = v2.WatchCollectionTag
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "flying-broom-balance-file").FlyingBroomBalance
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "FlyingBroomController"
    end,
    ["__index"] = u13
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
        [1] = u13
        [2] = u3
        [3] = u14
    --]]
    u13.constructor(p22)
    p22.Name = "FlyingBroomController"
    p22.activePilots = {}
    p22.witchTrailMap = u3.new(u14.WITCH_TRAIL_DURATION)
end
function u19.KnitStart(u23) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u18
        [3] = u16
        [4] = u10
        [5] = u7
        [6] = u4
        [7] = u17
        [8] = u11
        [9] = u12
        [10] = u15
        [11] = u8
        [12] = u14
    --]]
    u13.KnitStart(u23)
    u23:watchBroomVehicle(u18.FLYING_BROOM)
    u16.Client:Get("FlyingBroomPilotMount"):Connect(function(p24) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u7
            [3] = u4
            [4] = u17
            [5] = u23
        --]]
        local v25 = p24.player
        local v26 = u10.LocalPlayer.UserId
        local v27 = u7.new()
        if v25.UserId ~= v26 then
            return nil
        end
        u4:playSound(u17.WITCH_BROOM_MOUNT, {
            ["volumeMultiplier"] = 0.7
        })
        if u23.activePilots[p24.player.UserId] ~= nil then
            local v28 = u23.activePilots[p24.player.UserId]
            if v28 ~= nil then
                v28:DoCleaning()
            end
            u23.activePilots[p24.player.UserId] = nil
        end
        u23.activePilots[v25.UserId] = v27
    end)
    u16.Client:Get("FlyingBroomPilotDismount"):Connect(function(p29) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u17
            [3] = u23
        --]]
        u4:playSound(u17.WITCH_BROOM_DISMOUNT, {
            ["volumeMultiplier"] = 0.7
        })
        if u23.activePilots[p29.player.UserId] ~= nil then
            local v30 = u23.activePilots[p29.player.UserId]
            if v30 ~= nil then
                v30:DoCleaning()
            end
            u23.activePilots[p29.player.UserId] = nil
        end
    end)
    u16.Client:Get("FlyingBroomTrailPositionPlaced"):Connect(function(p31) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u23
            [3] = u12
            [4] = u4
            [5] = u17
            [6] = u15
            [7] = u10
            [8] = u8
            [9] = u14
        --]]
        local v32 = u11.Assets.Effects.WitchTrail:Clone()
        local u33 = v32.PrimaryPart
        local v34 = p31.trailTeamId
        u23.witchTrailMap:set(p31.trailPosition, {
            ["trailModel"] = v32,
            ["trailTeamId"] = v34
        })
        if u33 ~= nil then
            v32.Parent = u12
            local v35 = p31.trailPosition
            v32.Name = "WitchTrail@" .. tostring(v35)
            v32:PivotTo(CFrame.new(p31.trailPosition))
            u33.Anchored = true
            u33.CanCollide = false
            u33.CanTouch = false
            u33.Position = p31.trailPosition
            u4:playSound(u17.WITCH_BROOM_TRAIL_LOOP, {
                ["rollOffMaxDistance"] = 120,
                ["rollOffMinDistance"] = 50,
                ["looped"] = true,
                ["volumeMultiplier"] = 0.8,
                ["parent"] = u33,
                ["position"] = u33.Position
            })
            if u15.getGamePlayer(u10.LocalPlayer):getTeamId() ~= v34 then
                u8("Highlight", {
                    ["Name"] = "WitchTrailHighlight",
                    ["FillTransparency"] = 0.7,
                    ["OutlineTransparency"] = 0.2,
                    ["FillColor"] = Color3.fromRGB(255, 61, 0),
                    ["OutlineColor"] = Color3.fromRGB(255, 0, 0),
                    ["Parent"] = v32
                }).Enabled = true
            end
            task.delay(u14.WITCH_TRAIL_DURATION, function() --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:Destroy()
            end)
        end
    end)
    u16.Client:Get("FlyingBroomTrailDamageEvent"):Connect(function(p36) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        local v37 = u23.witchTrailMap:get(p36.trailPosition)
        if v37 ~= nil then
            v37 = v37.trailModel
        end
        local v38 = p36.trailPosition
        local v39 = p36.hitPlayer
        if v37 == nil or (v38 == nil or v39 == nil) then
            return nil
        end
        u23:trailDamageEffects(v37, v38, v39)
    end)
end
function u19.watchBroomVehicle(_, p40) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u17
    --]]
    u5(p40, function(p41) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u17
        --]]
        if not p41.PrimaryPart then
            p41:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
        local v42 = u4
        local v43 = u17.WITCH_BROOM_SPAWN
        local v44 = {
            ["volumeMultiplier"] = 1.4
        }
        local v45 = p41.PrimaryPart
        if v45 ~= nil then
            v45 = v45.Position
        end
        v44.position = v45
        v42:playSound(v43, v44)
    end)
end
function u19.trailDamageEffects(_, _, _, p46) --[[ Line: 164 ]]
    local v47 = p46.Character
    if v47 ~= nil then
        v47 = v47.PrimaryPart
        if v47 ~= nil then
            v47 = v47.Position
        end
    end
end
v6.CreateController(u19.new())
return nil