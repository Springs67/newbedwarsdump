local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "sync-event", "out").SyncEventPriority
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.CollectionService
local u8 = v6.Players
local u9 = v6.ReplicatedStorage
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-meta").getVehicleMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-util").VehicleUtil
local u14 = v1.import(script, script.Parent, "helicopter", "helicopter-pilot-client").HelicopterPilotClient
local u15 = v1.import(script, script.Parent, "ufo", "ufo-pilot-client").UfoPilotClient
local u16 = v1.import(script, script.Parent.Parent.Parent, "lobby", "lobby-gadget", "flying-carpet", "flying-carpet-pilot-client").FlyingCarpetPilot
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u18 = v1.import(script, script.Parent, "flying-broom", "flying-broom-pilot-client").FlyingBroomPilot
local u19 = v1.import(script, script.Parent, "flying-cloud", "flying-cloud-pilot-client").FlyingCloudPilot
local u20 = v1.import(script, script.Parent, "hot-air-balloon", "hot-air-balloon-pilot-client").HotAirBalloonPilot
local u21 = v1.import(script, script.Parent, "jellyfish-mount", "jellyfish-mount-pilot-client").JellyfishMountPilot
local u22 = v1.import(script, script.Parent, "sleigh", "sleigh-pilot-client").SleighPilot
local u23 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 28 ]]
        return "VehicleController"
    end,
    ["__index"] = u11
})
u23.__index = u23
function u23.new(...) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    local v24 = u23
    local v25 = setmetatable({}, v24)
    return v25:constructor(...) or v25
end
function u23.constructor(p26) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p26)
    p26.Name = "VehicleController"
end
function u23.KnitStart(p27) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u5
        [4] = u12
        [5] = u8
        [6] = u14
        [7] = u17
        [8] = u15
        [9] = u19
        [10] = u20
        [11] = u18
        [12] = u21
        [13] = u16
        [14] = u22
        [15] = u10
        [16] = u4
        [17] = u13
    --]]
    u11.KnitStart(p27)
    u2("vehicle", function(u28) --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u8
            [4] = u14
            [5] = u17
            [6] = u15
            [7] = u19
            [8] = u20
            [9] = u18
            [10] = u21
            [11] = u16
            [12] = u22
            [13] = u10
            [14] = u4
            [15] = u13
        --]]
        local u29 = u5.new()
        u28.Destroying:Connect(function() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            u29:DoCleaning()
        end)
        local u30 = u12(u28.Name)
        local u31 = u28:WaitForChild("Driver")
        if u30.checkOwner and u28:GetAttribute("PlacedByUserId") ~= u8.LocalPlayer.UserId then
            u31.Disabled = true
        end
        local function u33() --[[ Line: 54 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u14
                [3] = u28
                [4] = u17
                [5] = u15
                [6] = u19
                [7] = u20
                [8] = u18
                [9] = u21
                [10] = u16
                [11] = u22
                [12] = u31
            --]]
            local v32 = nil
            if u30.helicopter then
                v32 = u14.new(u28, u30.helicopter.attack)
            elseif u28.Name == u17.UFO then
                v32 = u15.new(u28)
            elseif u28.Name == u17.FLYING_CLOUD then
                v32 = u19.new(u28)
            elseif u28.Name == u17.HOT_AIR_BALLOON then
                v32 = u20.new(u28)
            elseif u28.Name == u17.FLYING_BROOM then
                v32 = u18.new(u28)
            elseif u28.Name == u17.JELLYFISH_MOUNT then
                v32 = u21.new(u28)
            elseif u28.Name == u17.FLYING_CARPET then
                v32 = u16.new(u28)
            elseif u28.Name == u17.SLEIGH then
                v32 = u22.new(u28)
            else
                error("Failed to find vehicle client: " .. u28.Name)
            end
            v32:enable(u31)
        end
        local function u37() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u8
                [3] = u28
                [4] = u17
                [5] = u30
                [6] = u33
            --]]
            local v34 = u31.Occupant
            if v34 then
                local v35 = u31.Occupant
                local v36 = u8.LocalPlayer.Character
                if v36 ~= nil then
                    v36 = v36:FindFirstChild("Humanoid")
                end
                v34 = v35 == v36
            end
            if v34 then
                if u28.Name == u17.FLYING_CLOUD then
                    u8.LocalPlayer:SetAttribute("FlyingCloudPilot", true)
                end
                if not u30.checkOwner or u28:GetAttribute("PlacedByUserId") == u8.LocalPlayer.UserId then
                    u33()
                end
            end
        end
        u29:GiveTask(u31:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u37
            --]]
            u37()
        end))
        u37()
        u29:GiveTask(u10.ProjectileHit:setPriority(u4.HIGH):connect(function(p38) --[[ Line: 100 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u13
            --]]
            if p38:isCancelled() then
                return nil
            end
            local v39 = p38.hitData.part
            if v39 ~= nil then
                v39 = v39:IsDescendantOf(u28)
            end
            if v39 and (p38.shooter and u13:isInVehicle(p38.shooter:getInstance(), u28)) then
                p38:setCancelled(true)
            end
        end))
    end)
end
function u23.getVehicleModel(_, p40) --[[ Line: 116 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u7
    --]]
    local v41 = u9:FindFirstChild("Vehicles")
    if v41 ~= nil then
        v41 = v41:FindFirstChild(p40)
    end
    if not v41 then
        return nil
    end
    u7:AddTag(v41, "vehicle")
    u7:AddTag(v41, p40)
    return v41:Clone()
end
v3.CreateController(u23.new())
return nil