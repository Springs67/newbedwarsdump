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
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "FrozenBreakEffectController"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
    --]]
    u11.constructor(p15, u9.FROZEN)
    p15.Name = "FrozenBreakEffectController"
end
function u12.KnitStart(p16) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.KnitStart(p16)
end
function u12.onBedBreak(p17, _, p18, p19, p20) --[[ Line: 37 ]]
    p17:createEffect(p18, p20, p19)
end
function u12.createEffect(u21, u22, _, u23) --[[ Line: 40 ]]
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
    u21.maid:GiveTask(task.spawn(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u23
            [3] = u21
            [4] = u22
            [5] = u7
        --]]
        local u24 = u3.Controllers.BreakBedEffectUtilController:createBedClone(u23)
        u21.maid:GiveTask(u24)
        if u24 then
            u24.Name = "BedBreakEffectBedClone"
            u24:PivotTo(u22)
            u24.Parent = u7
            for v25, v26 in u24:GetDescendants() do
                local _ = v25 - 1
                if v26:IsA("MeshPart") then
                    v26.LocalTransparencyModifier = 0.5
                end
            end
            u21.maid:GiveTask(task.delay(3, function() --[[ Line: 57 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24:Destroy()
            end))
        end
    end))
    local u27 = u6.Assets.Effects.FrostBedEffect:Clone()
    local v28 = u27:FindFirstChild("Root")
    if not v28 then
        return nil
    end
    local u29 = v28:FindFirstChild("ice shards")
    if u29 ~= nil then
        for v30, v31 in u29:GetChildren() do
            local _ = v30 - 1
            if v31:IsA("Model") then
                u21:fade(v31:GetChildren(), "out")
            end
        end
    end
    u27:PivotTo(u22)
    u27.Parent = u7
    u21.maid:GiveTask(u27)
    u21.maid:GiveTask(u2:playSound(u10.SEAHORSE_FREEZE, {
        ["position"] = u22.Position
    }))
    local v32 = 0
    if u29 ~= nil then
        for v33, u34 in u29:GetChildren() do
            local _ = v33 - 1
            if u34:IsA("Model") then
                task.delay(v32 * 0.5, function() --[[ Line: 92 ]]
                    --[[
                    Upvalues:
                        [1] = u21
                        [2] = u34
                    --]]
                    u21:fade(u34:GetChildren(), "in", 1.5)
                end)
                local v35 = v32 + 1
                v32 = v35
            end
        end
    end
    local u36 = 0
    u21.maid:GiveTask(task.delay(3, function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u21
            [3] = u36
            [4] = u2
            [5] = u10
            [6] = u22
        --]]
        local v37 = u29
        if v37 ~= nil then
            local v38 = v37:GetChildren()
            local function v49(p39) --[[ Line: 107 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u36
                    [3] = u2
                    [4] = u10
                    [5] = u22
                --]]
                if p39:IsA("Model") then
                    local v40 = p39:GetChildren()
                    local function v46(u41) --[[ Line: 110 ]]
                        --[[
                        Upvalues:
                            [1] = u21
                            [2] = u36
                            [3] = u2
                            [4] = u10
                            [5] = u22
                        --]]
                        if u41:IsA("MeshPart") then
                            u21.maid:GiveTask(task.delay(u36 * 0.15, function() --[[ Line: 112 ]]
                                --[[
                                Upvalues:
                                    [1] = u41
                                    [2] = u21
                                    [3] = u2
                                    [4] = u10
                                    [5] = u22
                                --]]
                                u41.Anchored = false
                                local v42 = u41
                                local v43 = math.random(-50, 50)
                                local v44 = math.random(10, 50)
                                local v45 = math.random
                                v42:ApplyImpulse((Vector3.new(v43, v44, v45(-50, 50))))
                                u21.maid:GiveTask(u2:playSound(u10.BREAK_FROZEN_BLOCK, {
                                    ["position"] = u22.Position
                                }))
                            end))
                            u36 = u36 + 1
                        end
                    end
                    for v47, v48 in v40 do
                        v46(v48, v47 - 1, v40)
                    end
                    u36 = u36 + 1
                end
            end
            for v50, v51 in v38 do
                v49(v51, v50 - 1, v38)
            end
        end
    end))
    u21.maid:GiveTask(task.delay(3, function() --[[ Line: 133 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u4
            [3] = u27
        --]]
        u8(1, u4, function(p52) --[[ Line: 134 ]]
            --[[
            Upvalues:
                [1] = u27
            --]]
            local v53 = u27:FindFirstChild("BedCover", true)
            if v53 then
                v53.LocalTransparencyModifier = p52
            end
        end, 0, 1):Play()
    end))
    u21.maid:GiveTask(task.delay(6, function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u27
        --]]
        u27:Destroy()
        u27.Parent = nil
    end))
end
function u12.fade(_, p54, u55, u56) --[[ Line: 147 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u4
    --]]
    local function v59(u57) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u56
            [2] = u8
            [3] = u4
            [4] = u55
        --]]
        if u57:IsA("MeshPart") then
            if u56 ~= 0 and (u56 == u56 and u56) then
                u8(u56, u4, function(p58) --[[ Line: 152 ]]
                    --[[
                    Upvalues:
                        [1] = u57
                    --]]
                    u57.LocalTransparencyModifier = p58
                end, u55 == "in" and 1 or 0, u55 == "in" and 0 or 1):Play()
                return
            end
            u57.LocalTransparencyModifier = u55 == "in" and 0 or 1
        end
    end
    for v60, v61 in p54 do
        v59(v61, v60 - 1, p54)
    end
end
u3.CreateController(u12.new())
return nil