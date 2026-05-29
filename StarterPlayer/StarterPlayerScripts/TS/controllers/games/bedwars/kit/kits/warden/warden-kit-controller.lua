local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "jailor", "jailor-constants").JailorConstants
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "shield", "shield-type").ShieldType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u23 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u24 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 29 ]]
        return "WardenKitController"
    end,
    ["__index"] = u23
})
u24.__index = u24
function u24.new(...) --[[ Line: 35 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v25 = u24
    local v26 = setmetatable({}, v25)
    return v26:constructor(...) or v26
end
function u24.constructor(p27) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u17
        [3] = u15
        [4] = u21
    --]]
    u23.constructor(p27, u17.JAILOR, {
        ["animations"] = { u15.JAILOR_IMPRISON, u15.FP_JAILOR_IMPRISON },
        ["sounds"] = { u21.JAILOR_IMPRISON_SLAM, u21.JAILOR_SOUL_CONSUME }
    })
    p27.Name = "WardenKitController"
    p27.imprisonedSoulCount = 0
end
function u24.KnitStart(p28) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u23
    --]]
    u23.KnitStart(p28)
end
function u24.onKitLocalActivated(u29, p30) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u11
        [3] = u20
        [4] = u6
        [5] = u21
    --]]
    p30:GiveTask((u19.Client:Get("UpdateImprisonedSoulCount"):Connect(function(p31) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.imprisonedSoulCount = p31
    end)))
    p30:GiveTask(u11.LocalPlayer.CharacterAdded:Connect(function(u32) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u6
            [3] = u21
        --]]
        local u33 = "Shield_" .. u20.JAILOR_KIT
        local v34 = u32:GetAttribute(u33)
        local u35 = v34 == nil and 0 or v34
        u32:GetAttributeChangedSignal(u33):Connect(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u33
                [3] = u35
                [4] = u6
                [5] = u21
            --]]
            local v36 = u32:GetAttribute(u33)
            local v37 = v36 == nil and 0 or v36
            if u35 < v37 then
                u6:playSound(u21.TRINITY_LIGHT_ORB_HEAL, {
                    ["volumeMultiplier"] = 0.16,
                    ["playbackSpeedMultiplier"] = 0.9 + 0.2 * math.random()
                })
            end
            u35 = v37
        end)
    end))
end
function u24.onKitLocalDeactivated(_) --[[ Line: 78 ]] end
function u24.onKitReplicationActivated(u38, p39) --[[ Line: 80 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u2
        [3] = u7
        [4] = u17
        [5] = u18
    --]]
    p39:GiveTask((u19.Client:Get("JailorImprisonSoul"):Connect(function(p40, p41, _) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        u38:playImprisonEffect(p40, p41)
    end)))
    p39:GiveTask(u2:getBlockDamageHook():connect(function(p42) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u17
            [3] = u18
            [4] = u38
        --]]
        if not u7.Controllers.KitController:isUsingKit(p42.player, u17.JAILOR) then
            return nil
        end
        p42.damage = u18.getBlockDamage(p42.damage, u38.imprisonedSoulCount)
    end))
