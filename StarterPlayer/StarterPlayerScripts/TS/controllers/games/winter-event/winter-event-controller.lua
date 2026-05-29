local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u9 = v8.InOutQuad
local u10 = v8.Linear
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Lighting
local u16 = v14.Players
local u17 = v14.RunService
local u18 = v14.SoundService
local u19 = v14.Workspace
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u22 = v1.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController
local u23 = v1.import(script, script.Parent.Parent.Parent, "global", "viewmodel", "viewmodel-mode").ViewmodelMode
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type").PingType
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "scene", "scene-key").SceneKey
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u31 = v1.import(script, script.Parent, "winter-event-environment").WinterEventEnvironment
local u32 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 42 ]]
        return "WinterEventController"
    end,
    ["__index"] = u22
})
u32.__index = u32
function u32.new(...) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v33 = u32
    local v34 = setmetatable({}, v33)
    return v34:constructor(...) or v34
end
function u32.constructor(p35) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u25
        [3] = u13
        [4] = u11
    --]]
    u22.constructor(p35, { u25.WINTER_EVENT })
    p35.Name = "WinterEventController"
    p35.currMaxHeightPerc = 0
    p35.actionBarTextLabel = u13.createRef()
    p35.climbActive = false
    p35.winterEffectStrengthLocked = false
    p35.atmosphereHidden = false
    p35.footstepModifierMaid = u11.new()
end
function u32.KnitStart(p36) --[[ Line: 62 ]]
    --[[
    Upvalues:
        [1] = u22
    --]]
    u22.KnitStart(p36)
end
function u32.onGameInit(p37) --[[ Line: 65 ]]
    p37:setup()
