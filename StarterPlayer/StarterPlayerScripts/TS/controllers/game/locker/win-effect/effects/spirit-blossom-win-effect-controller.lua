local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.OutQuad
local u10 = v8.OutQuart
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Lighting
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.TweenService
local u18 = v12.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").isSurfaceBlock
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u25 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u26 = {
    u24.HALLOWEEN_LUCKY_BLOCK_GROW_1,
    u24.HALLOWEEN_LUCKY_BLOCK_GROW_2,
    u24.HALLOWEEN_LUCKY_BLOCK_GROW_3,
    u24.FLOWER_PLANT,
    u24.FLOWER_BLOOM,
    u24.HALLOWEEN_LUCKY_BLOCK_PLANT,
    u24.FROSTQUEEN_LYLA_FLOWERBLOOM,
    u24.FROSTQUEEN_LYLA_FLOWERPLANT_1,
    u24.FROSTQUEEN_LYLA_FLOWERPLANT_2,
    u24.FROSTQUEEN_LYLA_FLOWERPLANT_3
}
local u27 = {
    "Flower_Frost_Queen",
    "Flower_Nightmare_Victorious",
    "Flower_Platinum_Victorious",
    "Flower_Diamond_Victorious"
}
local u28 = {
    "SpiritFlower1Small",
    "SpiritFlower2Small",
    "SpiritFlower3Small",
    "SpiritFlowerTall"
}
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "SpiritBlossomWinEffectController"
    end,
    ["__index"] = u25
})
u29.__index = u29
function u29.new(...) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u22
        [3] = u11
        [4] = u18
    --]]
    u25.constructor(p32, u22.SPIRIT_BLOSSOM)
    p32.Name = "SpiritBlossomWinEffectController"
    p32.floweredBlocks = {}
    p32.flowerFolder = u11("Folder", {
        ["Name"] = "FlowerWinEffectModels",
        ["Parent"] = u18
    })
    p32.spiritFolder = u11("Folder", {
        ["Name"] = "SpiritWinEffectModels",
        ["Parent"] = u18
    })
end
function u29.KnitStart(u33) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u23
        [3] = u14
        [4] = u7
        [5] = u16
        [6] = u6
        [7] = u5
        [8] = u26
        [9] = u15
        [10] = u18
        [11] = u4
    --]]
    u25.KnitStart(u33)
    u23.Client:OnEvent("SpiritBlossomWinEffectSetupComplete", function(p34) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u33
            [3] = u7
            [4] = u16
            [5] = u6
            [6] = u5
            [7] = u26
            [8] = u15
            [9] = u18
            [10] = u4
        --]]
        local u35 = p34.winningPlayer
        if u14.LocalPlayer == u35 then
            u33:orientCamera()
            u7.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = false,
                ["constantSpeedMultiplier"] = 6
            })
        end
        local u36 = 0
        local u37 = 0
        u16.Heartbeat:Connect(function() --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u36
                [2] = u35
                [3] = u33
                [4] = u37
                [5] = u6
                [6] = u5
                [7] = u26
            --]]
            if tick() - u36 < 0.1 then
                return nil
            end
            local v38 = u35.Character
            if not v38 then
                return nil
            end
            if u33:addFlowersToBlocksAroundPlayer(u35, 20) and tick() - u37 > 0.25 + math.random() then
                local v39 = u6
                local v40 = u26
                local v41 = u5.fromList(unpack(v40))
                local v42 = {
                    ["volumeMultiplier"] = 2,
                    ["rollOffMaxDistance"] = 150,
                    ["rollOffMinDistance"] = 20
                }
                local v43 = v38.PrimaryPart
                if v43 ~= nil then
                    v43 = v43.Position
                end
                v42.position = v43
                v39:playSound(v41, v42)
                u37 = tick()
            end
            u36 = tick()
        end)
        u33:putTreeInCenter(p34.centerPos)
        if u14.LocalPlayer == u35 then
            local u44 = u15.Assets.Effects.SpiritBlossomGroundEffect:Clone()
            u44.Parent = u18
            local function u49(p45, p46) --[[ Line: 103 ]]
                for v47, v48 in p45:GetDescendants() do
                    local _ = v47 - 1
                    if v48:IsA("ParticleEmitter") then
                        v48.Enabled = p46
                        if not p46 then
                            v48:Clear()
                        end
                    end
                end
            end
            u16.Heartbeat:Connect(function() --[[ Line: 117 ]]
                --[[
                Upvalues:
                    [1] = u35
                    [2] = u49
                    [3] = u44
                    [4] = u4
                --]]
                local v50 = u35.Character
                if v50 == nil then
                    u49(u44, false)
                    return nil
                end
                local v51 = RaycastParams.new()
                v51.FilterType = Enum.RaycastFilterType.Exclude
                v51.FilterDescendantsInstances = { v50 }
                local v52 = u4:raycast(v50:GetPivot().Position, Vector3.new(0, -200, 0), v51)
                local v53
                if v52 == nil then
                    v53 = v52
                else
                    v53 = v52.Instance
                end
                if not v53 then
                    u49(u44, false)
                    return nil
                end
                u49(u44, true)
                u44.Position = v52.Position + Vector3.new(0, 1, 0)
            end)
        end
    end)
