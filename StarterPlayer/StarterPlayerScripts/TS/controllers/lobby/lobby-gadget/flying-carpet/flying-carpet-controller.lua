local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "vehicle", "vehicle-type").VehicleType
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "FlyingCarpetController"
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
    --]]
    u13.constructor(p22)
    p22.Name = "FlyingCarpetController"
    p22.animMap = {}
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u12
        [3] = u16
        [4] = u6
        [5] = u17
        [6] = u11
        [7] = u10
        [8] = u18
        [9] = u8
        [10] = u14
        [11] = u3
        [12] = u15
        [13] = u4
        [14] = u7
    --]]
    u13.KnitStart(u23)
    u12.StartConsuming:connect(function(p24) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u6
            [3] = u17
            [4] = u11
        --]]
        if p24.itemType ~= u16.FLYING_CARPET_DEPLOY then
            return nil
        end
        if p24:isCancelled() then
            return nil
        end
        u6.Controllers.PreloadController:runPreload({
            ["sounds"] = { u17.FLYING_CARPET_DEPLOY, u17.FLYING_CARPET_IDLE }
        })
        if u11.LocalPlayer:GetAttribute("IsInVehicle") == true then
            p24:setCancelled(true)
        end
    end)
    u10:GetInstanceAddedSignal(u18.FLYING_CARPET):Connect(function(u25) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u14
            [4] = u3
            [5] = u15
            [6] = u4
            [7] = u17
            [8] = u7
            [9] = u11
            [10] = u23
        --]]
        local u26 = u8.new()
        u6.Controllers.PreloadController:runPreload({
            ["animations"] = { u14.SIT_FLAT, u14.FLYING_CARPET_IDLE }
        })
        u25.Destroying:Connect(function() --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:DoCleaning()
        end)
        task.spawn(function() --[[ Line: 65 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u3
                [3] = u15
                [4] = u14
            --]]
            u3:playAnimation(u25:WaitForChild("AnimationController"):WaitForChild("Animator"), u15:getAssetId(u14.FLYING_CARPET_IDLE), {
                ["looped"] = true
            })
        end)
        task.spawn(function() --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u4
                [3] = u17
            --]]
            local v27 = u25:WaitForChild("FlyingCarpet")
            if not v27 then
                return nil
            end
            u4:playSound(u17.FLYING_CARPET_IDLE, {
                ["looped"] = true,
                ["parent"] = v27
            })
        end)
        task.spawn(function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u7
                [3] = u11
                [4] = u23
                [5] = u26
            --]]
            local u28 = u25:WaitForChild("Passenger")
            local u29 = u7.Controllers.ProximityPromptController:createProximityPrompt({
                ["Name"] = "FlyingCarpetPassengerPrompt",
                ["ActionText"] = "Passenger",
                ["ObjectText"] = "Flying Carpet",
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 3,
                ["ClickablePrompt"] = true,
                ["HoldDuration"] = 0,
                ["Parent"] = u28
            })
            local v30 = u11.LocalPlayer:GetAttribute("FlyingCarpetPilot")
            if v30 ~= 0 and (v30 == v30 and (v30 ~= "" and v30)) then
                u29.Enabled = false
            end
            local u31 = -1
            u29.Triggered:Connect(function(p32) --[[ Line: 100 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u23
                    [3] = u28
                    [4] = u31
                --]]
                u29.Enabled = false
                u23:mountPassenger(p32, u28)
                u31 = p32.UserId
            end)
            u26:GiveTask(u28:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 105 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u11
                    [3] = u29
                    [4] = u23
                    [5] = u31
                --]]
                if not u28.Occupant then
                    local v33 = u11.LocalPlayer:GetAttribute("FlyingCarpetPilot")
                    if v33 == 0 or (v33 ~= v33 or (v33 == "" or not v33)) then
                        u29.Enabled = true
                    end
                    local v34 = u23.animMap[u31]
                    if v34 ~= nil then
                        v34:Stop()
                    end
                    if v34 ~= nil then
                        v34:Destroy()
                    end
                    u31 = -1
                end
            end))
            u26:GiveTask(function() --[[ Line: 125 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u31
                --]]
                local v35 = u23.animMap[u31]
                if v35 ~= nil then
                    v35:Stop()
                end
                if v35 ~= nil then
                    v35:Destroy()
                end
                u31 = -1
            end)
        end)
    end)
end
function u19.mountPassenger(p36, p37, p38) --[[ Line: 142 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u14
    --]]
    local v39 = p37.Character
    if v39 ~= nil then
        v39 = v39:FindFirstChildOfClass("Humanoid")
    end
    if v39 then
        p38:Sit(v39)
    end
    local v40 = p37.Character.Humanoid.Animator:LoadAnimation(u15:getAnimation(u14.SIT_FLAT))
    v40.Priority = Enum.AnimationPriority.Movement
    v40:Play()
    p36.animMap[p37.UserId] = v40
end
u6.CreateController(u19.new())
return nil