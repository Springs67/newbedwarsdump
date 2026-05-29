local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local v4 = v2.ConstantManager
local u5 = v2.GameQueryUtil
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u8 = v7.Linear
local u9 = v7.OutQuad
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u12 = v11.Debris
local u13 = v11.Players
local u14 = v11.ReplicatedStorage
local u15 = v11.TweenService
local u16 = v11.Workspace
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u18 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local v19 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "network")
local u20 = v19.EntityDamageEventZap
local u21 = v19.EntityHealEventZap
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "custom-damage-indicators").CustomDamageIndicators
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u27 = u1.import(script, script.Parent.Parent, "hotbar", "ui", "healthbar", "shield").HEALTHBAR_SHIELD_COLOR
local u28 = v4.registerConstants(script, {
    ["velX"] = 5,
    ["velY"] = 9,
    ["velZ"] = 5,
    ["gravityDamage"] = 0.9,
    ["gravityHeal"] = 0.98,
    ["textSize"] = 28,
    ["blowUpCompleteDuration"] = 0.05,
    ["blowUpDuration"] = 0.125,
    ["blowUpSize"] = 76,
    ["anchoredDuration"] = 0.4,
    ["strokeThickness"] = 1.5,
    ["baseColor"] = Color3.fromRGB(255, 81, 68)
})
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 49 ]]
        return "DamageIndicatorController"
    end,
    ["__index"] = u18
})
u29.__index = u29
function u29.new(...) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 59 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    u18.constructor(p32)
    p32.Name = "DamageIndicatorController"
