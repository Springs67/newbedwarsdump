local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.TweenService
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "controls", "gamepad-util").GamepadUtil
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u18 = v1.import(script, script.Parent, "ui", "satellite-dish-billboard").SatelliteDishBillboard
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "SatelliteDishController"
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
        [2] = u16
    --]]
    u13.constructor(p22)
    p22.Name = "SatelliteDishController"
    p22.activateSound = u16.SATELLITE_ACTIVATE
    p22.deactivateSound = u16.SATELLITE_DEACTIVATE
    p22.changeTargetSound = u16.SATELLITE_INTERACT
    p22.ambientSound = u16.SATELLITE_LOOP
    p22.ambientMap = {}
    p22.tweenMap = {}
    p22.billboardMap = {}
end
function u19.KnitStart(u23) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u9
        [3] = u3
        [4] = u11
        [5] = u10
        [6] = u17
        [7] = u14
        [8] = u7
        [9] = u18
        [10] = u6
        [11] = u12
        [12] = u15
        [13] = u2
    --]]
    u13.KnitStart(u23)
    u9:GetInstanceAddedSignal("satellite-dish"):Connect(function(u24) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u23
            [3] = u11
            [4] = u10
            [5] = u17
            [6] = u14
            [7] = u7
            [8] = u18
            [9] = u6
            [10] = u12
            [11] = u15
            [12] = u2
        --]]
        local v25 = u3:playModifiableSound(u23.ambientSound, {
            ["looped"] = true,
            ["position"] = u24.Position
        })
        if v25 then
            v25:Pause()
            u23.ambientMap[u24] = v25
        end
        local v26 = u24:WaitForChild("Dish")
        local v27 = TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1, false)
        u23.tweenMap[u24] = { u11:Create(v26, v27, {
                ["Orientation"] = Vector3.new(0, 360, 0)
            }) }
        if u10.LocalPlayer.UserId ~= u24:GetAttribute("PlacedByUserId") then
            return nil
        end
        if not u17(u10.LocalPlayer, u14.DISRUPTOR) then
            return nil
        end
        local v28 = u10:GetPlayerByUserId(u24:GetAttribute("PlacedByUserId"))
        local v29 = u7.mount(u7.createElement(u18, {
            ["satelliteInstance"] = u24,
            ["player"] = u10.LocalPlayer
        }), u24)
        u23.billboardMap[u24] = v29
        u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "ActivatePrompt",
            ["HoldDuration"] = 1,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 8,
            ["ClickablePrompt"] = false,
            ["GamepadKeyCode"] = u12.getGamepadKeybind("Interact"),
            ["ActionText"] = u23:getActivation(v28),
            ["Parent"] = u24
        }).Triggered:Connect(function(p30) --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u2
                [3] = u24
                [4] = u10
                [5] = u3
                [6] = u23
            --]]
            u15.Client:Get("DisruptionActivate"):SendToServer({
                ["blockPos"] = u2:getBlockPosition(u24.Position),
                ["device"] = u24
            })
            if p30 == u10.LocalPlayer then
                if p30:GetAttribute("DisruptorActivation") then
                    u3:playSound(u23.deactivateSound)
                    return
                end
                u3:playSound(u23.activateSound)
            end
        end)
        u6.Controllers.ProximityPromptController:createProximityPrompt({
            ["Name"] = "ChangeTargetPrompt",
            ["HoldDuration"] = 1,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 8,
            ["ActionText"] = "Change Target",
            ["ClickablePrompt"] = false,
            ["KeyboardKeyCode"] = Enum.KeyCode.X,
            ["GamepadKeyCode"] = u12.getGamepadKeybind("Ping"),
            ["ObjectText"] = u23:getTarget(v28),
            ["UIOffset"] = Vector2.new(0, -80),
            ["Parent"] = u24
        }).Triggered:Connect(function(p31) --[[ Line: 122 ]]
            --[[
            Upvalues:
                [1] = u15
                [2] = u2
                [3] = u24
                [4] = u10
                [5] = u3
                [6] = u23
            --]]
            u15.Client:Get("DisruptionChangeTarget"):SendToServer({
                ["blockPos"] = u2:getBlockPosition(u24.Position),
                ["device"] = u24
            })
            if p31 == u10.LocalPlayer then
                u3:playSound(u23.changeTargetSound)
            end
        end)
    end)
    u9:GetInstanceRemovedSignal("satellite-dish"):Connect(function(p32) --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u7
        --]]
        local v33 = u23.ambientMap[p32]
        if v33 ~= nil then
            v33:Destroy()
        end
        u23.ambientMap[p32] = nil
        local v34 = u23.tweenMap[p32]
        if v34 then
            if v34[1] then
                v34[1]:Destroy()
            end
            if v34[2] then
                v34[2]:Destroy()
            end
        end
        u23.tweenMap[p32] = nil
        local v35 = u23.billboardMap[p32]
        if v35 then
            u7.unmount(v35)
            u23.billboardMap[p32] = nil
        end
    end)
    u15.Client:OnEvent("DisruptionUpdate", function(u36) --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        if not u36.device then
            return nil
        end
        local u37 = u23.ambientMap[u36.device]
        local v38 = u23.tweenMap[u36.device]
        local v39 = u36.player
        if v39 ~= nil then
            v39 = v39:GetAttribute("DisruptorActivation")
        end
        if v39 then
            local v40
            if u37 == nil then
                v40 = u37
            else
                v40 = u37.IsPlaying
            end
            if not v40 then
                task.delay(1.5, function() --[[ Line: 192 ]]
                    --[[
                    Upvalues:
                        [1] = u36
                        [2] = u37
                    --]]
                    if u36.device then
                        local v41 = u37
                        if v41 ~= nil then
                            v41:Play()
                        end
                    end
                end)
            end
            if v38 then
                if v38[1] then
                    v38[1]:Play()
                end
                if v38[2] then
                    v38[2]:Play()
                end
            end
        else
            if u37 ~= nil then
                u37:Stop()
            end
            if v38 then
                if v38[1] then
                    v38[1]:Pause()
                end
                if v38[2] then
                    v38[2]:Pause()
                end
            end
        end
        if u36.player.UserId ~= u36.device:GetAttribute("PlacedByUserId") then
            return nil
        end
        if u36.device:FindFirstChild("ActivatePrompt") then
            u36.device.ActivatePrompt.ActionText = u23:getActivation(u36.player)
        end
        if u36.device:FindFirstChild("ChangeTargetPrompt") then
            u36.device.ChangeTargetPrompt.ObjectText = u23:getTarget(u36.player)
        end
    end)
end
function u19.getActivation(_, p42) --[[ Line: 222 ]]
    if p42 ~= nil then
        p42 = p42:GetAttribute("DisruptorActivation")
    end
    return p42 and "Deactivate" or "Activate"
end
function u19.getTarget(_, p43) --[[ Line: 229 ]]
    if p43 ~= nil then
        p43 = p43:GetAttribute("DisruptorTarget")
    end
    return "Current Target: " .. tostring(p43)
end
v5.CreateController(u19.new())
return nil