end
function u32.setup(u38) --[[ Line: 68 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u19
        [3] = u18
        [4] = u15
        [5] = u17
        [6] = u21
        [7] = u26
        [8] = u24
        [9] = u28
        [10] = u5
        [11] = u6
        [12] = u30
        [13] = u29
        [14] = u11
        [15] = u20
        [16] = u9
        [17] = u10
        [18] = u2
        [19] = u27
        [20] = u16
    --]]
    u38.winterEffectStrength = u12("NumberValue", {
        ["Name"] = "WinterStormStrength",
        ["Value"] = 0.05,
        ["Parent"] = u19
    })
    u38.winterEventSoundGroup = u12("SoundGroup", {
        ["Name"] = "WinterEvent",
        ["Volume"] = 0.35,
        ["Parent"] = u18
    })
    u38.blurEffect = u12("BlurEffect", {
        ["Parent"] = u15
    })
    if not u17:IsStudio() then
        u38:forceFirstPersonMode()
    end
    u38:setupWinterEffects()
    u21.MatchStateChange:connect(function(p39) --[[ Line: 86 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u38
        --]]
        if p39.matchState == u26.RUNNING then
            u38:playIntroMusicPiece()
        end
    end)
    u24.changed:connect(function(p40, p41) --[[ Line: 91 ]]
        --[[
        Upvalues:
            [1] = u38
        --]]
        if p40.Game.spectatingPlayer ~= p41.Game.spectatingPlayer then
            task.spawn(function() --[[ Line: 93 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                u38:enableThirdPersonMode()
            end)
        end
    end)
    u28.Client:Get("WinterEventStatusUpdate"):Connect(function(p42) --[[ Line: 98 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u6
            [3] = u30
            [4] = u29
            [5] = u11
            [6] = u20
            [7] = u9
            [8] = u10
            [9] = u38
            [10] = u2
            [11] = u27
            [12] = u19
            [13] = u16
        --]]
        if p42.gameStarted then
            local v43 = false
            local v44 = 0
            while true do
                if true then
                    if v43 then
                        v44 = v44 + 1
                    else
                        v43 = true
                    end
                end
                if v44 >= 3 then
                    break
                end
                local v45 = u5.fromList
                local v46 = p42.gameStarted.icePositions
                local v47 = v45(unpack(v46))
                local v48 = p42.gameStarted.icePositions
                local v49 = (table.find(p42.gameStarted.icePositions, v47) or 0) - 1
                table.remove(v48, v49 + 1)
                u6:playSound(u5.fromList(u30.ICICLE_IMPACT_1, u30.ICICLE_IMPACT_2), {
                    ["position"] = v47
                })
            end
            task.delay(4.5, function() --[[ Line: 123 ]]
                --[[
                Upvalues:
                    [1] = u29
                    [2] = u6
                    [3] = u30
                    [4] = u11
                    [5] = u20
                    [6] = u9
                    [7] = u10
                --]]
                local v50 = game.Workspace:WaitForChild(u29.WINTER_MINIGAME_MOUNTAIN)
                v50:WaitForChild("Effect"):WaitForChild("LightBeam")
                local u51 = v50.Effect.LightBeam
                u51.Transparency = 0
                local u52 = u51.Position
                u6:playSound(u30.WINTER_EVENT_LIGHT_SHINE, {
                    ["volumeMultiplier"] = 1.3,
                    ["rollOffMinDistance"] = 10000,
                    ["rollOffMaxDistance"] = 11000,
                    ["position"] = u51.Position
                })
                local u53 = u11.new()
                u53:GiveTask(function() --[[ Line: 137 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                    --]]
                    return u51:Destroy()
                end)
                u20(4, u9, function(p54) --[[ Line: 141 ]]
                    --[[
                    Upvalues:
                        [1] = u51
                        [2] = u52
                    --]]
                    local v55 = u51.Size
                    local v56 = u51
                    local v57 = p54 * 400
                    local v58 = v55.Y
                    local v59 = v55.Z
                    v56.Size = Vector3.new(v57, v58, v59)
                    local v60 = p54 * 400 / 2
                    u51.Position = u52 + Vector3.new(0, v60, 0)
                end)
                task.delay(6, function() --[[ Line: 156 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u10
                        [3] = u51
                        [4] = u52
                        [5] = u53
                    --]]
                    u20(3, u10, function(p61) --[[ Line: 158 ]]
                        --[[
                        Upvalues:
                            [1] = u51
                            [2] = u52
                        --]]
                        local v62 = u51.Size
                        local v63 = u51
                        local v64 = (1 - p61) * 400
                        local v65 = v62.Y
                        local v66 = v62.Z
                        v63.Size = Vector3.new(v64, v65, v66)
                        local v67 = (1 - p61) * 400 / 2
                        u51.Position = u52 + Vector3.new(0, v67, 0)
                        u51.Transparency = p61
                    end)
                    task.delay(4, function() --[[ Line: 165 ]]
                        --[[
                        Upvalues:
                            [1] = u53
                        --]]
                        u53:DoCleaning()
                    end)
                end)
            end)
        end
        if p42.minigameStarted then
            u38.climbActive = false
            if u38.destinationIndicator then
                u38.destinationIndicator:destroy()
                u38.destinationIndicator = nil
            end
            u38.gameStartTime = nil
        end
        if p42.nextGameStartTime ~= nil or p42.climbStarted then
            if p42.nextGameStartTime ~= nil then
                u38.gameStartTime = p42.nextGameStartTime
            end
            if not u38.climbActive then
                u38.climbActive = true
                if p42.platformPosition then
                    u38.destinationIndicator = u2.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):createIndicator(p42.platformPosition + Vector3.new(0, 6, 0), u27.GENERIC, nil, {
                        ["hidePlayerIcon"] = true,
                        ["indicatorLifetime"] = 180
                    })
                end
                while true do
                    local v68 = task.wait(0.1)
                    if v68 == 0 or (v68 ~= v68 or not v68) then
                        break
                    end
                    local v69 = u38.gameStartTime
                    local v70
                    if v69 == 0 or (v69 ~= v69 or not v69) then
                        v70 = nil
                    else
                        v70 = u38.gameStartTime - u19:GetServerTimeNow()
                    end
                    if v70 ~= nil and v70 <= 0 or not u38.climbActive then
                        u38:updateActionBar("Good luck!", Color3.fromRGB(116, 255, 102))
                        u38.climbActive = false
                        u38.gameStartTime = nil
                        return
                    end
                    local v71
                    if v70 == nil then
                        v71 = ""
                    else
                        local v72 = math.floor(v70)
                        v71 = " (" .. tostring(v72) .. "s)"
                    end
                    local v73 = u16.LocalPlayer:GetAttribute("ArrivedAtGame")
                    if v73 == 0 or (v73 ~= v73 or (v73 == "" or not v73)) then
                        u38:updateActionBar("Get to the next challenge!" .. v71)
                    else
                        u38:updateActionBar("Waiting for other climbers.." .. v71, Color3.fromRGB(116, 255, 102))
                    end
                end
            end
        end
    end)
    u28.Client:Get("MinigamePlayerEliminated"):Connect(function(p74) --[[ Line: 224 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u38
        --]]
        if p74 == u16.LocalPlayer.UserId then
            u38:hideActionBar()
        end
    end)
    task.spawn(function() --[[ Line: 229 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u38
            [3] = u20
            [4] = u10
        --]]
        while true do
            local v75 = task.wait(1)
            if v75 == 0 or (v75 ~= v75 or not v75) then
                break
            end
            local v76 = u19.CurrentCamera
            if v76 ~= nil then
                v76 = v76.CFrame.Position
            end
            if v76 then
                local v77 = (v76.Y - 238) / 436
                local v78 = math.clamp(v77, 0, 1)
                if u38.currMaxHeightPerc < v78 then
                    u38.currMaxHeightPerc = v78
                    local u79 = u38.winterEffectStrength.Value
                    local u80 = v78 * 0.95 + 0.05
                    u20(1, u10, function(p81) --[[ Line: 248 ]]
                        --[[
                        Upvalues:
                            [1] = u38
                            [2] = u79
                            [3] = u80
                        --]]
                        if u38.winterEffectStrengthLocked then
                            return nil
                        end
                        u38.winterEffectStrength.Value = u79 * (1 - p81) + u80 * p81
                    end)
                end
            end
        end
    end)
end
function u32.tweenWinterEffectStrength(u82, u83, p84) --[[ Line: 258 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
    --]]
    u82.winterEffectStrengthLocked = true
    local u85 = u82.winterEffectStrength.Value
    u20(p84, u10, function(p86) --[[ Line: 261 ]]
        --[[
        Upvalues:
            [1] = u82
            [2] = u85
            [3] = u83
        --]]
        u82.winterEffectStrength.Value = (1 - p86) * u85 + p86 * u83
    end)
end
function u32.updateActionBar(p87, p88, p89) --[[ Line: 265 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u2
        [3] = u13
        [4] = u4
        [5] = u20
        [6] = u10
    --]]
    if u7.Controllers.MinigameController:isEliminated() then
        return nil
    end
    if not p87.actionBarMaid then
        local v90 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController")
        local v91 = u13.createFragment
        local v92 = {
            ["WinterEventHelperText"] = u13.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextColor3"] = p89 or u4.WHITE,
                ["Text"] = p88,
                [u13.Ref] = p87.actionBarTextLabel,
                ["Size"] = UDim2.fromScale(1, 0.04),
                ["TextScaled"] = true,
                ["Font"] = "GothamBold"
            })
        }
        p87.actionBarMaid = v90:addComponent(v91(v92))
    end
    local u93 = p87.actionBarTextLabel:getValue()
    if u93 then
        local u94 = math.random()
        u93:SetAttribute("RefreshId", u94)
        u93.Text = p88
        u93.TextColor3 = p89 or u4.WHITE
        local u95 = u93.TextTransparency
        if u95 ~= 0 then
            local u96 = nil
            u96 = u20(0.6, u10, function(p97) --[[ Line: 291 ]]
                --[[
                Upvalues:
                    [1] = u93
                    [2] = u94
                    [3] = u96
                    [4] = u95
                --]]
                if u93:GetAttribute("RefreshId") ~= u94 then
                    u96:Cancel()
                    return nil
                end
                u93.TextTransparency = (1 - p97) * u95
            end)
        end
        task.delay(5, function() --[[ Line: 299 ]]
            --[[
            Upvalues:
                [1] = u93
                [2] = u94
                [3] = u20
                [4] = u10
            --]]
            if u93:GetAttribute("RefreshId") ~= u94 then
                return nil
            end
            local u98 = nil
            u98 = u20(2, u10, function(p99) --[[ Line: 304 ]]
                --[[
                Upvalues:
                    [1] = u93
                    [2] = u94
                    [3] = u98
                --]]
                if u93:GetAttribute("RefreshId") ~= u94 then
                    u98:Cancel()
                    return nil
                end
                u93.TextTransparency = p99
            end)
        end)
    end