end
function u24.onKitReplicationDeactivated(_) --[[ Line: 92 ]] end
function u24.onInnateAbilityEnabled(_, _, _) --[[ Line: 94 ]] end
function u24.onAbilityUsed(_, _, _) --[[ Line: 96 ]] end
function u24.playImprisonEffect(_, p43, u44) --[[ Line: 98 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u12
        [3] = u13
        [4] = u11
        [5] = u16
        [6] = u15
        [7] = u7
        [8] = u6
        [9] = u21
        [10] = u22
        [11] = u14
        [12] = u8
        [13] = u5
        [14] = u3
    --]]
    local u45 = u9.new()
    local u46 = u12.Assets.Misc.JailorSoul:Clone()
    u46:PivotTo(CFrame.new(u44))
    u46.Parent = u13
    task.delay(1.5, function() --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u46
        --]]
        for v47, v48 in u46:GetDescendants() do
            local _ = v47 - 1
            if v48:IsA("ParticleEmitter") then
                v48.Enabled = false
            end
        end
        task.delay(2.5, function() --[[ Line: 114 ]]
            --[[
            Upvalues:
                [1] = u46
            --]]
            u46:Destroy()
        end)
    end)
    local u49 = p43 == u11.LocalPlayer
    if u49 then
        local u50 = u16:playAnimation(p43, u15.JAILOR_IMPRISON)
        if u50 then
            u45:GiveTask(function() --[[ Line: 122 ]]
                --[[
                Upvalues:
                    [1] = u50
                --]]
                return u50:Stop(0.25)
            end)
        end
        local u51 = u7.Controllers.ViewmodelController:playAnimation(u15.FP_JAILOR_IMPRISON)
        if u51 then
            u45:GiveTask(function() --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u51
                --]]
                return u51:Stop(0.25)
            end)
        end
    end
    local u52 = p43.Character
    local v53
    if u52 == nil then
        v53 = u52
    else
        v53 = u52.PrimaryPart
    end
    if not v53 then
        return u45:DoCleaning()
    end
    local v54 = u6
    local v55 = u21.JAILOR_SOUL_CONSUME
    local v56 = {
        ["rollOffMinDistance"] = 8,
        ["rollOffMaxDistance"] = 60
    }
    local v57
    if u49 then
        v57 = nil
    else
        v57 = u52.PrimaryPart
    end
    v56.parent = v57
    v54:playSound(v55, v56)
    local u58 = u12.Assets.Effects.JailorImprisonSoul:Clone()
    u45:GiveTask(u58)
    local u59 = u58:FindFirstChild("0")
    local u60 = u58:FindFirstChild("1")
    if not (u59 and u60) then
        return u45:DoCleaning()
    end
    local u61 = {}
    local u62
    if u49 then
        u62 = u12.Assets.Misc.JailorSkull:Clone()
        u45:GiveTask(u62)
        table.insert(u61, u62)
        u7.Controllers.ViewmodelController:addAccessory(u62)
    else
        u62 = nil
    end
    local u63 = u12.Assets.Misc.JailorSkull:Clone()
    u45:GiveTask(u63)
    table.insert(u61, u63)
    local v64 = u52:FindFirstChild("Humanoid")
    if v64 then
        v64:AddAccessory(u63)
        u22:weldCharacterAccessories(u52)
    end
    u58.CFrame = CFrame.new(u44, u52:GetPrimaryPartCFrame().Position)
    u58.Transparency = 0
    u58.Parent = u13
    local u65 = nil
    for v66, v67 in u46:GetDescendants() do
        local _ = v66 - 1
        if v67:IsA("ParticleEmitter") == true then
            u65 = v67
            break
        end
    end
    local u68 = u65.Color
    local u69 = {}
    if u49 then
        u7.Controllers.ScreenShakeController:shake(u44, (u52:GetPrimaryPartCFrame().Position - u44).Unit, {
            ["zMagnitude"] = 0.1,
            ["magnitude"] = 0.1,
            ["duration"] = 1.5,
            ["cycles"] = 30
        })
    end
    local u102 = u14(1.5, u8, function(p70) --[[ Line: 207 ]]
        --[[
        Upvalues:
            [1] = u52
            [2] = u45
            [3] = u63
            [4] = u62
            [5] = u7
            [6] = u60
            [7] = u59
            [8] = u58
            [9] = u5
            [10] = u3
            [11] = u69
            [12] = u61
            [13] = u68
            [14] = u65
            [15] = u44
        --]]
        if not u52.Parent then
            u45:DoCleaning()
            return nil
        end
        local v71 = u63
        if u62 and u7.Controllers.ViewmodelController:isVisible() then
            v71 = u62
        end
        local v72 = v71:FindFirstChildWhichIsA("BasePart")
        if v72 ~= nil then
            v72 = v72.Position
        end
        if v72 then
            u60.WorldPosition = v72
        end
        local u73 = 0.25 * (u59.WorldPosition - u60.WorldPosition).Magnitude
        local v74 = 6.283185307179586 * p70 / 0.5
        local u75 = math.sin(v74)
        local u76 = math.pow(p70, 2)
        local u77 = {}
        local v78 = u58:GetDescendants()
        local function v85(p79) --[[ Line: 234 ]]
            --[[
            Upvalues:
                [1] = u77
                [2] = u5
                [3] = u76
                [4] = u75
                [5] = u73
            --]]
            if not p79:IsA("Beam") then
                return nil
            end
            local v80 = u77[p79]
            if not v80 then
                v80 = p79.Color
                u77[p79] = v80
            end
            local v81 = v80.Keypoints
            local v82 = table.create(#v81)
            for v83, v84 in v81 do
                local _ = v83 - 1
                v82[v83] = ColorSequenceKeypoint.new(v84.Time, v84.Value:Lerp(u5.hexColor(6291428), u76))
            end
            p79.Color = ColorSequence.new(v82)
            p79.CurveSize0 = u75 * u73
            p79.CurveSize1 = u75 * -1 * u73
        end
        for v86, v87 in v78 do
            v85(v87, v86 - 1, v78)
        end
        local function v95(p88) --[[ Line: 263 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u69
                [3] = u5
                [4] = u76
            --]]
            local v89 = p88:GetDescendants()
            local function v92(p90) --[[ Line: 265 ]]
                --[[
                Upvalues:
                    [1] = u3
                    [2] = u69
                    [3] = u5
                    [4] = u76
                --]]
                if p90:IsA("ParticleEmitter") then
                    local v91 = u3.getOrCreate(u69, p90, p90.Color.Keypoints[1].Value)
                    p90.Color = ColorSequence.new(v91:Lerp(u5.hexColor(6291428), u76))
                end
                if p90:IsA("BasePart") and p90.Material == Enum.Material.Neon then
                    p90.Color = u3.getOrCreate(u69, p90, p90.Color):Lerp(u5.hexColor(6291428), u76)
                end
            end
            for v93, v94 in v89 do
                v92(v94, v93 - 1, v89)
            end
        end
        for v96, v97 in u61 do
            v95(v97, v96 - 1, u61)
        end
        local v98 = u68.Keypoints
        local v99 = table.create(#v98)
        for v100, v101 in v98 do
            local _ = v100 - 1
            v99[v100] = ColorSequenceKeypoint.new(v101.Time, v101.Value:Lerp(u5.hexColor(6291428), u76))
        end
        u65.Color = ColorSequence.new(v99)
        u58.CFrame = CFrame.new(u44, u52:GetPrimaryPartCFrame().Position)
    end)
    u45:GiveTask(function() --[[ Line: 295 ]]
        --[[
        Upvalues:
            [1] = u102
        --]]
        return u102:Cancel()
    end)
    task.delay(1.52, function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u49
            [3] = u7
            [4] = u44
            [5] = u52
        --]]
        u45:DoCleaning()
        if u49 then
            u7.Controllers.ScreenShakeController:shake(u44, (u52:GetPrimaryPartCFrame().Position - u44).Unit, {
                ["zMagnitude"] = 1,
                ["magnitude"] = 0.5
            })
        end
    end)
end
u7.CreateController(u24.new())
return nil