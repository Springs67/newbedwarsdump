local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.GameQueryUtil
local u5 = v2.SoundManager
local u6 = v2.WatchCollectionTag
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.InQuad
local u10 = v8.Linear
local u11 = v8.OutBack
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Lighting
local u16 = v14.ReplicatedStorage
local u17 = v14.TweenService
local u18 = v14.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "lib", "viewport-portal-magic", "viewport-portal-magic")
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "void-invasion-balance", "void-invasion-balance").VoidInvasionBalance
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-util").snapBlockRotation
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 34 ]]
        return "VoidCreaturesController"
    end,
    ["__index"] = u20
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
        [1] = u20
    --]]
    u20.constructor(p32)
    p32.Name = "VoidCreaturesController"
end
function u29.KnitStart(u33) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u6
        [3] = u26
        [4] = u3
        [5] = u23
        [6] = u22
        [7] = u5
        [8] = u27
        [9] = u7
        [10] = u13
        [11] = u15
        [12] = u19
        [13] = u9
        [14] = u24
    --]]
    u20.KnitStart(u33)
    u6("void-creature-portal", function(_) --[[ Line: 50 ]] end)
    u26.Client:Get("VoidPortalSpawnMonster"):Connect(function(p34) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u33
        --]]
        u33:portalEffect(p34.part.CFrame, p34.part.Position, p34.part)
    end)
    u6("VoidHound", function(p35) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u23
            [3] = u22
        --]]
        local v36 = p35:WaitForChild("Humanoid", 3)
        local u37
        if v36 == nil then
            u37 = v36
        else
            u37 = v36:WaitForChild("Animator", 3)
        end
        if u37 and v36 then
            local u38 = u3:playAnimation(u37, u23:getAssetId(u22.VOID_HOUND_WALK), {
                ["looped"] = true
            })
            v36.Running:Connect(function(p39) --[[ Line: 85 ]]
                --[[
                Upvalues:
                    [1] = u38
                    [2] = u23
                    [3] = u22
                    [4] = u3
                    [5] = u37
                --]]
                local v40 = p39 > 0
                if v40 then
                    local v41 = u38
                    if v41 ~= nil then
                        v41 = v41.Animation
                        if v41 ~= nil then
                            v41 = v41.AnimationId
                        end
                    end
                    v40 = v41 ~= u23:getAssetId(u22.VOID_HOUND_WALK)
                end
                if v40 then
                    u38 = u3:playAnimation(u37, u23:getAssetId(u22.VOID_HOUND_WALK), {
                        ["looped"] = true
                    })
                end
                local v42 = p39 == 0
                if v42 then
                    local v43 = u38
                    if v43 ~= nil then
                        v43 = v43.Animation
                        if v43 ~= nil then
                            v43 = v43.AnimationId
                        end
                    end
                    v42 = v43 ~= u23:getAssetId(u22.VOID_HOUND_IDLE)
                end
                if v42 then
                    u38 = u3:playAnimation(u37, u23:getAssetId(u22.VOID_HOUND_IDLE), {
                        ["looped"] = true
                    })
                end
            end)
        end
    end)
    u26.Client:Get("VoidPortalSchedule"):Connect(function(u44) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u27
            [3] = u7
            [4] = u13
            [5] = u15
            [6] = u19
            [7] = u9
            [8] = u33
            [9] = u24
        --]]
        u5:playSound(u27.VOID_INVASION_FORCAST)
        local u45 = u7.Controllers.VoidWorldMusicController:playVoidWorldMusic()
        local u46 = u13("ColorCorrectionEffect", {
            ["Parent"] = u15
        })
        local u47 = u15:FindFirstChildWhichIsA("Atmosphere") or u13("Atmosphere", {
            ["Parent"] = u15
        })
        u19(10, u9, function(p48) --[[ Line: 132 ]]
            --[[
            Upvalues:
                [1] = u46
                [2] = u47
            --]]
            u46.Brightness = -0.05 * p48
            u46.Contrast = 0.05 * p48
            u46.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(222, 186, 255), p48)
            u47.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p48)
            u47.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p48)
            u47.Glare = p48
            u47.Haze = 4.5 * p48
        end, 0, 1)
        task.delay(15, function() --[[ Line: 143 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u9
                [3] = u46
                [4] = u47
                [5] = u45
            --]]
            u19(4, u9, function(p49) --[[ Line: 144 ]]
                --[[
                Upvalues:
                    [1] = u46
                    [2] = u47
                --]]
                u46.Brightness = -0.05 * p49
                u46.Contrast = 0.05 * p49
                u46.TintColor = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(255, 255, 255), p49)
                u47.Color = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(25, 0, 54), p49)
                u47.Decay = Color3.fromRGB(255, 255, 255):Lerp(Color3.fromRGB(37, 12, 50), p49)
                u47.Glare = 1 * p49
                u47.Haze = 4.5 * p49
            end, 1, 0)
            u45:Stop()
            u45:Destroy()
        end)
        task.spawn(function() --[[ Line: 158 ]]
            --[[
            Upvalues:
                [1] = u44
                [2] = u33
            --]]
            for v50, v51 in u44.positions do
                local _ = v50 - 1
                u33:createTornado(v51)
                task.wait(1)
            end
        end)
        task.delay(u24.portalSpawnDelay, function() --[[ Line: 168 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u27
            --]]
            u5:playSound(u27.VOID_INVASION_START)
        end)
    end)
