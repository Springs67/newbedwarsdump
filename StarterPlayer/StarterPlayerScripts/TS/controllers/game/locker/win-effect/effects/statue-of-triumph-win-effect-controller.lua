local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.SoundManager
local u5 = v2.WatchCharacter
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u7 = v6.KnitClient
local u8 = v6.KnitClient
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.Players
local u11 = v9.ReplicatedStorage
local u12 = v9.RunService
local u13 = v9.TweenService
local u14 = v9.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u24 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u25 = {
    CFrame.Angles(0, 0, 0),
    CFrame.Angles(0, 1.5707963267948966, 0),
    CFrame.Angles(0, 3.141592653589793, 0),
    CFrame.Angles(0, 4.71238898038469, 0)
}
local u26 = {
    u16.TRIUMPH_STATUE_1_FRAME,
    u16.TRIUMPH_STATUE_2_FRAME,
    u16.TRIUMPH_STATUE_3_FRAME,
    u16.TRIUMPH_STATUE_4_FRAME
}
local u27 = {
    u16.TRIUMPH_STATUE_1,
    u16.TRIUMPH_STATUE_2,
    u16.TRIUMPH_STATUE_3,
    u16.TRIUMPH_STATUE_4
}
local u28 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 33 ]]
        return "StatueOfTriumphWinEffectController"
    end,
    ["__index"] = u24
})
u28.__index = u28
function u28.new(...) --[[ Line: 39 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    local v29 = u28
    local v30 = setmetatable({}, v29)
    return v30:constructor(...) or v30
end
function u28.constructor(p31) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u19
    --]]
    u24.constructor(p31, u19.STATUE_OF_TRIUMPH)
    p31.Name = "StatueOfTriumphWinEffectController"
    p31.characterClones = {}
    p31.statuePositions = {}
    p31.statuePrimaryParts = {}
    p31.statueHighlightMaids = {}
    p31.playersThatHaveWinEffect = {}
    p31.statueAnimMap = {}
    p31.playersCheckedForPreload = {}
    p31.isPreloaded = false
end
function u28.KnitStart(u32) --[[ Line: 55 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u10
        [3] = u19
        [4] = u7
        [5] = u16
        [6] = u5
        [7] = u20
    --]]
    u24.KnitStart(u32)
    u10.LocalPlayer.CharacterAdded:Connect(function(p33) --[[ Line: 57 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u32
            [3] = u19
            [4] = u7
            [5] = u16
        --]]
        local v34 = u10:GetPlayerFromCharacter(p33)
        if v34 and u32.playersThatHaveWinEffect[v34] == nil then
            u32.playersCheckedForPreload[v34] = true
            if p33:GetAttribute("WinEffect") == u19.STATUE_OF_TRIUMPH and not u32.isPreloaded then
                u7.Controllers.PreloadController:runPreload({
                    ["animations"] = {
                        u16.TRIUMPH_STATUE_1,
                        u16.TRIUMPH_STATUE_2,
                        u16.TRIUMPH_STATUE_3,
                        u16.TRIUMPH_STATUE_4,
                        u16.TRIUMPH_STATUE_1_FRAME,
                        u16.TRIUMPH_STATUE_2_FRAME,
                        u16.TRIUMPH_STATUE_3_FRAME,
                        u16.TRIUMPH_STATUE_4_FRAME
                    }
                })
                u32.isPreloaded = true
            end
        end
    end)
    u5(function(p35, _) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        if u32.playersThatHaveWinEffect[p35] ~= nil then
            u32:createGoldCrownOnDeath(p35)
            u32:createStatueHitbox(p35)
        end
    end)
    u20.Client:Get("GetStatueWinEffectClone"):Connect(function(p36) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        for v37, v38 in p36.clones do
            local _ = v37 - 1
            local v39 = u32.characterClones
            table.insert(v39, v38)
        end
        u32:createStatues()
    end)
    u20.Client:Get("GetStatueWinEffectPositions"):Connect(function(p40) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u32
        --]]
        local v41 = u32.statuePositions
        local v42 = p40.statuePosition
        table.insert(v41, v42)
    end)