end
function u32.hideActionBar(p100) --[[ Line: 314 ]]
    local v101 = p100.actionBarMaid
    if v101 ~= nil then
        v101:DoCleaning()
    end
    p100.actionBarMaid = nil
    local v102 = p100.actionBarTextLabel:getValue()
    if v102 ~= nil then
        v102 = v102.Text
    end
    if v102 ~= "" and v102 then
        p100.actionBarTextLabel:getValue().Text = ""
    end
end
function u32.setupWinterEffects(u103) --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u31
        [3] = u6
        [4] = u30
        [5] = u15
    --]]
    u7.Controllers.SnowWeatherParticleController:enable(0.2)
    u7.Controllers.EnvironmentController:setupEnvironment(u31)
    local u104 = u6:playModifiableSound(u30.AMBIENCE_SNOW, {
        ["looped"] = true
    })
    u103.backgroundMusic = u6:playModifiableSound(u30.WINTER_EVENT_BACKGROUND_MUSIC, {
        ["looped"] = true
    })
    if u104 then
        u104.SoundGroup = u103.winterEventSoundGroup
    end
    if u103.backgroundMusic then
        u103.backgroundMusic.SoundGroup = u103.winterEventSoundGroup
    end
    local function u115() --[[ Line: 343 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u104
            [3] = u15
            [4] = u31
            [5] = u7
        --]]
        local v105 = u103.winterEffectStrength.Value
        local v106 = math.clamp(v105, 0, 1)
        if u104 then
            u104.Volume = v106 * 1.5
        end
        if u103.backgroundMusic then
            local v107 = 0.75 - v106
            local v108 = math.max(v107, 0)
            local v109 = u103.backgroundMusic:GetAttribute("Silent")
            if v109 == 0 or (v109 ~= v109 or (v109 == "" or not v109)) then
                u103.backgroundMusic.Volume = v108
            else
                u103.backgroundMusic:SetAttribute("DesiredVolume", v108)
            end
        end
        local v110 = (v106 - 0.05) / 0.95
        local v111 = math.clamp(v110, 0, 1)
        u103.atmosphere = u15:FindFirstChildWhichIsA("Atmosphere")
        if u103.atmosphere and not u103.atmosphereHidden then
            u103.atmosphere.Color = u31.Atmosphere.Color:Lerp(Color3.fromRGB(236, 255, 249), v111)
            u103.atmosphere.Density = u31.Atmosphere.Density * (1 - v111) + v111 * 0.7
            u103.atmosphere.Offset = u31.Atmosphere.Offset * (1 - v111) + v111 * 1
            u103.atmosphere.Haze = u31.Atmosphere.Haze * (1 - v111) + v111 * 4.5
        end
        local v112 = u15:FindFirstChildWhichIsA("DepthOfFieldEffect")
        if v112 then
            v112.InFocusRadius = u31.DepthOfFieldEffect.InFocusRadius * (1 - v111) + v111 * 150
        end
        local v113 = u103.blurEffect
        local v114 = (v106 - 0.7) / 0.30000000000000004
        v113.Size = math.clamp(v114, 0, 1) * 2.5
        u7.Controllers.SnowWeatherParticleController:setIntensity(v106)
    end
    u103.winterEffectStrength.Changed:Connect(function() --[[ Line: 374 ]]
        --[[
        Upvalues:
            [1] = u115
        --]]
        u115()
    end)
    u115()
