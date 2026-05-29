local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AnimationUtil
local u4 = v2.DeviceUtil
local u5 = v2.RandomUtil
local u6 = v2.SoundManager
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "inspect", "inspect")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u16 = v15.Players
local u17 = v15.RunService
local u18 = v15.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u20 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v21 = u1.import(script, script.Parent.Parent.Parent.Parent, "movement", "event", "move-mount-event")
local u22 = v21.InputActionType
local u23 = v21.MoveMountDirection
local u24 = u1.import(script, script.Parent.Parent.Parent.Parent, "movement", "move-mount-ui").MoveMountUI
local u25 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "mount", "mount-flight-controls").MountFlightControls
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "environments", "season-x-environment").SeasonXEnvironment
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "items", "angel-wings", "angel-wings-types").AngelWingsColors
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "win-effect", "win-effect-type").WinEffectType
local u32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "log", "logger-provider").LoggerProvider
local u33 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u34 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u35 = u1.import(script, script.Parent.Parent, "win-effect").WinEffect
local v36 = {}
local u37 = setmetatable({}, {
    ["__index"] = v36
})
u37.Hover = 0
v36[0] = "Hover"
u37.Fly = 1
v36[1] = "Fly"
u37.Dive = 2
v36[2] = "Dive"
u37.DiveTransition = 3
v36[3] = "DiveTransition"
u37.GroundSmash = 4
v36[4] = "GroundSmash"
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 59 ]]
        return "AngelWingsWinEffectController"
    end,
    ["__index"] = u35
})
u38.__index = u38
function u38.new(...) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 69 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u31
        [3] = u10
        [4] = u37
        [5] = u19
        [6] = u12
        [7] = u32
    --]]
    u35.constructor(p41, u31.ANGEL_WINGS)
    p41.Name = "AngelWingsWinEffectController"
    p41.targetVerticalVelocity = u10.SingleMotor.new(0)
    p41.flyState = u37.Hover
    p41.flyStateUpdate = u19.new()
    p41.angelWingsPlayers = {}
    p41.upHeld = false
    p41.downHeld = false
    p41.maid = u12.new()
    p41.stateMaid = u12.new()
    p41.logger = u32.getLogger("AngelWingsWinEffectController")
    p41.playerWingsAnimator = {}
end
function u38.KnitStart(u42) --[[ Line: 83 ]]
    --[[
    Upvalues:
        [1] = u35
        [2] = u8
        [3] = u29
        [4] = u26
        [5] = u34
        [6] = u33
        [7] = u16
        [8] = u1
        [9] = u6
        [10] = u28
        [11] = u11
    --]]
    u35.KnitStart(u42)
    u8.Controllers.PreloadController:preloadForItemType(u29.ANGEL_WINGS, {
        ["animations"] = {
            u26.ANGEL_WINGS_FLYING,
            u26.ANGEL_WINGS_DIVING_IDLE,
            u26.ANGEL_WINGS_DIVE,
            u26.ANGEL_WINGS_PLAYER_FLYING,
            u26.ANGEL_WINGS_PLAYER_DIVING_IDLE,
            u26.ANGEL_WINGS_PLAYER_DIVE,
            u26.ANGEL_WINGS_PLAYER_FLY,
            u26.ANGEL_WINGS_PLAYER_IDLE,
            u26.ANGEL_WINGS_WINGS_IDLE,
            u26.ANGEL_WINGS_GROUND_SMASH,
            u26.ANGEL_WINGS_PLAYER_GROUND_SMASH
        },
        ["sounds"] = {
            u34.XUROT_FLAP_WING_1,
            u34.XUROT_FLAP_WING_2,
            u34.WIND_TUNNEL_FLYING,
            u34.JUGGERNAUT_GROUND_SMASH
        }
    })
    u33.Client:OnEvent("AngelWingsWinEffectSetupComplete", function(u43) --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u16
            [3] = u1
            [4] = u6
            [5] = u8
            [6] = u28
            [7] = u11
        --]]
        local v44 = u42.angelWingsPlayers
        local v45 = u43.winningPlayer.UserId
        table.insert(v44, v45)
        if u16.LocalPlayer == u43.winningPlayer then
            u1.Promise.new(function(p46) --[[ Line: 94 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u6
                    [3] = u8
                    [4] = u28
                    [5] = u16
                    [6] = u42
                --]]
                local v47 = u43.music
                if v47 ~= "" and v47 then
                    u6:playSound(u43.music, {
                        ["looped"] = true,
                        ["fadeInTime"] = 1,
                        ["fadeOutTime"] = 1
                    })
                end
                if u43.useSeasonXSkybox then
                    u8.Controllers.EnvironmentController:setupEnvironment(u28)
                end
                local v48 = u16.LocalPlayer.Character:WaitForChild("Humanoid", 5)
                u42:mountUi(u16.LocalPlayer)
                u42:bindControls(v48)
                u42:orientCamera()
                return p46()
            end):timeout(5):catch(function(p49) --[[ Line: 111 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u11
                --]]
                u42.logger:Error("Failed to setup angel wings win effect on local player with reason: {err}", u11(p49))
            end)
        end
    end)