end
function u28.onWin(u43, u44) --[[ Line: 95 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u20
        [3] = u4
        [4] = u21
        [5] = u14
        [6] = u12
        [7] = u23
    --]]
    u43.playersThatHaveWinEffect[u44] = true
    local u45 = u43:createGoldCrown(u44)
    local u46 = u43:createSpotLight(u44)
    local u47 = false
    local v48 = u13:Create(u46.Root.LightBeam, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        ["Transparency"] = 0.9
    })
    v48:Play()
    v48.Completed:Connect(function() --[[ Line: 106 ]]
        --[[
        Upvalues:
            [1] = u47
            [2] = u20
            [3] = u43
            [4] = u44
        --]]
        u47 = true
        u20.Client:Get("StatueWinEffectAddClone"):SendToServer({})
        u43:createStatueHitbox(u44)
    end)
    task.delay(1, function() --[[ Line: 111 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u4
            [3] = u21
        --]]
        local v49 = u44.Character
        if v49 ~= nil then
            v49 = v49.PrimaryPart
        end
        if v49 then
            u4:playSound(u21.TRIUMPH_WIN_EFFECT_LIGHT, {
                ["parent"] = u44.Character.PrimaryPart,
                ["position"] = u44.Character.PrimaryPart.Position
            })
        end
    end)
    u13:Create(u46.Root.LightPart.LightAttachment.PointLight, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ["Brightness"] = 2.5
    }):Play()
    u13:Create(u46.Root.LightSource, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        ["Transparency"] = 0
    }):Play()
    task.delay(1.75, function() --[[ Line: 129 ]]
        --[[
        Upvalues:
            [1] = u46
            [2] = u13
        --]]
        u46.Root.LightBeam.WeldConstraint.Enabled = true
        u13:Create(u46.Root.Ground.TopSurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            ["ImageTransparency"] = 0.5
        }):Play()
        u13:Create(u46.Root.Ground.BottomSurfaceGui.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
            ["ImageTransparency"] = 0.5
        }):Play()
    end)
    local u50 = 0
    local u51 = u14:GetServerTimeNow()
    local u52 = 0
    local u53 = u45.Handle.Position.Y
    local u54 = false
    u12.Heartbeat:Connect(function() --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u44
            [2] = u46
            [3] = u47
            [4] = u50
            [5] = u14
            [6] = u51
            [7] = u54
            [8] = u52
            [9] = u45
            [10] = u23
            [11] = u53
        --]]
        if u44.Character then
            local v55 = u44.Character.PrimaryPart
            if not v55 then
                return nil
            end
            u46:PivotTo(v55.CFrame)
            if not u47 then
                u50 = u14:GetServerTimeNow() - u51
                local v56 = u50 / 2
                local v57 = math.clamp(v56, 0, 1)
                local v58 = u46.Root.LightBeam.Position:Lerp(u46.Root.Ground.Position, v57)
                u46.Root.LightBeam.CFrame = CFrame.new(u46.Root.Ground.CFrame.Position.X, v58.Y + 56.5, u46.Root.Ground.CFrame.Position.Z)
                return
            end
            if u47 and not u54 then
                if u52 > 4 then
                    u54 = true
                    u45.Handle.CanCollide = true
                    u45.Handle.CanTouch = true
                    u23:weldAccessory(u44.Character, u45)
                end
                u52 = u14:GetServerTimeNow() - u51
                local v59 = u52 / 4
                local v60 = 1 - math.clamp(v59, 0, 1)
                local v61 = 1 - math.pow(v60, 2)
                local v62 = u53 + (u44.Character.PrimaryPart.Position.Y + 2.5 - u53) * v61
                local v63 = u44.Character.PrimaryPart.Position.X
                local v64 = u44.Character.PrimaryPart.Position.Z
                u45.Handle.CFrame = CFrame.new(v63, v62, v64)
            end
        end
    end)
end
function u28.createGoldCrown(_, p65) --[[ Line: 176 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
    --]]
    local v66 = u11.Assets.Misc.GoldCrownWearable:Clone()
    v66.Parent = u14
    v66.Handle:PivotTo(p65.Character.PrimaryPart.CFrame + Vector3.new(0, 115, 0))
    v66.Handle.CanCollide = false
    v66.Handle.CanTouch = false
    return v66
