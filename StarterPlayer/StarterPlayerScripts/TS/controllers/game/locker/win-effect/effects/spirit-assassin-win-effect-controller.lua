local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.GameQueryUtil
local u6 = v2.MathExtras
local u7 = v2.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u9 = v8.KnitClient
local u10 = v8.KnitClient
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u12 = v11.InOutExpo
local u13 = v11.Linear
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "electric-arc", "lib")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u19 = v18.Players
local u20 = v18.ReplicatedStorage
local u21 = v18.TweenService
local u22 = v18.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u34 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "SpiritAssassinWinEffectController"
    end,
    ["__index"] = u34
})
u35.__index = u35
function u35.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u30
        [3] = u15
    --]]
    u34.constructor(p38, u30.SPIRIT_ASSASSIN)
    p38.Name = "SpiritAssassinWinEffectController"
    p38.canUseTeleport = false
    p38.spiritOrbIsFlashing = false
    p38.maid = u15.new()
end
function u35.KnitStart(u39) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u9
        [3] = u32
        [4] = u19
        [5] = u30
        [6] = u31
        [7] = u7
        [8] = u25
        [9] = u24
        [10] = u10
        [11] = u4
        [12] = u27
    --]]
    u34.KnitStart(u39)
    u9.Controllers.PreloadController:runPreload({
        ["sounds"] = { u32.FORGE_CRYSTAL_EXPLODE, u32.BLACKHOLE_LOOP }
    })
    local _ = u19.LocalPlayer:GetAttribute("WinEffect") == u30.SPIRIT_ASSASSIN
    u31.Client:Get("SpiritAssassinWinEffectSetupComplete"):Connect(function(p40) --[[ Line: 65 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u32
            [3] = u25
            [4] = u24
            [5] = u39
            [6] = u19
            [7] = u10
            [8] = u4
            [9] = u27
        --]]
        u7:playSound(u32.FORGE_CRYSTAL_EXPLODE, {
            ["volumeMultiplier"] = 1,
            ["position"] = p40.spiritOrb:GetPrimaryPartCFrame().Position
        })
        u7:playSound(u32.BLACKHOLE_LOOP, {
            ["volumeMultiplier"] = 1,
            ["looped"] = true,
            ["position"] = p40.spiritOrb:GetPrimaryPartCFrame().Position
        })
        local v41 = p40.spiritModels
        local function v45(u42) --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u24
                [3] = u39
            --]]
            local v43 = u42:FindFirstChild("Humanoid")
            if v43 then
                if v43 ~= nil then
                    v43 = v43:FindFirstChildOfClass("Animator")
                end
                local u44 = v43 and u25:playAnimation(v43, u24.ROBLOX_DEFAULT_FREEFALL, {
                    ["looped"] = true
                })
                if u44 then
                    u39.maid:GiveTask(function() --[[ Line: 95 ]]
                        --[[
                        Upvalues:
                            [1] = u44
                        --]]
                        u44:Stop()
                        u44:Destroy()
                    end)
                end
            end
            task.spawn(function() --[[ Line: 104 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u42
                --]]
                u39:setTransparency(u42)
            end)
        end
        for v46, v47 in v41 do
            v45(v47, v46 - 1, v41)
        end
        if u19.LocalPlayer ~= p40.winningPlayer then
            return nil
        end
        local v48 = p40.spiritModels
        local function v58(u49) --[[ Line: 117 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u4
                [3] = u39
                [4] = u19
                [5] = u27
            --]]
            local v50 = u10.Controllers.ProximityPromptController
            local v51 = {}
            local v52 = u49:GetAttribute("SpiritPlayerName")
            local v53 = v52 == nil and "Player" or v52
            v51.Name = "Soul of " .. tostring(v53)
            local v54 = u49:GetAttribute("SpiritPlayerName")
            local v55 = v54 == nil and "Player" or v54
            v51.ObjectText = "Soul of " .. tostring(v55)
            v51.ActionText = "Teleport"
            v51.AutoLocalize = false
            v51.ClickablePrompt = u4.isMobileControls()
            v51.KeyboardKeyCode = Enum.KeyCode.F
            v51.RequiresLineOfSight = false
            v51.Parent = u49
            v51.MaxActivationDistance = (1 / 0)
            v50:createProximityPrompt(v51).Triggered:Connect(function(p56) --[[ Line: 140 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u19
                    [3] = u27
                    [4] = u49
                --]]
                if not u39.canUseTeleport then
                    return nil
                end
                if p56 == u19.LocalPlayer then
                    local v57 = u27:getEntity(p56)
                    if v57 ~= nil then
                        v57 = v57:isAlive()
                    end
                    if not v57 then
                        return nil
                    end
                    u39:useSpirit(p56, (u49:GetAttribute("SpiritId")))
                end
            end)
        end
        for v59, v60 in v48 do
            v58(v60, v59 - 1, v48)
        end
        u39.canUseTeleport = true
        u39.spiritOrb = p40.spiritOrb
    end)
    u31.Client:Get("SpiritAssassinWinEffectTeleportSuccessful"):Connect(function(p61) --[[ Line: 172 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u19
            [3] = u9
            [4] = u24
        --]]
        u39:createTrail(p61.originalPosition, p61.endPosition)
        u39:playSlashAnimation(p61.player, p61.targetSpirit)
        task.spawn(function() --[[ Line: 175 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39:flashSpiritOrb(u39.spiritOrb)
        end)
        if p61.player == u19.LocalPlayer then
            u9.Controllers.ViewmodelController:playAnimation(u24.FP_DAGGER_SLASH)
            task.delay(0.5, function() --[[ Line: 181 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                u39.canUseTeleport = true
            end)
        end
    end)
end
function u35.onWin(_, _) --[[ Line: 187 ]] end
function u35.useSpirit(p62, _, p63) --[[ Line: 189 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    p62.canUseTeleport = false
    u31.Client:Get("SpiritAssassinWinEffectUseSpirit"):SendToServer({
        ["spiritId"] = p63
    })
end
function u35.createTrail(_, p64, p65) --[[ Line: 195 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u22
        [3] = u14
        [4] = u15
    --]]
    local u66 = u16("Attachment", {
        ["Parent"] = u16("Part", {
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = true,
            ["Position"] = p64,
            ["Parent"] = u22
        })
    })
    local u67 = u16("Attachment", {
        ["Parent"] = u16("Part", {
            ["Transparency"] = 1,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Anchored"] = true,
            ["Position"] = p65,
            ["Parent"] = u22
        })
    })
    local u68 = u14.link(u67, u66, Color3.fromRGB(180, 128, 255))
    local u69 = u15.new()
    u69:GiveTask(u68)
    task.delay(0.3, function() --[[ Line: 223 ]]
        --[[
        Upvalues:
            [1] = u68
            [2] = u66
            [3] = u67
            [4] = u69
        --]]
        u68:Destroy()
        u66:Destroy()
        u67:Destroy()
        u69:DoCleaning()
    end)
end
function u35.playSlashAnimation(p70, p71, p72) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u22
        [3] = u7
        [4] = u32
        [5] = u16
        [6] = u3
        [7] = u25
        [8] = u24
        [9] = u27
        [10] = u28
        [11] = u9
        [12] = u29
        [13] = u17
        [14] = u5
        [15] = u33
        [16] = u12
    --]]
    local v73 = p71.Character
    if v73 ~= nil then
        v73 = v73.PrimaryPart
    end
    if not v73 then
        return nil
    end
    local u74 = u20.Assets.Effects.SpiritAssassinWinEffectGhostExplosion:Clone()
    u74.Parent = u22
    u74.CFrame = p72:GetPrimaryPartCFrame()
    u74.Smoke.Enabled = true
    task.delay(0.5, function() --[[ Line: 244 ]]
        --[[
        Upvalues:
            [1] = u74
        --]]
        u74.Smoke.Enabled = false
    end)
    task.delay(2, function() --[[ Line: 247 ]]
        --[[
        Upvalues:
            [1] = u74
        --]]
        u74:Destroy()
    end)
    u7:playSound(u32.SMOKE_GRENADE_POP, {
        ["position"] = p72:GetPrimaryPartCFrame().Position
    })
    if p70.antiGravityForce then
        p70.antiGravityForce:Destroy()
    end
    v73.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
    local v75 = u16
    local v76 = {
        ["Name"] = "SpiritAssassinWinEffectAntiGravity"
    }
    local v77 = u22.Gravity * v73.AssemblyMass
    v76.Force = Vector3.new(0, v77, 0)
    v76.Parent = v73
    p70.antiGravityForce = v75("BodyForce", v76)
    local v78 = u3:playAnimation(p71, u25:getAssetId(u24.DAGGER_SLASH))
    if v78 ~= nil then
        v78:AdjustSpeed(0.8)
    end
    local v79 = u27:getEntity(p71)
    if not v79 then
        return nil
    end
    local v80
    if v79 == nil then
        v80 = v79
    else
        v80 = v79:getInstance()
    end
    local v81 = u28.DEFAULT
    if v80 then
        v81 = u9.Controllers.KitController:getKitSkin(v80)
    end
    local v82 = u29[v81].spiritAssassin
    local v83 = u7
    local v84
    if v82 == nil then
        v84 = v82
    else
        v84 = v82.daggerSlashSound
    end
    if v84 == nil then
        v84 = u32.SPIRIT_DAGGER_SLASH
    end
    local v85 = {}
    local v86 = p71.Character
    if v86 ~= nil then
        v86 = v86:GetPrimaryPartCFrame().Position
    end
    v85.position = v86
    v85.rollOffMaxDistance = 45
    v85.volumeMultiplier = 0.5
    v83:playSound(v84, v85)
    local v87 = u20.Assets.Effects
    if v82 ~= nil then
        v82 = v82.spinEffect
    end
    local u88 = v87[v82 == nil and "DaggerSpin" or v82]:Clone()
    if not u88:IsA("Model") then
        return nil
    end
    u88:PivotTo(v79:getInstance():GetPrimaryPartCFrame())
    u17(u88, 0.04)
    u88.Parent = u22
    for _, v89 in u88:GetChildren() do
        if v89:IsA("BasePart") then
            u5:setQueryIgnored(v89, true)
        end
    end
    u33.tweenModelSize(u88, 0, u12, 10)
    task.delay(0.3, function() --[[ Line: 322 ]]
        --[[
        Upvalues:
            [1] = u88
        --]]
        u88:Destroy()
    end)
end
function u35.enterSpiritForm(p90, p91) --[[ Line: 326 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u26
    --]]
    for _, u92 in p91:GetDescendants() do
        if u92:IsA("BasePart") and u92.Transparency < 0.5 then
            local u93 = u92:GetAttribute("SpiritTransparency")
            if u93 == nil then
                u93 = u92.Transparency
                u92:SetAttribute("SpiritTransparency", u93)
            end
            local u94 = u92.Material
            u21:Create(u92, TweenInfo.new(0.1), {
                ["Transparency"] = 0.369
            }):Play()
            u92.Material = Enum.Material.ForceField
            p90.maid:GiveTask(function() --[[ Line: 341 ]]
                --[[
                Upvalues:
                    [1] = u92
                    [2] = u21
                    [3] = u26
                    [4] = u93
                    [5] = u94
                --]]
                if u92.Parent then
                    local v95 = {
                        ["Transparency"] = u93
                    }
                    u21:Create(u92, TweenInfo.new(u26.SPIRIT_ARMOR_DELAY), v95):Play()
                    u92.Material = u94
                end
            end)
        end
        if u92:IsA("ParticleEmitter") or u92:IsA("Trail") then
            u92.Enabled = true
            p90.maid:GiveTask(function() --[[ Line: 353 ]]
                --[[
                Upvalues:
                    [1] = u92
                --]]
                u92.Enabled = false
            end)
        end
    end
end
function u35.setTransparency(p96, u97) --[[ Line: 359 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u13
        [3] = u6
    --]]
    u97:AddTag("entity")
    u97:SetAttribute("Transparency", 0.3)
    local u98 = true
    p96.maid:GiveTask(function() --[[ Line: 364 ]]
        --[[
        Upvalues:
            [1] = u98
        --]]
        u98 = false
    end)
    while u98 do
        u23(0.5, u13, function(p99) --[[ Line: 368 ]]
            --[[
            Upvalues:
                [1] = u98
                [2] = u6
                [3] = u97
            --]]
            if not u98 then
                return nil
            end
            u97:SetAttribute("Transparency", (u6:lerp(0.4, 0.7, p99)))
        end):Wait()
        u23(0.5, u13, function(p100) --[[ Line: 375 ]]
            --[[
            Upvalues:
                [1] = u98
                [2] = u6
                [3] = u97
            --]]
            if not u98 then
                return nil
            end
            u97:SetAttribute("Transparency", (u6:lerp(0.7, 0.4, p100)))
        end):Wait()
    end
end
function u35.flashSpiritOrb(u101, p102) --[[ Line: 384 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u13
        [3] = u6
    --]]
    if not p102 then
        return nil
    end
    if u101.spiritOrbIsFlashing then
        return nil
    end
    u101.spiritOrbIsFlashing = true
    local u103 = true
    u101.maid:GiveTask(function() --[[ Line: 393 ]]
        --[[
        Upvalues:
            [1] = u103
        --]]
        u103 = false
    end)
    local u104 = p102:FindFirstChild("bigball")
    if u104 ~= nil then
        u104 = u104:FindFirstChild("inside")
    end
    local u105 = p102:FindFirstChild("bigball")
    if u105 ~= nil then
        u105 = u105:FindFirstChild("outside")
    end
    local u106 = p102:FindFirstChild("bigball")
    local u107 = { u104.Color:ToHSV() }
    local u108 = { u105.Color:ToHSV() }
    local u109 = { u106.Color:ToHSV() }
    local u110 = nil
    u23(0.2, u13, function(p111) --[[ Line: 412 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u110
            [3] = u6
            [4] = u107
            [5] = u101
            [6] = u104
            [7] = u108
            [8] = u105
            [9] = u109
            [10] = u106
        --]]
        if not u103 then
            return nil
        end
        u110 = u6:lerp(u107[3], u107[3] * 1.3, p111)
        u101:setColorValue(u104, u110)
        u110 = u6:lerp(u108[3], u108[3] * 1.3, p111)
        u101:setColorValue(u105, u110)
        u110 = u6:lerp(u109[3], u109[3] * 1.3, p111)
        u101:setColorValue(u106, u110)
    end):Wait()
    u23(0.2, u13, function(p112) --[[ Line: 423 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u110
            [3] = u6
            [4] = u107
            [5] = u101
            [6] = u104
            [7] = u108
            [8] = u105
            [9] = u109
            [10] = u106
        --]]
        if not u103 then
            return nil
        end
        u110 = u6:lerp(u107[3] * 1.3, u107[3], p112)
        u101:setColorValue(u104, u110)
        u110 = u6:lerp(u108[3] * 1.3, u108[3], p112)
        u101:setColorValue(u105, u110)
        u110 = u6:lerp(u109[3] * 1.3, u109[3], p112)
        u101:setColorValue(u106, u110)
    end):Wait()
    u101.spiritOrbIsFlashing = false
end
function u35.setColorValue(_, p113, p114) --[[ Line: 436 ]]
    local v115 = { p113.Color:ToHSV() }
    p113.Color = Color3.fromHSV(v115[1], v115[2], p114)
end
u9.CreateController(u35.new())
return nil