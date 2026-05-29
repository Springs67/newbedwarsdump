local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.Players
local u9 = v7.ReplicatedStorage
local u10 = v7.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").BreakBlockEventZap
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u19 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 24 ]]
        return "RainbowLuckyBlockController"
    end,
    ["__index"] = u12
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
        [1] = u12
        [2] = u9
    --]]
    u12.constructor(p22)
    p22.Name = "RainbowLuckyBlockController"
    p22.currentRainbowArch = u9.Assets.Effects.RainbowArch:Clone()
end
function u19.KnitStart(u23) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u15
        [4] = u16
        [5] = u6
        [6] = u9
        [7] = u14
        [8] = u10
        [9] = u3
        [10] = u17
        [11] = u11
        [12] = u5
        [13] = u8
        [14] = u4
        [15] = u18
    --]]
    u12.KnitStart(u23)
    u13.On(function(p24, p25, _, _, _) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u23
        --]]
        if p25 == u15.RAINBOW_LUCKY_BLOCK then
            u23:rainbowBlockDestroyEffects(p24)
        else
            if p25 ~= u15.RAINBOW_POT_OF_GOLD then
                return nil
            end
            if u23.currentRainbowArch then
                u23.currentRainbowArch:Destroy()
            end
            u23:rainbowBlockDestroyEffects(p24)
        end
    end)
    u16.Client:Get("RainbowLuckyBlockSpawn"):Connect(function(u26) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u14
            [4] = u10
            [5] = u15
            [6] = u3
            [7] = u17
            [8] = u11
            [9] = u5
            [10] = u8
            [11] = u4
            [12] = u18
        --]]
        local u27 = u6.new()
        local v28 = u9.Assets.Effects.HugeLuckyBlock.Ground:Clone()
        local v29 = u26.position
        local v30 = u14 / 2
        local v31 = -u14 / 2
        local v32 = u14 / 2
        local u33 = v29 + Vector3.new(v30, v31, v32)
        v28.Position = u33
        v28.Parent = u10
        u27:GiveTask(v28)
        local u34 = u9.Assets.Blocks:FindFirstChild(u15.RAINBOW_LUCKY_BLOCK)
        if u34 ~= nil then
            u34 = u34:Clone()
        end
        u27:GiveTask(u34)
        u34.Parent = u10
        local v35 = math.random() * 3.141592653589793 * 2
        local v36 = CFrame.new(u26.position)
        local v37 = math.cos(v35) * 15
        local v38 = math.sin(v35) * 15
        local u39 = v36 + Vector3.new(v37, 450, v38)
        u34:PivotTo(u39)
        local u40 = u3:playSound(u17.RAINBOW_LB_AMBIENT_LOOP, {
            ["rollOffMaxDistance"] = 1000,
            ["rollOffMinDistance"] = 150,
            ["looped"] = true,
            ["parent"] = u34.PrimaryPart
        })
        local v41 = u26.arriveTime - u10:GetServerTimeNow()
        local u42 = nil
        u42 = u11(v41, u5, function(p43) --[[ Line: 104 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u42
                [3] = u39
                [4] = u26
            --]]
            local v44 = u34.PrimaryPart
            if v44 ~= nil then
                v44 = v44.Parent
            end
            if not v44 then
                u42:Cancel()
                return nil
            end
            u34:PivotTo(u39:Lerp(CFrame.new(u26.position), (math.pow(p43, 2) + math.pow(p43, 8)) / 2))
        end)
        task.delay(v41, function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u27
                [2] = u8
                [3] = u33
                [4] = u4
                [5] = u3
                [6] = u17
                [7] = u9
                [8] = u10
                [9] = u18
                [10] = u40
            --]]
            u27:DoCleaning()
            local v45 = u8.LocalPlayer.Character
            local v46
            if v45 == nil then
                v46 = v45
            else
                v46 = v45.PrimaryPart
                if v46 ~= nil then
                    v46 = v46.CFrame
                end
            end
            if not (v45 and v46) then
                return nil
            end
            local v47 = (v46.Position - u33).Magnitude
            local v48 = v47 == nil and 250 or v47
            if v48 < 200 then
                u4.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    ["magnitude"] = 0.4 * v48 / 200
                })
            end
            local v49 = {
                ["rollOffMinDistance"] = 20,
                ["rollOffMaxDistance"] = 200,
                ["volumeMultiplier"] = 0.2,
                ["position"] = u33
            }
            u3:playSound(u17.LUCKY_BLOCK_SLAM, v49)
            local v50 = u9.Assets.Effects.HugeLuckyBlock.Impact:Clone()
            v50.Position = u33
            v50.Parent = u10
            u18:playEffects({ v50 }, nil, {
                ["destroyAfterSec"] = 3
            })
            if u40 then
                u3:tweenSoundVolume(u40, 0, 1)
            end
        end)
    end)
    u16.Client:Get("RainbowPotOfGoldBlockSpawn"):Connect(function(u51) --[[ Line: 156 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u14
            [4] = u10
            [5] = u15
            [6] = u11
            [7] = u5
            [8] = u8
            [9] = u4
            [10] = u3
            [11] = u17
            [12] = u18
            [13] = u23
        --]]
        local u52 = u6.new()
        local v53 = u9.Assets.Effects.HugeLuckyBlock.Ground:Clone()
        local v54 = u51.targetPosition
        local v55 = u14 - u14 / 2
        local v56 = -u14 / 2
        local v57 = u14 - u14 / 2
        local u58 = v54 + Vector3.new(v55, v56, v57)
        v53.Position = u58
        v53.Parent = u10
        u52:GiveTask(v53)
        local u59 = u9.Assets.Blocks:WaitForChild(u15.RAINBOW_POT_OF_GOLD)
        if u59 ~= nil then
            u59 = u59:Clone()
        end
        u52:GiveTask(u59)
        u59.Parent = u10
        local v60 = math.random() * 3.141592653589793 * 2
        local v61 = CFrame.new(u51.targetPosition)
        local v62 = math.cos(v60) * 15
        local v63 = math.sin(v60) * 15
        local u64 = v61 + Vector3.new(v62, 450, v63)
        u59:PivotTo(u64)
        local v65 = u51.arriveTime - u10:GetServerTimeNow()
        local u66 = nil
        u66 = u11(v65, u5, function(p67) --[[ Line: 179 ]]
            --[[
            Upvalues:
                [1] = u59
                [2] = u66
                [3] = u64
                [4] = u51
            --]]
            local v68 = u59.PrimaryPart
            if v68 ~= nil then
                v68 = v68.Parent
            end
            if not v68 then
                u66:Cancel()
                return nil
            end
            u59:PivotTo(u64:Lerp(CFrame.new(u51.targetPosition), (math.pow(p67, 2) + math.pow(p67, 8)) / 2))
        end)
        task.delay(v65, function() --[[ Line: 190 ]]
            --[[
            Upvalues:
                [1] = u52
                [2] = u8
                [3] = u58
                [4] = u4
                [5] = u3
                [6] = u17
                [7] = u9
                [8] = u10
                [9] = u18
                [10] = u23
                [11] = u51
            --]]
            u52:DoCleaning()
            local v69 = u8.LocalPlayer.Character
            if v69 ~= nil then
                v69 = (v69:GetPrimaryPartCFrame().Position - u58).Magnitude
            end
            local v70 = v69 == nil and 250 or v69
            if v70 < 200 then
                u4.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                    ["magnitude"] = 0.4 * v70 / 200
                })
            end
            local v71 = {
                ["rollOffMinDistance"] = 20,
                ["rollOffMaxDistance"] = 200,
                ["volumeMultiplier"] = 0.2,
                ["position"] = u58
            }
            u3:playSound(u17.LUCKY_BLOCK_SLAM, v71)
            local v72 = u9.Assets.Effects.HugeLuckyBlock.Impact:Clone()
            v72.Position = u58
            v72.Parent = u10
            u18:playEffects({ v72 }, nil, {
                ["destroyAfterSec"] = 3
            })
            u23:initRainbowArch(u51.initialPosition, u51.targetPosition)
        end)
    end)