end
function u28.createSpotLight(_, p67) --[[ Line: 187 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
    --]]
    local v68 = u11.Assets.Effects.TriumphLight:Clone()
    v68.Parent = u14
    v68:PivotTo(p67.Character.PrimaryPart.CFrame)
    return v68
end
function u28.createGoldCrownOnDeath(_, p69) --[[ Line: 193 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u23
    --]]
    local v70 = u11.Assets.Misc.GoldCrownWearable:Clone()
    if not p69.Character then
        return nil
    end
    v70.Parent = p69.Character
    v70.Handle.CanCollide = true
    v70.Handle.CanTouch = true
    u23:weldAccessory(p69.Character, v70)
end
function u28.createStatues(p71) --[[ Line: 203 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u18
        [3] = u14
        [4] = u25
        [5] = u4
        [6] = u21
        [7] = u13
        [8] = u15
        [9] = u11
        [10] = u22
    --]]
    local v72 = p71.characterClones
    local function v80(p73) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u18
        --]]
        for v74, v75 in p73:GetDescendants() do
            local _ = v74 - 1
            if v75:IsA("BasePart") and v75.Name ~= "HumanoidRootPart" then
                v75.Transparency = 0
                v75.Material = Enum.Material.Concrete
            elseif v75:IsA("Decal") then
                v75.Transparency = 0
            end
        end
        u8.Controllers.EntityHighlightController:highlight(p73, {
            ["transparency"] = 0,
            ["lastsForever"] = true,
            ["color"] = Color3.fromRGB(120, 120, 120),
            ["shouldApplyToPart"] = function(p76) --[[ Name: shouldApplyToPart, Line 222 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                local v77 = p76:FindFirstAncestorWhichIsA("Accessory")
                if not v77 or v77:GetAttribute("ArmorSlot") ~= u18.HELMET then
                    return p76.Name ~= "StatuePodium"
                end
                for v78, v79 in v77:GetDescendants() do
                    local _ = v78 - 1
                    if v79:IsA("Texture") then
                        v79.Transparency = 1
                    end
                end
                return false
            end
        })
    end
    for v81, v82 in v72 do
        v80(v82, v81 - 1, v72)
    end
    local v83 = false
    local v84 = 0
    while true do
        if v83 then
            v84 = v84 + 1
        else
            v83 = true
        end
        if v84 >= #p71.statuePositions then
            for v85, v86 in p71.characterClones do
                local _ = v85 - 1
                v86:Destroy()
            end
            return
        end
        local v87 = v84 % #p71.characterClones
        local v88 = p71.characterClones[v87 + 1]:Clone()
        v88.Parent = u14
        p71:playFreezeAnimation(v88)
        if v88.PrimaryPart then
            v88.PrimaryPart.CollisionGroup = "Statue"
            p71.statuePrimaryParts[v88.PrimaryPart] = v88
        end
        local v89 = u25
        local v90 = math.random() * #u25
        local v91 = v89[math.floor(v90) + 1]
        u4:playSound(u21.TRIUMPH_WIN_EFFECT_STATUE, {
            ["position"] = p71.statuePositions[v84 + 1]
        })
        local v92 = p71.statuePositions[v84 + 1]
        v88:PivotTo(CFrame.new(v92 + Vector3.new(0, -8, 0)) * v91)
        local v93 = u13
        local v94 = v88.HumanoidRootPart
        local v95 = TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local v96 = {}
        local v97 = p71.statuePositions[v84 + 1]
        v96.CFrame = CFrame.new(v97 + Vector3.new(0, 7.7, 0)) * v91
        v93:Create(v94, v95, v96):Play()
        local v98 = {}
        for v99, v100 in v88:GetDescendants() do
            local _ = v99 - 1
            if v100:IsA("BasePart") and v100.Name ~= "HolyRays" then
                v100.CanCollide = true
            elseif v100:IsA("Texture") and u15.startsWith(v100.Name, "entity-highlight-texture:") then
                table.insert(v98, v100)
            end
        end
        p71.statueHighlightMaids[v88] = v98
        local u101 = u11.Assets.Effects.StatueSummon:Clone()
        u101.Parent = v88
        u101.Position = p71.statuePositions[v84 + 1] + Vector3.new(0, -5, 0)
        u22:enableInstanceEffect(u101)
        task.delay(6, function() --[[ Line: 312 ]]
            --[[
            Upvalues:
                [1] = u101
            --]]
            u101:Destroy()
        end)
        task.wait(0.5)
    end
end
function u28.createStatueHitbox(u102, p103) --[[ Line: 326 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u23
        [3] = u22
        [4] = u13
        [5] = u4
        [6] = u21
    --]]
    local v104 = u11.Assets.Misc.StatueHitbox:Clone()
    if not p103.Character then
        return nil
    end
    u23:weldAccessory(p103.Character, v104)
    v104.Handle.Touched:Connect(function(p105) --[[ Line: 332 ]]
        --[[
        Upvalues:
            [1] = u102
            [2] = u22
            [3] = u13
            [4] = u4
            [5] = u21
        --]]
        if u102.statuePrimaryParts[p105] ~= nil then
            local u106 = u102.statuePrimaryParts[p105]
            u102.statuePrimaryParts[p105] = nil
            local u107
            if u106 == nil then
                u107 = u106
            else
                u107 = u106:FindFirstChild("StatuePodium")
                if u107 ~= nil then
                    u107 = u107:FindFirstChild("HolyRays")
                end
            end
            if not (u106 and u107) then
                return nil
            end
            u22:enableInstanceEffect(u107)
            local v108 = u102.statueHighlightMaids[u106]
            if v108 ~= nil then
                local function v110(p109) --[[ Line: 356 ]]
                    --[[
                    Upvalues:
                        [1] = u13
                    --]]
                    u13:Create(p109, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        ["Transparency"] = 1
                    }):Play()
                end
                for v111, v112 in v108 do
                    v110(v112, v111 - 1, v108)
                end
            end
            u4:playSound(u21.TRIUMPH_WIN_EFFECT_PURIFY, {
                ["position"] = u107.Position
            })
            task.delay(2, function() --[[ Line: 368 ]]
                --[[
                Upvalues:
                    [1] = u107
                    [2] = u102
                    [3] = u106
                --]]
                for v113, v114 in u107:GetDescendants() do
                    local _ = v113 - 1
                    if v114:IsA("ParticleEmitter") then
                        v114.Enabled = false
                    end
                end
                u102:playStatueAnimation(u106)
            end)
        end
    end)
end
function u28.playFreezeAnimation(p115, p116) --[[ Line: 383 ]]
    --[[
    Upvalues:
        [1] = u26
        [2] = u3
        [3] = u17
    --]]
    local v117 = math.random() * #u26
    local v118 = math.floor(v117)
    local v119 = u26[v118 + 1]
    local v120 = p116:FindFirstChild("Humanoid")
    if v120 ~= nil then
        v120 = v120:FindFirstChild("Animator")
    end
    local v121 = u3:playAnimation(v120, u17:getAssetId(v119), {
        ["looped"] = true
    })
    p115.statueAnimMap[p116] = v118
    return v121
end
function u28.playStatueAnimation(p122, u123) --[[ Line: 399 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u3
        [3] = u17
        [4] = u13
    --]]
    local v124 = p122.statueAnimMap[u123]
    if v124 == nil then
        return nil
    end
    local v125 = u27[v124 + 1]
    local v126 = u123:FindFirstChild("Humanoid")
    if v126 ~= nil then
        v126 = v126:FindFirstChild("Animator")
    end
    local u127 = u3:playAnimation(v126, u17:getAssetId(v125), {
        ["looped"] = false
    })
    if not u127 then
        return nil
    end
    u127:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 418 ]]
        --[[
        Upvalues:
            [1] = u127
            [2] = u123
            [3] = u13
        --]]
        u127:AdjustSpeed(0)
        local v128 = u123:GetDescendants()
        local function v130(p129) --[[ Line: 421 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            if p129:IsA("BasePart") and (p129.Name ~= "HumanoidRootPart" and p129.Name ~= "StatuePodium") then
                u13:Create(p129, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    ["Transparency"] = 1,
                    ["CanCollide"] = false
                }):Play()
            elseif p129:IsA("Decal") then
                u13:Create(p129, TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    ["Transparency"] = 1
                }):Play()
            end
        end
        for v131, v132 in v128 do
            v130(v132, v131 - 1, v128)
        end
    end)
    return u127
end
u7.CreateController(u28.new())
return nil