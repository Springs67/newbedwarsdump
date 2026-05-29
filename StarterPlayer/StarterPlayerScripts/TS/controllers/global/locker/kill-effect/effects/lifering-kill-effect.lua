local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u3 = v2.InExpo
local u4 = v2.Linear
local u5 = v2.OutExpo
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u13 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u14 = Random.new()
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "LiferingKillEffect"
    end,
    ["__index"] = u13
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
function u15.constructor(p18, p19) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.constructor(p18, p19)
    u13.setPlayDefaultKillEffect(p18, false)
end
function u15.onKill(p20, _, p21, u22) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u10
        [3] = u13
        [4] = u7
        [5] = u9
        [6] = u14
        [7] = u11
        [8] = u5
        [9] = u12
        [10] = u4
        [11] = u3
    --]]
    local v23 = u6.new()
    p21.Archivable = true
    local u24 = p21:Clone()
    u24.HumanoidRootPart.Anchored = true
    u24:PivotTo(u22)
    u24.Parent = u10
    u13.hideCharacter(p20, p21)
    v23:GiveTask(u24)
    local u25 = u7("Attachment", {
        ["WorldPosition"] = u22.Position + Vector3.new(0, 100, 0),
        ["Parent"] = u10.Terrain
    })
    v23:GiveTask(u25)
    local u26 = u9.Assets.Misc.LifeRing:Clone()
    u26.Parent = u10
    u26:PivotTo(u22 * CFrame.new(0, 100, 0))
    local u27 = u26.PrimaryPart
    local v28 = u7
    local v29 = {}
    local v30 = u14:NextNumber(-1, 1) * 1.5
    local v31 = u14:NextNumber(-1, 1) * 1.5
    v29.Position = Vector3.new(v30, 0, v31)
    v29.Parent = u27
    local v32 = v28("Attachment", v29)
    local v33 = u7
    local v34 = {}
    local v35 = u14:NextNumber(-1, 1) * 1.5
    local v36 = u14:NextNumber(-1, 1) * 1.5
    v34.Position = Vector3.new(v35, 0, v36)
    v34.Parent = u27
    local v37 = v33("Attachment", v34)
    v23:GiveTask(u26)
    local v38 = u7
    local v39 = {}
    local v40 = u27.AssemblyMass * 50
    v39.Force = Vector3.new(0, v40, 0)
    v39.Parent = u27
    local u41 = v38("BodyForce", v39)
    local u42 = u7("SpringConstraint", {
        ["Visible"] = true,
        ["Stiffness"] = 500,
        ["Damping"] = 20,
        ["FreeLength"] = 10,
        ["Attachment0"] = u25,
        ["Attachment1"] = v32,
        ["Parent"] = u27
    })
    local u43 = u7("SpringConstraint", {
        ["Visible"] = true,
        ["Stiffness"] = 500,
        ["Damping"] = 20,
        ["FreeLength"] = 10,
        ["Attachment0"] = u25,
        ["Attachment1"] = v37,
        ["Parent"] = u27
    })
    v23:GiveTask(u42)
    v23:GiveTask(u43)
    task.spawn(function() --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u5
            [3] = u26
            [4] = u27
            [5] = u22
            [6] = u24
            [7] = u12
            [8] = u41
            [9] = u25
            [10] = u4
            [11] = u3
            [12] = u42
            [13] = u43
        --]]
        u11(2, u5, function(p44) --[[ Line: 92 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            if u26.PrimaryPart then
                u26:PivotTo(p44)
            end
        end, u27.CFrame, u22):Wait()
        for _, v45 in u24:GetDescendants() do
            if v45:IsA("BasePart") then
                v45.Anchored = false
            end
        end
        u12:weldParts(u24.PrimaryPart, u27)
        task.wait(2)
        u27.Anchored = false
        local v46 = u41
        local v47 = -1000 * u27.AssemblyMass
        v46.Force = Vector3.new(0, v47, 0)
        u11(2, u4, function(p48) --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u25
            --]]
            u25.WorldPosition = p48
        end, u25.WorldPosition, u25.WorldPosition + Vector3.new(0, 300, 0))
        u11(0.7, u3, function(p49) --[[ Line: 113 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u27
                [3] = u42
                [4] = u43
            --]]
            for _, v50 in u24:GetDescendants() do
                if v50:IsA("BasePart") or v50:IsA("Decal") then
                    v50.Transparency = p49
                end
            end
            u27.Transparency = p49
            if p49 > 0.5 then
                u42.Visible = false
                u43.Visible = false
            end
        end, 0, 1)
    end)
    return v23
end
return u15