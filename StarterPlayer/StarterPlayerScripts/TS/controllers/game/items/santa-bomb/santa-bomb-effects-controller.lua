local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "santa", "santa-util").SantaUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "SantaBombEffectsController"
    end,
    ["__index"] = u11
})
u15.__index = u15
function u15.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18, ...) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p18, ...)
    p18.Name = "SantaBombEffectsController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u13
        [3] = u8
        [4] = u9
        [5] = u3
        [6] = u4
        [7] = u14
        [8] = u10
        [9] = u12
        [10] = u6
    --]]
    u11.KnitStart(p19)
    u13.Client:WaitFor("SantaStrafeEffect"):andThen(function(p20) --[[ Line: 37 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u9
            [3] = u3
            [4] = u4
            [5] = u14
            [6] = u10
            [7] = u12
            [8] = u6
        --]]
        return p20:Connect(function(p21) --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u9
                [3] = u3
                [4] = u4
                [5] = u14
                [6] = u10
                [7] = u12
                [8] = u6
            --]]
            local u22 = u8.Assets.Misc:WaitForChild("santa"):WaitForChild("santa_sleigh"):Clone()
            local v23 = p21.siege == true
            u22.Parent = u9
            local u24 = CFrame.new(p21.originPosition, p21.dropPosition)
            local v25 = u22:WaitForChild("sleigh")
            local u26 = u24 + (p21.dropPosition - p21.originPosition) * 2
            local u27 = {
                {
                    ["sleighDelta"] = Vector3.new(0, 0, 0),
                    ["model"] = v25
                }
            }
            for _, v28 in u22:GetChildren() do
                if v28:IsA("Model") and v28.Name == "deer" then
                    local v29 = {
                        ["model"] = v28,
                        ["sleighDelta"] = (v28:GetPivot():Inverse() * v25:GetPivot()).Position
                    }
                    table.insert(u27, v29)
                    u3:playAnimation(v28:FindFirstChildWhichIsA("AnimationController"):FindFirstChildWhichIsA("Animator"), "rbxassetid://8246523829", {
                        ["looped"] = true
                    })
                end
            end
            u4:playSound(u14.SANTA_BELLS, {
                ["rollOffMinDistance"] = 150,
                ["rollOffMaxDistance"] = 300,
                ["position"] = u24.Position,
                ["playbackSpeedMultiplier"] = v23 and 0.85 or 1
            })
            local u33 = u10(u12.DROP_DELAY * 2, u6, function(p30) --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u24
                    [3] = u26
                --]]
                for _, v31 in u27 do
                    local v32 = u24:Lerp(u26, p30) * CFrame.new(v31.sleighDelta * -1)
                    if v31.model.Name == "sleigh" then
                        v32 = v32 * CFrame.Angles(0, -1.5707963267948966, 0)
                    end
                    v31.model:PivotTo(v32)
                end
            end, 0, 1)
            task.spawn(function() --[[ Line: 86 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u22
                --]]
                u33:Wait()
                u22:Destroy()
            end)
        end)
    end)
end
v5.CreateController(u15.new())
return nil