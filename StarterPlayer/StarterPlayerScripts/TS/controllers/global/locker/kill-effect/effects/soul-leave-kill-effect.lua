local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u4 = v3.Linear
local u5 = v3.OutExpo
local u6 = v3.OutQuint
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.ReplicatedStorage
local u11 = v9.Workspace
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u15 = v1.import(script, script.Parent.Parent, "kill-effect").KillEffect
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "SoulLeaveKillEffect"
    end,
    ["__index"] = u15
})
u16.__index = u16
function u16.new(...) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    local v17 = u16
    local v18 = setmetatable({}, v17)
    return v18:constructor(...) or v18
end
function u16.constructor(p19, p20) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p19, p20)
    u15.setPlayDefaultKillEffect(p19, false)
end
function u16.onKill(u21, _, p22, p23) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u15
        [4] = u2
        [5] = u13
        [6] = u12
        [7] = u5
        [8] = u6
        [9] = u10
        [10] = u14
        [11] = u8
        [12] = u4
    --]]
    local u24 = u7.new()
    p22.Archivable = true
    local u25 = p22:Clone()
    u25.HumanoidRootPart.Anchored = true
    u25.Parent = u11
    u24:GiveTask(u25)
    u15.hideCharacter(u21, p22)
    u2:playSound(u13.GHOST_PILLAR_ERUPT, {
        ["position"] = u25:GetPivot().Position
    })
    local v26 = CFrame.new(0, -3, 0)
    local v27 = CFrame.Angles(1.5707963267948966, 0, 0)
    u12(0.5, u5, function(p28) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        return u25:PivotTo(p28)
    end, p23, p23 * v26 * v27)
    u12(0.7, u6, function(u29) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u25
        --]]
        local v30 = u25:GetDescendants()
        local function v32(p31) --[[ Line: 61 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            if p31:IsA("BasePart") and u29 > p31.Transparency then
                p31.Transparency = u29
                return
            elseif p31:IsA("GuiObject") then
                p31.Transparency = u29
                return
            elseif p31:IsA("UIStroke") then
                p31.Transparency = u29
            elseif p31:IsA("Decal") then
                p31.Transparency = u29
            end
        end
        for v33, v34 in v30 do
            v32(v34, v33 - 1, v30)
        end
    end, 0, 1)
    local v35 = u10.Assets.Effects.SoulLeaveKillEffect.DeathEffect:Clone()
    v35.Position = u25.PrimaryPart:GetPivot().Position
    v35.Parent = u25.PrimaryPart
    u14:playEffects({ v35 }, nil, {
        ["destroyAfterSec"] = 2.2
    })
    task.delay(0.5, function() --[[ Line: 84 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u24
            [3] = u25
            [4] = u8
            [5] = u11
            [6] = u21
            [7] = u12
            [8] = u4
        --]]
        local u36 = u10.Assets.Misc:FindFirstChild("GhostKillEffect")
        if u36 ~= nil then
            u36 = u36:Clone()
        end
        u24:GiveTask(u36)
        local v37 = u36:FindFirstChild("RootPart")
        local u38
        if v37 == nil then
            u38 = v37
        else
            u38 = v37:FindFirstChild("HeadAttachment")
        end
        local u39
        if u38 == nil then
            u39 = u38
        else
            u39 = u38.WorldCFrame + Vector3.new(0, 0, 0.1)
        end
        if not (v37 and u39) then
            return u24
        end
        local u40 = u25.Head:Clone()
        u40.Neck:Destroy()
        u40.Anchored = true
        u40:PivotTo(u39)
        u8("WeldConstraint", {
            ["Part0"] = v37,
            ["Part1"] = u40,
            ["Parent"] = u40
        })
        u40.Parent = u36
        u40.Transparency = 1
        local v41 = u25:GetChildren()
        local function v49(p42) --[[ Line: 123 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u8
                [3] = u40
            --]]
            if not p42:IsA("Accessory") then
                return nil
            end
            if p42.AccessoryType ~= Enum.AccessoryType.Hat and (p42.AccessoryType ~= Enum.AccessoryType.Hair and p42.AccessoryType ~= Enum.AccessoryType.Face) then
                return nil
            end
            if p42.AccessoryType == Enum.AccessoryType.Hat then
                local v43 = p42:FindFirstChildOfClass("MeshPart")
                if not v43 then
                    return nil
                end
                local v44 = { v43.Size.X, v43.Size.Y, v43.Size.Z }
                table.sort(v44, function(p45, p46) --[[ Line: 137 ]]
                    return p46 < p45
                end)
                if v44[1] > 3.5 then
                    return nil
                end
            end
            local v47 = p42:Clone()
            local v48 = v47:WaitForChild("Handle", 1)
            if v48 then
                v48.Name = v47.Name
                v48:PivotTo(u38.WorldCFrame)
                u8("WeldConstraint", {
                    ["Part0"] = v48,
                    ["Part1"] = u40,
                    ["Parent"] = v48
                })
                v48.Parent = u40
            end
        end
        for v50, v51 in v41 do
            v49(v51, v50 - 1, v41)
        end
        local v52 = u25:FindFirstChild("3DClothing") or u25:FindFirstChild("Clothing")
        local u53 = {
            "Hat",
            "Head",
            "Mesh/Hat",
            "Mesh/Face",
            "Mesh/Head",
            "Mesh/Hair",
            "Mesh/Eyes"
        }
        if v52 ~= nil then
            local v54 = v52:GetChildren()
            local function v58(p55) --[[ Line: 169 ]]
                --[[
                Upvalues:
                    [1] = u53
                    [2] = u40
                    [3] = u8
                    [4] = u39
                --]]
                local v56 = p55.Name
                if table.find(u53, v56) ~= nil then
                    local v57 = p55:Clone()
                    v57.Parent = u40
                    u8("WeldConstraint", {
                        ["Part0"] = v57,
                        ["Part1"] = u40,
                        ["Parent"] = v57
                    })
                    if u39 and v57 ~= nil then
                        v57:PivotTo(u39)
                    end
                end
            end
            for v59, v60 in v54 do
                v58(v60, v59 - 1, v54)
            end
        end
        for v61, v62 in u40:GetDescendants() do
            local _ = v61 - 1
            if v62:IsA("BasePart") or v62:IsA("Decal") then
                v62.Transparency = 0.5
            end
        end
        u36:PivotTo(u25.PrimaryPart:GetPivot())
        u36.Parent = u11
        local v63 = u21.killerPlayer.Character
        local v64 = CFrame
        local v65 = u36:GetPivot().Position
        local v66
        if v63 then
            local v67
            if v63 == nil then
                v67 = v63
            else
                v67 = v63.PrimaryPart
            end
            v66 = v67.Position
        else
            v66 = u36:GetPivot().LookVector
        end
        local v68 = v64.lookAt(v65, v66)
        local function v75(p69) --[[ Line: 218 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            local v70 = u36
            local v71 = p69.Y
            local v72 = math.sin(v71)
            local v73 = p69.Y
            local v74 = math.sin(v73)
            v70:PivotTo(p69 + Vector3.new(v72, 0, v74))
        end
        local v76 = CFrame
        local v77 = (u36:GetPivot() + Vector3.new(0, 9, 0)).Position
        local v78
        if v63 then
            if v63 ~= nil then
                v63 = v63.PrimaryPart
            end
            v78 = v63.Position
        else
            v78 = u36:GetPivot().LookVector
        end
        u12(2, u4, v75, v68, v76.lookAt(v77, v78))
        u12(2, u4, function(p79) --[[ Line: 240 ]]
            --[[
            Upvalues:
                [1] = u36
            --]]
            for v80, v81 in u36:GetDescendants() do
                local _ = v80 - 1
                if v81:IsA("BasePart") and v81.Transparency < p79 then
                    v81.Transparency = p79
                end
            end
        end, 0, 1)
        task.delay(3, function() --[[ Line: 251 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            u24:DoCleaning()
        end)
    end)
    return u24
end
return u16