end
function u29.onWin(_, _) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u24
        [3] = u13
        [4] = u17
    --]]
    u6:playSound(u24.SPIRIT_ISLAND, {
        ["fadeInTime"] = 2,
        ["fadeOutTime"] = 2
    })
    local v54 = u13:FindFirstChildOfClass("Atmosphere")
    if v54 then
        u17:Create(v54, TweenInfo.new(1), {
            ["Glare"] = 0.3,
            ["Haze"] = 10,
            ["Color"] = Color3.fromRGB(231, 195, 197),
            ["Decay"] = Color3.fromRGB(135, 70, 156)
        }):Play()
    end
end
function u29.spawnSpirit(p55, u56) --[[ Line: 159 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u15
        [3] = u16
    --]]
    local v57 = u5.fromList(unpack({ "PinkSpirit", "BlueSpirit", "PurpleSpirit" }))
    local u58 = u15.Assets.Effects:FindFirstChild(v57)
    if u58 ~= nil then
        u58 = u58:Clone()
    end
    if u58 == nil then
        return nil
    end
    u58:PivotTo(CFrame.new(u56))
    u58.Parent = p55.spiritFolder
    local u59 = 0
    u16.Heartbeat:Connect(function(p60) --[[ Line: 173 ]]
        --[[
        Upvalues:
            [1] = u58
            [2] = u59
            [3] = u56
        --]]
        if not u58.Parent then
            return nil
        end
        u59 = u59 + p60
        local v61 = p60 * 2
        local v62 = math.sin(v61) * 5
        local v63 = u58
        local v64 = CFrame.new(u56)
        local v65 = CFrame.Angles
        local v66 = u59 * 50
        local v67 = v65(0, math.rad(v66), 0)
        local v68 = Vector3.new(0, v62, 0)
        v63:PivotTo(v64 * v67 + v68)
    end)
end
function u29.putTreeInCenter(_, p69) --[[ Line: 186 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
        [3] = u4
        [4] = u19
        [5] = u10
    --]]
    local u70 = u15.Assets.Effects.SpiritTree:Clone()
    if u70 == nil then
        return nil
    end
    local v71 = RaycastParams.new()
    v71.FilterType = Enum.RaycastFilterType.Include
    v71.FilterDescendantsInstances = { u18.Map }
    local v72 = u4:raycast(p69, Vector3.new(0, -200, 0), v71)
    local v73
    if v72 == nil then
        v73 = v72
    else
        v73 = v72.Position
    end
    if v73 then
        p69 = v72.Position
    end
    u70:ScaleTo(0.2)
    u70:PivotTo(CFrame.new(p69))
    u70.Parent = u18
    u19(5, u10, function(p74) --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        u70:ScaleTo(p74)
    end, 0.2, 3):Play()
end
function u29.addFlowersToBlocksAroundPlayer(p75, p76, p77) --[[ Line: 212 ]]
    local v78 = p75:getSurroundingBlocks(p76, p77)
    if next(v78) == nil then
        return false
    end
    local v79 = 0
    for v80 in v78 do
        if p75.floweredBlocks[v80] == nil then
            p75:addFlowersToBlock(v80)
            p75.floweredBlocks[v80] = true
            v79 = v79 + 1
        end
    end
    return v79 > 0
