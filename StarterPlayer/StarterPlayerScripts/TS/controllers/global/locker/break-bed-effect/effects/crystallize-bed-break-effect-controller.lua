local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.OutExpo
local u6 = v4.OutQuad
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u8 = v7.ReplicatedStorage
local u9 = v7.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u14 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "CrystallizeBreakEffectController"
    end,
    ["__index"] = u14
})
u15.__index = u15
function u15.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v16 = u15
    local v17 = setmetatable({}, v16)
    return v17:constructor(...) or v17
end
function u15.constructor(p18) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u11
    --]]
    u14.constructor(p18, u11.CRYSTALLIZE)
    p18.Name = "CrystallizeBedBreakEffectController"
end
function u15.KnitStart(p19) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onBedBreak(p20, _, p21, p22, p23) --[[ Line: 40 ]]
    p20:createEffect(p21, p23, p22)
end
function u15.createEffect(u24, u25, u26, u27) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u8
        [4] = u2
        [5] = u12
        [6] = u10
        [7] = u5
        [8] = u6
        [9] = u13
    --]]
    u24.maid:GiveTask(task.spawn(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u27
            [3] = u24
            [4] = u25
            [5] = u9
        --]]
        local u28 = u3.Controllers.BreakBedEffectUtilController:createBedClone(u27)
        u24.maid:GiveTask(u28)
        if u28 then
            u28.Name = "BedBreakEffectBedClone"
            u28:PivotTo(u25)
            u28.Parent = u9
            for v29, v30 in u28:GetDescendants() do
                local _ = v29 - 1
                if v30:IsA("MeshPart") then
                    v30.LocalTransparencyModifier = 0.5
                end
            end
            task.delay(2.5, function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:Destroy()
            end)
        end
    end))
    local u31 = u8.Assets.Effects.CrystallizeBedEffect:Clone()
    u31.Parent = u9
    local u32 = { u31.Root.PurpleCrystal, u31.Root.LightCrystal, u31.Root.MiddleCrystal }
    for v33, v34 in u31:GetDescendants() do
        local _ = v33 - 1
        if v34:IsA("MeshPart") then
            v34.Transparency = 1
        elseif v34:IsA("Decal") then
            v34.Transparency = 1
        end
    end
    u31:PivotTo(u25)
    u24.maid:GiveTask(u31)
    u24.maid:GiveTask(u2:playSound(u12.CRYSTALLIZE_BED, {
        ["rollOffMinDistance"] = 10,
        ["rollOffMaxDistance"] = 40,
        ["looped"] = false,
        ["position"] = u26
    }))
    u24.maid:GiveTask(task.spawn(function() --[[ Line: 90 ]]
        --[[
        Upvalues:
            [1] = u32
            [2] = u2
            [3] = u12
            [4] = u10
            [5] = u5
        --]]
        for v35, v36 in u32 do
            local _ = v35 - 1
            v36.Position = v36.Position - Vector3.new(0, 6, 0)
        end
        task.wait(1)
        for v37, u38 in u32 do
            local _ = v37 - 1
            task.spawn(function() --[[ Line: 101 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u2
                    [3] = u12
                    [4] = u10
                    [5] = u5
                --]]
                u38.Transparency = 0
                for v39, v40 in u38:GetDescendants() do
                    local _ = v39 - 1
                    if v40:IsA("Decal") then
                        v40.Transparency = 0
                    end
                end
                task.delay(0.2, function() --[[ Line: 112 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u12
                        [3] = u38
                    --]]
                    u2:playSound(u12.CRYSTAL_BED_IMPALE, {
                        ["rollOffMinDistance"] = 10,
                        ["rollOffMaxDistance"] = 40,
                        ["looped"] = false,
                        ["position"] = u38.Position
                    })
                end)
                u10(1, u5, function(p41) --[[ Line: 120 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    u38.Position = p41
                end, u38.Position, u38.Position + Vector3.new(0, 6, 0)):Play()
            end)
            task.wait(0.35)
        end
    end))
    for v42, u43 in u31:GetDescendants() do
        local _ = v42 - 1
        u24.maid:GiveTask(task.spawn(function() --[[ Line: 137 ]]
            --[[
            Upvalues:
                [1] = u43
                [2] = u32
                [3] = u10
                [4] = u6
            --]]
            local v44 = u43:IsA("MeshPart")
            if v44 then
                local v45 = u43
                local v46 = table.find(u32, v45) ~= nil
                v44 = not v46
            end
            if v44 then
                u43.Transparency = 1
                u10(1.5, u6, function(p47) --[[ Line: 145 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    if u43:IsA("BasePart") then
                        u43.Transparency = p47
                    end
                end, 1, u43.Name == "BedCover" and 0.7 or 0):Play()
            elseif u43:IsA("Decal") then
                u43.Transparency = 1
                u10(1.5, u6, function(p48) --[[ Line: 152 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                    --]]
                    if u43:IsA("Decal") then
                        u43.Transparency = p48
                    end
                end, 1, 0):Play()
            end
        end))
    end
    u24.maid:GiveTask(task.delay(2.5, function() --[[ Line: 164 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u2
            [3] = u12
            [4] = u26
            [5] = u31
            [6] = u8
            [7] = u9
            [8] = u13
        --]]
        local v49 = {
            ["rollOffMinDistance"] = 10,
            ["rollOffMaxDistance"] = 40,
            ["looped"] = false,
            ["position"] = u26
        }
        u24.maid:GiveTask(u2:playSound(u12.CRYSTALLIZE_BED_BREAK, v49))
        local _ = {
            Color3.fromRGB(250, 98, 255),
            Color3.fromRGB(225, 116, 232),
            Color3.fromRGB(149, 101, 212),
            Color3.fromRGB(255, 206, 255),
            Color3.fromRGB(163, 86, 221),
            Color3.fromRGB(241, 73, 253)
        }
        local v50 = u31:GetDescendants()
        local function v54(u51) --[[ Line: 174 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u9
                [3] = u24
                [4] = u13
            --]]
            if u51:IsA("MeshPart") then
                if u51.Name == "SmallCrystal" then
                    u51.Anchored = false
                    local v52 = u8.Assets.Effects.CrystalExplosion:Clone()
                    v52:PivotTo(CFrame.new(u51.Position))
                    v52.Parent = u9
                    u24.maid:GiveTask(v52)
                    u13:playEffects(v52:GetChildren(), nil, {
                        ["sizeMultiplier"] = u51.Size.X / 2
                    })
                    task.delay(0.6, function() --[[ Line: 197 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                        --]]
                        u51:Destroy()
                    end)
                    return
                end
                local v53 = u8.Assets.Effects.CrystalExplosion:Clone()
                v53:PivotTo(CFrame.new(u51.Position))
                v53.Parent = u9
                u24.maid:GiveTask(v53)
                u13:playEffects(v53:GetChildren(), nil, {
                    ["sizeMultiplier"] = u51.Size.X / 2
                })
                u51:Destroy()
            end
        end
        for v55, v56 in v50 do
            v54(v56, v55 - 1, v50)
        end
    end))
    u24.maid:GiveTask(task.delay(4, function() --[[ Line: 216 ]]
        --[[
        Upvalues:
            [1] = u31
        --]]
        u31:Destroy()
        u31.Parent = nil
    end))
end
u3.CreateController(u15.new())
return nil