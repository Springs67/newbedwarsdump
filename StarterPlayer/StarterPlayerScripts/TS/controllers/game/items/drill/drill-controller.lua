local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.CollectionService
local u10 = v8.Players
local u11 = v8.ReplicatedStorage
local u12 = v8.Workspace
local v13 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "interaction", "interaction-registry-controller")
local u14 = v13.InteractionCategory
local u15 = v13.InteractionPriority
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u20 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 25 ]]
        return "DrillController"
    end,
    ["__index"] = u16
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
        [1] = u16
        [2] = u7
    --]]
    u16.constructor(p23)
    p23.Name = "DrillController"
    p23.alarmMaid = u7.new()
end
function u20.KnitStart(u24) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u17
        [3] = u10
        [4] = u19
        [5] = u9
        [6] = u11
        [7] = u4
        [8] = u12
        [9] = u5
        [10] = u18
    --]]
    u16.KnitStart(u24)
    u24:initPrompt()
    u17.Client:Get("DrillPlaced"):Connect(function(p25) --[[ Line: 43 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u19
            [3] = u9
        --]]
        local v26 = p25.drill:GetAttribute("PlacedByUserId")
        if v26 == 0 or (v26 ~= v26 or not v26) then
            return nil
        else
            local v27 = u10:GetPlayerByUserId(v26)
            if v27 then
                local _ = u19.mcGreen
                if u10.LocalPlayer.Team == v27.Team then
                    u9:AddTag(p25.drill, "Friendly_Drill")
                else
                    local _ = u19.mcRed
                end
            else
                return nil
            end
        end
    end)
    u17.Client:Get("DrillAlarmTriggered"):Connect(function(p28) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u4
            [3] = u12
            [4] = u9
            [5] = u5
            [6] = u18
            [7] = u24
        --]]
        local v29 = p28.drill.PrimaryPart
        if v29 ~= nil then
            v29 = v29.Position + Vector3.new(0, 15, 0)
        end
        if not v29 then
            return nil
        end
        local u30 = u11:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("BedAlarm"):Clone()
        u30:SetAttribute("RotationSpeed", 270)
        u30:PivotTo(CFrame.new(v29))
        for v31, v32 in u30:GetDescendants() do
            local _ = v31 - 1
            u4:setQueryIgnored(v32, true)
        end
        u30.Parent = u12
        u9:AddTag(u30, "RotatingObject")
        local u33 = u5:playSound(u18.BED_ALARM, {
            ["rollOffMaxDistance"] = 100,
            ["looped"] = true,
            ["position"] = v29
        })
        u24.alarmMaid:GiveTask(function() --[[ Line: 87 ]]
            --[[
            Upvalues:
                [1] = u30
            --]]
            u30:Destroy()
        end)
        if u33 then
            u24.alarmMaid:GiveTask(function() --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u33
                --]]
                u5:tweenSoundVolume(u33, 0, 0.2)
                task.delay(0.3, function() --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                    --]]
                    u33:Stop()
                end)
            end)
            task.delay(3, function() --[[ Line: 97 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24.alarmMaid:DoCleaning()
            end)
        end
    end)
end
function u20.initPrompt(_) --[[ Line: 103 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u15
        [4] = u14
        [5] = u17
    --]]
    u6.Controllers.InteractionRegistryController:RegisterInteraction({
        ["interactionLabel"] = "Extract",
        ["interactionObjectText"] = "Extract ore",
        ["interactionTag"] = "Friendly_Drill",
        ["holdDuration"] = 0.5,
        ["maxActivationDistance"] = 5,
        ["clickablePrompt"] = u3.isMobileControls(),
        ["priority"] = u15.OTHER,
        ["category"] = u14.OTHER,
        ["KeyCode"] = Enum.KeyCode.R,
        ["onInteracted"] = function(_, p34, _) --[[ Name: onInteracted, Line 114 ]]
            --[[
            Upvalues:
                [1] = u17
            --]]
            if not p34.PrimaryPart.Position then
                return nil
            end
            u17.Client:Get("ExtractFromDrill"):SendToServer({
                ["drill"] = p34
            })
        end
    })
end
u6.CreateController(u20.new())
return nil