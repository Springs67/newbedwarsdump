local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.MathExtras
local u4 = v2.RandomUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.InQuad
local u9 = v7.Linear
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.ReplicatedStorage
local u13 = v11.RunService
local u14 = v11.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "bed-break-effect", "bed-break-effect-type").BedBreakEffectType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u19 = v1.import(script, script.Parent.Parent, "break-bed-effect-controller").BreakBedEffectController
local u20 = {
    UDim2.fromScale(0, 0),
    UDim2.fromScale(-1, 0),
    UDim2.fromScale(0, -1),
    UDim2.fromScale(-1, -1)
}
local u21 = {
    Color3.fromRGB(71, 245, 125),
    Color3.fromRGB(255, 99, 99),
    Color3.fromRGB(255, 171, 36),
    Color3.fromRGB(71, 166, 255),
    Color3.fromRGB(194, 122, 250),
    Color3.fromRGB(255, 122, 196)
}
local u22 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 37 ]]
        return "ButterflySwarmBreakEffectController"
    end,
    ["__index"] = u19
})
u22.__index = u22
function u22.new(...) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    local v23 = u22
    local v24 = setmetatable({}, v23)
    return v24:constructor(...) or v24
end
function u22.constructor(p25) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u16
        [3] = u10
    --]]
    u19.constructor(p25, u16.BUTTERFLY_SWARM)
    p25.Name = "ButterflySwarmBedBreakEffectController"
    p25.tweenMaid = u10.new()
end
function u22.KnitStart(p26) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u19
    --]]
    u19.KnitStart(p26)
