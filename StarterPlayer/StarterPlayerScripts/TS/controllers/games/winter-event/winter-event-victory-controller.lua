local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "WinterEventVictoryController"
    end,
    ["__index"] = u14
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p21)
    p21.Name = "WinterEventVictoryController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u6
        [4] = u13
        [5] = u8
        [6] = u15
        [7] = u4
        [8] = u17
        [9] = u10
        [10] = u11
        [11] = u12
        [12] = u7
        [13] = u3
    --]]
    u14.KnitStart(p22)
    u16.Client:Get("WinWinterEvent"):Connect(function(p23, u24) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u13
            [3] = u8
            [4] = u15
            [5] = u4
            [6] = u17
            [7] = u10
            [8] = u11
            [9] = u12
            [10] = u7
            [11] = u3
        --]]
        task.delay(5, function() --[[ Line: 40 ]]
            --[[
            Upvalues:
                [1] = u6
            --]]
            u6.Controllers.WinterEventController:enableThirdPersonMode()
        end)
        u6.Controllers.WinterEventController:tweenWinterEffectStrength(0, 4)
        local u25 = u6.Controllers.WinterEventController:getClimbSoundGroup()
        local u26 = u25.Volume
        u13(4, u8, function(p27) --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u26
            --]]
            u25.Volume = (1 - p27) * u26 + p27 * 0.15
        end)
        task.wait(1)
        task.spawn(function() --[[ Line: 51 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u24
                [3] = u15
            --]]
            local v28 = false
            local v29 = 0
            ::l12::
            if v28 then
                v29 = v29 + 1
            else
                v28 = true
            end
            if v29 >= 10 then
                return
            end
            local v30 = false
            local v31 = 0
            while true do
                if true then
                    if v30 then
                        v31 = v31 + 1
                    else
                        v30 = true
                    end
                end
                if v31 >= 4 then
                    break
                end
                local v32 = math.random() * 3.141592653589793 * 2
                local v33 = math.random() * 50 + 20
                local v34 = u6.Controllers.FireworkController
                local v35 = u24
                local v36 = math.cos(v32) * v33
                local v37 = math.sin(v32) * v33
                v34:playFireworkEffect(v35 + Vector3.new(v36, 40, v37), u15.NORMAL)
                task.wait(0.1)
            end
            task.wait(2)
            goto l12
        end)
        task.wait(3)
        u4:playSound(u17.WINTER_BOSS_VICTORY_TRACK)
        local v38 = u10.LocalPlayer
        if table.find(p23, v38) ~= nil then
            local u39 = u11.Assets.Misc.MinigameMountain.WinterRewards:Clone()
            local u40 = u39.Present
            u40.Parent = u12
            u40:PivotTo(CFrame.new(u24))
            u7.Controllers.ProximityPromptController:createProximityPrompt({
                ["MaxActivationDistance"] = 20,
                ["RequiresLineOfSight"] = false,
                ["HoldDuration"] = 1,
                ["ActionText"] = "Open",
                ["ObjectText"] = "Summit Gift",
                ["Parent"] = u40.PrimaryPart
            }).Triggered:Connect(function() --[[ Line: 109 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u6
                    [3] = u15
                    [4] = u39
                    [5] = u12
                    [6] = u4
                    [7] = u17
                    [8] = u3
                --]]
                local v41 = u40:GetPrimaryPartCFrame().Position
                u6.Controllers.FireworkController:playFireworkEffect(v41, u15.HEART)
                u40:Destroy()
                local v42 = 0
                local v43 = {}
                local v44 = 0
                local v45 = 0
                for v46, v47 in u39:GetChildren() do
                    local _ = v46 - 1
                    if v47:IsA("BasePart") == true then
                        v42 = v42 + 1
                        v43[v42] = v47
                    end
                end
                for _, v48 in v43 do
                    if v48:IsA("BasePart") then
                        local v49 = v48:Clone()
                        v49.Position = v41
                        v49.Parent = u12
                        local v50 = math.cos(v44) * 33
                        local v51 = math.sin(v44) * 33
                        v49.Velocity = Vector3.new(v50, 40, v51)
                        v44 = v44 + 6.283185307179586 / #v43
                        u4:playSound(u17.NEW_EMERALD_PICKUP, {
                            ["playbackSpeedMultiplier"] = 1.1 - v45 * 0.1
                        })
                        u4:playSound(u3.fromList(u17.FIREWORK_EXPLODE_1, u17.FIREWORK_EXPLODE_2, u17.FIREWORK_EXPLODE_3), {
                            ["playbackSpeedMultiplier"] = 1.1 - v45 * 0.1
                        })
                        v45 = v45 + 1
                        u4:playSound(u17.EMERALD_GENERATOR_AURA, {
                            ["rollOffMaxDistance"] = 120,
                            ["rollOffMinDistance"] = 30,
                            ["volumeMultiplier"] = 1.5,
                            ["parent"] = v49
                        })
                        task.wait(0.2)
                    end
                end
            end)
        end
    end)
end
u6.CreateController(u18.new())
return nil