end
function u29.addFlowersToBlock(p81, p82) --[[ Line: 228 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
        [3] = u27
        [4] = u15
        [5] = u28
        [6] = u19
        [7] = u9
        [8] = u10
    --]]
    local v83 = u2:getWorldPosition(p82)
    if math.random() < 0.03 then
        local v84 = math.random(-1, 1)
        local v85 = 4 + math.random(0, 8)
        local v86 = math.random
        p81:spawnSpirit(v83 + Vector3.new(v84, v85, v86(-1, 1)))
    end
    if math.random() < 0.3 then
        return nil
    end
    local v87 = math.random() < 0.85 and "Flower" or "Spirit"
    local u88 = nil
    if v87 == "Flower" then
        local v89 = u27
        local v90 = u5.fromList(unpack(v89))
        u88 = u15.Assets.Effects.Lyla:FindFirstChild(v90)
        if u88 ~= nil then
            u88 = u88:Clone()
        end
    elseif v87 == "Spirit" then
        local v91 = u28
        local v92 = u5.fromList(unpack(v91))
        u88 = u15.Assets.Effects:FindFirstChild(v92)
        if u88 ~= nil then
            u88 = u88:Clone()
        end
    end
    if u88 == nil then
        return nil
    end
    for v93, v94 in u88:GetDescendants() do
        local _ = v93 - 1
        if v94:IsA("ParticleEmitter") or (v94:IsA("Trail") or v94:IsA("Beam")) then
            v94:Destroy()
        end
    end
    local v95 = CFrame.new(v83)
    local v96 = math.random(-1, 1)
    local v97 = math.random
    local v98 = Vector3.new(v96, -1, v97(-1, 1))
    local v99 = CFrame.Angles
    local v100 = math.random(0, 360)
    local v101 = v99(0, math.rad(v100), 0)
    u88:PivotTo((v95 + v98) * v101)
    u88:ScaleTo(0.25)
    u88.Parent = p81.flowerFolder
    local u102 = u88:GetPivot().Position
    local u103 = u88:GetPivot().Position + Vector3.new(0, 1, 0)
    u19(0.9 + math.random() * 0.2, u9, function(p104) --[[ Line: 278 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u102
            [3] = u103
        --]]
        local v105 = u88
        if v105 ~= nil then
            v105:PivotTo(CFrame.new(u102:Lerp(u103, p104)))
        end
    end, 0, 1):Play()
    u19(0.9 + math.random() * 0.2, u10, function(p106) --[[ Line: 285 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        local v107 = u88
        if v107 ~= nil then
            v107:ScaleTo(p106)
        end
    end, 0.25, 1):Play()
end
function u29.getSurroundingBlocks(p108, p109, p110) --[[ Line: 293 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u2
    --]]
    local v111 = p109.Character
    if v111 ~= nil then
        v111 = v111.PrimaryPart
    end
    if not v111 then
        return {}
    end
    local v112 = p109.Character.PrimaryPart.CFrame.LookVector * -1
    local v113 = p109.Character.PrimaryPart.CFrame + v112 * (p110 / 2)
    local v114 = p110 * 6
    local v115 = Vector3.new(p110, v114, p110)
    local v116 = false
    local v117 = 0
    local v118 = {}
    while true do
        if v116 then
            v117 = v117 + u20
        else
            v116 = true
        end
        if v117 >= v115.X then
            return v118
        end
        local v119 = false
        local v120 = 0
        while true do
            if true then
                if v119 then
                    v120 = v120 + u20
                else
                    v119 = true
                end
            end
            if v120 >= v115.Y then
                break
            end
            local v121 = false
            local v122 = 0
            while true do
                if true then
                    if v121 then
                        v122 = v122 + u20
                    else
                        v121 = true
                    end
                end
                if v122 >= v115.Z then
                    break
                end
                local v123 = v113 * (Vector3.new(v117, v120, v122) - v115 / 2)
                local v124 = u2:getBlockPosition(v123)
                if p108:validatePosition(p109, v123, p110) then
                    v118[v124] = true
                end
            end
        end
    end
end
function u29.makeDebugPart(_, p125, p126) --[[ Line: 360 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local u127 = Instance.new("Part")
    u127.Size = Vector3.new(1, 1, 1)
    u127.Position = p125
    u127.Anchored = true
    u127.CanCollide = false
    u127.CanQuery = false
    u127.CanTouch = false
    u127.Color = p126
    u127.Parent = u18
    u127.Transparency = 0.6
    task.delay(1, function() --[[ Line: 371 ]]
        --[[
        Upvalues:
            [1] = u127
        --]]
        u127:Destroy()
    end)
end
function u29.validatePosition(_, p128, p129, p130) --[[ Line: 375 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u2
        [3] = u21
    --]]
    local v131 = p128.Character
    if v131 ~= nil then
        v131 = v131.PrimaryPart
    end
    if not v131 then
        return false
    end
    local v132 = p128.Character.PrimaryPart.Position
    if p129.Y > v132.Y then
        return false
    end
    if p129.Y < v132.Y - u20 * 30 then
        return false
    end
    local v133 = v132.X
    local v134 = v132.Z
    local v135 = Vector3.new(v133, 0, v134)
    local v136 = p129.X
    local v137 = p129.Z
    local v138 = Vector3.new(v136, 0, v137)
    local v139 = u2:getBlockPosition(p129)
    return (v138 - v135).Magnitude <= p130 and u21(v139) and true or false
end
function u29.orientCamera(_) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u14
    --]]
    if u18.CurrentCamera then
        u14.LocalPlayer.CameraMaxZoomDistance = 100
        u14.LocalPlayer.CameraMinZoomDistance = 60
    end
end
u7.CreateController(u29.new())
return nil