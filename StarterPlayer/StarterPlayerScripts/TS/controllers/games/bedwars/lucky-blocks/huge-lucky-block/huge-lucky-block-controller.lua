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
        return "HugeLuckyBlockController"
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
    --]]
    u12.constructor(p22)
    p22.Name = "HugeLuckyBlockController"
end
function u19.KnitStart(p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u15
        [4] = u9
        [5] = u2
        [6] = u10
        [7] = u18
        [8] = u3
        [9] = u17
        [10] = u16
        [11] = u6
        [12] = u14
        [13] = u11
        [14] = u5
        [15] = u8
        [16] = u4
    --]]
    u12.KnitStart(p23)
    u13.On(function(p24, p25, _, _, _) --[[ Line: 40 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u9
            [3] = u2
            [4] = u10
            [5] = u18
            [6] = u3
            [7] = u17
        --]]
        if p25 ~= u15.HUGE_LUCKY_BLOCK then
            return nil
        end
        local v26 = u9.Assets.Effects.HugeLuckyBlock:FindFirstChild("Destroy"):Clone()
        local v27 = u2:getWorldPosition(p24)
        v26.Position = v27
        v26.Parent = u10
        u18:playEffects({ v26 }, nil, {
            ["destroyAfterSec"] = 4
        })
        u3:playSound(u17.FIREWORK_CRACKLE_2, {
            ["position"] = v27
        })
        u3:playSound(u17.FIREWORK_EXPLODE_2, {
            ["position"] = v27
        })
        local v28 = false
        local v29 = 0
        while true do
            if v28 then
                v29 = v29 + 1
            else
                v28 = true
            end
            if v29 >= 7 then
                return
            end
            u3:playSound(u17.BALLOON_POP, {
                ["playbackSpeedMultiplier"] = v29 / 7 / 4 + 1.2,
                ["position"] = v27
            })
            task.wait(0.2)
        end
    end)
    u16.Client:WaitFor("HugeLuckyBlockEvent"):andThen(function(p30) --[[ Line: 104 ]]
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
        --]]
        p30:Connect(function(u31) --[[ Line: 105 ]]
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
            --]]
            local u32 = u6.new()
            local v33 = u9.Assets.Effects.HugeLuckyBlock.Ground:Clone()
            local v34 = u31.position
            local v35 = u14
            local v36 = -u14 / 2
            local v37 = u14
            local u38 = v34 + Vector3.new(v35, v36, v37)
            v33.Position = u38
            v33.Parent = u10
            u32:GiveTask(v33)
            local u39 = u9.Assets.Blocks:FindFirstChild(u15.HUGE_LUCKY_BLOCK)
            if u39 ~= nil then
                u39 = u39:Clone()
            end
            local v40 = u39:FindFirstChild("LuckyBlock")
            if v40 ~= nil then
                local v41 = v40:FindFirstChild("Trail")
                if v41 ~= nil then
                    for v42, v43 in v41:GetDescendants() do
                        local _ = v42 - 1
                        if v43:IsA("ParticleEmitter") then
                            v43.Enabled = true
                        end
                    end
                end
            end
            u32:GiveTask(u39)
            local v44 = math.random() * 3.141592653589793 * 2
            local v45 = CFrame.new(u31.position)
            local v46 = math.cos(v44) * 15
            local v47 = math.sin(v44) * 15
            local u48 = v45 + Vector3.new(v46, 450, v47)
            u39:PivotTo(u48)
            u39.Parent = u10
            local v49 = u31.arriveTime - u10:GetServerTimeNow()
            local u50 = nil
            u50 = u11(v49, u5, function(p51) --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u50
                    [3] = u48
                    [4] = u31
                --]]
                local v52 = u39.PrimaryPart
                if v52 ~= nil then
                    v52 = v52.Parent
                end
                if not v52 then
                    u50:Cancel()
                    return nil
                end
                u39:PivotTo(u48:Lerp(CFrame.new(u31.position), (math.pow(p51, 2) + math.pow(p51, 8)) / 2))
            end)
            task.delay(v49, function() --[[ Line: 155 ]]
                --[[
                Upvalues:
                    [1] = u32
                    [2] = u8
                    [3] = u38
                    [4] = u4
                    [5] = u3
                    [6] = u17
                    [7] = u9
                    [8] = u10
                    [9] = u18
                --]]
                u32:DoCleaning()
                local v53 = u8.LocalPlayer.Character
                local v54
                if v53 == nil then
                    v54 = v53
                else
                    v54 = v53.PrimaryPart
                    if v54 ~= nil then
                        v54 = v54.CFrame
                    end
                end
                if not (v53 and v54) then
                    return nil
                end
                local v55 = (v54.Position - u38).Magnitude
                local v56 = v55 == nil and 250 or v55
                if v56 < 200 then
                    u4.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
                        ["magnitude"] = 0.4 * v56 / 200
                    })
                end
                local v57 = {
                    ["rollOffMinDistance"] = 20,
                    ["rollOffMaxDistance"] = 200,
                    ["volumeMultiplier"] = 0.2,
                    ["position"] = u38
                }
                u3:playSound(u17.LUCKY_BLOCK_SLAM, v57)
                local v58 = u9.Assets.Effects.HugeLuckyBlock.Impact:Clone()
                v58.Position = u38
                v58.Parent = u10
                u18:playEffects({ v58 }, nil, {
                    ["destroyAfterSec"] = 3
                })
            end)
        end)
    end)
end
u4.CreateController(u19.new())
return nil