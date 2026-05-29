local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.TweenService
local u15 = v10.Workspace
local u16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u21 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u23 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u24 = u1.import(script, script.Parent, "ui", "wind-walker-status").WindWalkerStatus
local u25 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 31 ]]
        return "WindWalkerController"
    end,
    ["__index"] = u23
})
u25.__index = u25
function u25.new(...) --[[ Line: 37 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v26 = u25
    local v27 = setmetatable({}, v26)
    return v27:constructor(...) or v27
end
function u25.constructor(p28) --[[ Line: 41 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u19
        [3] = u7
    --]]
    u23.constructor(p28, u19.WIND_WALKER)
    p28.Name = "WindWalkerController"
    p28.hudMounted = false
    p28.jumpMaid = u7.new()
    p28.doubleJumpActive = false
    p28.doubleJumpSoundLastPlay = 0
end
function u25.onKitLocalActivated(u29, u30) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u17
    --]]
    u20.Client:OnEvent("WindWalkerSpawned", function() --[[ Line: 50 ]]
        --[[
        Upvalues:
            [1] = u29
        --]]
        if not u29.hudMounted then
            u29.hudMounted = true
            u29:mountHud()
        end
    end):andThen(function(p31) --[[ Line: 55 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:GiveTask(p31)
    end)
    u20.Client:OnEvent("WindWalkerSpeedUpdate", function(p32) --[[ Line: 58 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u29
        --]]
        u17.WindWalkerOrbUpdate:fire(p32.orbCount)
        u29:updateSpeed(p32.multiplier)
        u29:updateJump(p32.orbCount)
    end):andThen(function(p33) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u30
        --]]
        u30:GiveTask(p33)
    end)
