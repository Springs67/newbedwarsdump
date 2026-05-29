local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.MobileTouchType
local u6 = v3.SoundManager
local u7 = v3.WatchCollectionTag
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.Workspace
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "FlyingCloudController"
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
    p23.Name = "FlyingCloudController"
    p23.activeCloudPilots = {}
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u19
        [3] = u13
        [4] = u15
        [5] = u11
        [6] = u17
        [7] = u9
        [8] = u6
        [9] = u18
        [10] = u2
        [11] = u4
        [12] = u5
    --]]
    u14.KnitStart(u24)
    u24:watchCloudVehicle(u19.FLYING_CLOUD)
    u13.AbilityEnabled:connect(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u24
            [3] = u11
        --]]
        if p25.ability.abilityId ~= u15.CLOUD_LIGHTNING_STRIKE then
            return nil
        end
        function p25.ability.getExtraData() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u11
            --]]
            return u24:getCloudAbilityExtra(u11.LocalPlayer)
        end
    end)
    u17.Client:Get("FlyingCloudPilotMount"):Connect(function(p26) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u9
            [3] = u6
            [4] = u18
            [5] = u24
            [6] = u2
            [7] = u15
            [8] = u4
            [9] = u5
        --]]
        local u27 = p26.player
        local v28 = u11.LocalPlayer.UserId
        local v29 = u9.new()
        if u27.UserId ~= v28 then
            return nil
        end
        u6:playSound(u18.FLYING_CLOUD_MOUNT, {
            ["volumeMultiplier"] = 0.7
        })
        if u24.activeCloudPilots[p26.player.UserId] ~= nil then
            local v30 = u24.activeCloudPilots[p26.player.UserId]
            if v30 ~= nil then
                v30:DoCleaning()
            end
            u24.activeCloudPilots[p26.player.UserId] = nil
        end
        local v31 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v32 = u15.CLOUD_LIGHTNING_STRIKE
        local v33 = {
            ["abilityType"] = "ItemPrimary",
            ["clickToTrigger"] = true,
            ["abilityButton"] = {
                ["icon"] = "rbxassetid://13261737928",
                ["stateColors"] = {
                    [u4.READY] = Color3.fromRGB(130, 168, 191)
                }
            }
        }
        v29:GiveTask(v31:enableAbility(v32, v33):expect())
        v29:GiveTask((u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
            ["action"] = "Attack",
            ["actionId"] = "cloud_lightning_strike",
            ["boundFunction"] = function(_, p34, p35) --[[ Name: boundFunction, Line 89 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u24
                    [3] = u2
                    [4] = u15
                --]]
                if p35.UserInputType == Enum.UserInputType.Touch and p34 ~= Enum.UserInputState.End then
                    return Enum.ContextActionResult.Pass
                end
                if u27 ~= nil then
                    local v36 = u24:getCloudAbilityExtra(u27)
                    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u15.CLOUD_LIGHTNING_STRIKE, p35, v36)
                end
            end,
            ["mobile"] = {
                ["touchType"] = u5.TouchBeginEnd
            }
        })))
        u24.activeCloudPilots[u27.UserId] = v29
    end)
    u17.Client:Get("FlyingCloudPilotDismount"):Connect(function(p37) --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u24
        --]]
        if u24.activeCloudPilots[p37.player.UserId] ~= nil then
            local v38 = u24.activeCloudPilots[p37.player.UserId]
            if v38 ~= nil then
                v38:DoCleaning()
            end
            u24.activeCloudPilots[p37.player.UserId] = nil
        end
    end)
end
function u20.watchCloudVehicle(_, p39) --[[ Line: 130 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    u7(p39, function(p40) --[[ Line: 131 ]]
        if not p40.PrimaryPart then
            p40:GetPropertyChangedSignal("PrimaryPart"):Wait()
        end
    end)
end
function u20.getCloudAbilityExtra(_, p41) --[[ Line: 137 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u16
    --]]
    local v42 = p41.Character
    if v42 ~= nil then
        v42 = v42.PrimaryPart
        if v42 ~= nil then
            v42 = v42.Position
        end
    end
    if v42 == nil then
        return nil
    end
    local v43 = u12:Raycast(v42 + Vector3.new(0, -5, 0), Vector3.new(0, -1, 0) * u16.FLYING_CLOUD_STRIKE_MAX_RANGE)
    if v43 then
        if v43.Instance.Name == "Part" then
            return nil
        end
        local v44 = v43.Position
        return v44 ~= nil and {
            ["target"] = v44
        } or nil
    end
end
v8.CreateController(u20.new())
return nil