end
function u32.playIntroMusicPiece(u116) --[[ Line: 379 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u30
    --]]
    local v117 = u6:playModifiableSound(u30.WINTER_EVENT_INTRO_MUSIC, {
        ["fadeInTime"] = 1.2
    })
    if v117 then
        v117.SoundGroup = u116.winterEventSoundGroup
        if u116.backgroundMusic then
            u116.backgroundMusic:SetAttribute("DesiredVolume", u116.backgroundMusic.Volume)
            u116.backgroundMusic:SetAttribute("Silent", true)
            u6:tweenSoundVolume(u116.backgroundMusic, 0, 1)
            task.delay(17, function() --[[ Line: 390 ]]
                --[[
                Upvalues:
                    [1] = u116
                    [2] = u6
                --]]
                local v118 = u116.backgroundMusic
                if v118 ~= nil then
                    v118 = v118.IsPlaying
                end
                if not v118 then
                    return nil
                end
                local v119 = u6
                local v120 = u116.backgroundMusic
                local v121 = u116.backgroundMusic
                if v121 ~= nil then
                    v121 = v121:GetAttribute("DesiredVolume")
                end
                v119:tweenSoundVolume(v120, v121, 1)
                task.delay(1, function() --[[ Line: 405 ]]
                    --[[
                    Upvalues:
                        [1] = u116
                    --]]
                    if not u116.backgroundMusic then
                        return nil
                    end
                    u116.backgroundMusic:SetAttribute("Silent", false)
                end)
            end)
        end
    end