end
function u19.rainbowBlockDestroyEffects(_, p73) --[[ Line: 222 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u2
        [3] = u10
        [4] = u18
        [5] = u3
        [6] = u17
    --]]
    local v74 = u9.Assets.Effects.HugeLuckyBlock:FindFirstChild("Destroy"):Clone()
    local v75 = u2:getWorldPosition(p73)
    v74.Position = v75
    v74.Parent = u10
    u18:playEffects({ v74 }, nil, {
        ["destroyAfterSec"] = 4
    })
    u3:playSound(u17.FIREWORK_CRACKLE_2, {
        ["position"] = v75
    })
    u3:playSound(u17.FIREWORK_EXPLODE_2, {
        ["position"] = v75
    })
    local v76 = false
    local v77 = 0
    while true do
        if v76 then
            v77 = v77 + 1
        else
            v76 = true
        end
        if v77 >= 7 then
            return
        end
        u3:playSound(u17.BALLOON_POP, {
            ["playbackSpeedMultiplier"] = v77 / 7 / 4 + 1.2,
            ["position"] = v75
        })
        task.wait(0.2)
    end
end
function u19.initRainbowArch(p78, p79, p80) --[[ Line: 256 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u10
        [3] = u3
        [4] = u17
    --]]
    local v81 = u9.Assets.Effects.RainbowArch:Clone()
    p78.currentRainbowArch = v81
    local v82 = v81:WaitForChild("Start")
    local v83 = v81:WaitForChild("End")
    local v84 = v81:WaitForChild("Start")
    if v84 ~= nil then
        v84 = v84:FindFirstChild("Attachment")
    end
    local v85 = v81:WaitForChild("End")
    if v85 ~= nil then
        v85 = v85:FindFirstChild("Attachment")
    end
    v81.Parent = u10
    v82:PivotTo(CFrame.new(p79))
    v83:PivotTo(CFrame.new(p80))
    u3:playSound(u17.RAINBOW_INIT, {
        ["rollOffMinDistance"] = 20,
        ["rollOffMaxDistance"] = 200,
        ["volumeMultiplier"] = 1.2,
        ["position"] = p79
    })
    local v86 = u3:playSound(u17.RAINBOW_AMBIENT_LOOP, {
        ["rollOffMaxDistance"] = 1200,
        ["rollOffMinDistance"] = 150,
        ["looped"] = true,
        ["volumeMultiplier"] = 1.2,
        ["parent"] = v81.PrimaryPart
    })
    if v86 then
        u3:tweenSoundVolume(v86, 1, 1)
    end
end
u4.CreateController(u19.new())
return nil