local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u5 = v4.InExpo
local u6 = v4.OutExpo
local u7 = v4.OutQuart
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u9 = v8.ReplicatedStorage
local u10 = v8.Workspace
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u15 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "VoidPortalBedBreakEffectController"
    end,
    ["__index"] = u14
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
function u15.constructor(p18) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
    --]]
    u14.constructor(p18, u12.VOID_PORTAL)
    p18.Name = "VoidPortalBedBreakEffectController"
end
function u15.KnitStart(p19) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p19)
end
function u15.onBedBreak(p20, _, p21, p22, _) --[[ Line: 37 ]]
    p20:createEffect(p21, p22)
end
function u15.createEffect(u23, u24, u25) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u10
        [3] = u9
        [4] = u11
        [5] = u7
        [6] = u5
        [7] = u6
        [8] = u2
        [9] = u13
    --]]
    u23.maid:GiveTask(task.spawn(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u25
            [3] = u23
            [4] = u24
            [5] = u10
            [6] = u9
            [7] = u11
            [8] = u7
            [9] = u5
            [10] = u6
        --]]
        local u26 = u3.Controllers.BreakBedEffectUtilController:createBedClone(u25)
        u23.maid:GiveTask(u26)
        if u26 then
            u26.Name = "BedBreakEffectBedClone"
            u26:PivotTo(u24)
            u26.Parent = u10
            local u27 = u9.Assets.Effects.VoidBedParticles:Clone()
            for v28, v29 in u27:GetDescendants() do
                local _ = v28 - 1
                v29.Parent = u26:WaitForChild("Bed", 1)
            end
            u23.maid:GiveTask(task.delay(5, function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u26
                --]]
                u27:Destroy()
                u26:Destroy()
            end))
            u23.maid:GiveTask(task.spawn(function() --[[ Line: 60 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u7
                    [3] = u26
                    [4] = u5
                --]]
                u11(2, u7, function(p30) --[[ Line: 61 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26:ScaleTo(p30)
                end, 1, 1.5):Wait()
                u11(1.5, u5, function(p31) --[[ Line: 65 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26:ScaleTo(p31)
                end, 1.5, 0.01):Play()
            end))
            u23.maid:GiveTask(task.spawn(function() --[[ Line: 71 ]]
                --[[
                Upvalues:
                    [1] = u26
                    [2] = u11
                    [3] = u6
                --]]
                local function v33(p32) --[[ Line: 72 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26:PivotTo(p32)
                end
                local v34 = u26:GetPivot()
                local v35 = u26:GetPivot()
                local v36 = CFrame.Angles(5.235987755982989, 1.7453292519943295, 5.235987755982989)
                u11(2.25, u6, v33, v34, (v35 + Vector3.new(0, 4, 0)) * v36):Wait()
                local function v38(p37) --[[ Line: 81 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    u26:PivotTo(p37)
                end
                local v39 = u26:GetPivot()
                local v40 = u26:GetPivot()
                local v41 = CFrame.Angles(-1.7453292519943295, -0.8726646259971648, -5.235987755982989)
                u11(0.75, u6, v38, v39, (v40 - Vector3.new(0, 7, 0)) * v41):Play()
            end))
            u23.maid:GiveTask(task.delay(2.5, function() --[[ Line: 92 ]]
                --[[
                Upvalues:
                    [1] = u11
                    [2] = u6
                    [3] = u26
                --]]
                u11(1, u6, function(p42) --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                    --]]
                    for v43, v44 in u26:GetDescendants() do
                        local _ = v43 - 1
                        if v44:IsA("MeshPart") then
                            v44.LocalTransparencyModifier = p42
                        end
                    end
                end, 0, 1):Play()
            end))
        end
    end))
    local u45 = u9.Assets.Effects.BedVoidPortal:Clone()
    u45:PivotTo(u24 - Vector3.new(0, 0.5, 0))
    u23.maid:GiveTask(u45)
    local v46 = u45:GetDescendants()
    local function v50(u47) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u7
        --]]
        if u47:IsA("BasePart") then
            local v48 = u47.Size
            u47.Size = v48 * 0.01
            u11(0.3, u7, function(p49) --[[ Line: 120 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                u47.Size = p49
            end, v48 * 0.01, v48):Play()
        end
    end
    for v51, v52 in v46 do
        v50(v52, v51 - 1, v46)
    end
    u45.Parent = u10
    u23.maid:GiveTask(task.delay(0.2, function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u2
            [3] = u13
            [4] = u24
        --]]
        u23.maid:GiveTask(u2:playSound(u13.VOID_PORTAL_ENTER, {
            ["position"] = u24.Position
        }))
    end))
    u23.maid:GiveTask(task.delay(2.5, function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u2
            [3] = u13
            [4] = u24
        --]]
        u23.maid:GiveTask(u2:playSound(u13.VOID_PORTAL_TELEPORT, {
            ["position"] = u24.Position
        }))
    end))
    u23.maid:GiveTask(task.delay(5, function() --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:Destroy()
        u45.Parent = nil
    end))
end
u3.CreateController(u15.new())
return nil