end
function u32.forceFirstPersonMode(p122) --[[ Line: 415 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u23
        [3] = u16
    --]]
    u7.Controllers.MobileShiftLockController:blockShiftLock(true)
    p122.footstepModifierMaid:GiveTask(u7.Controllers.FootstepsController.footstepModifier:addModifier({
        ["localVolumeMultiplier"] = 5,
        ["localFootstepFrequency"] = 0.13513513513513511
    }))
    u7.Controllers.ScreenWobbleController:enableScreenWobble()
    u7.Controllers.ViewmodelController:setViewModelMode(u23.SHOW_ARMS)
    u16.LocalPlayer.CameraMaxZoomDistance = 0
    u16.LocalPlayer.CameraMinZoomDistance = 0
end
function u32.enableThirdPersonMode(p123, p124) --[[ Line: 426 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u16
    --]]
    local v125 = p124 == nil and 14 or p124
    u7.Controllers.MobileShiftLockController:blockShiftLock(false)
    u7.Controllers.ScreenWobbleController:disableScreenWobble()
    p123.footstepModifierMaid:DoCleaning()
    local v126 = v125 > 16 and 16 or v125
    u16.LocalPlayer.CameraMaxZoomDistance = 16
    u16.LocalPlayer.CameraMinZoomDistance = v126
    task.delay(0.1, function() --[[ Line: 439 ]]
        --[[
        Upvalues:
            [1] = u16
        --]]
        u16.LocalPlayer.CameraMinZoomDistance = 0
    end)
end
function u32.getClimbSoundGroup(p127) --[[ Line: 443 ]]
    return p127.winterEventSoundGroup
end
function u32.hideAtmosphere(p128) --[[ Line: 446 ]]
    p128.atmosphereHidden = true
    if p128.atmosphere then
        p128.atmosphere.Density = 0
    end
end
function u32.setStaticWinterEffectStrength(p129, p130) --[[ Line: 452 ]]
    p129.winterEffectStrengthLocked = true
    p129.winterEffectStrength.Value = p130
end
function u32.disableStaticWinterEffectStrength(p131) --[[ Line: 456 ]]
    p131.winterEffectStrengthLocked = false
end
function u32.showAtmosphere(p132) --[[ Line: 459 ]]
    p132.atmosphereHidden = false
end
u7.CreateController(u32.new())
return nil