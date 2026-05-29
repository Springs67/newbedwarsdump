local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "constant", "constant-manager").ConstantManager
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u6 = v5.Linear
local u7 = v5.OutQuad
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Debris
local u11 = v9.TweenService
local u12 = v9.Workspace
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u14 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v3.registerConstants(script, {
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
    ["strokeThickness"] = 1.5
})
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 35 ]]
        return "ScytheDamageBlockController"
    end,
    ["__index"] = u14
})
u18.__index = u18
function u18.new(...) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    u14.constructor(p21)
    p21.Name = "ScytheDamageBlockController"
end
function u18.KnitStart(u22) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
        [3] = u2
        [4] = u16
    --]]
    u14.KnitStart(u22)
    u15.Client:Get("ScytheBlockDamage"):Connect(function(p23) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u16
            [3] = u22
        --]]
        local v24 = p23.target.PrimaryPart
        if v24 ~= nil then
            v24 = v24.Position
        end
        if not v24 then
            return nil
        end
        u2:playSound(u16.SCYTHE_SPIRIT_STATE)
        u22:spawnDamageIndicator(v24)
    end)
end
function u18.spawnDamageIndicator(_, p25, p26) --[[ Line: 64 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u17
        [3] = u8
        [4] = u13
        [5] = u6
        [6] = u11
        [7] = u1
        [8] = u7
        [9] = u10
    --]]
    local v27 = (u12.CurrentCamera.CFrame.Position - p25).Magnitude > 200
    if v27 then
        local v28
        if p26 == nil then
            v28 = p26
        else
            v28 = p26.infiniteRange
        end
        v27 = not v28
    end
    if v27 then
        return nil
    end
    local u29 = Instance.new("Part")
    u29.Name = "DamageIndicatorPart"
    u29.Size = Vector3.new(1, 1, 1)
    u29.Transparency = 1
    u29.CanCollide = false
    u29.CanQuery = false
    u29.CFrame = CFrame.new(p25)
    u29:SetAttribute("FirstPersonVisible", false)
    u29.Anchored = true
    task.delay(u17.anchoredDuration, function() --[[ Line: 88 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        u29.Anchored = false
    end)
    local v30 = Instance.new("BodyForce")
    local v31 = u17.gravityHeal
    local v32 = u29:GetMass() * u12.Gravity * v31
    v30.Force = Vector3.new(0, v32, 0)
    v30.Parent = u29
    local v33 = math.random(-50, 50) / 100 * u17.velX
    local v34 = math.random(-50, 50) / 100 * u17.velZ
    u29.Velocity = Vector3.new(v33, 0, v34)
    local v35 = Instance.new("BillboardGui")
    v35.Size = UDim2.new(5.88, 0, 2.8, 0)
    v35.AlwaysOnTop = true
    local v36
    if p26 == nil then
        v36 = p26
    else
        v36 = p26.infiniteRange
    end
    v35.MaxDistance = v36 and (1 / 0) or 100
    local u37 = u8("Frame", {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Parent"] = v35
    })
    local u38 = nil
    local v39
    if p26 == nil then
        v39 = p26
    else
        v39 = p26.image
    end
    if v39 ~= "" and v39 then
        local v40 = {
            ["BackgroundTransparency"] = 1
        }
        local v41
        if p26 == nil then
            v41 = p26
        else
            v41 = p26.image
        end
        v40.Image = v41
        v40.ImageColor3 = p26.imageColor
        v40.Position = UDim2.fromScale(0.25, 0.5)
        v40.AnchorPoint = Vector2.new(0, 0.5)
        v40.Size = UDim2.fromScale(0.25, 1)
        v40.Parent = u37
        u38 = u8("ImageLabel", v40)
        u8("UIAspectRatioConstraint", {
            ["AspectRatio"] = 1,
            ["DominantAxis"] = Enum.DominantAxis.Width,
            ["Parent"] = u38
        })
    end
    local u42 = Instance.new("TextLabel")
    u42.Text = "Miss"
    u42.Size = UDim2.new(0.5, 0, 1, 0)
    u42.BackgroundTransparency = 1
    u42.BorderSizePixel = 0
    u42.Font = Enum.Font.GothamBlack
    u42.Position = UDim2.fromScale(0.5, 0.5)
    u42.AnchorPoint = Vector2.new(0, 0.5)
    u42.TextSize = 25
    u42.TextXAlignment = Enum.TextXAlignment.Left
    u42.TextColor3 = Color3.fromRGB(219, 179, 255)
    u42:SetAttribute("FirstPersonVisible", false)
    local v43 = u8("UIStroke", {
        ["Parent"] = u42,
        ["Thickness"] = u17.strokeThickness,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    })
    u42.Parent = u37
    v35.Parent = u29
    u29.Parent = u12
    task.spawn(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u37
            [3] = u17
            [4] = u13
            [5] = u6
        --]]
        local u44 = u42.TextSize
        local u45 = u37.Size
        local u46 = u17.blowUpSize / u44
        local v53 = u13(u17.blowUpDuration, u6, function(p47) --[[ Line: 170 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u44
                [3] = u17
                [4] = u45
                [5] = u46
                [6] = u37
            --]]
            u42.TextSize = u44 * (1 - p47) + p47 * u17.blowUpSize
            local v48 = u45
            local v49 = 1 - p47
            local v50 = UDim2.new(v48.X.Scale * v49, v48.X.Offset * v49, v48.Y.Scale * v49, v48.Y.Offset * v49)
            local v51 = u45
            local v52 = p47 * u46
            u37.Size = v50 + UDim2.new(v51.X.Scale * v52, v51.X.Offset * v52, v51.Y.Scale * v52, v51.Y.Offset * v52)
        end, 0, 1)
        v53:Play()
        v53:Wait()
        u44 = u42.TextSize
        u45 = u37.Size
        local u54 = u17.textSize / u44
        u13(u17.blowUpCompleteDuration, u6, function(p55) --[[ Line: 181 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u44
                [3] = u17
                [4] = u45
                [5] = u54
                [6] = u37
            --]]
            u42.TextSize = u44 * (1 - p55) + p55 * u17.textSize
            local v56 = u45
            local v57 = 1 - p55
            local v58 = UDim2.new(v56.X.Scale * v57, v56.X.Offset * v57, v56.Y.Scale * v57, v56.Y.Offset * v57)
            local v59 = u45
            local v60 = p55 * u54
            u37.Size = v58 + UDim2.new(v59.X.Scale * v60, v59.X.Offset * v60, v59.Y.Scale * v60, v59.Y.Offset * v60)
        end, 0, 1):Play()
    end)
    local u61 = u11:Create(v43, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        ["Transparency"] = 1
    })
    u1.Promise.delay(u17.anchoredDuration + 0.3):andThen(function() --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u7
            [3] = u42
            [4] = u38
            [5] = u61
        --]]
        u13(0.2, u7, function(p62) --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u38
            --]]
            u42.TextTransparency = p62
            if u38 then
                u38.ImageTransparency = p62
            end
        end, 0, 1)
        u61:Play()
    end)
    u10:AddItem(u29, 0.5)
end
v4.CreateController(u18.new())
return nil