end
function u29.createTornado(_, u52) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u24
        [4] = u17
    --]]
    local v53 = math.random(200, 300)
    local v54 = u52 + Vector3.new(0, v53, 0)
    local u55 = u16.Assets.Effects.VoidTornado:Clone()
    u55:PivotTo(CFrame.new(v54))
    u55.Parent = u18
    local u56 = u55:WaitForChild("Part", 1)
    if u56 then
        task.delay(u24.portalSpawnDelay, function() --[[ Line: 182 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u56
                [3] = u52
            --]]
            u17:Create(u56, TweenInfo.new(1), {
                ["CFrame"] = CFrame.new(u52)
            }):Play()
        end)
    end
    task.delay(90, function() --[[ Line: 190 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        u55:Destroy()
    end)
end
function u29.portalEffect(_, p57, p58, p59) --[[ Line: 194 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u13
        [3] = u4
        [4] = u21
        [5] = u25
        [6] = u16
        [7] = u27
        [8] = u5
        [9] = u19
        [10] = u11
        [11] = u28
        [12] = u10
    --]]
    local v60 = u12.new()
    local u61 = u13("Part", {
        ["Size"] = Vector3.new(0.0001, 7, 7),
        ["Rotation"] = Vector3.new(0, -90, -90),
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Transparency"] = 1,
        ["Shape"] = Enum.PartType.Cylinder,
        ["Position"] = p58,
        ["Parent"] = p59
    })
    u4:setQueryIgnored(u61, true)
    v60:GiveTask(u61)
    local u62 = u61.Size
    u21.createFaces(u61, nil, { Enum.NormalId.Left })
    local v63 = { p57:ToOrientation() }
    local v64 = CFrame.new(p57.Position)
    local v65 = CFrame.Angles
    local v66 = u25
    local v67 = v63[2]
    local v68 = v66((math.deg(v67)))
    local _ = v64 * v65(0, math.rad(v68), 0)
    local u69 = u16.Assets.Effects.VoidPortal:Clone()
    v60:GiveTask(u69)
    u69:PivotTo(CFrame.new(u61:GetPivot().Position) * CFrame.Angles(0, 0, 0))
    u69.Parent = u61
    u5:playSound(u27.VOID_PORTAL_SPAWN, {
        ["position"] = u61:GetPivot().Position
    })
    local u70 = u5:playSound(u27.VOID_PORTAL_LOOP, {
        ["rollOffMaxDistance"] = 100,
        ["looped"] = true,
        ["position"] = u61:GetPivot().Position
    })
    v60:GiveTask(function() --[[ Line: 237 ]]
        --[[
        Upvalues:
            [1] = u70
        --]]
        local v71 = u70
        if v71 ~= nil then
            v71:Stop()
        end
        local v72 = u70
        if v72 ~= nil then
            v72:Destroy()
        end
    end)
    u19(0.7, u11, function(p73) --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u61
            [2] = u62
        --]]
        local v74 = math.noise(os.clock() * 15) * 1.5
        local v75 = u61
        local v76 = (u62.X + v74) * p73
        local v77 = (u62.Y + v74) * p73
        local v78 = u62.Z
        v75.Size = Vector3.new(v76, v77, v78)
    end, 0, 1):Wait()
    u28:playEffects({ u69.OnOpen }, nil)
    u28:playEffects({ u69.OnOpened }, nil)
    task.spawn(function() --[[ Line: 255 ]]
        --[[
        Upvalues:
            [1] = u69
            [2] = u19
            [3] = u10
        --]]
        task.wait(3)
        task.delay(5, function() --[[ Line: 257 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:Destroy()
        end)
        local u79 = nil
        u79 = u19(1, u10, function(u80) --[[ Line: 262 ]]
            --[[
            Upvalues:
                [1] = u69
                [2] = u79
            --]]
            if not u69.OnOpened then
                u79:Cancel()
                return nil
            end
            local v81 = u69.OnOpened:GetDescendants()
            local function v87(p82) --[[ Line: 268 ]]
                --[[
                Upvalues:
                    [1] = u80
                --]]
                if p82:IsA("ParticleEmitter") or p82:IsA("Beam") then
                    local v83 = 1
                    local v84 = v83
                    for v85, v86 in p82.Transparency.Keypoints do
                        local _ = v85 - 1
                        if v86.Value < v84 then
                            v83 = v86.Value
                            v84 = v83
                        end
                    end
                    if v84 < u80 then
                        p82.Transparency = NumberSequence.new(u80)
                    end
                elseif p82:IsA("ImageLabel") and p82.ImageTransparency < u80 then
                    p82.ImageTransparency = u80
                end
            end
            for v88, v89 in v81 do
                v87(v89, v88 - 1, v81)
            end
            local v90 = u69:WaitForChild("Ring", 3)
            if v90 ~= nil then
                local v91 = v90:GetDescendants()
                local function v97(p92) --[[ Line: 295 ]]
                    --[[
                    Upvalues:
                        [1] = u80
                    --]]
                    if p92:IsA("ParticleEmitter") or p92:IsA("Beam") then
                        local v93 = 1
                        local v94 = v93
                        for v95, v96 in p92.Transparency.Keypoints do
                            local _ = v95 - 1
                            if v96.Value < v94 then
                                v93 = v96.Value
                                v94 = v93
                            end
                        end
                        if v94 < u80 then
                            p92.Transparency = NumberSequence.new(u80)
                        end
                    elseif p92:IsA("ImageLabel") and p92.ImageTransparency < u80 then
                        p92.ImageTransparency = u80
                    end
                end
                for v98, v99 in v91 do
                    v97(v99, v98 - 1, v91)
                end
            end
        end)
    end)
    return v60
end
u7.CreateController(u29.new())
return nil