end
function u38.onWin(u50, u51) --[[ Line: 117 ]]
    --[[
    Upvalues:
        [1] = u33
        [2] = u1
        [3] = u29
        [4] = u16
        [5] = u17
        [6] = u37
        [7] = u10
        [8] = u20
        [9] = u23
        [10] = u22
        [11] = u11
    --]]
    u33.Client:Get("RequestAngelWingsEffect"):SendToServer(true)
    u50:updateWingType(u51, (u33.Client:Get("RequestAngelWingsEffectType"):CallServer(u51)))
    u1.Promise.new(function(p52, p53) --[[ Line: 122 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u51
            [3] = u29
        --]]
        while true do
            local v54 = u50.angelWingsPlayers
            local v55 = u51.UserId
            if table.find(v54, v55) ~= nil then
                break
            end
            wait(0.3)
        end
        if not u51.Character then
            return p53("Winning player has no character model")
        end
        local v56 = u51.Character:WaitForChild(u29.ANGEL_WINGS, 5)
        if not v56 then
            return p53("Could not find angel wings on player")
        end
        u50.playerWingsAnimator[u51.UserId] = v56.Handle.rig.AnimationController.Animator
        return p52()
    end):andThen(function() --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u51
            [3] = u16
            [4] = u17
            [5] = u37
            [6] = u10
            [7] = u20
            [8] = u23
            [9] = u22
        --]]
        u50.flyStateUpdate:Connect(function(p57, p58) --[[ Line: 145 ]]
            --[[
            Upvalues:
                [1] = u50
            --]]
            return u50:handleEventTransitions(p57, p58)
        end)
        if u51 == u16.LocalPlayer then
            local u59 = u16.LocalPlayer.Character:WaitForChild("Humanoid", 1)
            local u60 = 0
            u50.maid:GiveTask(u17.Heartbeat:Connect(function(p61) --[[ Line: 151 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u37
                    [3] = u59
                    [4] = u51
                    [5] = u60
                    [6] = u10
                    [7] = u16
                --]]
                if u50.flyState == u37.Hover and u59.MoveDirection.Magnitude > 3 then
                    u50.flyStateUpdate:Fire(u51, u37.Fly)
                end
                if u50.upHeld and not u50.downHeld then
                    u60 = -0.3
                    u50.targetVerticalVelocity:setGoal(u10.Spring.new(25, {
                        ["frequency"] = 1,
                        ["dampingRatio"] = 0.45
                    }))
                elseif u50.upHeld or not u50.downHeld then
                    u60 = -0.3
                    u50.targetVerticalVelocity:setGoal(u10.Spring.new(0, {
                        ["frequency"] = 1,
                        ["dampingRatio"] = 0.45
                    }))
                else
                    u60 = u60 + p61
                    local v62 = u50.targetVerticalVelocity
                    local v63 = u10.Instant.new
                    local v64 = u60 * u60 * 10
                    v62:setGoal(v63(-math.clamp(v64, 0, 50)))
                end
                local v65 = u16.LocalPlayer.Character
                local v66
                if v65 == nil then
                    v66 = v65
                else
                    v66 = v65.PrimaryPart
                end
                if not v66 then
                    return nil
                end
                local v67 = v65.PrimaryPart.AssemblyLinearVelocity
                local v68 = u50.targetVerticalVelocity:getValue()
                local v69 = Vector3.new(0, v68, 0)
                v65.PrimaryPart.AssemblyLinearVelocity = v67 * Vector3.new(1, 0, 1) + v69
            end))
            u50.maid:GiveTask(u59.StateChanged:Connect(function(_, p70) --[[ Line: 187 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u37
                    [3] = u51
                --]]
                if p70 ~= Enum.HumanoidStateType.Freefall and u50.flyState == u37.Dive then
                    u50.flyStateUpdate:Fire(u51, u37.GroundSmash)
                end
            end))
            u50.maid:GiveTask(u20.MoveMountButtonChange:connect(function(p71) --[[ Line: 192 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u50
                    [3] = u22
                    [4] = u59
                --]]
                local v72 = p71.direction
                if v72 == u23.UP then
                    u50:moveUp(p71.inputActionType == u22.PRESS)
                    return
                elseif v72 == u23.DOWN then
                    u50:moveDown(p71.inputActionType == u22.PRESS, u59)
                end
            end))
        end
    end):timeout(8):catch(function(p73) --[[ Line: 206 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u11
            [3] = u51
            [4] = u16
        --]]
        u50.logger:Error("Failed to setup angel wings win effect with reason: {reason}", u11(p73))
        if u51 == u16.LocalPlayer then
            u50.maid:DoCleaning()
        end
    end)
