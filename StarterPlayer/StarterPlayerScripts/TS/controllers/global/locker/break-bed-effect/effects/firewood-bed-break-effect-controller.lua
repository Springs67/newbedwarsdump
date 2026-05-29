local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.RandomUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.Debris
local u10 = v8.ReplicatedStorage
local u11 = v8.RunService
local u12 = v8.TweenService
local u13 = v8.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u16 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u17 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 22 ]]
        return "FirewoodBedBreakEffectController"
    end,
    ["__index"] = u16
})
u17.__index = u17
function u17.new(...) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    local v18 = u17
    local v19 = setmetatable({}, v18)
    return v19:constructor(...) or v19
end
function u17.constructor(p20) --[[ Line: 32 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u14
    --]]
    u16.constructor(p20, u14.FIREWOOD)
    p20.Name = "FirewoodBedBreakEffectController"
end
function u17.KnitStart(p21) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    u16.KnitStart(p21)
end
function u17.onBedBreak(u22, _, p23, p24) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u13
        [4] = u5
        [5] = u12
        [6] = u11
        [7] = u4
        [8] = u15
    --]]
    local u25 = u6.new()
    u22.maid:GiveTask(u25)
    local u26 = u10.Assets.Misc.StoneAxe:Clone()
    u26:PivotTo(p23 + Vector3.new(-9, 4, 1))
    u26:ScaleTo(5)
    u26.Parent = u13
    u25:GiveTask(u26)
    local u27 = u10.Assets.Misc.Logs:Clone()
    u27:PivotTo(p23)
    u27.Parent = u13
    u25:GiveTask(u27)
    local v28 = 0
    local u29 = {}
    for v30, v31 in u27.logs:GetDescendants() do
        local _ = v30 - 1
        if v31:IsA("BasePart") == true then
            v28 = v28 + 1
            u29[v28] = v31
        end
    end
    table.sort(u29, function(p32, p33) --[[ Line: 68 ]]
        return p32.Name > p33.Name
    end)
    for v34, v35 in u29 do
        local _ = v34 - 1
        v35.Transparency = 1
    end
    for v36, v37 in u27.fire:GetDescendants() do
        local _ = v36 - 1
        if v37:IsA("ParticleEmitter") then
            v37.Enabled = false
        end
    end
    local u38 = u5.Controllers.BreakBedEffectUtilController:createBedClone(p24)
    if u38 then
        u38.Name = "BedBreakEffectBedClone"
        u38:PivotTo(p23)
        u38.Parent = u13
        u25:GiveTask(u38)
        local v39 = u38:GetDescendants()
        local function v41(p40) --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u12
                [2] = u25
                [3] = u38
            --]]
            if p40:IsA("MeshPart") then
                u12:Create(p40, TweenInfo.new(2.356194490192345), {
                    ["Transparency"] = 1
                }):Play()
                u25:GiveTask(task.delay(2.356194490192345, function() --[[ Line: 102 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    u38:Destroy()
                end))
            end
        end
        for v42, v43 in v39 do
            v41(v43, v42 - 1, v39)
        end
        u25:GiveTask(task.spawn(function() --[[ Line: 110 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u25
                [3] = u11
                [4] = u29
                [5] = u12
                [6] = u22
                [7] = u4
                [8] = u15
                [9] = u27
            --]]
            task.wait(0.39269908169872414)
            local u44 = u38:GetPivot()
            local u45 = true
            u25:GiveTask(task.delay(2.356194490192345, function() --[[ Line: 114 ]]
                --[[
                Upvalues:
                    [1] = u45
                --]]
                u45 = false
            end))
            while u45 do
                local u46 = 0
                local u47 = nil
                u47 = u11.Heartbeat:Connect(function(p48) --[[ Line: 120 ]]
                    --[[
                    Upvalues:
                        [1] = u46
                        [2] = u38
                        [3] = u44
                        [4] = u47
                    --]]
                    u46 = u46 + p48
                    local v49 = 0.7853981633974483 - u46 + 1.5
                    local v50 = math.pow(v49, 4)
                    local v51 = math.sin(v50) / 2 * 0.25
                    u38:PivotTo(u44 + Vector3.new(v51, v51, v51))
                    if u46 >= 0.7853981633974483 then
                        u47:Disconnect()
                    end
                end)
                u25:GiveTask(u47)
                local v52 = #u29
                local v53 = u29[v52]
                u29[v52] = nil
                if v53 then
                    u12:Create(v53, TweenInfo.new(0.5), {
                        ["Transparency"] = 0
                    }):Play()
                end
                u22:spawnDebris(math.random(8, 12), math.random() * 0.25 + 0.25, u38:GetPivot().Position, 2, 1)
                u25:GiveTask(u4:playSound(u15.WOOD_BREAK, {
                    ["position"] = u38:GetPivot().Position
                }))
                task.wait(0.7853981633974483)
            end
            for v54, v55 in u27.fire:GetDescendants() do
                local _ = v54 - 1
                if v55:IsA("ParticleEmitter") then
                    v55.Enabled = true
                end
            end
            u25:GiveTask(u4:playSound(u15.FIRE_START, {
                ["position"] = u38:GetPivot().Position
            }))
            u25:GiveTask(u4:playSound(u15.FIRE_LOOP, {
                ["looped"] = true,
                ["position"] = u38:GetPivot().Position
            }))
        end))
    end
    local u56 = 0
    local u64 = u11.Heartbeat:Connect(function(p57) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u26
        --]]
        u56 = u56 + p57
        local v58 = CFrame.new(u26.Part.CFrame.Position)
        local v59 = CFrame.Angles
        local v60 = u56 * 4
        local v61 = math.sin(v60)
        local v62 = math.pow(v61, 4) * -90
        local v63 = v59(0, 0, (math.rad(v62)))
        u26.Part.CFrame = v58 * v63
    end)
    u25:GiveTask(u64)
    u25:GiveTask(task.delay(2.356194490192345, function() --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u26
            [3] = u64
        --]]
        u12:Create(u26.Handle, TweenInfo.new(1), {
            ["Transparency"] = 1
        }):Play()
        u64:Disconnect()
        task.delay(1, function() --[[ Line: 179 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            u26:Destroy()
        end)
    end))
end
function u17.spawnDebris(_, p65, p66, p67, p68, p69) --[[ Line: 184 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u13
        [3] = u7
        [4] = u12
        [5] = u9
    --]]
    local v70 = { Color3.fromRGB(237, 189, 135), Color3.fromRGB(171, 140, 105), Color3.fromRGB(199, 135, 64) }
    local v71 = false
    local v72 = 0
    while true do
        if v71 then
            v72 = v72 + 1
        else
            v71 = true
        end
        if v72 >= p65 then
            return
        end
        local v73 = u7("Part", {
            ["Anchored"] = false,
            ["Size"] = Vector3.new(p66, p66, p66),
            ["CFrame"] = CFrame.new(p67) * CFrame.Angles(math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793, math.random() * 2 * 3.141592653589793),
            ["CanCollide"] = false,
            ["Color"] = u3.fromList(unpack(v70)),
            ["Parent"] = u13
        })
        local v74 = (math.random() - 0.5) * p68
        local v75 = (math.random() - 0.5) * p68
        local v76 = (math.random() - 0.5) * p68
        v73:ApplyImpulse((Vector3.new(v74, v75, v76)))
        u12:Create(v73, TweenInfo.new(p69, Enum.EasingStyle.Linear), {
            ["Transparency"] = 1
        }):Play()
        u9:AddItem(v73, p69)
    end
end
u5.CreateController(u17.new())
return nil