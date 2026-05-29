local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutExpo
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.TweenService
local u8 = v5.Workspace
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u12 = Color3.fromRGB(115, 192, 144)
local u13 = Color3.fromRGB(48, 117, 87)
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 19 ]]
        return "GhostKillEffect"
    end,
    ["__index"] = u11
})
u14.__index = u14
function u14.new(...) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17, p18) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p17, p18)
    u11.setPlayDefaultKillEffect(p17, false)
end
function u14.onKill(p19, _, p20, _) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u11
        [4] = u2
        [5] = u10
        [6] = u7
        [7] = u12
        [8] = u6
        [9] = u13
        [10] = u1
        [11] = u9
        [12] = u3
    --]]
    local u21 = u4.new()
    p20.Archivable = true
    local u22 = p20:Clone()
    u22.Parent = u8
    u21:GiveTask(u22)
    u11.hideCharacter(p19, p20)
    u21:GiveTask(u2:playSound(u10.GHOST_VACUUM_SUCKING_LOOP, {
        ["position"] = u22:GetPivot().Position
    }))
    local v23 = TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    local v24 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
    for _, v25 in u22:GetDescendants() do
        if v25:IsA("BasePart") then
            u7:Create(v25, v23, {
                ["Transparency"] = 1
            }):Play()
            u7:Create(v25, v24, {
                ["Color"] = u12
            }):Play()
            if v25.Name == "LeftHand" or (v25.Name == "LeftFoot" or (v25.Name == "RightHand" or (v25.Name == "RightFoot" or (v25.Name == "UpperTorso" or v25.Name == "Head")))) then
                for _, v26 in u6.Assets.Effects.GhostSmokeEffect:Clone():GetChildren() do
                    v26.Parent = v25
                    v26.Enabled = true
                    v26.LockedToPart = false
                    v26.Acceleration = Vector3.new(0, 0.1, 0)
                    v26.Rate = 25
                end
            end
        elseif v25:IsA("Texture") or v25:IsA("Clothing") then
            if v25:IsA("Texture") then
                u7:Create(v25, v23, {
                    ["Transparency"] = 0.45
                }):Play()
            end
            u7:Create(v25, v24, {
                ["Color3"] = u13
            }):Play()
        end
    end
    local u27 = u22:GetPivot()
    local u29 = u1.Promise.new(function() --[[ Line: 82 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u27
            [3] = u9
            [4] = u3
            [5] = u21
        --]]
        task.delay(0.75, function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u27
                [3] = u9
                [4] = u3
            --]]
            u9(1.5, u3, function(p28) --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u22
                --]]
                return u22:PivotTo(p28)
            end, u22:GetPivot(), u27 * CFrame.new(0, 15, 0)):Play()
        end)
        task.delay(2.25, function() --[[ Line: 93 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            u21:DoCleaning()
        end)
    end)
    u21:GiveTask(function() --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        return u29:cancel()
    end)
    return u21
end
return u14