end
function u29.KnitStart(u33) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u16
        [3] = u5
        [4] = u20
        [5] = u13
        [6] = u22
        [7] = u24
        [8] = u23
        [9] = u26
        [10] = u21
    --]]
    task.spawn(function() --[[ Line: 64 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u33
            [3] = u16
            [4] = u5
        --]]
        u14:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect")
        u33.hitEffectPart = u14.Assets.Effects.HitEffect:Clone()
        u33.hitEffectPart.Anchored = true
        u33.hitEffectPart.Parent = u16
        u5:setQueryIgnored(u33.hitEffectPart, true)
    end)
    u20.On(function(p34, p35, p36, _, p37, _, _, p38, p39, _, _, p40, _, p41) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u13
            [3] = u22
            [4] = u24
            [5] = u33
            [6] = u23
            [7] = u26
        --]]
        if p34.PrimaryPart then
            local v42 = u16.CurrentCamera and (u16.CurrentCamera.CFrame.Position - p34:GetPrimaryPartCFrame().Position).Magnitude >= 60
            if v42 then
                if p34 == u13.LocalPlayer.Character then
                    v42 = false
                else
                    v42 = p37 ~= u13.LocalPlayer.Character
                end
            end
            if v42 then
                return nil
            end
            if not p40 then
                local v43 = p34:GetPivot().Position + Vector3.new(0, 2.5, 0)
                local v44 = p37 == u13.LocalPlayer.Character
                local v45 = (p41 == 0 or (p41 ~= p41 or not p41)) and {} or u22[p41]
                local v46
                if p38 == nil then
                    v46 = p38
                else
                    v46 = p38.headshot
                end
                if v46 then
                    v46 = p41 == nil
                end
                local v47 = v46 and {
                    ["gradientRotation"] = 45,
                    ["image"] = u24.HEADSHOT_ICON,
                    ["color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 48)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 84)) }),
                    ["imageColor"] = Color3.fromRGB(255, 199, 48)
                } or v45
                local v48 = u33
                local v49 = v47.damage
                if v49 == nil then
                    v49 = p35
                end
                local v50 = {}
                for v51, v52 in v47 do
                    v50[v51] = v52
                end
                v50.damageType = p36
                v50.shieldHit = p39
                v50.infiniteRange = v44
                if p38 ~= nil then
                    p38 = p38.swingTimeRatio
                end
                v50.swingTimeRatio = p38
                v48:spawnDamageIndicator(v43, v49, v50)
            end
            if (p36 == u23.SWORD or p36 == u23.PROJECTILE) and u33.hitEffectPart then
                u33.hitEffectPart.CFrame = p34.PrimaryPart.CFrame
                u26:playEffects({ u33.hitEffectPart }, p34)
            end
        end
    end)
    u21.On(function(p53, p54, _, p55) --[[ Line: 139 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        if p55 then
            return nil
        end
        if p53.PrimaryPart then
            u33:spawnDamageIndicator(p53:GetPivot().Position + Vector3.new(0, 2.5, 0), p54, {
                ["heal"] = true
            })
        end
    end)
end
function u29.spawnDamageIndicator(_, p56, p57, p58) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u28
        [3] = u10
        [4] = u3
        [5] = u25
        [6] = u27
        [7] = u23
        [8] = u17
        [9] = u8
        [10] = u15
        [11] = u1
        [12] = u9
        [13] = u12
    --]]
    local v59 = (u16.CurrentCamera.CFrame.Position - p56).Magnitude > 200
    if v59 then
        local v60
        if p58 == nil then
            v60 = p58
        else
            v60 = p58.infiniteRange
        end
        v59 = not v60
    end
    if v59 then
        return nil
    end
    local v61 = math.ceil(p57)
    local v62
    if p58 == nil then
        v62 = p58
    else
        v62 = p58.heal
    end
    if v62 == nil then
        v62 = false
    end
    local u63 = Instance.new("Part")
    u63.Name = "DamageIndicatorPart"
    u63.Size = Vector3.new(1, 1, 1)
    u63.Transparency = 1
    u63.CanCollide = false
    u63.CanQuery = false
    u63.CFrame = CFrame.new(p56)
    u63.Anchored = true
    task.delay(u28.anchoredDuration, function() --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u63
        --]]
        u63.Anchored = false
    end)
    local v64 = Instance.new("BodyForce")
    local v65
    if v61 < 0 then
        v65 = u28.gravityHeal
    else
        v65 = u28.gravityDamage
    end
    local v66 = u63:GetMass() * u16.Gravity * v65
    v64.Force = Vector3.new(0, v66, 0)
    v64.Parent = u63
    local v67 = math.random(-50, 50) / 100 * u28.velX
    local v68 = math.random(-50, 50) / 100 * u28.velZ
    u63.Velocity = Vector3.new(v67, 0, v68)
    local v69 = Instance.new("BillboardGui")
    local v70 = math.min(v61, 100) / 100 * 0.7 + 2.1
    v69.Size = UDim2.new(v70 * 2.1, 0, v70, 0)
    v69.AlwaysOnTop = true
    local v71
    if p58 == nil then
        v71 = p58
    else
        v71 = p58.infiniteRange
    end
    v69.MaxDistance = v71 and (1 / 0) or 100
    local v72
    if p58 == nil then
        v72 = p58
    else
        v72 = p58.offset
    end
    local v73
    if v72 then
        v73 = p58.offset
    else
        v73 = v69.StudsOffset
    end
    v69.StudsOffset = v73
    local u74 = u10("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Parent"] = v69
    })
    local u75 = nil
    local v76
    if p58 == nil then
        v76 = p58
    else
        v76 = p58.image
    end
    if v76 ~= "" and v76 then
        local v77 = {
            ["BackgroundTransparency"] = 1
        }
        local v78
        if p58 == nil then
            v78 = p58
        else
            v78 = p58.image
        end
        v77.Image = v78
        v77.ImageColor3 = p58.imageColor
        v77.Position = UDim2.fromScale(0.25, 0.5)
        v77.AnchorPoint = Vector2.new(0, 0.5)
        v77.Size = UDim2.fromScale(0.25, 1)
        v77.Parent = u74
        u75 = u10("ImageLabel", v77)
        u10("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1,
            ["DominantAxis"] = Enum.DominantAxis.Width,
            ["Parent"] = u75
        })
    end
    local u79 = Instance.new("TextLabel")
    local v80
    if p58 == nil then
        v80 = p58
    else
        v80 = p58.text
    end
    if v80 == nil then
        v80 = v61
    end
    u79.Text = tostring(v80)
    u79.Size = UDim2.new(0.5, 0, 1, 0)
    u79.BackgroundTransparency = 1
    u79.BorderSizePixel = 0
    u79.Font = Enum.Font.GothamBlack
    u79.Position = UDim2.fromScale(0.5, 0.5)
    u79.AnchorPoint = Vector2.new(0, 0.5)
    u79.TextSize = 25
    u79.TextXAlignment = Enum.TextXAlignment.Left
    local v81 = nil
    local v82
    if p58 == nil then
        v82 = p58
    else
        v82 = p58.color
    end
    if v82 then
        local v83 = p58.color
        if typeof(v83) == "Color3" then
            v81 = p58.color
        else
            v81 = u3.WHITE
        end
    end
    local v84
    if p58 == nil then
        v84 = p58
    else
        v84 = p58.swingTimeRatioInterpolateColor
    end
    if v84 then
        if p58 == nil then
            v84 = p58
        else
            v84 = p58.swingTimeRatio
        end
    end
    if v84 ~= 0 and (v84 == v84 and v84) then
        local v85 = p58.swingTimeRatioInterpolateColor
        local v86 = v85.minColor
        local v87 = v85.maxColor
        local v88
        if p58 == nil then
            v88 = p58
        else
            v88 = p58.swingTimeRatio
        end
        local v89 = Color3.fromRGB
        local v90 = v86.R * 255 * (1 - v88) + v87.R * 255 * v88
        local v91 = math.floor(v90)
        local v92 = v86.G * 255 * (1 - v88) + v87.G * 255 * v88
        local v93 = math.floor(v92)
        local v94 = v86.B * 255 * (1 - v88) + v87.B * 255 * v88
        v81 = v89(v91, v93, (math.floor(v94)))
    end
    u79.TextColor3 = v81 or u28.baseColor
    local v95
    if p58 == nil then
        v95 = p58
    else
        v95 = p58.color
    end
    if v95 then
        local v96 = p58.color
        v95 = typeof(v96) == "ColorSequence"
    end
    if v95 then
        u10("UIGradient", {
            ["Color"] = p58.color,
            ["Rotation"] = p58.gradientRotation,
            ["Parent"] = u79
        })
    end
    local v97 = u10("UIStroke", {
        ["Parent"] = u79,
        ["Thickness"] = u28.strokeThickness,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    })
    Color3.fromRGB(255, 255, 255)
    if v62 then
        u79.Text = "+" .. tostring(v61)
        u79.TextColor3 = u25.mcGreen
    else
        local v98
        if p58 == nil then
            v98 = p58
        else
            v98 = p58.shieldHit
        end
        if v98 then
            u79.TextColor3 = u27
        end
    end
    local v99
    if p58 == nil then
        v99 = p58
    else
        v99 = p58.damageType
    end
    if v99 == u23.POISON then
        u3.hexColor(0)
        u79.TextColor3 = u3.hexColor(5025629)
    end
    if p58 ~= nil then
        p58 = p58.damageType
    end
    if p58 == u23.INFECTED_POISON then
        u3.hexColor(0)
        u79.TextColor3 = u3.hexColor(5025629)
    end
    u79.Parent = u74
    v69.Parent = u63
    u63.Parent = u16
    task.spawn(function() --[[ Line: 357 ]]
        --[[
        Upvalues:
            [1] = u79
            [2] = u74
            [3] = u28
            [4] = u17
            [5] = u8
        --]]
        local u100 = u79.TextSize
        local u101 = u74.Size
        local u102 = u28.blowUpSize / u100
        local v109 = u17(u28.blowUpDuration, u8, function(p103) --[[ Line: 364 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u100
                [3] = u28
                [4] = u101
                [5] = u102
                [6] = u74
            --]]
            u79.TextSize = u100 * (1 - p103) + p103 * u28.blowUpSize
            local v104 = u101
            local v105 = 1 - p103
            local v106 = UDim2.new(v104.X.Scale * v105, v104.X.Offset * v105, v104.Y.Scale * v105, v104.Y.Offset * v105)
            local v107 = u101
            local v108 = p103 * u102
            u74.Size = v106 + UDim2.new(v107.X.Scale * v108, v107.X.Offset * v108, v107.Y.Scale * v108, v107.Y.Offset * v108)
        end, 0, 1)
        v109:Play()
        v109:Wait()
        u100 = u79.TextSize
        u101 = u74.Size
        local u110 = u28.textSize / u100
        u17(u28.blowUpCompleteDuration, u8, function(p111) --[[ Line: 375 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u100
                [3] = u28
                [4] = u101
                [5] = u110
                [6] = u74
            --]]
            u79.TextSize = u100 * (1 - p111) + p111 * u28.textSize
            local v112 = u101
            local v113 = 1 - p111
            local v114 = UDim2.new(v112.X.Scale * v113, v112.X.Offset * v113, v112.Y.Scale * v113, v112.Y.Offset * v113)
            local v115 = u101
            local v116 = p111 * u110
            u74.Size = v114 + UDim2.new(v115.X.Scale * v116, v115.X.Offset * v116, v115.Y.Scale * v116, v115.Y.Offset * v116)
        end, 0, 1):Play()
    end)
    local u117 = u15:Create(v97, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    })
    u1.Promise.delay(u28.anchoredDuration + 0.3):andThen(function() --[[ Line: 388 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u9
            [3] = u79
            [4] = u75
            [5] = u117
        --]]
        u17(0.2, u9, function(p118) --[[ Line: 389 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u75
            --]]
            u79.TextTransparency = p118
            if u75 then
                u75.ImageTransparency = p118
            end
        end, 0, 1)
        u117:Play()
    end)
    u12:AddItem(u63, 1.5)
end
return {
    ["DamageIndicatorController"] = v6.CreateController(u29.new())
}