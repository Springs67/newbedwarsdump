local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u6 = v5.ReplicatedStorage
local u7 = v5.Workspace
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u12 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u13 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 20 ]]
        return "GhostifyBreakEffectController"
    end,
    ["__index"] = u12
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
function u13.constructor(p16) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
    --]]
    u12.constructor(p16, u9.GHOSTIFY)
    p16.Name = "GhostifyBreakEffectController"
end
function u13.KnitStart(p17) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    u12.KnitStart(p17)
end
function u13.onBedBreak(p18, _, p19, p20, p21) --[[ Line: 37 ]]
    p18:createEffect(p19, p21, p20)
end
function u13.createEffect(u22, u23, u24, _) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u7
        [3] = u2
        [4] = u10
        [5] = u11
        [6] = u8
        [7] = u4
    --]]
    u22.maid:GiveTask(task.spawn(function() --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u23
            [3] = u7
            [4] = u22
            [5] = u2
            [6] = u10
            [7] = u24
            [8] = u11
            [9] = u8
            [10] = u4
        --]]
        local u25 = u6.Assets.Misc.BedBreakEffects.ghostify_bed:Clone()
        if u25 then
            u25.Name = "BedBreakEffectBedClone"
            u25:PivotTo(u23)
            for v26, v27 in u25:GetDescendants() do
                local _ = v26 - 1
                if v27:IsA("BasePart") then
                    v27.Anchored = true
                end
            end
            u25.Parent = u7
            u22.maid:GiveTask(u25)
            local v28 = {
                ["rollOffMinDistance"] = 10,
                ["rollOffMaxDistance"] = 40,
                ["volumeMultiplier"] = 1.5,
                ["playbackSpeedMultiplier"] = 1.75,
                ["looped"] = false,
                ["position"] = u24
            }
            u22.maid:GiveTask(u2:playSound(u10.GHOST_PILLAR_ERUPT, v28))
            u11:enableInstanceEffect(u25)
            u11:playInstanceEffects({ u25 })
            local v29 = {
                ["rollOffMinDistance"] = 10,
                ["rollOffMaxDistance"] = 40,
                ["volumeMultiplier"] = 2,
                ["looped"] = true,
                ["position"] = u24
            }
            local u30 = u2:playSound(u10.GHOST_PILLAR_LOOP, v29)
            u22.maid:GiveTask(u30)
            u22.maid:GiveTask(task.delay(3, function() --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u8
                    [3] = u4
                    [4] = u22
                    [5] = u2
                    [6] = u30
                --]]
                for v31, u32 in u25:GetDescendants() do
                    local _ = v31 - 1
                    if u32:IsA("BasePart") then
                        u8(1, u4, function(p33) --[[ Line: 82 ]]
                            --[[
                            Upvalues:
                                [1] = u32
                            --]]
                            if u32 then
                                u32.Transparency = p33
                            end
                        end, u32.Transparency, 1)
                    end
                end
                u22.maid:GiveTask(u2:tweenSoundVolume(u30, 0, 1))
                u22.maid:GiveTask(task.delay(1.2, function() --[[ Line: 93 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u30
                    --]]
                    u25:Destroy()
                    u30:Stop()
                    u30:Destroy()
                end))
            end))
        end
    end))
end
v3.CreateController(u13.new())
return nil