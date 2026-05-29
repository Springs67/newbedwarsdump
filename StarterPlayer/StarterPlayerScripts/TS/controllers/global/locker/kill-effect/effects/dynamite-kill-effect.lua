local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.ReplicatedStorage
local u6 = v4.TweenService
local u7 = v4.Workspace
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u10 = u1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u11 = Color3.fromRGB(115, 115, 115)
local u12 = Color3.fromRGB(74, 74, 74)
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "DynamiteKillEffect"
    end,
    ["__index"] = u10
})
u13.__index = u13
function u13.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    local v14 = u13
    local v15 = setmetatable({}, v14)
    return v15:constructor(...) or v15
end
function u13.constructor(p16, p17) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    u10.constructor(p16, p17)
    u10.setPlayDefaultKillEffect(p16, false)
end
function u13.onKill(p18, _, p19, _) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u10
        [4] = u5
        [5] = u2
        [6] = u8
        [7] = u6
        [8] = u1
        [9] = u9
        [10] = u11
        [11] = u12
    --]]
    local u20 = u3.new()
    p19.Archivable = true
    local u21 = p19:Clone()
    u21.Parent = u7
    u20:GiveTask(u21)
    u10.hideCharacter(p18, p19)
    for v22, v23 in u21:GetDescendants() do
        local _ = v22 - 1
        if v23:IsA("Highlight") then
            v23:Destroy()
        end
    end
    local u24 = u5.Assets.Effects.DynamiteBundle:Clone()
    u24.Parent = u7
    u24:PivotTo(u21:GetPivot() + u21:GetPivot().LookVector.Unit * 1.2)
    u20:GiveTask(u24)
    local u25 = u2:playSound(u8.SPARKLER_LOOP, {
        ["looped"] = true,
        ["position"] = u21:GetPivot().Position
    })
    u20:GiveTask(u25)
    local v26 = u24:WaitForChild("Part"):WaitForChild("SparklerPos1")
    local v27 = u24:WaitForChild("Part"):WaitForChild("SparklerPos2")
    local u28 = u5.Assets.Effects.SparklerEffect:Clone()
    u28.Parent = u7
    u28:PivotTo(v26.WorldCFrame)
    u20:GiveTask(u28)
    u6:Create(u28, TweenInfo.new(0.9, Enum.EasingStyle.Linear), {
        ["Position"] = v27.WorldPosition
    }):Play()
    local u48 = u1.Promise.delay(0.9):andThen(function() --[[ Line: 74 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u7
            [3] = u21
            [4] = u20
            [5] = u2
            [6] = u8
            [7] = u9
            [8] = u25
            [9] = u28
            [10] = u24
            [11] = u11
            [12] = u12
            [13] = u6
        --]]
        local v29 = u5.Assets.Effects.DynamiteExplosion:Clone()
        v29.Parent = u7
        v29:PivotTo(u21:GetPivot())
        u20:GiveTask(v29)
        u20:GiveTask(u2:playSound(u8.INVISIBLE_LANDMINE_EXPLOSION, {
            ["volumeMultiplier"] = 0.8,
            ["position"] = u21:GetPivot().Position
        }))
        u9:playEffects(v29:GetDescendants(), nil, {
            ["destroyAfterSec"] = 4
        })
        u25:Destroy()
        u28:Destroy()
        u24:Destroy()
        local u30 = {}
        local u31 = {}
        local u32 = {}
        local u33 = {}
        local u34 = {}
        for _, v35 in u21:GetDescendants() do
            if v35:IsA("BasePart") then
                v35.Color = u11
                table.insert(u30, v35)
                if v35:IsA("MeshPart") and v35.TextureID ~= "" then
                    v35.Material = Enum.Material.Plastic
                    v35.TextureID = ""
                end
                if v35.Name == "LeftHand" or (v35.Name == "LeftFoot" or (v35.Name == "RightHand" or (v35.Name == "RightFoot" or (v35.Name == "UpperTorso" or v35.Name == "Head")))) then
                    local v36 = u5.Assets.Effects.DynamiteSmoke:Clone()
                    v36.Parent = v35
                    v36.Enabled = true
                    v36.LockedToPart = true
                    v36.Acceleration = Vector3.new(0, 5.5, 0)
                    table.insert(u31, v36)
                    u20:GiveTask(v36)
                end
            elseif v35:IsA("Texture") or (v35:IsA("Clothing") or v35:IsA("Decal")) then
                v35.Color3 = u12
                if v35:IsA("Texture") or v35:IsA("Decal") then
                    table.insert(u32, v35)
                end
            elseif v35:IsA("ParticleEmitter") or (v35:IsA("Trail") or v35:IsA("Beam")) then
                table.insert(u33, v35)
            elseif v35:IsA("WeldConstraint") or v35:IsA("Weld") then
                table.insert(u34, v35)
            end
        end
        task.delay(1.25, function() --[[ Line: 129 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u21
                [3] = u34
                [4] = u31
                [5] = u6
                [6] = u30
                [7] = u32
            --]]
            for v37, v38 in u33 do
                local _ = v37 - 1
                v38:Destroy()
            end
            u21:BreakJoints()
            for v39, v40 in u34 do
                local _ = v39 - 1
                if v40.Parent ~= nil then
                    v40:Destroy()
                end
            end
            local v41 = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            for v42, u43 in u31 do
                local _ = v42 - 1
                task.delay(1, function() --[[ Line: 149 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    u43.Enabled = false
                end)
            end
            for v44, v45 in u30 do
                local _ = v44 - 1
                u6:Create(v45, v41, {
                    ["Transparency"] = 1
                }):Play()
            end
            for v46, v47 in u32 do
                local _ = v46 - 1
                u6:Create(v47, v41, {
                    ["Transparency"] = 1
                }):Play()
            end
        end)
        task.delay(3.4, function() --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20:DoCleaning()
        end)
    end)
    u20:GiveTask(function() --[[ Line: 180 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        return u48:cancel()
    end)
    return u20
end
return u13