end
function u25.onKitLocalDeactivated(_) --[[ Line: 66 ]] end
function u25.onKitReplicationActivated(u34, u35) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u8
    --]]
    u20.Client:OnEvent("WindWalkerEffect", function(p36) --[[ Line: 69 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u8
        --]]
        local v37 = p36.player.Character
        if v37 then
            local v38 = v37:WaitForChild("UpperTorso", 3)
            if v38 ~= nil then
                v38 = v38:WaitForChild("BodyFrontAttachment")
            end
            local v39 = v37:WaitForChild("UpperTorso", 3)
            if v39 ~= nil then
                v39 = v39:WaitForChild("BodyBackAttachment")
            end
            local v40 = u34:getKitSkinMeta(p36.player)
            local v41
            if v40 == nil then
                v41 = v40
            else
                v41 = v40.effects
                if v41 ~= nil then
                    v41 = v41.trail
                    if v41 ~= nil then
                        local v42 = 0
                        local v43 = {}
                        for v44, v45 in v41:GetChildren() do
                            local _ = v44 - 1
                            if v45:IsA("Trail") == true then
                                v42 = v42 + 1
                                v43[v42] = v45
                            end
                        end
                        v41 = table.create(#v43)
                        for v46, v47 in v43 do
                            local _ = v46 - 1
                            v41[v46] = v47:Clone()
                        end
                    end
                end
            end
            if v40 ~= nil then
                v40 = v40.effects
                if v40 ~= nil then
                    v40 = v40.trail
                end
            end
            if not v40 then
                local v48 = u8("Trail", {
                    ["LightEmission"] = 0.5,
                    ["Lifetime"] = 0.33,
                    ["MaxLength"] = 50,
                    ["Transparency"] = NumberSequence.new(0.75)
                })
                table.insert(v41, v48)
            end
            for v49, v50 in v41 do
                local _ = v49 - 1
                v50:SetAttribute("FirstPersonVisible", false)
                v50.Attachment0 = v38
                v50.Attachment1 = v39
                v50.Parent = v37
            end
        end
    end):andThen(function(p51) --[[ Line: 143 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:GiveTask(p51)
    end)
    u20.Client:OnEvent("SpawnWindWalkerOrb", function(p52) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:spawnOrb(p52.entity, p52.position)
    end):andThen(function(p53) --[[ Line: 148 ]]
        --[[
        Upvalues:
            [1] = u35
        --]]
        u35:GiveTask(p53)
    end)
end
function u25.onKitReplicationDeactivated(_) --[[ Line: 152 ]] end
function u25.onInnateAbilityEnabled(_, _, _) --[[ Line: 154 ]] end
function u25.onAbilityUsed(_, _, _) --[[ Line: 156 ]] end
function u25.mountHud(_) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u9
        [3] = u24
    --]]
    local v54 = u11.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("StatusEffectHudScreen"):WaitForChild("StatusEffectHud")
    u9.mount(u9.createElement(u24), v54)
end
function u25.updateSpeed(p55, p56) --[[ Line: 162 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    if p55.currentSpeedModifier then
        p55.currentSpeedModifier:Destroy()
    end
    if p56 == 1 then
        return nil
    end
    p55.currentSpeedModifier = u4.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["moveSpeedMultiplier"] = p56
    })
end
function u25.updateJump(u57, p58) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u15
        [4] = u2
    --]]
    if p58 >= 5 and not u57.doubleJumpActive then
        u57.doubleJumpActive = true
        local v59 = u5.Controllers.JumpHeightController:getJumpModifier():addModifier({
            ["airJumps"] = 2
        })
        u57.jumpMaid:GiveTask(v59)
        local v60 = u11.LocalPlayer.Character
        if v60 ~= nil then
            v60 = v60:FindFirstChildOfClass("Humanoid")
        end
        if v60 then
            u57.jumpMaid:GiveTask(v60.StateChanged:Connect(function(p61, p62) --[[ Line: 186 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u57
                    [3] = u11
                    [4] = u2
                --]]
                if p61 ~= Enum.HumanoidStateType.Freefall or p62 ~= Enum.HumanoidStateType.Jumping then
                    return nil
                end
                local v63 = u15:GetServerTimeNow()
                if v63 - u57.doubleJumpSoundLastPlay < 0.2 then
                    return nil
                end
                u57.doubleJumpSoundLastPlay = v63
                local v64 = u57:getKitSkinMeta(u11.LocalPlayer)
                if v64 ~= nil then
                    v64 = v64.sounds
                    if v64 ~= nil then
                        v64 = v64.doubleJump
                    end
                end
                if v64 == nil or #v64 < 1 then
                    return nil
                end
                u2:playSound(v64[math.random(0, #v64 - 1) + 1])
            end))
            return
        end
    elseif p58 < 5 and u57.doubleJumpActive then
        u57.doubleJumpActive = false
        u57.jumpMaid:DoCleaning()
    end
end
function u25.spawnOrb(u65, u66, u67) --[[ Line: 214 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u11
        [3] = u2
        [4] = u21
        [5] = u12
        [6] = u15
        [7] = u16
        [8] = u6
        [9] = u13
        [10] = u4
        [11] = u22
        [12] = u8
        [13] = u1
        [14] = u14
    --]]
    local v68 = u66:FindFirstChild("UpperTorso")
    if v68 ~= nil then
        v68 = v68:FindFirstChild("BodyFrontAttachment")
    end
    if v68 then
        local u69 = u7.new()
        local u70 = false
        u69:GiveTask(function() --[[ Line: 223 ]]
            --[[
            Upvalues:
                [1] = u70
            --]]
            u70 = true
        end)
        local u71 = u66 == u11.LocalPlayer.Character
        local v72 = u65:getKitSkinMeta(u11.LocalPlayer)
        local v73 = u2
        if v72 ~= nil then
            v72 = v72.sounds
            if v72 ~= nil then
                v72 = v72.orbSpawn
            end
        end
        if v72 == nil then
            v72 = u21.WIND_ORB_SPAWN
        end
        local v74 = {}
        local v75
        if u71 then
            v75 = nil
        else
            v75 = u66:GetPivot().Position
        end
        v74.position = v75
        v73:playSound(v72, v74)
        local u76 = u12:WaitForChild("Assets"):WaitForChild("Misc"):WaitForChild("WindWalkerOrb"):Clone()
        u76:WaitForChild("Spirit")
        u76:PivotTo(CFrame.new(u67))
        u76.Parent = u15
        u69:GiveTask(function() --[[ Line: 261 ]]
            --[[
            Upvalues:
                [1] = u76
            --]]
            local v77 = u76
            if v77 ~= nil then
                v77:Destroy()
            end
        end)
        local v78 = math.random() * 3.141592653589793 * 2
        local v79 = math.cos(v78) * 3
        local v80 = math.sin(v78) * 3
        local u81 = Vector3.new(v79, 2, v80)
        local u84 = u16(0.5, u6, function(p82) --[[ Line: 269 ]]
            --[[
            Upvalues:
                [1] = u67
                [2] = u81
                [3] = u76
            --]]
            local v83 = u67:Lerp(u67 + u81, p82)
            u76:PivotTo(CFrame.new(v83))
        end)
        u69:GiveTask(function() --[[ Line: 274 ]]
            --[[
            Upvalues:
                [1] = u84
            --]]
            return u84:Cancel()
        end)
        task.delay(0.5, function() --[[ Line: 277 ]]
            --[[
            Upvalues:
                [1] = u70
                [2] = u13
                [3] = u66
                [4] = u69
                [5] = u76
                [6] = u71
                [7] = u65
                [8] = u11
                [9] = u2
                [10] = u21
                [11] = u4
                [12] = u12
                [13] = u15
                [14] = u22
            --]]
            if u70 then
                return nil
            end
            local u85 = os.clock()
            local u86 = nil
            u86 = u13.Heartbeat:Connect(function(p87) --[[ Line: 283 ]]
                --[[
                Upvalues:
                    [1] = u66
                    [2] = u69
                    [3] = u85
                    [4] = u76
                    [5] = u71
                    [6] = u65
                    [7] = u11
                    [8] = u2
                    [9] = u21
                    [10] = u4
                    [11] = u12
                    [12] = u15
                    [13] = u22
                    [14] = u86
                --]]
                if not u66.PrimaryPart then
                    u69:DoCleaning()
                    return nil
                end
                local v88 = 30 + (os.clock() - u85) * 100
                local v89 = u66.PrimaryPart.Position
                local v90 = v89 - u76:GetPrimaryPartCFrame().Position
                if v90.Magnitude > v88 * p87 then
                    v90 = v90.Unit * (v88 * p87)
                else
                    if u71 then
                        local v91 = u65:getKitSkinMeta(u11.LocalPlayer)
                        local v92 = u2
                        if v91 ~= nil then
                            v91 = v91.sounds
                            if v91 ~= nil then
                                v91 = v91.orbGet
                            end
                        end
                        if v91 == nil then
                            v91 = u21.WIND_ORB_GET
                        end
                        local v93 = {}
                        local v94
                        if u71 then
                            v94 = nil
                        else
                            v94 = u66:GetPrimaryPartCFrame().Position
                        end
                        v93.position = v94
                        local v95
                        if u71 then
                            v95 = nil
                        else
                            v95 = u66.PrimaryPart
                        end
                        v93.parent = v95
                        v92:playSound(v91, v93)
                        u4.Controllers.ScreenShakeController:shake(u76:GetPivot().Position, v90.Unit, {
                            ["magnitude"] = 0.3,
                            ["cycles"] = 2
                        })
                    end
                    local v96 = u65:getKitSkinMeta(u11.LocalPlayer)
                    if v96 ~= nil then
                        v96 = v96.effects
                        if v96 ~= nil then
                            v96 = v96.hitEffect
                            if v96 ~= nil then
                                v96 = v96:Clone()
                            end
                        end
                    end
                    if v96 == nil then
                        v96 = u12.Assets.Effects.WindHitEffect:Clone()
                    end
                    v96.CFrame = CFrame.new(v89, v89 + v90)
                    v96.Parent = u15
                    u22:playEffects({ v96 }, nil, {
                        ["destroyAfterSec"] = 2
                    })
                    u86:Disconnect()
                    u76:Destroy()
                end
                u76:PivotTo(u76:GetPivot() + v90)
            end)
            u69:GiveTask(u86)
        end)
        local u97 = u8("Beam", {
            ["LightEmission"] = 0.6,
            ["LightInfluence"] = 1,
            ["Width0"] = 0.4,
            ["Width1"] = 0.2,
            ["CurveSize0"] = 3,
            ["CurveSize1"] = -3,
            ["FaceCamera"] = true,
            ["Attachment0"] = u76:FindFirstChild("Spirit"):FindFirstChild("Attachment"),
            ["Attachment1"] = v68,
            ["Transparency"] = NumberSequence.new(0.8),
            ["Parent"] = u76
        })
        local u98 = u97:Clone()
        u98.FaceCamera = false
        u98.Parent = u76
        u1.Promise.defer(function() --[[ Line: 370 ]]
            --[[
            Upvalues:
                [1] = u97
                [2] = u14
                [3] = u98
            --]]
            local v99 = 1
            while u97.Parent do
                local v100 = 0.4 + 0.2 * math.random()
                local v101 = u14:Create(u97, TweenInfo.new(v100), {
                    ["CurveSize0"] = v99 * -3,
                    ["CurveSize1"] = v99 * 3
                })
                u14:Create(u98, TweenInfo.new(v100), {
                    ["CurveSize0"] = v99 * -3,
                    ["CurveSize1"] = v99 * 3
                }):Play()
                v101:Play()
                v101.Completed:Wait()
                v99 = v99 * -1
            end
        end)
        u1.Promise.delay(2.5):andThen(function() --[[ Line: 391 ]]
            --[[
            Upvalues:
                [1] = u69
            --]]
            u69:DoCleaning()
        end)
    end
end
function u25.getKitSkinMeta(_, p102) --[[ Line: 397 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u18
    --]]
    local v103 = u4.Controllers.KitSkinController:getKitSkin(p102)
    if v103 == nil then
        return nil
    else
        local v104 = u18[v103]
        if v104 == nil then
            return nil
        else
            return v104.windWalker
        end
    end
end
u4.CreateController(u25.new())
return nil