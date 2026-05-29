local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.ReplicatedStorage
local u8 = v6.Workspace
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "firework", "firework-effect-type").FireworkType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u15 = v1.import(script, script.Parent.Parent, "break-bed-effect-util-controller").BedBreakBedType
local u16 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 21 ]]
        return "FireworkBedBreakEffectController"
    end,
    ["__index"] = u14
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
function u16.constructor(p19) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u12
    --]]
    u14.constructor(p19, u12.FIREWORK)
    p19.Name = "FireworkBedBreakEffectController"
end
function u16.KnitStart(p20) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.KnitStart(p20)
end
function u16.onBedBreak(u21, _, u22, p23, p24) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u15
        [3] = u8
        [4] = u7
        [5] = u11
        [6] = u5
        [7] = u2
        [8] = u13
        [9] = u9
        [10] = u4
        [11] = u10
    --]]
    local u25 = u3.Controllers.BreakBedEffectUtilController:createBedClone(p23, u15.SPIN)
    if u25 then
        u25.Name = "BedBreakEffectBedClone"
        u25:PivotTo(u22)
        u25.Parent = u8
        u21.maid:GiveTask(u25)
        local v26 = u25.PrimaryPart
        local v27 = v26.Rotation.Y == 0 and true or v26.Rotation.Y == 180
        local v28 = v27 and 1.5 or 3
        local v29 = v27 and 3 or 1.5
        local v30 = {}
        local v31 = Vector3.new(v28, 0, v29)
        local v32 = -v28
        local v33 = Vector3.new(v32, 0, v29)
        local v34 = -v29
        local v35 = Vector3.new(v28, 0, v34)
        local v36 = -v28
        local v37 = -v29
        __set_list(v30, 1, {v31, v33, v35, (Vector3.new(v36, 0, v37))})
        local v38 = false
        local v39 = 0
        while true do
            if true then
                if v38 then
                    v39 = v39 + 1
                else
                    v38 = true
                end
            end
            if v39 >= 4 then
                break
            end
            local v40 = u7:FindFirstChild("Items")
            if v40 ~= nil then
                v40 = v40:FindFirstChild(u11.STICKY_FIREWORK)
                if v40 ~= nil then
                    v40 = v40:FindFirstChild("Handle")
                    if v40 ~= nil then
                        v40 = v40:Clone()
                    end
                end
            end
            if v40 then
                v40.Parent = u25
                local v41 = v30[v39 + 1]
                v40:PivotTo(CFrame.new(u25.PrimaryPart.Position + v41))
                u5("WeldConstraint", {
                    ["Part0"] = v40,
                    ["Part1"] = u25.PrimaryPart,
                    ["Parent"] = v40
                })
                local v42 = v40:FindFirstChildWhichIsA("ParticleEmitter")
                if v42 then
                    v42.Enabled = true
                end
            end
        end
        u2:playSound(u13.FIREWORK_LAUNCH, {
            ["position"] = u22.Position
        })
        local v43 = u2:playSound(u13.FIREWORK_TRAIL, {
            ["looped"] = true,
            ["position"] = u22.Position
        })
        if v43 then
            u21.maid:GiveTask(v43)
        end
        local _ = u22.Position + Vector3.new(0, 15, 0)
        u25.WorldPivot = u22 - p24
        u9(2, u4, function(p44) --[[ Line: 106 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u22
            --]]
            local v45 = u25
            local v46 = u22
            local v47 = 10 * p44
            local v48 = math.sin(v47) * 10
            local v49 = 15 * p44
            local v50 = 10 * p44
            local v51 = math.cos(v50) * 10
            local v52 = Vector3.new(v48, v49, v51)
            local v53 = CFrame.Angles(0, p44 * 6 * 3.141592653589793, 0)
            v45:PivotTo((v46 + v52) * v53)
            local v54 = u25
            local v55 = 1 - p44 * 0.7
            v54:ScaleTo(math.max(0, v55) + 0.3)
        end, 0, 1)
        task.delay(2, function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u25
                [3] = u2
                [4] = u13
                [5] = u3
                [6] = u10
            --]]
            u21:createBedDebris(u25.PrimaryPart, true)
            local v56 = u2
            local v57 = u13.GOO_SPLAT
            local v58 = {}
            local v59 = u25.PrimaryPart
            if v59 ~= nil then
                v59 = v59.Position
            end
            v58.position = v59
            v58.rollOffMaxDistance = 45
            v56:playSound(v57, v58)
            u3.Controllers.FireworkController:playFireworkEffect(u25.PrimaryPart.Position, u10.NORMAL)
            u25:Destroy()
        end)
    end
end
u3.CreateController(u16.new())
return nil