end
function u38.mountUi(p74, p75) --[[ Line: 213 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u9
        [3] = u14
        [4] = u24
    --]]
    if u4.isMobileControls() then
        u9.Controllers.MobileUiController:toggleMountMovementControls(true)
        p74.maid:GiveTask(function() --[[ Line: 216 ]]
            --[[
            Upvalues:
                [1] = u9
            --]]
            u9.Controllers.MobileUiController:toggleMountMovementControls(false)
        end)
    else
        local u76 = u14.mount(u14.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u14.createElement(u24) }), p75:WaitForChild("PlayerGui"))
        p74.maid:GiveTask(function() --[[ Line: 225 ]]
            --[[
            Upvalues:
                [1] = u14
                [2] = u76
            --]]
            u14.unmount(u76)
        end)
    end
end
function u38.orientCamera(_) --[[ Line: 230 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
    --]]
    if u18.CurrentCamera then
        u16.LocalPlayer.CameraMaxZoomDistance = 40
        u16.LocalPlayer.CameraMinZoomDistance = 20
    end
end
function u38.bindControls(u77, u78) --[[ Line: 236 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    local v79 = u25.bindUpDownControls()
    u77.maid:GiveTask(v79.bindActionMaid)
    u77.maid:GiveTask(v79.shouldFlyUpRef.Changed:Connect(function(p80) --[[ Line: 239 ]]
        --[[
        Upvalues:
            [1] = u77
        --]]
        return u77:moveUp(p80)
    end))
    u77.maid:GiveTask(v79.shouldFlyDownRef.Changed:Connect(function(p81) --[[ Line: 242 ]]
        --[[
        Upvalues:
            [1] = u77
            [2] = u78
        --]]
        return u77:moveDown(p81, u78)
    end))
end
function u38.handleEventTransitions(u82, u83, p84) --[[ Line: 246 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u27
        [3] = u26
        [4] = u3
        [5] = u6
        [6] = u5
        [7] = u34
        [8] = u1
        [9] = u8
        [10] = u16
    --]]
    local u85 = u82.playerWingsAnimator[u83.UserId]
    local v86 = u85 ~= nil
    assert(v86, "Sent angel wings state update without wings animator")
    u82.flyState = p84
    u82.stateMaid:DoCleaning()
    if p84 == u37.Hover then
        local u87 = u27:playAnimation(u85, u26.ANGEL_WINGS_WINGS_IDLE, {
            ["looped"] = true
        })
        local u88 = u3:playAnimation(u83, u27:getAssetId(u26.ANGEL_WINGS_PLAYER_IDLE), {
            ["looped"] = true
        })
        local u89
        if u87 == nil then
            u89 = u87
        else
            u89 = u87:GetMarkerReachedSignal("flap"):Connect(function() --[[ Line: 264 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u34
                    [4] = u83
                    [5] = u85
                --]]
                local v90 = u6
                local v91 = u5.fromList(u34.XUROT_FLAP_WING_1, u34.XUROT_FLAP_WING_2)
                local v92 = {}
                local v93 = u83.Character
                if v93 ~= nil then
                    v93 = v93:GetPivot().Position
                end
                v92.position = v93
                v92.volumeMultiplier = 0.1
                v92.rollOffMaxDistance = 10
                v92.parent = u85.Parent
                v90:playSound(v91, v92)
            end)
        end
        u82.stateMaid:GiveTask(function() --[[ Line: 281 ]]
            --[[
            Upvalues:
                [1] = u87
                [2] = u88
                [3] = u89
            --]]
            local v94 = u87
            if v94 ~= nil then
                v94:Destroy()
            end
            local v95 = u88
            if v95 ~= nil then
                v95:Destroy()
            end
            local v96 = u89
            if v96 ~= nil then
                v96:Disconnect()
            end
        end)
        return
    elseif p84 == u37.Fly then
        local u97 = u27:playAnimation(u85, u26.ANGEL_WINGS_FLYING, {
            ["looped"] = true
        })
        local u98 = u3:playAnimation(u83, u27:getAssetId(u26.ANGEL_WINGS_PLAYER_FLYING), {
            ["looped"] = true
        })
        local u99
        if u97 == nil then
            u99 = u97
        else
            u99 = u97:GetMarkerReachedSignal("Flap"):Connect(function() --[[ Line: 306 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u5
                    [3] = u34
                    [4] = u83
                    [5] = u85
                --]]
                local v100 = u6
                local v101 = u5.fromList(u34.XUROT_FLAP_WING_1, u34.XUROT_FLAP_WING_2)
                local v102 = {}
                local v103 = u83.Character
                if v103 ~= nil then
                    v103 = v103:GetPivot().Position
                end
                v102.position = v103
                v102.volumeMultiplier = 0.2
                v102.rollOffMaxDistance = 10
                v102.parent = u85.Parent
                v100:playSound(v101, v102)
            end)
        end
        u82.stateMaid:GiveTask(function() --[[ Line: 323 ]]
            --[[
            Upvalues:
                [1] = u97
                [2] = u98
                [3] = u99
            --]]
            local v104 = u97
            if v104 ~= nil then
                v104:Destroy()
            end
            local v105 = u98
            if v105 ~= nil then
                v105:Destroy()
            end
            local v106 = u99
            if v106 ~= nil then
                v106:Disconnect()
            end
        end)
    elseif p84 == u37.DiveTransition then
        local v107 = u27:playAnimation(u85, u26.ANGEL_WINGS_DIVE, {
            ["looped"] = false
        })
        local v108 = u3:playAnimation(u83, u27:getAssetId(u26.ANGEL_WINGS_PLAYER_DIVE))
        if v107 then
            u82.stateMaid:GiveTask(v107)
            local u109 = u1.Promise.delay(v107.Length):andThen(function() --[[ Line: 346 ]]
                --[[
                Upvalues:
                    [1] = u82
                    [2] = u83
                    [3] = u37
                --]]
                u82.flyStateUpdate:Fire(u83, u37.Dive)
            end)
            u82.stateMaid:GiveTask(function() --[[ Line: 349 ]]
                --[[
                Upvalues:
                    [1] = u109
                --]]
                return u109:cancel()
            end)
        end
        if v108 then
            u82.stateMaid:GiveTask(v108)
            return
        end
    else
        if p84 == u37.Dive then
            local u110 = u27:playAnimation(u85, u26.ANGEL_WINGS_DIVING_IDLE, {
                ["looped"] = true
            })
            local u111 = u3:playAnimation(u83, u27:getAssetId(u26.ANGEL_WINGS_PLAYER_DIVING_IDLE), {
                ["looped"] = true
            })
            local v112 = u6
            local v113 = u34.WIND_TUNNEL_FLYING
            local v114 = {}
            local v115 = u83.Character
            if v115 ~= nil then
                v115 = v115:GetPivot().Position
            end
            v114.position = v115
            v114.volumeMultiplier = 0.5
            v114.rollOffMaxDistance = 10
            v114.parent = u85.Parent
            local u116 = v112:playSound(v113, v114)
            u82.stateMaid:GiveTask(function() --[[ Line: 378 ]]
                --[[
                Upvalues:
                    [1] = u110
                    [2] = u111
                    [3] = u116
                --]]
                local v117 = u110
                if v117 ~= nil then
                    v117:Destroy()
                end
                local v118 = u111
                if v118 ~= nil then
                    v118:Destroy()
                end
                u116:Destroy()
            end)
            return
        end
        if p84 == u37.GroundSmash then
            local u119 = u27:playAnimation(u85, u26.ANGEL_WINGS_GROUND_SMASH, {
                ["looped"] = false,
                ["speed"] = 2.5
            })
            local u120 = u3:playAnimation(u83, u27:getAssetId(u26.ANGEL_WINGS_PLAYER_GROUND_SMASH), {
                ["looped"] = false,
                ["speed"] = 2.5
            })
            local u121
            if u120 == nil then
                u121 = u120
            else
                u121 = u120:GetMarkerReachedSignal("HitGround"):Connect(function() --[[ Line: 402 ]]
                    --[[
                    Upvalues:
                        [1] = u83
                        [2] = u6
                        [3] = u34
                        [4] = u85
                        [5] = u8
                        [6] = u16
                    --]]
                    local v122 = u83.Character
                    if v122 ~= nil then
                        v122 = v122:GetPivot().Position
                    end
                    if not v122 then
                        return nil
                    end
                    u6:playSound(u34.JUGGERNAUT_GROUND_SMASH, {
                        ["volumeMultiplier"] = 0.4,
                        ["position"] = v122,
                        ["parent"] = u85.Parent
                    })
                    local v123 = false
                    local v124 = 0
                    while true do
                        if v123 then
                            v124 = v124 + 1
                        else
                            v123 = true
                        end
                        if v124 >= 9 then
                            if u83 == u16.LocalPlayer then
                                u8.Controllers.ScreenShakeController:shake(v122, u83.Character:GetPivot().LookVector, {
                                    ["magnitude"] = 5,
                                    ["cycles"] = 5,
                                    ["duration"] = 0.4
                                })
                            end
                            return
                        end
                        u8.Controllers.BlockDebrisController:createDebris(v122, Color3.fromRGB(25, 25, 25), Vector3.new(0.1, 0.3, 0.1))
                    end
                end)
            end
            local v125 = u1.Promise
            local v126
            if u119 == nil then
                v126 = u119
            else
                v126 = u119.Length
            end
            local v127 = v126 == nil and 0.3 or v126
            local u128 = v125.delay(v127):andThen(function() --[[ Line: 450 ]]
                --[[
                Upvalues:
                    [1] = u82
                    [2] = u83
                    [3] = u37
                --]]
                u82.flyStateUpdate:Fire(u83, u37.Hover)
            end)
            u82.stateMaid:GiveTask(function() --[[ Line: 453 ]]
                --[[
                Upvalues:
                    [1] = u128
                    [2] = u119
                    [3] = u120
                    [4] = u121
                --]]
                u128:cancel()
                local v129 = u119
                if v129 ~= nil then
                    v129:Destroy()
                end
                local v130 = u120
                if v130 ~= nil then
                    v130:Destroy()
                end
                local v131 = u121
                if v131 ~= nil then
                    v131:Disconnect()
                end
            end)
            return
        end
    end
end
function u38.moveDown(u132, p133, u134) --[[ Line: 472 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u1
        [3] = u16
    --]]
    u132.downHeld = p133
    if u132.flyState == u37.Hover and p133 then
        local v135 = u132.diveTransitionPromise
        if v135 ~= nil then
            v135:cancel()
        end
        u132.diveTransitionPromise = u1.Promise.delay(0.3):andThen(function() --[[ Line: 479 ]]
            --[[
            Upvalues:
                [1] = u134
                [2] = u132
                [3] = u16
                [4] = u37
            --]]
            if u134:GetState() == Enum.HumanoidStateType.Freefall or u134:GetState() == Enum.HumanoidStateType.FallingDown then
                u132.flyStateUpdate:Fire(u16.LocalPlayer, u37.DiveTransition)
            end
        end)
    elseif (u132.flyState == u37.Dive or u132.flyState == u37.DiveTransition) and not p133 then
        local v136 = u132.diveTransitionPromise
        if v136 ~= nil then
            v136:cancel()
        end
        u132.flyStateUpdate:Fire(u16.LocalPlayer, u37.Hover)
    end
end
function u38.moveUp(p137, p138) --[[ Line: 492 ]]
    --[[
    Upvalues:
        [1] = u37
        [2] = u16
    --]]
    local v139 = p137.diveTransitionPromise
    if v139 ~= nil then
        v139:cancel()
    end
    if p137.flyState == u37.Fly and not p138 then
        p137.flyStateUpdate:Fire(u16.LocalPlayer, u37.Hover)
    elseif p137.flyState ~= u37.Fly and p138 then
        p137.flyStateUpdate:Fire(u16.LocalPlayer, u37.Fly)
    end
    p137.upHeld = p138
end
function u38.updateWingType(u140, u141, u142) --[[ Line: 504 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u29
        [3] = u30
        [4] = u9
        [5] = u13
        [6] = u11
    --]]
    u1.Promise.new(function(p143, p144) --[[ Line: 505 ]]
        --[[
        Upvalues:
            [1] = u141
            [2] = u29
            [3] = u30
            [4] = u142
            [5] = u9
            [6] = u13
            [7] = u140
        --]]
        local v145 = u141.Character
        if v145 ~= nil then
            v145 = v145:WaitForChild("Humanoid")
        end
        local v146 = u141.Character
        if v146 ~= nil then
            v146 = v146.PrimaryPart
        end
        if not (v146 and v145) then
            return p144("No player humanoid found")
        end
        local v147 = u141.Character
        if v147 ~= nil then
            v147 = v147:WaitForChild(u29.ANGEL_WINGS, 5)
        end
        if not v147 then
            return p144("Could not find angel wings accessory")
        end
        local v148 = u30[u142]
        for v149, v150 in v147:GetDescendants() do
            local _ = v149 - 1
            if v150:IsA("BasePart") then
                v150.Color = v148.neonColor
            elseif v150:IsA("Decal") then
                v150.Color3 = v148.wingsDecalColor
            end
        end
        u9.Controllers.FancyExplosionController:createExplosion({
            ["radius"] = 20,
            ["randomSizeOffset"] = 0,
            ["randomPositionOffset"] = 0,
            ["inDuration"] = 0.5,
            ["outDuration"] = 1,
            ["position"] = v146.Position,
            ["model"] = v148.ExplosionEffect
        })
        local v151 = v148.EffectModel:Clone()
        v151:PivotTo(v146.CFrame)
        v151.Parent = v146
        u13("WeldConstraint", {
            ["Enabled"] = true,
            ["Part0"] = v151.EffectPart,
            ["Part1"] = v146,
            ["Parent"] = v151
        })
        u140.maid:GiveTask(v151)
        return p143()
    end):catch(function(p152) --[[ Line: 559 ]]
        --[[
        Upvalues:
            [1] = u140
            [2] = u11
        --]]
        u140.logger:Warn("Failed to update wing type for player with error reason: {err}", u11(p152))
    end)
end
u8.CreateController(u38.new())
return nil