end
function u22.onBedBreak(u27, _, u28, u29, u30) --[[ Line: 55 ]]
    task.spawn(function() --[[ Line: 56 ]]
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
function u22.createEffect(u31, p32, u33, p34) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u14
        [3] = u12
        [4] = u4
        [5] = u21
        [6] = u18
        [7] = u5
        [8] = u17
        [9] = u13
        [10] = u20
        [11] = u3
        [12] = u15
        [13] = u8
        [14] = u9
    --]]
    local u35 = true
    u31.maid:GiveTask(function() --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35 = false
    end)
    u31.maid:GiveTask(u31.tweenMaid)
    local v36 = u6.Controllers.BreakBedEffectUtilController:createBedClone(p34)
    if not v36 then
        return nil
    end
    v36.Name = "BedBreakEffectBedClone"
    v36:PivotTo(p32)
    local v37 = v36:FindFirstChild("Root")
    local u38
    if v37 == nil then
        u38 = u35
    else
        u38 = u35
        for v39, v40 in v37:GetChildren() do
            local _ = v39 - 1
            if v40:IsA("BasePart") then
                v40.Transparency = 0.55
            end
        end
    end
    v36.Parent = u14
    u31.maid:GiveTask(v36)
    local u41 = u12.Assets.Effects.BedButterflies:Clone()
    u41:PivotTo(CFrame.new(u33))
    u41.Parent = u14
    u31.maid:GiveTask(u41)
    local v42 = u41.BedCube
    local v43 = v42.Position.Y + v42.Size.Y / 2
    local v44 = v42.Position.Y - v42.Size.Y / 2
    local v45 = (v43 + v44) / 2
    local v46 = v42.Size.X
    local v47 = v42.Size.Z
    local v48 = false
    local v49 = 0
    local v50 = {}
    while true do
        if v48 then
            v49 = v49 + 1
        else
            v48 = true
        end
        if v49 >= 20 then
            break
        end
        local v51 = v49 / 4
        local v52 = math.floor(v51)
        local v53 = v49 % 4
        local v54 = v42.Position.X - v46 / 2 + v46 / 4 * (v53 + 0.5)
        local v55 = v45 + v42.Size.Y / 2
        local v56 = v42.Position.Z - v47 / 2 + v47 / 5 * (v52 + 0.5)
        local v57 = Vector3.new(v54, v55, v56)
        table.insert(v50, v57)
    end
    local v58 = false
    local v59 = 0
    while true do
        if v58 then
            v59 = v59 + 1
        else
            v58 = true
        end
        if v59 >= 24 then
            local u60 = {}
            for v61, v62 in v50 do
                local u63 = v62
                local _ = v61 - 1
                u31.maid:GiveTask(task.spawn(function() --[[ Line: 167 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u4
                        [3] = u21
                        [4] = u41
                        [5] = u63
                        [6] = u18
                        [7] = u60
                        [8] = u31
                    --]]
                    local u64 = u12.Assets.Effects.BedButterfly:Clone()
                    local v65 = u64:FindFirstChild("BillboardGui")
                    if not v65 then
                        return nil
                    end
                    local v66 = v65:FindFirstChild("ImageLabel")
                    if not v66 then
                        return nil
                    end
                    local v67 = u21
                    v66.ImageColor3 = u4.fromList(unpack(v67))
                    u64.Parent = u41
                    local v68 = u63
                    local v69 = u18.randomFloatMaxInclusive(8, 14)
                    local v70 = v68 + Vector3.new(0, v69, 0)
                    u64:PivotTo(CFrame.new(v70))
                    local v71 = u18.randomFloatMaxInclusive(-0.1, 0.1)
                    local v72 = u18.randomFloatMaxInclusive(-0.1, 0.1)
                    local v73 = u18.randomFloatMaxInclusive
                    u63 = u63 + Vector3.new(v71, v72, v73(-0.1, 0.1))
                    local v74 = {
                        ["moveProgress"] = 0,
                        ["part"] = u64,
                        ["startPosition"] = v70,
                        ["endPosition"] = u63,
                        ["moveDuration"] = u18.randomFloatMaxInclusive(2.5, 3.5),
                        ["spiralRadius"] = u18.randomFloatMaxInclusive(9, 14),
                        ["spiralSpeed"] = u18.randomFloatMaxInclusive(0.5, 1),
                        ["spinProgress"] = u18.randomFloatMaxInclusive(0, 1),
                        ["animationFrameIndex"] = math.random(0, 3),
                        ["animationFrameChangeInterval"] = u18.randomFloatMaxInclusive(0.03, 0.05),
                        ["lastAnimationFrameChangeTime"] = tick()
                    }
                    local v75 = u60
                    table.insert(v75, v74)
                    u31.maid:GiveTask(function() --[[ Line: 200 ]]
                        --[[
                        Upvalues:
                            [1] = u64
                        --]]
                        u64:Destroy()
                    end)
                end))
            end
            local u76 = u12.Assets.Effects.BedButterfly:Clone()
            local u77 = math.random(1, #u21 - 1)
            local v78 = u76:FindFirstChild("BillboardGui")
            if not v78 then
                return nil
            end
            local v79 = v78:FindFirstChild("ImageLabel")
            if not v79 then
                return nil
            end
            v79.ImageColor3 = u21[u77 + 1]
            v78.Size = UDim2.fromScale(5, 5)
            u76:PivotTo(CFrame.new(u33 + Vector3.new(0, 3, 0)))
            u76.Parent = u41
            u31.maid:GiveTask(function() --[[ Line: 226 ]]
                --[[
                Upvalues:
                    [1] = u76
                --]]
                u76:Destroy()
            end)
            local u80 = {
                ["moveProgress"] = 0,
                ["animationFrameChangeInterval"] = 0.05,
                ["part"] = u76,
                ["startPosition"] = u76:GetPivot().Position,
                ["endPosition"] = u76:GetPivot().Position,
                ["moveDuration"] = u18.randomFloatMaxInclusive(2.5, 3.5),
                ["spiralRadius"] = u18.randomFloatMaxInclusive(9, 14),
                ["spiralSpeed"] = u18.randomFloatMaxInclusive(0.5, 1),
                ["spinProgress"] = u18.randomFloatMaxInclusive(0, 1),
                ["animationFrameIndex"] = math.random(0, 3),
                ["lastAnimationFrameChangeTime"] = tick()
            }
            local u81 = {}
            local v82 = u5:playModifiableSound(u17.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                ["looped"] = true,
                ["playbackSpeedMultiplier"] = 2.4,
                ["position"] = p32.Position,
                ["parent"] = u14
            })
            table.insert(u81, v82)
            local v83 = u5:playModifiableSound(u17.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                ["looped"] = true,
                ["playbackSpeedMultiplier"] = 2.6,
                ["position"] = p32.Position,
                ["parent"] = u14
            })
            table.insert(u81, v83)
            local v84 = u5:playModifiableSound(u17.BUTTERFLY_SWARM_BED_BREAK_FLUTTER, {
                ["looped"] = true,
                ["playbackSpeedMultiplier"] = 2.8,
                ["position"] = p32.Position,
                ["parent"] = u14
            })
            table.insert(u81, v84)
            u31.maid:GiveTask(function() --[[ Line: 266 ]]
                --[[
                Upvalues:
                    [1] = u81
                --]]
                local v85 = u81
                if (v85 ~= nil and #v85 or v85) > 0 then
                    for v86, v87 in u81 do
                        local _ = v86 - 1
                        v87:Stop()
                        v87:Destroy()
                    end
                    table.clear(u81)
                end
            end)
            local u88 = 0
            local u103 = u13.Heartbeat:Connect(function(p89) --[[ Line: 284 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u60
                    [3] = u80
                    [4] = u88
                    [5] = u21
                    [6] = u77
                --]]
                local function v95(p90) --[[ Line: 286 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                    --]]
                    if not p90 then
                        return nil
                    end
                    local v91
                    if p90 == nil then
                        v91 = p90
                    else
                        v91 = p90.part
                        if v91 ~= nil then
                            v91 = v91:FindFirstChild("BillboardGui")
                        end
                    end
                    local v92 = not v91
                    if not v92 then
                        local v93 = p90.part
                        if v93 ~= nil then
                            v93 = v93.Parent
                        end
                        v92 = v93 == nil
                    end
                    if v92 then
                        return nil
                    end
                    if tick() - p90.lastAnimationFrameChangeTime > p90.animationFrameChangeInterval then
                        p90.lastAnimationFrameChangeTime = tick()
                        p90.animationFrameIndex = (p90.animationFrameIndex + 1) % 4
                        local v94
                        if p90 == nil then
                            v94 = p90
                        else
                            v94 = p90.part
                            if v94 ~= nil then
                                v94 = v94:FindFirstChild("BillboardGui")
                                if v94 ~= nil then
                                    v94 = v94:FindFirstChild("ImageLabel")
                                end
                            end
                        end
                        if not v94 then
                            return nil
                        end
                        v94.Position = u20[p90.animationFrameIndex + 1]
                    end
                end
                for v96, v97 in u60 do
                    v95(v97, v96 - 1, u60)
                end
                local v98 = u80
                if v98 ~= nil then
                    v98 = v98.part
                    if v98 ~= nil then
                        v98 = v98:FindFirstChild("BillboardGui")
                    end
                end
                if v98 then
                    local v99 = u80.part
                    if v99 ~= nil then
                        v99 = v99.Parent
                    end
                    v98 = v99 ~= nil
                end
                if v98 then
                    local v100 = u80.part:FindFirstChild("BillboardGui")
                    local v101
                    if v100 == nil then
                        v101 = v100
                    else
                        v101 = v100:FindFirstChild("ImageLabel")
                    end
                    if not v100 then
                        return nil
                    end
                    if not v101 then
                        return nil
                    end
                    if tick() - u80.lastAnimationFrameChangeTime > u80.animationFrameChangeInterval then
                        u80.lastAnimationFrameChangeTime = tick()
                        u80.animationFrameIndex = (u80.animationFrameIndex + 1) % 4
                        v101.Position = u20[u80.animationFrameIndex + 1]
                    end
                    u88 = u88 + p89 * 0.8
                    local v102 = u88
                    v101.ImageColor3 = u21[u77 + 1]:Lerp(u21[(u77 + 1) % #u21 + 1], (math.clamp(v102, 0, 1)))
                    if u88 >= 1 then
                        u77 = (u77 + 1) % #u21
                        u88 = 0
                    end
                end
            end)
            u31.maid:GiveTask(function() --[[ Line: 380 ]]
                --[[
                Upvalues:
                    [1] = u103
                --]]
                if u103.Connected then
                    u103:Disconnect()
                end
            end)
            local u122 = u13.Heartbeat:Connect(function(u104) --[[ Line: 386 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u60
                --]]
                local function v119(p105) --[[ Line: 389 ]]
                    --[[
                    Upvalues:
                        [1] = u104
                        [2] = u3
                    --]]
                    local v106
                    if p105 == nil then
                        v106 = p105
                    else
                        v106 = p105.part
                        if v106 ~= nil then
                            v106 = v106:FindFirstChild("BillboardGui")
                        end
                    end
                    local v107 = not v106
                    if not v107 then
                        local v108
                        if p105 == nil then
                            v108 = p105
                        else
                            v108 = p105.part
                            if v108 ~= nil then
                                v108 = v108.Parent
                            end
                        end
                        v107 = v108 == nil
                    end
                    if v107 then
                        return nil
                    end
                    if p105.moveProgress >= 1 then
                        return nil
                    end
                    p105.moveProgress = p105.moveProgress + u104 / p105.moveDuration
                    p105.spinProgress = p105.spinProgress + u104 * p105.spiralSpeed
                    local v109 = u3
                    local v110 = p105.startPosition.Y
                    local v111 = p105.endPosition.Y
                    local v112 = p105.moveProgress
                    local v113 = v109:lerp(v110, v111, (math.clamp(v112, 0, 1)))
                    local v114 = p105.spinProgress * 2 * 3.141592653589793
                    local v115 = p105.spiralRadius * (1 - p105.moveProgress)
                    local v116 = p105.endPosition.X + v115 * math.cos(v114)
                    local v117 = p105.endPosition.Z + v115 * math.sin(v114)
                    local v118 = Vector3.new(v116, v113, v117)
                    p105.part:PivotTo(CFrame.new(v118))
                end
                for v120, v121 in u60 do
                    v119(v121, v120 - 1, u60)
                end
            end)
            u31.maid:GiveTask(function() --[[ Line: 429 ]]
                --[[
                Upvalues:
                    [1] = u122
                --]]
                if u122.Connected then
                    u122:Disconnect()
                end
            end)
            task.wait(3.5)
            task.wait(0.5)
            v36:Destroy()
            for v123, u124 in u60 do
                local _ = v123 - 1
                u31.maid:GiveTask(task.spawn(function() --[[ Line: 442 ]]
                    --[[
                    Upvalues:
                        [1] = u124
                        [2] = u18
                        [3] = u33
                        [4] = u15
                        [5] = u8
                        [6] = u31
                        [7] = u38
                    --]]
                    if not u124 then
                        return nil
                    end
                    if u124.part.Parent == nil then
                        return nil
                    end
                    local v125 = u18.randomFloatMaxInclusive(-15, 15)
                    local v126 = u18.randomFloatMaxInclusive(-15, 15)
                    local v127 = 30 + u18.randomFloatMaxInclusive(0, 8)
                    local u128 = u33 + Vector3.new(v125, v127, v126)
                    local v129 = u18.randomFloatMaxInclusive(2, 3)
                    local u130 = nil
                    u130 = u15(v129, u8, function(p131) --[[ Line: 458 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                            [2] = u130
                            [3] = u128
                        --]]
                        if u124 == nil or (u124.part == nil or u124.part.Parent == nil) then
                            u130:Cancel()
                            return nil
                        end
                        local v132 = u124.endPosition:Lerp(u128, p131)
                        u124.part:PivotTo(CFrame.new(v132))
                    end, 0, 1)
                    u130:Play()
                    u31.tweenMaid:GiveTask(function() --[[ Line: 467 ]]
                        --[[
                        Upvalues:
                            [1] = u130
                        --]]
                        if u130 then
                            u130:Cancel()
                        end
                    end)
                    task.wait(v129 - 1)
                    local u133 = nil
                    u133 = u15(1, u8, function(p134) --[[ Line: 475 ]]
                        --[[
                        Upvalues:
                            [1] = u124
                            [2] = u133
                            [3] = u38
                        --]]
                        local v135 = u124.part
                        if v135 ~= nil then
                            v135 = v135:FindFirstChild("BillboardGui")
                        end
                        local v136 = not v135
                        if not v136 then
                            local v137 = u124.part
                            if v137 ~= nil then
                                v137 = v137.Parent
                            end
                            v136 = v137 == nil
                        end
                        if v136 then
                            u133:Cancel()
                            return nil
                        end
                        if u38 then
                            local v138 = u124.part:FindFirstChild("BillboardGui")
                            local v139 = v138 and v138:FindFirstChild("ImageLabel")
                            if v139 then
                                v139.ImageTransparency = p134
                            end
                        end
                    end, 0, 1)
                    u133:Play():Wait()
                    u31.tweenMaid:GiveTask(function() --[[ Line: 502 ]]
                        --[[
                        Upvalues:
                            [1] = u133
                        --]]
                        if u133 then
                            u133:Cancel()
                        end
                    end)
                end))
            end
            u31.maid:GiveTask(task.spawn(function() --[[ Line: 513 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u15
                    [3] = u8
                    [4] = u80
                    [5] = u31
                    [6] = u38
                --]]
                local u140 = u33 + Vector3.new(0, 30, 0)
                local u141 = nil
                u141 = u15(4, u8, function(p142) --[[ Line: 521 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                        [2] = u141
                        [3] = u140
                    --]]
                    if u80 == nil or (u80.part == nil or u80.part.Parent == nil) then
                        u141:Cancel()
                        return nil
                    end
                    local v143 = u80.endPosition:Lerp(u140, p142)
                    u80.part:PivotTo(CFrame.new(v143))
                end, 0, 1)
                u141:Play()
                u31.tweenMaid:GiveTask(function() --[[ Line: 530 ]]
                    --[[
                    Upvalues:
                        [1] = u141
                    --]]
                    if u141 then
                        u141:Cancel()
                    end
                end)
                task.wait(3)
                local u144 = nil
                u144 = u15(1, u8, function(p145) --[[ Line: 538 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                        [2] = u144
                        [3] = u38
                    --]]
                    local v146 = u80.part
                    if v146 ~= nil then
                        v146 = v146:FindFirstChild("BillboardGui")
                    end
                    local v147 = not v146
                    if not v147 then
                        local v148 = u80.part
                        if v148 ~= nil then
                            v148 = v148.Parent
                        end
                        v147 = v148 == nil
                    end
                    if v147 then
                        u144:Cancel()
                        return nil
                    end
                    if u38 then
                        local v149 = u80.part:FindFirstChild("BillboardGui")
                        local v150 = v149 and v149:FindFirstChild("ImageLabel")
                        if v150 then
                            v150.ImageTransparency = p145
                        end
                    end
                end, 0, 1)
                u144:Play():Wait()
                u31.tweenMaid:GiveTask(function() --[[ Line: 566 ]]
                    --[[
                    Upvalues:
                        [1] = u144
                    --]]
                    if u144 then
                        u144:Cancel()
                    end
                end)
            end))
            u31.maid:GiveTask(task.spawn(function() --[[ Line: 573 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u9
                    [3] = u81
                --]]
                u15(4, u9, function(p151) --[[ Line: 574 ]]
                    --[[
                    Upvalues:
                        [1] = u81
                    --]]
                    for v152, v153 in u81 do
                        local _ = v152 - 1
                        v153.Volume = 1 - p151
                    end
                end, 0, 1):Play()
            end))
            u31.maid:GiveTask(task.spawn(function() --[[ Line: 585 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                task.wait(10)
                u31.tweenMaid:DoCleaning()
                u31.maid:DoCleaning()
            end))
            return
        end
        local v154, v155
        if v59 < 4 then
            v154 = v42.Position.X - v46 / 2 + v46 / 4 * v59
            v155 = v42.Position.Z - v47 / 2
        elseif v59 < 12 then
            v154 = v42.Position.X + v46 / 2
            v155 = v42.Position.Z - v47 / 2 + v47 / 8 * (v59 - 4)
        elseif v59 < 16 then
            v154 = v42.Position.X + v46 / 2 - v46 / 4 * (v59 - 4 - 8)
            v155 = v42.Position.Z + v47 / 2
        else
            v154 = v42.Position.X - v46 / 2
            v155 = v42.Position.Z + v47 / 2 - v47 / 8 * (v59 - 8 - 8)
        end
        local v156 = Vector3.new(v154, v45, v155)
        table.insert(v50, v156)
        local v157 = v44 - 1
        local v158 = Vector3.new(v154, v157, v155)
        table.insert(v50, v158)
    end
end
u6.CreateController(u22.new())
return nil