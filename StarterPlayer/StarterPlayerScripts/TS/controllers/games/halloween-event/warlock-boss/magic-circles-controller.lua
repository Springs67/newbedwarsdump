local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.TweenService
local u13 = v9.Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 23 ]]
        return "CurseCirclesController"
    end,
    ["__index"] = u15
})
u18.__index = u18
function u18.new(...) --[[ Line: 29 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    local v19 = u18
    local v20 = setmetatable({}, v19)
    return v20:constructor(...) or v20
end
function u18.constructor(p21) --[[ Line: 33 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    u15.constructor(p21)
    p21.Name = "CurseCirclesController"
end
function u18.KnitStart(u22) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u16
        [3] = u5
        [4] = u17
        [5] = u13
        [6] = u8
        [7] = u11
        [8] = u3
        [9] = u14
        [10] = u7
    --]]
    u15.KnitStart(u22)
    u16.Client:GetNamespace("WarlockBoss"):Get("WarlockMagicCircle"):Connect(function(p23) --[[ Line: 39 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u17
            [3] = u13
            [4] = u8
            [5] = u11
            [6] = u3
            [7] = u14
            [8] = u7
            [9] = u22
        --]]
        local u24 = p23.position
        local _ = p23.fromPosition
        local u25 = p23.radius
        local v26 = p23.explodeAt
        u5:playSound(u17.MAGIC_CIRCLE_SPAWN, {
            ["rollOffMaxDistance"] = 180,
            ["volumeMultiplier"] = 3,
            ["position"] = u24
        })
        local v27 = {
            ["CFrame"] = CFrame.new(u24) * CFrame.Angles(0, 0, 1.5707963267948966),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["Shape"] = Enum.PartType.Cylinder
        }
        local v28 = u25 * 2
        local v29 = u25 * 2
        v27.Size = Vector3.new(0.5, v28, v29)
        v27.Material = Enum.Material.ForceField
        v27.Transparency = 0.2
        v27.Color = Color3.fromRGB(255, 64, 64)
        v27.Parent = u13
        local u30 = u8("Part", v27)
        local v31 = v26 - u13:GetServerTimeNow()
        local v32 = math.max(v31, 0.1)
        local u33 = u11.Assets.Effects.Warlock.MagicCircle:Clone()
        for v34, v35 in u33:GetDescendants() do
            local _ = v34 - 1
            if v35:IsA("BasePart") then
                v35.CanCollide = false
                v35.CanQuery = false
            end
        end
        u33:PivotTo(CFrame.new(u24) * CFrame.Angles(1.5707963267948966, 0, 0))
        local v36 = u33:GetDescendants()
        local function v38(p37) --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            if p37:IsA("UIGradient") then
                p37.Color = ColorSequence.new(u3.brighten(Color3.fromRGB(89, 255, 97), 0.1), Color3.fromRGB(89, 255, 97))
            end
        end
        for v39, v40 in v36 do
            v38(v40, v39 - 1, v36)
        end
        u33.Parent = u13
        u14(v32, u7, function(p41) --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u25
            --]]
            local v42 = u33
            local v43 = p41 * (u25 * 2)
            local v44 = p41 * (u25 * 2)
            v42.Size = Vector3.new(v43, v44, 1)
            local v45 = u33
            local v46 = u33.Rotation.X
            local v47 = u33.Rotation.Y
            local v48 = p41 * 360 * 2
            v45.Rotation = Vector3.new(v46, v47, v48)
        end)
        task.delay(v32, function() --[[ Line: 94 ]]
            --[[
            Upvalues:
                [1] = u30
                [2] = u22
                [3] = u24
                [4] = u25
                [5] = u33
            --]]
            u30:Destroy()
            u22:eruptFlamePillar(u24, u25, 0.8)
            task.delay(0.8, function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u33
                --]]
                u33:Destroy()
            end)
        end)
    end)
end
function u18.eruptFlamePillar(_, p49, p50, p51) --[[ Line: 104 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u4
        [3] = u13
        [4] = u5
        [5] = u17
        [6] = u10
        [7] = u6
        [8] = u12
        [9] = u14
        [10] = u7
    --]]
    local u52 = u11.Assets.Effects.Warlock.FlamePillar:Clone()
    for v53, v54 in u52:GetDescendants() do
        local _ = v53 - 1
        u4:setQueryIgnored(v54, true)
        if v54:IsA("BasePart") then
            v54.CanCollide = false
            v54.CanQuery = false
            v54.CanTouch = false
        end
    end
    if not u52 then
        return nil
    end
    u52.CFrame = CFrame.new(p49)
    u52.Size = Vector3.new(0, 0, 0)
    u52.Orientation = Vector3.new(0, 0, -90)
    u52.Parent = u13
    u5:playSound(u17.MAGIC_CIRCLE_FLAME_ERUPT, {
        ["rollOffMaxDistance"] = 180,
        ["volumeMultiplier"] = 4.5,
        ["position"] = p49
    })
    local u55 = u5:playSound(u17.GHOST_PILLAR_LOOP, {
        ["rollOffMaxDistance"] = 150,
        ["volumeMultiplier"] = 3.5,
        ["looped"] = true,
        ["position"] = p49
    })
    local v56 = u10.LocalPlayer.Character
    if v56 ~= nil then
        v56 = v56:GetPivot().Position
    end
    if v56 ~= nil then
        v56 = (v56 - u52:GetPivot().Position).Magnitude
    end
    local v57
    if v56 == 0 or (v56 ~= v56 or not v56) then
        v57 = v56
    else
        v57 = v56 < 35
    end
    if v57 ~= 0 and (v57 == v57 and v57) then
        u6.Controllers.ScreenShakeController:shake(Vector3.new(0, 0, 0), Vector3.new(0, -1, 0), {
            ["magnitude"] = 0.4 * v56 / 200
        })
    end
    local v58 = u12
    local v59 = TweenInfo.new(1.2, Enum.EasingStyle.Exponential)
    local v60 = {}
    local v61 = p50 * 2
    local v62 = p50 * 2
    v60.Size = Vector3.new(35, v61, v62)
    v60.Position = u52.Position + Vector3.new(0, 17.5, 0)
    v58:Create(u52, v59, v60):Play()
    task.delay(p51, function() --[[ Line: 170 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u7
            [3] = u52
            [4] = u55
        --]]
        u14(0.65, u7, function(p63) --[[ Line: 173 ]]
            --[[
            Upvalues:
                [1] = u52
            --]]
            u52.Base.PointLight.Brightness = p63
        end, u52.Base.PointLight.Brightness, 0)
        local v64 = u52:GetDescendants()
        local function v67(u65) --[[ Line: 178 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u7
            --]]
            if u65:IsA("ParticleEmitter") or u65:IsA("Beam") then
                u14(0.65, u7, function(p66) --[[ Line: 180 ]]
                    --[[
                    Upvalues:
                        [1] = u65
                    --]]
                    u65.Transparency = p66
                end, u65.Transparency, NumberSequence.new(1))
            end
        end
        for v68, v69 in v64 do
            v67(v69, v68 - 1, v64)
        end
        task.delay(0.75, function() --[[ Line: 188 ]]
            --[[
            Upvalues:
                [1] = u55
                [2] = u52
            --]]
            local v70 = u55
            if v70 ~= nil then
                v70:Destroy()
            end
            u52:Destroy()
        end)
    end)
end
u6.CreateController(u18.new())
return nil