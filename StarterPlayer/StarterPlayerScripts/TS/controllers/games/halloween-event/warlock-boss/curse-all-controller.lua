local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.Linear
local u9 = v7.OutBack
local u10 = v7.OutCirc
local u11 = v7.OutQuad
local u12 = v7.OutQuint
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.ReplicatedStorage
local u17 = v15.Workspace
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 30 ]]
        return "CurseAllController"
    end,
    ["__index"] = u19
})
u25.__index = u25
function u25.new(...) --[[ Line: 36 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 40 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u20
    --]]
    u19.constructor(p28, { u20.HALLOWEEN_EVENT })
    p28.Name = "CurseAllController"
end
function u25.KnitStart(u29) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u21
        [3] = u17
        [4] = u6
    --]]
    u19.KnitStart(u29)
    u21.Client:GetNamespace("WarlockBoss"):Get("WarlockCurseAll"):Connect(function(p30) --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u29
            [3] = u6
        --]]
        local v31 = p30.fromPosition
        local v32 = p30.altarPosition
        local v33 = p30.altarShieldRadius
        local v34 = p30.mapInfo
        local v35 = p30.curseAtTime - u17:GetServerTimeNow()
        local u36 = u29:spinMagicCircle(v31, v35)
        local u37 = u29:setupAltar(v32, v33)
        u6.Controllers.PoisonFogEffectController:enablePoisonCountdownSound(v35 / 15)
        local v38 = v34.ArenaCorner1.Position
        local v39 = v34.ArenaCorner2.Position
        local v40 = v34.PlayerSpawn.Y - 3.2
        local v41 = (v38.X + v39.X) / 2
        local v42 = (v38.Z + v39.Z) / 2
        local v43 = Vector3.new(v41, v40, v42)
        local u44 = u29:playDangerEffect(v43, (v34.ArenaCorner1.Position - v43).Magnitude - 55, v35)
        task.delay(v35, function() --[[ Line: 67 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u36
                [3] = u37
                [4] = u6
            --]]
            u44:DoCleaning()
            u36:DoCleaning()
            u37:DoCleaning()
            u6.Controllers.PoisonFogEffectController:disablePoisonEffect()
        end)
    end)
end
function u25.spinMagicCircle(_, p45, p46) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u3
        [4] = u23
        [5] = u17
        [6] = u5
        [7] = u22
        [8] = u24
        [9] = u18
        [10] = u12
        [11] = u10
    --]]
    local v47 = u13.new()
    local u48 = u16.Assets.Effects.Warlock.MagicCircle:Clone()
    for v49, v50 in u48:GetDescendants() do
        local _ = v49 - 1
        if v50:IsA("BasePart") then
            v50.CanCollide = false
            v50.CanQuery = false
            v50.CanTouch = false
        end
    end
    for v51, v52 in u48:GetDescendants() do
        local _ = v51 - 1
        if v52:IsA("UIGradient") then
            v52.Color = ColorSequence.new(u3.brighten(u23.mcGreen, 0.1), u23.mcGreen)
        end
    end
    local v53 = p45 + Vector3.new(-10, 0, 0)
    u48:PivotTo(CFrame.new(v53) * CFrame.Angles(0, 1.5707963267948966, 0))
    u48.Parent = u17
    u5:playSound(u22.MAGIC_CIRCLE_SPAWN, {
        ["rollOffMaxDistance"] = 300,
        ["playbackSpeedMultiplier"] = 2,
        ["volumeMultiplier"] = 4,
        ["position"] = p45
    })
    u24:playEffects({ u48.ChargingEffect }, nil, {
        ["sizeMultiplier"] = 2,
        ["destroyAfterSec"] = p46 - 1
    })
    u18(1.8, u12, function(p54) --[[ Line: 120 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        u48.Size = p54
    end, Vector3.new(0, 0, 0.1), Vector3.new(23, 23, 0.1))
    u18(p46, u10, function(p55) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u48
        --]]
        local v56 = u48
        local v57 = p55 * 360 * 2.5
        local v58 = u48.Rotation.Y
        local v59 = u48.Rotation.Z
        v56.Rotation = Vector3.new(v57, v58, v59)
    end)
    task.delay(p46 - 1, function() --[[ Line: 128 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u48
        --]]
        u24:playInstanceEffects({ u48.ReadyEffect }, {
            ["destroyAfterSec"] = 1,
            ["sizeMultiplier"] = 2
        })
    end)
    v47:GiveTask(function() --[[ Line: 134 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u48
        --]]
        u24:playInstanceEffects({ u48.BlastEffect }, {
            ["destroyAfterSec"] = 0.5,
            ["sizeMultiplier"] = 2
        })
        task.delay(0.5, function() --[[ Line: 139 ]]
            --[[
            Upvalues:
                [1] = u48
            --]]
            u48:Destroy()
        end)
    end)
    return v47
