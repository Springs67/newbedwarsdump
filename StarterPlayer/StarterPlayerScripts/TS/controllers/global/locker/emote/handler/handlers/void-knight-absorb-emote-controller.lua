local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.TweenService
local u8 = v5.Workspace
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u17 = v1.import(script, script.Parent.Parent, "emote-handler").EmoteHandler
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "VoidKnightDevourEmoteController"
    end,
    ["__index"] = u9
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
        [1] = u9
    --]]
    u9.constructor(p21)
    p21.Name = "VoidKnightDevourEmoteController"
end
function u18.KnitStart(p22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u3
        [3] = u13
        [4] = u17
        [5] = u12
        [6] = u11
        [7] = u16
        [8] = u10
        [9] = u6
        [10] = u4
        [11] = u8
        [12] = u7
        [13] = u2
        [14] = u14
        [15] = u15
    --]]
    u9.KnitStart(p22)
    local v23 = u3.Controllers.EmoteHandlerController
    local v24 = u13.VOID_HUNTER_ABSORB
    local u25 = u17
    local u26 = setmetatable({}, {
        ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
            return "Anonymous"
        end,
        ["__index"] = u25
    })
    u26.__index = u26
    function u26.new(...) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u26
        --]]
        local v27 = u26
        local v28 = setmetatable({}, v27)
        return v28:constructor(...) or v28
    end
    function u26.constructor(p29, ...) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        u25.constructor(p29, ...)
    end
    function u26.onEnable(p30, p31, u32, _, u33) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u11
            [3] = u16
            [4] = u10
            [5] = u6
            [6] = u4
            [7] = u8
            [8] = u7
            [9] = u2
            [10] = u14
            [11] = u15
        --]]
        local u34 = u12.createItemInstance(u11.NOCTIUM_BLADE_4, 1)
        for v35, v36 in u34:GetDescendants() do
            local _ = v35 - 1
            if v36:IsA("MeshPart") then
                v36.Transparency = 1
            end
            if v36:IsA("Beam") then
                v36.Enabled = false
            end
        end
        u34.Parent = u32
        u16:weldAccessory(u32, u34)
        u33:GiveTask(u34)
        task.delay(4, function() --[[ Line: 75 ]]
            --[[
            Upvalues:
                [1] = u33
            --]]
            u33:DoCleaning()
        end)
        u33:GiveTask(p30:watchEmoteAnimation(p31, u32, u10.WINTER_BOSS_RAISE_AXE, function(u37) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
                [3] = u32
                [4] = u11
                [5] = u6
                [6] = u4
                [7] = u8
                [8] = u7
                [9] = u2
                [10] = u14
                [11] = u15
            --]]
            u33:GiveTask(task.spawn(function() --[[ Line: 81 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u32
                    [3] = u11
                    [4] = u6
                    [5] = u4
                    [6] = u8
                    [7] = u33
                    [8] = u7
                    [9] = u2
                    [10] = u14
                    [11] = u37
                    [12] = u15
                --]]
                local u38 = u34:WaitForChild("Handle", 3)
                if not u38 then
                    return nil
                end
                u38.CanCollide = false
                task.wait(0.6)
                local u39 = 0
                while u39 < 10 do
                    local v40 = u32.PrimaryPart.Position
                    local v41 = math.random(-20, 20)
                    local v42 = math.random
                    local v43 = v40 + Vector3.new(v41, -6, v42(-20, 20))
                    local v44
                    if u39 % 2 == 0 then
                        v44 = u11.EMERALD
                    else
                        v44 = u11.IRON
                    end
                    local u45 = u6:WaitForChild("Items"):FindFirstChild(v44)
                    if u45 ~= nil then
                        u45 = u45:WaitForChild("Handle", 1)
                        if u45 ~= nil then
                            u45 = u45:Clone()
                        end
                    end
                    if u45 then
                        u4(u45, 0.5)
                        u45.Anchored = true
                        u45.Parent = u8
                        u45.CanCollide = false
                        u33:GiveTask(u45)
                        u45:PivotTo(CFrame.new(v43))
                        local v46 = u7:Create(u45, TweenInfo.new(0.6), {
                            ["Position"] = u38.Position
                        })
                        v46:Play()
                        v46.Completed:Connect(function() --[[ Line: 114 ]]
                            --[[
                            Upvalues:
                                [1] = u45
                                [2] = u38
                                [3] = u39
                                [4] = u2
                                [5] = u14
                            --]]
                            u45:Destroy()
                            local v47 = u38
                            local v48 = u38.Transparency - 0.05
                            v47.Transparency = math.max(v48, 0)
                            u38.Transparency = 0
                            for v49, v50 in u38:GetDescendants() do
                                local _ = v49 - 1
                                if v50:IsA("MeshPart") then
                                    local v51 = u38.Transparency - 0.1
                                    v50.Transparency = math.max(v51, 0)
                                    if u39 == 9 then
                                        v50.Transparency = 0
                                    end
                                end
                                if u39 == 9 and v50:IsA("Beam") then
                                    v50.Enabled = true
                                end
                            end
                            if u39 % 3 == 0 and u39 < 9 then
                                u2:playSound(u14.VOID_KNIGHT_CONSUME, {
                                    ["position"] = u38.Position
                                })
                            end
                        end)
                    end
                    if u39 == 9 then
                        local u52 = u6.Assets.Effects.VoidKnightLevelUpEffect:Clone()
                        u52.Position = u38.Position
                        u52.Parent = u8
                        u37:AdjustSpeed(0)
                        task.delay(0.5, function() --[[ Line: 147 ]]
                            --[[
                            Upvalues:
                                [1] = u37
                            --]]
                            u37:AdjustSpeed(1)
                        end)
                        u2:playSound(u14.VOID_KNIGHT_LEVEL_UP_4, {
                            ["position"] = u38.Position
                        })
                        u15:playEffects({ u52 }, nil, {
                            ["particleMultiplier"] = 0.5,
                            ["sizeMultiplier"] = 0.5
                        })
                        task.delay(3, function() --[[ Line: 157 ]]
                            --[[
                            Upvalues:
                                [1] = u52
                            --]]
                            u52:Destroy()
                        end)
                    end
                    local v53 = u39 + 1
                    task.wait(0.1)
                    u39 = v53
                end
            end))
        end))
    end
    function u26.onDisable(_, _, _, _) --[[ Line: 167 ]] end
    v23:registerHandler(v24, u26)
end
u3.CreateController(u18.new())
return nil