local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.SoundManager
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v7 = v6.KnitClient
local u8 = v6.KnitClient
local u9 = v6.TableUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.ReplicatedStorage
local u17 = v14.RunService
local u18 = v14.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v20 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u21 = v20.InputActionType
local u22 = v20.MoveMountDirection
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil
local u36 = v1.import(script, script.Parent.Parent, "win-effect").WinEffect
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "DragonRiderEffectController"
    end,
    ["__index"] = u36
})
u37.__index = u37
function u37.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(u40) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u30
        [3] = u11
        [4] = u19
        [5] = u22
        [6] = u21
        [7] = u31
        [8] = u25
        [9] = u32
        [10] = u34
        [11] = u5
        [12] = u33
    --]]
    u36.constructor(u40, u30.DRAGON_RIDER)
    u40.upHeld = false
    u40.downHeld = false
    u40.maid = u11.new()
    u40.dragonEffectMap = {}
    u40.maid:GiveTask(u19.MoveMountButtonChange:connect(function(p41) --[[ Line: 60 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u40
            [3] = u21
        --]]
        local v42 = p41.direction
        if v42 == u22.UP then
            u40.upHeld = p41.inputActionType == u21.PRESS
        elseif v42 == u22.DOWN then
            u40.downHeld = p41.inputActionType == u21.PRESS
        end
    end))
    u40.maid:GiveTask(u19.MatchStateChange:connect(function(p43) --[[ Line: 73 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u40
            [3] = u19
            [4] = u25
            [5] = u32
            [6] = u34
            [7] = u5
            [8] = u33
        --]]
        if p43.matchState == u31.POST then
            u40.maid:GiveTask(u19.AbilityInputStateChanged:connect(function(p44) --[[ Line: 75 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u32
                --]]
                if p44.ability.abilityId ~= u25.YUZI_DRAGON_FIRE_BREATH_WIN_EFFECT then
                    return nil
                end
                u32.Client:Get("YuziDragonFireBreathWinEffectRequest"):SendToServer({
                    ["enabled"] = p44.inputState == Enum.UserInputState.Begin
                })
            end))
            u40.maid:GiveTask(u32.Client:Get("YuziDragonFireBreathWinEffect"):Connect(function(p45) --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u34
                    [3] = u5
                    [4] = u33
                --]]
                local v46 = u40.dragonEffectMap[p45.userId]
                if v46 then
                    u34:toggleEffects(v46, p45.enabled, 0.5)
                    if not u40.burnSound then
                        u40.burnSound = u5:playModifiableSound(u33.FIRE_LOOP, {
                            ["volumeMultiplier"] = 0.4,
                            ["looped"] = true
                        })
                        u40.maid:GiveTask(u40.burnSound)
                    end
                    u40.burnSound.Volume = p45.enabled and 0.4 or 0
                    if p45.enabled and not u40.roarSound then
                        u40.roarSound = u5:playModifiableSound(u33.DRAGON_ROAR)
                        u40.roarSound.Ended:Connect(function() --[[ Line: 99 ]]
                            --[[
                            Upvalues:
                                [1] = u40
                            --]]
                            local v47 = u40.roarSound
                            if v47 ~= nil then
                                v47:Destroy()
                            end
                            u40.roarSound = nil
                        end)
                    end
                end
            end))
        end
    end))
