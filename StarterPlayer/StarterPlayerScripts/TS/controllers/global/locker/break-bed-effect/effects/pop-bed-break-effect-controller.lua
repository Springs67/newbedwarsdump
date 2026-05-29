local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.RunService
local u9 = v6.Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u13 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u14 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 45 ]]
        return "PopBreakEffectController"
    end,
    ["__index"] = u13
})
u14.__index = u14
function u14.new(...) --[[ Line: 51 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v15 = u14
    local v16 = setmetatable({}, v15)
    return v16:constructor(...) or v16
end
function u14.constructor(p17) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u10
        [3] = u5
    --]]
    u13.constructor(p17, u10.POP)
    p17.Name = "PopBreakEffectController"
    p17.tweenMaid = u5.new()
end
function u14.KnitStart(p18) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    u13.KnitStart(p18)
end
function u14.onBedBreak(u19, _, u20, u21, u22) --[[ Line: 63 ]]
    task.spawn(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u20
            [3] = u22
            [4] = u21
        --]]
        u19:createEffect(u20, u22, u21)
    end)
end
function u14.createEffect(u23, u24, u25, p26) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u9
        [3] = u2
        [4] = u11
        [5] = u8
        [6] = u4
        [7] = u7
        [8] = u12
    --]]
    local u27 = true
    u23.maid:GiveTask(function() --[[ Line: 70 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27 = false
    end)
    u23.maid:GiveTask(u23.tweenMaid)
    local v28 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p26)
    if not v28 then
        return nil
    end
    v28.Name = "BedBreakEffectBedClone"
    v28:PivotTo(u24)
    v28.Parent = u9
    u23.maid:GiveTask(v28)
    local u29 = u2:playSound(u11.BED_INFLATE_SOUND, {
        ["position"] = u25
    })
    if u29 then
        u23.tweenMaid:GiveTask(function() --[[ Line: 96 ]]
            --[[
            Upvalues:
                [1] = u29
            --]]
            return u29:Destroy()
        end)
    end
    local v30 = v28:FindFirstChild("Root")
    if not v30 then
        v28:Destroy()
        return nil
    end
    local u31
    if v30:IsA("Model") then
        u31 = v30:GetPivot()
    elseif v30:IsA("BasePart") then
        u31 = v30.CFrame
    else
        error("[PopBreakEffect] Root must be Model or BasePart")
        u31 = nil
    end
    local u32 = {}
    for v33, v34 in v30:GetChildren() do
        local _ = v33 - 1
        if v34:IsA("BasePart") then
            u32[v34] = {
                ["initialSize"] = v34.Size,
                ["initialLocalCFrame"] = u31:ToObjectSpace(v34.CFrame)
            }
        end
    end
    local u35 = 0
    local v81 = u8.Heartbeat:Connect(function(p36) --[[ Line: 123 ]]
        --[[
        Upvalues:
            [1] = u35
            [2] = u4
            [3] = u31
            [4] = u24
            [5] = u32
        --]]
        u35 = u35 + p36
        local v37 = u35 / 3
        local v38 = math.min(1, v37)
        local v39 = u35
        local v40 = u4(math.min(v39, 3), 0, 1, 3)
        local u41 = math.lerp(1, 1.5, v40)
        local u42 = math.lerp(1, 3.5, v40)
        local u43 = math.lerp(1, 1.5, v40)
        local v44 = math.lerp(0, 0.5, v38)
        local v45 = math.pow(v38, 2.2)
        local v46 = math.pow(v38, 2.4)
        local v47 = v45 * math.lerp(1, 0.82, v46)
        local v48 = math.lerp(2.2, 22, v47)
        local v49 = math.lerp(0.042, 0.24, v47)
        local v50 = math.lerp(0.0020943951023931952, 0.01832595714594046, v47)
        local v51 = u35
        local v52 = CFrame.new
        local v53 = v51 * v48 * 1.07
        local v54 = math.sin(v53) * v49
        local v55 = v51 * v48 * 0.93
        local v56 = math.cos(v55) * v49 * 0.55 + v44
        local v57 = v51 * v48 * 0.71 + 1.2
        local v58 = v52(v54, v56, math.sin(v57) * v49)
        local v59 = CFrame.Angles
        local v60 = v51 * v48 * 1.21
        local v61 = math.cos(v60) * v50 * 0.5
        local v62 = v51 * v48 * 0.88
        local v63 = math.sin(v62) * v50 * 0.5
        local v64 = v51 * v48 * 0.76 + 0.5
        local u65 = v58 * v59(v61, v63, math.cos(v64) * v50 * 0.5)
        local function v78(p66, p67) --[[ Line: 142 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u42
                [3] = u43
                [4] = u31
                [5] = u24
                [6] = u65
            --]]
            local v68 = p66.initialLocalCFrame
            local v69 = v68.Position
            local v70 = v69.X * u41
            local v71 = v69.Y * u42
            local v72 = v69.Z * u43
            local v73 = Vector3.new(v70, v71, v72)
            local v74 = v68 - v68.Position
            p67.CFrame = u24:ToWorldSpace(u65 * u24:ToObjectSpace((u31:ToWorldSpace(CFrame.new(v73) * v74))))
            local v75 = p66.initialSize.X * u41
            local v76 = p66.initialSize.Y * u42
            local v77 = p66.initialSize.Z * u43
            p67.Size = Vector3.new(v75, v76, v77)
        end
        for v79, v80 in u32 do
            v78(v80, v79, u32)
        end
    end)
    u23.tweenMaid:GiveTask(v81)
    task.delay(2.7, function() --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u2
            [3] = u11
            [4] = u25
            [5] = u7
            [6] = u9
            [7] = u12
        --]]
        local v82 = u29
        if v82 ~= nil then
            v82:Stop()
        end
        local v83 = {
            ["position"] = u25
        }
        u2:playSound(u11.BED_POP_SOUND, v83)
        local v84 = u7.Assets.Effects.BedPopExplosion:Clone()
        v84.Parent = u9
        v84.CFrame = CFrame.new(u25)
        u12:playEffects({ v84 }, nil, {
            ["sizeMultiplier"] = 2,
            ["destroyAfterSec"] = 3
        })
    end)
    task.wait(2.8499999999999996)
    v81:Disconnect()
    v28:Destroy()
    u23.maid:GiveTask(task.spawn(function() --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u23
        --]]
        task.wait(10)
        u23.tweenMaid:DoCleaning()
        u23.maid:DoCleaning()
    end))
end
u3.CreateController(u14.new())
return nil