end
function u25.setupAltar(_, p60, p61) --[[ Line: 145 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u16
        [3] = u4
        [4] = u17
        [5] = u5
        [6] = u22
        [7] = u18
        [8] = u11
        [9] = u9
    --]]
    local v62 = u13.new()
    local u63 = u16.Assets.Effects.Warlock.Altar:Clone()
    local u64 = CFrame.new(p60) + Vector3.new(0, -5, 0)
    local u65 = CFrame.new(p60) + Vector3.new(0, 2.5, 0)
    u63:PivotTo(CFrame.new(p60) + Vector3.new(0, 2.5, 0))
    for v66, v67 in u63.forcefield:GetDescendants() do
        local _ = v66 - 1
        u4:setQueryIgnored(v67, true)
    end
    u63.Parent = u17
    local v68 = u63.forcefield
    local v69 = p61 * 2
    local v70 = p61 * 2
    local v71 = p61 * 2
    v68.Size = Vector3.new(v69, v70, v71)
    local u72 = u5:playSound(u22.ROCK_RUMBLE, {
        ["volumeMultiplier"] = 1.3,
        ["rollOffMaxDistance"] = 420,
        ["rollOffMinDistance"] = 90,
        ["fadeInTime"] = 0.1,
        ["fadeOutTime"] = 0.3,
        ["parent"] = u63
    })
    local u73 = u5:playSound(u22.WARLOCK_ALTAR_LOOP, {
        ["rollOffMaxDistance"] = 100,
        ["volumeMultiplier"] = 4,
        ["looped"] = true,
        ["position"] = u63:GetPivot().Position
    })
    u18(2.5, u11, function(p74) --[[ Line: 181 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u64
            [3] = u65
        --]]
        u63:PivotTo(u64:Lerp(u65, p74))
    end)
    task.delay(2.5, function() --[[ Line: 184 ]]
        --[[
        Upvalues:
            [1] = u72
            [2] = u5
        --]]
        if u72 then
            u5:tweenSoundVolume(u72, 0, 1)
        end
    end)
    v62:GiveTask(function() --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u63
            [2] = u18
            [3] = u11
            [4] = u9
            [5] = u73
        --]]
        u63.Highlight.FillTransparency = 1
        u18(0.6, u11, function(p75) --[[ Line: 193 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            if u63.forcefield then
                u63.forcefield.Size = p75
            end
        end, Vector3.new(30, 30, 30), Vector3.new(0, 0, 0))
        task.delay(0.7, function() --[[ Line: 198 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            u63.forcefield:Destroy()
        end)
        u18(2, u9, function(p76) --[[ Line: 202 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            for v77, v78 in u63:GetDescendants() do
                local _ = v77 - 1
                if v78:IsA("BasePart") then
                    v78.Transparency = p76
                elseif v78:IsA("ParticleEmitter") then
                    v78.Transparency = NumberSequence.new(p76)
                elseif v78:IsA("GuiObject") then
                    v78.Transparency = p76
                end
            end
        end)
        task.delay(1, function() --[[ Line: 217 ]]
            --[[
            Upvalues:
                [1] = u73
            --]]
            local v79 = u73
            if v79 ~= nil then
                v79:Destroy()
            end
        end)
        task.delay(2.1, function() --[[ Line: 223 ]]
            --[[
            Upvalues:
                [1] = u63
            --]]
            u63:Destroy()
        end)
    end)
    return v62
end
function u25.playDangerEffect(_, u80, u81, p82) --[[ Line: 229 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u17
        [3] = u14
        [4] = u18
        [5] = u8
        [6] = u16
        [7] = u24
        [8] = u5
        [9] = u22
        [10] = u6
    --]]
    local v83 = u13.new()
    local v84 = {
        ["CFrame"] = CFrame.new(u80) * CFrame.Angles(0, 0, 1.5707963267948966),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["CanQuery"] = false,
        ["Shape"] = Enum.PartType.Cylinder
    }
    local v85 = u81 * 2
    local v86 = u81 * 2
    v84.Size = Vector3.new(0.5, v85, v86)
    v84.Material = Enum.Material.ForceField
    v84.Transparency = 0.2
    v84.Color = Color3.fromRGB(255, 41, 0)
    v84.Parent = u17
    local u87 = u14("Part", v84)
    local u88 = u87:Clone()
    u88.Material = Enum.Material.Neon
    u88.Size = Vector3.new(0.6, 0, 0)
    u88.Transparency = 0.6
    u88.Parent = u17
    u18(p82, u8, function(p89) --[[ Line: 253 ]]
        --[[
        Upvalues:
            [1] = u88
            [2] = u81
        --]]
        if u88.Parent then
            local v90 = u88
            local v91 = p89 * u81 * 2
            local v92 = p89 * u81 * 2
            v90.Size = Vector3.new(0.6, v91, v92)
        end
    end)
    v83:GiveTask(function() --[[ Line: 258 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u87
            [3] = u24
            [4] = u5
            [5] = u22
            [6] = u80
            [7] = u6
            [8] = u88
        --]]
        local v93 = 0
        local v94 = {}
        for v95, v96 in u16.Assets.Effects.Warlock.UnityCurseAura.Root.OnExplode:GetChildren() do
            local _ = v95 - 1
            local v97
            if v96:IsA("ParticleEmitter") then
                v97 = v96:Clone()
                v97.Parent = u87
                v97:SetAttribute("EmitCount", 50)
            else
                v97 = nil
            end
            if v97 ~= nil then
                v93 = v93 + 1
                v94[v93] = v97
            end
        end
        u87.Transparency = 1
        u87.Transparency = 1
        u24:playInstanceEffects(v94, {
            ["destroyAfterSec"] = 1,
            ["sizeMultiplier"] = 2
        })
        local v98 = {
            ["rollOffMaxDistance"] = 300,
            ["rollOffMinDistance"] = 300,
            ["position"] = u80
        }
        u5:playSound(u22.CURSE_ACTIVATE, v98)
        u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
            ["magnitude"] = 2.2
        })
        task.delay(0.8, function() --[[ Line: 294 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u88
            --]]
            u87:Destroy()
            u88:Destroy()
        end)
    end)
    return v83
end
u6.CreateController(u25.new())
return nil