end
function u37.onWin(u48, u49) --[[ Line: 112 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u12
        [3] = u18
        [4] = u15
        [5] = u16
        [6] = u34
        [7] = u27
        [8] = u26
        [9] = u10
        [10] = u17
    --]]
    local v50 = u49.Character
    if not v50 then
        return nil
    end
    local u51 = v50:FindFirstChild("Humanoid")
    if not u51 then
        return nil
    end
    local u52 = v50.PrimaryPart
    if not u52 then
        return nil
    end
    local u53 = u28:getEntity(u49)
    if not u53 then
        return nil
    end
    local v54 = u12
    local v55 = {
        ["Parent"] = u18
    }
    local v56 = u49.UserId
    v55.Name = "Dragon_" .. tostring(v56)
    local v57 = v54("Folder", v55)
    u48.maid:GiveTask(v57)
    local v58 = {
        ["Name"] = "DragonPart_Start"
    }
    local v59 = u49.Character
    if v59 ~= nil then
        v59 = v59:GetPivot()
    end
    v58.CFrame = v59
    v58.Size = Vector3.new(4.525, 5.648, 7.5)
    v58.Anchored = true
    v58.CanCollide = false
    v58.CanQuery = false
    v58.CanTouch = false
    v58.Transparency = 1
    v58.Parent = v57
    local u60 = u12("Part", v58)
    u48.maid:GiveTask(u60)
    if u15.LocalPlayer == u49 then
        u48:mountUi(u49)
        u48:bindControls()
        u48:orientCamera(u52)
        u48:setupFireBreathAbility()
    end
    local v61 = u12("Attachment", {
        ["Parent"] = v50.PrimaryPart
    })
    u48.maid:GiveTask(v61)
    local v62 = u12("AngularVelocity", {
        ["MaxTorque"] = 5000,
        ["RelativeTo"] = Enum.ActuatorRelativeTo.Attachment0,
        ["Attachment0"] = v61,
        ["Parent"] = v50.PrimaryPart
    })
    u48.maid:GiveTask(v62)
    local u63 = u48:makeDragonSegments(u60, 7, 5, v57)
    local v64 = u63[#u63 - 1 + 1]
    local v65 = u16.Assets.Effects.DragonEffect:Clone()
    local v66 = v64:GetPivot()
    local v67 = CFrame.new(Vector3.new(0, -2, -8))
    local v68 = CFrame.Angles(0, 1.5707963267948966, 0)
    v65:PivotTo(v66 * v67 * v68)
    v65.Anchored = false
    v65.Parent = v64
    u34:toggleEffects(v65, false)
    u48.dragonEffectMap[u49.UserId] = v65
    u48.maid:GiveTask(function() --[[ Line: 185 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u49
        --]]
        local v69 = u48.dragonEffectMap[u49.UserId]
        if v69 ~= nil then
            v69:Destroy()
        end
        u48.dragonEffectMap[u49.UserId] = nil
    end)
    local v70 = u12("WeldConstraint", {
        ["Part0"] = v64,
        ["Part1"] = v65,
        ["Parent"] = v64
    })
    u48.maid:GiveTask(v70)
    v50.Archivable = true
    local v71 = v50:Clone()
    v71.Parent = v57
    v71.Name = "Conductor"
    for v72, v73 in v71:GetDescendants() do
        local _ = v72 - 1
        if v73:IsA("Part") then
            v73.CanCollide = false
            v73.CanQuery = false
            v73.CanTouch = false
        end
    end
    v71:PivotTo(v64:GetPivot() + Vector3.new(0, 3, 0))
    u48.maid:GiveTask(v71)
    local v74 = u12("WeldConstraint", {
        ["Parent"] = v64,
        ["Part0"] = v64,
        ["Part1"] = v71.PrimaryPart
    })
    u48.maid:GiveTask(v74)
    local u75 = v71:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation((u12("Animation", {
        ["AnimationId"] = u27:getAssetId(u26.R15_SIT)
    })))
    u75:Play()
    u48.maid:GiveTask(function() --[[ Line: 236 ]]
        --[[
        Upvalues:
            [1] = u75
        --]]
        u75:Stop()
        u75:Destroy()
    end)
    u53:getInstance():SetAttribute("Transparency", 1)
    u53:hideNametag()
    u48.maid:GiveTask(function() --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u53
        --]]
        u53:getInstance():SetAttribute("Transparency", 0)
        u53:showNametag()
    end)
    local u76 = 0
    local u77 = u10.SingleMotor.new(0)
    u17.Heartbeat:Connect(function(p78) --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u76
            [2] = u49
            [3] = u60
            [4] = u48
            [5] = u63
            [6] = u15
            [7] = u52
            [8] = u77
            [9] = u10
            [10] = u51
        --]]
        u76 = u76 + p78
        local v79 = u49.Character:GetPivot()
        local v80 = u76
        local v81 = math.rad(v80) * 150
        local v82 = math.sin(v81) * 5
        u60.CFrame = v79 + Vector3.new(0, v82, 0)
        u48:solveIK(u63, u60)
        if u15.LocalPlayer == u49 and u52 then
            u52.CFrame = u52.CFrame * CFrame.new(0, 0, -20 * p78)
            if u48.upHeld and not u48.downHeld then
                u77:setGoal(u10.Spring.new(938))
            elseif u48.downHeld and not u48.upHeld then
                u77:setGoal(u10.Spring.new(-938))
            else
                u77:setGoal(u10.Spring.new(0, {
                    ["frequency"] = 1
                }))
            end
            local v83 = u52
            local v84 = u77:getValue() * p78
            v83.AssemblyLinearVelocity = Vector3.new(0, v84, 0)
            u51:Move(Vector3.new(0, 0, 0))
        end
    end)
