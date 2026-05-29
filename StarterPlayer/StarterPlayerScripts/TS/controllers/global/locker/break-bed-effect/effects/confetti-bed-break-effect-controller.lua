local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v6 = v5.KnitClient
local u7 = v5.KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutQuad
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.ReplicatedStorage
local u12 = v10.Workspace
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "team", "team-color-hex").TeamColorHex
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u21 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 27 ]]
        return "ConfettiBedBreakEffectController"
    end,
    ["__index"] = u21
})
u22.__index = u22
function u22.new(...) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u17
    --]]
    u21.constructor(p25, u17.CONFETTI)
    p25.Name = "ConfettiBedBreakEffectController"
end
function u22.KnitStart(p26) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u21
    --]]
    u21.KnitStart(p26)
end
function u22.onBedBreak(u27, _, u28, u29, u30) --[[ Line: 44 ]]
    task.spawn(function() --[[ Line: 45 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u28
            [3] = u30
            [4] = u29
        --]]
        u27:createEffect(u28, u30, u29)
    end)
end
function u22.createEffect(u31, p32, u33, u34) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u11
        [3] = u12
        [4] = u20
        [5] = u7
        [6] = u3
        [7] = u16
        [8] = u13
        [9] = u4
        [10] = u18
        [11] = u19
        [12] = u14
        [13] = u8
        [14] = u15
    --]]
    local u35 = u9.new()
    local u36 = u9.new()
    u31.maid:GiveTask(u35)
    u31.maid:GiveTask(u36)
    local u37 = u11.Assets.Effects.ConfettiBedBreakParticle:Clone()
    u37:PivotTo(p32)
    u37.Parent = u12
    u37.ConfettiParticle:Emit(80)
    u35:GiveTask(task.delay(3, function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        u37:Destroy()
    end))
    u31.maid:GiveTask(u37)
    local u38 = u11.Assets.Misc.SlicedBed:Clone()
    u31.maid:GiveTask(u38)
    u35:GiveTask(task.spawn(function() --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u7
            [3] = u34
            [4] = u3
            [5] = u16
            [6] = u38
            [7] = u13
        --]]
        local u39
        if u20.isLobbyServer() then
            u39 = u3.hexColor(u16.red)
        else
            u39 = u7.Controllers.TeamController:getTeamById(u34)
            if u39 ~= nil then
                u39 = u39.color
            end
        end
        if not u39 then
            return nil
        end
        local v40 = u38.Pivot.Align:GetChildren()
        local function v42(p41) --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u3
                [3] = u39
            --]]
            if not p41:IsA("MeshPart") then
                return nil
            end
            if u13.includes(string.lower(p41.Name), "blanket") then
                p41.Color = u3.brighten(u39, 0.2)
                return nil
            end
            if u13.includes(string.lower(p41.Name), "mattress") then
                p41.Color = u39
            end
        end
        for v43, v44 in v40 do
            v42(v44, v43 - 1, v40)
        end
    end))
    u38:PivotTo(p32)
    u38.Parent = u12
    local v45 = 0
    local u46 = {}
    for v47, v48 in u38.Pivot.Align:GetChildren() do
        local _ = v47 - 1
        if v48:IsA("MeshPart") == true then
            v45 = v45 + 1
            u46[v45] = v48
        end
    end
    local u49 = 0
    local u50 = 0
    local u51 = nil
    u31.maid:GiveTask(task.spawn(function() --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u51
            [3] = u35
            [4] = u49
            [5] = u4
            [6] = u18
            [7] = u38
            [8] = u19
            [9] = u33
            [10] = u14
            [11] = u8
            [12] = u15
            [13] = u31
            [14] = u50
            [15] = u11
            [16] = u12
        --]]
        for _, u52 in u46 do
            if u51 == nil then
                u51 = u52
            end
            u35:GiveTask(task.spawn(function() --[[ Line: 126 ]]
                --[[
                Upvalues:
                    [1] = u52
                    [2] = u49
                    [3] = u35
                    [4] = u4
                    [5] = u18
                    [6] = u38
                    [7] = u19
                    [8] = u33
                    [9] = u14
                    [10] = u8
                    [11] = u15
                    [12] = u31
                    [13] = u50
                    [14] = u11
                    [15] = u12
                --]]
                local u53 = u52.Position
                if tick() - u49 > 0.5 then
                    u35:GiveTask(u4:playSound(u18.FIREWORK_LAUNCH, {
                        ["position"] = u53,
                        ["parent"] = u38.PrimaryPart,
                        ["playbackSpeedMultiplier"] = u19.randomFloatMaxInclusive(0.8, 1.2)
                    }))
                    u49 = tick()
                end
                local v54 = u19.randomFloatMaxInclusive(-5, 5)
                local v55 = u19.randomFloatMaxInclusive(-5, 5)
                local v56 = 5 + u19.randomFloatMaxInclusive(0, 6)
                local u57 = u33 + Vector3.new(v54, v56, v55)
                local u58 = (u57 - u53).Magnitude / u19.randomFloatMaxInclusive(18, 24)
                local v59 = u19.randomFloatMaxInclusive(-1, 1) * 200
                local v60 = u19.randomFloatMaxInclusive(-1, 1) * 200
                local v61 = u19.randomFloatMaxInclusive(-1, 1) * 200
                local u62 = Vector3.new(v59, v60, v61)
                local u63 = 0
                local u64 = tick()
                u14(u58, u8, function(p65) --[[ Line: 151 ]]
                    --[[
                    Upvalues:
                        [1] = u63
                        [2] = u64
                        [3] = u53
                        [4] = u57
                        [5] = u15
                        [6] = u52
                        [7] = u62
                    --]]
                    u63 = tick() - u64
                    u64 = tick()
                    local v66 = u53:Lerp(u57, p65)
                    u15.setPosition(u52, v66)
                    local v67 = u63
                    u15.rotateLocalDegrees(u52, u62 * v67)
                end, 0, 1)
                u31.maid:GiveTask(task.spawn(function() --[[ Line: 160 ]]
                    --[[
                    Upvalues:
                        [1] = u58
                        [2] = u52
                        [3] = u50
                        [4] = u31
                        [5] = u4
                        [6] = u18
                        [7] = u57
                        [8] = u38
                        [9] = u19
                        [10] = u11
                        [11] = u12
                    --]]
                    task.wait(u58 * 0.9)
                    u52:Destroy()
                    if tick() - u50 > 0.5 then
                        u31.maid:GiveTask(u4:playSound(u18.CONFETTI, {
                            ["position"] = u57,
                            ["parent"] = u38.PrimaryPart,
                            ["playbackSpeedMultiplier"] = u19.randomFloatMaxInclusive(0.8, 1.2)
                        }))
                        u50 = tick()
                    end
                    local u68 = u11.Assets.Effects.ConfettiBedBreakParticle:Clone()
                    u68:PivotTo(CFrame.new(u57))
                    u68.Parent = u12
                    u68.ConfettiParticle:Emit(50)
                    u31.maid:GiveTask(u68)
                    u31.maid:GiveTask(task.delay(3, function() --[[ Line: 180 ]]
                        --[[
                        Upvalues:
                            [1] = u68
                        --]]
                        u68:Destroy()
                    end))
                end))
            end))
            task.wait(0.05)
        end
    end))
    u31.maid:GiveTask(task.spawn(function() --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u36
            [2] = u35
        --]]
        task.wait(6)
        u36:DoCleaning()
        u35:DoCleaning()
    end))
end
v6.CreateController(u22.new())
return nil