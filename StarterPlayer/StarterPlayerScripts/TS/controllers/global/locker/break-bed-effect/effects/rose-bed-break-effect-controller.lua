local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "RoseBedBreakEffectController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
    --]]
    u11.constructor(p15, u9.ROSE)
    p15.Name = "RoseBedBreakEffectController"
end
function u12.KnitStart(p16) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p16)
end
function u12.onBedBreak(u17, _, u18, u19, _) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u6
        [4] = u2
        [5] = u10
        [6] = u8
        [7] = u4
    --]]
    u17.maid:GiveTask(task.spawn(function() --[[ Line: 35 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u19
            [3] = u17
            [4] = u18
            [5] = u7
            [6] = u6
            [7] = u2
            [8] = u10
            [9] = u8
            [10] = u4
        --]]
        local u20 = u3.Controllers.BreakBedEffectUtilController:createBedClone(u19)
        u17.maid:GiveTask(u20)
        if u20 then
            u20.Name = "BedBreakEffectBedClone"
            u20:PivotTo(u18)
            u20.Parent = u7
            for v21, v22 in u20:GetDescendants() do
                local _ = v21 - 1
                if v22:IsA("MeshPart") then
                    v22.LocalTransparencyModifier = 0.5
                end
            end
            task.delay(5, function() --[[ Line: 51 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:Destroy()
            end)
        end
        local u23 = u6.Assets.Effects.RoseBedBreakEffect:Clone()
        u23:PivotTo(u18)
        u23.Parent = u7
        local u24 = u23.PrimaryPart
        if u24 ~= nil then
            u24 = u24:WaitForChild("Model", 1)
            if u24 ~= nil then
                u24 = u24:GetChildren()
            end
        end
        if not u24 then
            return nil
        end
        u2:playSound(u10.FLOWER_BLOOM, {
            ["position"] = u18.Position
        })
        local function v29(u25) --[[ Line: 72 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
            --]]
            local v26 = u25.Size
            local v27 = u25.Size * math.random(1.5, 3)
            u8(math.random(1, 2), u4, function(p28) --[[ Line: 77 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25.Size = p28
            end, v26, v27)
        end
        for v30, v31 in u24 do
            v29(v31, v30 - 1, u24)
        end
        task.delay(2.5, function() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u24
                [4] = u23
                [5] = u20
            --]]
            local function v35(u32) --[[ Line: 91 ]]
                --[[
                Upvalues:
                    [1] = u8
                    [2] = u4
                --]]
                local v33 = u32:FindFirstChildOfClass("ParticleEmitter")
                if v33 then
                    v33:Emit(5)
                end
                u8(0.5, u4, function(p34) --[[ Line: 96 ]]
                    --[[
                    Upvalues:
                        [1] = u32
                    --]]
                    u32.Transparency = p34
                end, 0, 1)
            end
            for v36, v37 in u24 do
                v35(v37, v36 - 1, u24)
            end
            local u38 = u23.PrimaryPart
            if u38 ~= nil then
                u38 = u38:FindFirstChild("Flower_Bouquet")
            end
            if u38 then
                u8(0.5, u4, function(p39) --[[ Line: 109 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                    --]]
                    u38.Transparency = p39
                end, 0, 1)
            end
            u20:Destroy()
        end)
        task.delay(5, function() --[[ Line: 115 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23:Destroy()
        end)
    end))
end
u3.CreateController(u12.new())
return nil