end
function u37.makeDragonSegments(_, p85, p86, p87, p88) --[[ Line: 274 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u12
        [3] = u35
        [4] = u9
    --]]
    local v89 = {}
    local v90 = setmetatable({}, {
        ["__index"] = v89
    })
    v90.HEAD = "headSegment"
    v89.headSegment = "HEAD"
    v90.LEG = "legSegment"
    v89.legSegment = "LEG"
    v90.TORSO = "torsoSegment"
    v89.torsoSegment = "TORSO"
    local v91 = {}
    local v92 = v90.HEAD
    local v93 = v90.LEG
    table.insert(v91, v92)
    table.insert(v91, v93)
    local v94 = false
    local v95 = 0
    local v96 = {}
    while true do
        if v94 then
            v95 = v95 + 1
        else
            v94 = true
        end
        if v95 >= p86 then
            break
        end
        local v97 = v90.TORSO
        table.insert(v91, v97)
    end
    local v98 = v90.LEG
    table.insert(v91, v98)
    local v99 = false
    local v100 = 0
    while true do
        if v99 then
            v100 = v100 + 1
        else
            v99 = true
        end
        if v100 >= p87 then
            break
        end
        local v101 = v90.TORSO
        table.insert(v91, v101)
    end
    local v102 = false
    local v103 = 0
    while true do
        if v102 then
            v103 = v103 + 1
        else
            v102 = true
        end
        if v103 >= #v91 then
            return u9.Reverse(v96)
        end
        local v104 = u16.Assets.Misc.PaperDragon[v91[v103 + 1]]:Clone()
        table.insert(v96, v104)
        v104.Size = p85.Size
        v104.CFrame = p85.CFrame * CFrame.new(0, 0, p85.Size.Z + p85.Size.Z)
        local v105 = u12("Model", {
            ["Children"] = { v104 },
            ["Parent"] = p88,
            ["PrimaryPart"] = v104
        })
        if #v91 - p87 <= v103 then
            u35.scaleModel(v105, 1 / (v103 + 1 - (#v91 - p87)))
        end
        v104.Parent = p88
        v105:Destroy()
    end
end
function u37.makeSegments(_, p106, p107, p108, p109) --[[ Line: 363 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v110 = p108 / p107
    local v111 = false
    local v112 = 0
    local v113 = {}
    while true do
        if v111 then
            v112 = v112 + 1
        else
            v111 = true
        end
        if v112 >= p107 then
            return v113
        end
        local v114 = {
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["CanQuery"] = false,
            ["CanTouch"] = false,
            ["Name"] = "DragonPart" .. tostring(v112)
        }
        local v115 = 5 - (p107 - v112) * 5 / p107 + 1
        local v116 = 5 - (p107 - v112) * 5 / p107 + 1
        v114.Size = Vector3.new(v115, v116, v110)
        v114.Color = Color3.fromRGB(255, 255, 255)
        v114.CFrame = p106.CFrame * CFrame.new(0, 0, p106.Size.Z + v110 * (v112 - 1))
        v114.Parent = p109
        local v117 = u12("Part", v114)
        table.insert(v113, v117)
    end
end
function u37.solveIK(_, p118, p119) --[[ Line: 398 ]]
    local v120 = #p118 - 1
    local v121 = false
    local v122 = nil
    while true do
        if v121 then
            v120 = v120 - 1
        else
            v121 = true
        end
        if v120 < 0 then
            return
        end
        local v123 = p118[v120 + 1]
        local v124
        if v122 then
            v124 = (v122.CFrame * CFrame.new(0, 0, v122.Size.Z / 2)).Position
        else
            v124 = p119.Position
        end
        local v125 = (v123.CFrame * CFrame.new(0, 0, v123.Size.Z / 2)).Position
        local v126 = CFrame.new(v124, v125)
        local v127 = CFrame.new(0, 0, -v123.Size.Z / 2)
        local v128 = CFrame.Angles(0, 3.141592653589793, 0)
        v123.CFrame = v126 * v127 * v128
        v122 = v123
    end
end
function u37.mountUi(p129, p130) --[[ Line: 432 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u8
        [3] = u13
        [4] = u23
    --]]
    if u4.isMobileControls() then
        u8.Controllers.MobileUiController:toggleMountMovementControls(true)
        p129.maid:GiveTask(function() --[[ Line: 435 ]]
            --[[
            Upvalues:
                [1] = u8
            --]]
            u8.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u131 = u13.mount(u13.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u13.createElement(u23) }), p130:WaitForChild("PlayerGui"))
        p129.maid:GiveTask(function() --[[ Line: 444 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u131
            --]]
            u13.unmount(u131)
        end)
    end
end
function u37.orientCamera(_, p132) --[[ Line: 449 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u15
    --]]
    if u18.CurrentCamera then
        u18.CurrentCamera.CameraSubject = p132
        u15.LocalPlayer.CameraMaxZoomDistance = 100
        u15.LocalPlayer.CameraMinZoomDistance = 60
    end
end
function u37.bindControls(u133) --[[ Line: 456 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    local v134 = u24.bindUpDownControls()
    u133.maid:GiveTask(v134.bindActionMaid)
    u133.maid:GiveTask(v134.shouldFlyUpRef.Changed:Connect(function(p135) --[[ Line: 459 ]]
        --[[
        Upvalues:
            [1] = u133
        --]]
        u133.upHeld = p135
        return u133.upHeld
    end))
    u133.maid:GiveTask(v134.shouldFlyDownRef.Changed:Connect(function(p136) --[[ Line: 463 ]]
        --[[
        Upvalues:
            [1] = u133
        --]]
        u133.downHeld = p136
        return u133.downHeld
    end))
end
function u37.setupFireBreathAbility(_) --[[ Line: 468 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u29
    --]]
    local v137 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v138 = u25.YUZI_DRAGON_FIRE_BREATH_WIN_EFFECT
    local v139 = {
        ["abilityType"] = "MiscPrimary",
        ["abilityButton"] = {
            ["icon"] = u29.FIRE_ENCHANT
        }
    }
    v137:enableAbility(v138, v139)
end
v7.CreateController(u37.new())
return nil