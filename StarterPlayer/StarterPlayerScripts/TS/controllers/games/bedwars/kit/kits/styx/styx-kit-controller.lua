local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.DeviceUtil
local u6 = v4.SoundManager
local v7 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Lighting
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u20 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u21 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u22 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u23 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u24 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "styx", "styx-kit-balance").StyxKitBalance
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = u1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u31 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 36 ]]
        return "StyxKitController"
    end,
    ["__index"] = u30
})
u31.__index = u31
function u31.new(...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    local v32 = u31
    local v33 = setmetatable({}, v32)
    return v33:constructor(...) or v33
end
function u31.constructor(p34) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u26
        [3] = u11
        [4] = u19
    --]]
    u30.constructor(p34, u26.STYX)
    p34.Name = "StyxKitController"
    p34.culledParts = {}
    p34.entrancePortals = {}
    p34.exitPortals = {}
    p34.ghostStateMaid = u11.new()
    p34.initialCameraMinZoom = 0
    p34.initialCameraMaxZoom = 0
    p34.entrancePortalDoorClosedXPosition = 0.8
    p34.entrancePortalDoorOpenXPosition = 2
    p34.exitPortalDoorOpenXPosition = 1.8
    p34.exitPortalCooldownSignal = u19.new()
end
function u31.onKitLocalActivated(p35, p36) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u14
        [3] = u15
    --]]
    p35.colorCorrectionEffect = u12("ColorCorrectionEffect", {
        ["Name"] = "StyxColorCorrectionEffect",
        ["Saturation"] = -0.3,
        ["Enabled"] = false,
        ["TintColor"] = Color3.fromRGB(87, 255, 219),
        ["Parent"] = u14
    })
    p36:GiveTask(p35.colorCorrectionEffect)
    p35.initialCameraMinZoom = 0
    p35.initialCameraMaxZoom = u15.LocalPlayer.CameraMaxZoomDistance
end
function u31.onKitLocalDeactivated(_) --[[ Line: 76 ]] end
function u31.onKitReplicationActivated(u37, p38) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u15
        [3] = u9
        [4] = u5
        [5] = u8
        [6] = u26
        [7] = u3
        [8] = u16
        [9] = u18
        [10] = u27
        [11] = u25
        [12] = u1
        [13] = u24
        [14] = u12
        [15] = u6
        [16] = u29
        [17] = u22
        [18] = u20
        [19] = u10
        [20] = u17
    --]]
    p38:GiveTask(u28.Client:Get("StyxSpawnEntrancePortalFromServer"):Connect(function(u39) --[[ Line: 80 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u15
            [3] = u9
            [4] = u5
        --]]
        u39.entrancePortalData.blockPosition = u39.entrancePortalData.blockPosition
        local v40 = u37.entrancePortals
        local v41 = u39.entrancePortalData
        table.insert(v40, v41)
        if u39.entrancePortalData.player == u15.LocalPlayer then
            local v42 = u37.exitPortals
            local function v45(u43) --[[ Line: 88 ]]
                --[[
                Upvalues:
                    [1] = u39
                    [2] = u9
                    [3] = u5
                    [4] = u37
                --]]
                if u43.killingTeamId == u39.entrancePortalData.teamId and u43.proximityPrompt then
                    u43.proximityPrompt:Destroy()
                    u43.proximityPrompt = nil
                    local v44 = u9.Controllers.ProximityPromptController:createProximityPrompt({
                        ["ObjectText"] = "Styx\'s Exit Portal",
                        ["ActionText"] = "Connect",
                        ["AutoLocalize"] = false,
                        ["RequiresLineOfSight"] = false,
                        ["MaxActivationDistance"] = 10,
                        ["ClickablePrompt"] = u5.isMobileControls(),
                        ["KeyboardKeyCode"] = Enum.KeyCode.F,
                        ["Parent"] = u43.promptParent
                    })
                    if not v44 then
                        return nil
                    end
                    u43.proximityPrompt = v44
                    v44.Triggered:Connect(function(_) --[[ Line: 107 ]]
                        --[[
                        Upvalues:
                            [1] = u37
                            [2] = u43
                        --]]
                        u37:tryOpenExitPortal(u43)
                    end)
                end
            end
            for v46, v47 in v42 do
                v45(v47, v46 - 1, v42)
            end
        end
    end))
    p38:GiveTask(u28.Client:Get("StyxSpawnExitPortalFromServer"):Connect(function(p48) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u15
            [3] = u26
            [4] = u37
        --]]
        if not u8.Controllers.KitController:isUsingKit(u15.LocalPlayer, u26.STYX) then
            return nil
        end
        u37:spawnExitPortal(p48.exitPortalData, true)
    end))
    p38:GiveTask(u28.Client:Get("StyxDespawnExitPortalFromServer"):Connect(function(p49) --[[ Line: 127 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        local v50 = nil
        for v51, v52 in u37.exitPortals do
            local _ = v51 - 1
            if v52.uuid == p49.exitPortalData.uuid == true then
                v50 = v52
                break
            end
        end
        if not v50 then
            return nil
        end
        u37:despawnExitPortal(v50, p49.lastTeleportEndTime)
    end))
    p38:GiveTask(u28.Client:Get("StyxOpenExitPortalFromServer"):Connect(function(p53) --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u37
            [2] = u3
            [3] = u16
            [4] = u18
            [5] = u8
            [6] = u15
            [7] = u9
            [8] = u27
            [9] = u5
        --]]
        local v54 = nil
        for v55, v56 in u37.exitPortals do
            local _ = v55 - 1
            if v56.uuid == p53.exitPortalData.uuid == true then
                v54 = v56
                break
            end
        end
        local v57 = v54 or u37:spawnExitPortal(p53.exitPortalData, false)
        if not v57 then
            return nil
        end
        v57.connectedEntrancePortalUUID = p53.exitPortalData.connectedEntrancePortalUUID
        local v58 = nil
        for v59, v60 in u37.exitPortals do
            local _ = v59 - 1
            if v60.uuid == p53.exitPortalData.uuid == true then
                v58 = v60
                break
            end
        end
        local v61 = p53.exitPortalData.connectedEntrancePortalUUID
        if v61 == "" or not v61 then
            return nil
        end
        local u62 = nil
        for v63, v64 in u37.entrancePortals do
            local _ = v63 - 1
            if v64.uuid == p53.exitPortalData.connectedEntrancePortalUUID == true then
                u62 = v64
                break
            end
        end
        if not u62 then
            return nil
        end
        local v65 = u3:getStore():getBlockAt(u62.blockPosition)
        if v65 then
            if u62.whirpoolSpinHeartbeatConnection then
                u62.whirpoolSpinHeartbeatConnection:Disconnect()
            end
            local v66 = u37:openEntrancePortalVisuals(v65, u62)
            if v66 then
                u62.whirpoolSpinHeartbeatConnection = v66
            end
        end
        if v57.model then
            if v57.whirpoolSpinHeartbeatConnection then
                v57.whirpoolSpinHeartbeatConnection:Disconnect()
            end
            local v67 = u37:openExitPortalVisuals(v57.model, v57)
            if v67 then
                v57.whirpoolSpinHeartbeatConnection = v67
            end
        end
        local v68 = u62.worldPosition
        local v69 = v57.model
        if v69 ~= nil then
            v69 = v69:GetPivot().Position
        end
        if v69 then
            local v70 = u16.Assets.Misc.StyxPortalBeam:Clone()
            v70.Parent = u18
            v70.BeamPoint1:PivotTo(CFrame.new(v68))
            v70.BeamPoint2:PivotTo(CFrame.new(v69))
            u62.beam = v70
            v57.beam = v70
        end
        local v71 = p53.exitPortalData.killingTeamId
        local v72 = u8.Controllers.TeamController:getPlayerTeam(u15.LocalPlayer)
        if v72 ~= nil then
            v72 = v72.id
        end
        if v71 ~= v72 then
            return nil
        end
        local v73 = u9.Controllers.ProximityPromptController
        local v74 = {
            ["ActionText"] = "Teleport",
            ["AutoLocalize"] = false,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10
        }
        local v75 = u27.PORTAL_USE_COUNT_MAX
        local v76 = tostring(v75)
        local v77 = u27.PORTAL_USE_COUNT_MAX
        v74.ObjectText = "Styx\'s Portal\n" .. v76 .. "/" .. tostring(v77) .. " uses remaining"
        v74.ClickablePrompt = u5.isMobileControls()
        v74.KeyboardKeyCode = Enum.KeyCode.F
        v74.Parent = p53.exitPortalData.connectedEntrancePortalBlock
        local v78 = v73:createProximityPrompt(v74)
        if not v78 then
            return nil
        end
        u62.proximityPrompt = v78
        v78.Triggered:Connect(function(_) --[[ Line: 271 ]]
            --[[
            Upvalues:
                [1] = u37
                [2] = u62
            --]]
            u37:tryUseEntrancePortal(u62)
        end)
        if v57.proximityPrompt then
            v57.proximityPrompt:Destroy()
            v57.proximityPrompt = nil
        end
    end))
    p38:GiveTask(u28.Client:Get("UseStyxPortalFromServer"):Connect(function(u79) --[[ Line: 281 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u1
            [3] = u24
            [4] = u37
            [5] = u3
            [6] = u27
            [7] = u12
            [8] = u18
            [9] = u6
            [10] = u29
            [11] = u15
            [12] = u22
            [13] = u20
            [14] = u10
        --]]
        local v80 = u79.player
        if not v80 then
            return nil
        end
        local v81 = u25:getEntity(v80)
        if not v81 then
            return nil
        end
        if not u1.instanceof(v81, u24) then
            return nil
        end
        local v82 = v80.Character
        if v82 ~= nil then
            v82 = v82.PrimaryPart
        end
        if not v82 then
            return nil
        end
        local v83 = nil
        for v84, v85 in u37.entrancePortals do
            local _ = v84 - 1
            if u79.entrancePortalData.uuid == v85.uuid == true then
                v83 = v85
                break
            end
        end
        if v83 then
            local v86 = v83.proximityPrompt
            if u79.usesRemaining <= 0 then
                local v87 = u3:getStore():getBlockAt(v83.blockPosition)
                if v87 then
                    u37:closeEntrancePortalVisuals(v87, v83.whirpoolSpinHeartbeatConnection, v83, v83.proximityPrompt)
                end
            elseif v86 then
                local v88 = u79.usesRemaining
                local v89 = tostring(v88)
                local v90 = u27.PORTAL_USE_COUNT_MAX
                v86.ObjectText = "Styx\'s Portal\n" .. v89 .. "/" .. tostring(v90) .. " uses remaining"
            end
        end
        local u91 = u12("Part", {
            ["Size"] = Vector3.new(1, 1, 1),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Transparency"] = 1,
            ["CFrame"] = CFrame.new(u79.startPosition),
            ["Parent"] = u18
        })
        local v92 = u6:playSound(u29.UMBRA_TELEPORT_LOOP, {
            ["rollOffMaxDistance"] = 120,
            ["rollOffMinDistance"] = 50,
            ["looped"] = true,
            ["volumeMultiplier"] = 2,
            ["parent"] = u91
        })
        if v80 == u15.LocalPlayer then
            local v93 = u18.CurrentCamera
            if u91 and v93 then
                v93.CameraSubject = u91
            end
            if u91 then
                u91.Anchored = true
            end
            u22:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = false
            })
            if u37.colorCorrectionEffect then
                u37.colorCorrectionEffect.Enabled = true
            end
        end
        local _ = (u79.endPosition - u79.startPosition).Unit
        u20(u79.duration, u10, function(p94) --[[ Line: 377 ]]
            --[[
            Upvalues:
                [1] = u91
                [2] = u79
            --]]
            u91:PivotTo(CFrame.new(u79.startPosition):Lerp(CFrame.new(u79.endPosition), p94))
        end):Wait()
        v92:Stop()
        u91:Destroy()
    end))
    p38:GiveTask(u28.Client:Get("FinishStyxPortalTeleportFromServer"):Connect(function(p95) --[[ Line: 386 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u18
            [3] = u37
            [4] = u22
        --]]
        if p95.player == u15.LocalPlayer then
            local v96 = u15.LocalPlayer.Character
            if v96 ~= nil then
                v96 = v96:FindFirstChildOfClass("Humanoid")
            end
            if v96 then
                u18.CurrentCamera.CameraSubject = v96
            end
            if u37.colorCorrectionEffect then
                u37.colorCorrectionEffect.Enabled = false
            end
            u22:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = true
            })
        end
    end))
    p38:GiveTask(u28.Client:Get("StyxDestroyEntrancePortalBlockFromServer"):Connect(function(p97) --[[ Line: 412 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        local v98 = 0
        local v99 = {}
        for v100, v101 in u37.exitPortals do
            local _ = v100 - 1
            if v101.connectedEntrancePortalUUID == p97.entrancePortalData.uuid == true then
                v98 = v98 + 1
                v99[v98] = v101
            end
        end
        for v102, v103 in v99 do
            local _ = v102 - 1
            u37:despawnExitPortal(v103)
        end
        local v104 = nil
        for v105, v106 in u37.entrancePortals do
            local _ = v105 - 1
            if v106.uuid == p97.entrancePortalData.uuid == true then
                v104 = v106
                break
            end
        end
        if not v104 then
            return nil
        end
        local v107 = 0
        local v108 = {}
        for v109, v110 in u37.entrancePortals do
            local _ = v109 - 1
            if v110.uuid ~= p97.entrancePortalData.uuid == true then
                v107 = v107 + 1
                v108[v107] = v110
            end
        end
        u37.entrancePortals = v108
        if v104.proximityPrompt then
            v104.proximityPrompt:Destroy()
        end
        if v104.whirpoolSpinHeartbeatConnection then
            v104.whirpoolSpinHeartbeatConnection:Disconnect()
        end
        if v104.beam then
            v104.beam:Destroy()
        end
    end))
    p38:GiveTask(u28.Client:Get("StyxStartGhostStateFromServer"):Connect(function(p111) --[[ Line: 482 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u37
            [3] = u17
            [4] = u18
            [5] = u27
        --]]
        if p111.player == u15.LocalPlayer then
            if u37.colorCorrectionEffect then
                u37.colorCorrectionEffect.Enabled = true
            end
            local v131 = u17.Heartbeat:Connect(function() --[[ Line: 497 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u37
                    [3] = u18
                    [4] = u27
                --]]
                local v112 = u15.LocalPlayer.Character
                if v112 ~= nil then
                    v112 = v112.PrimaryPart
                end
                if not v112 then
                    return nil
                end
                local v113 = OverlapParams.new()
                v113.FilterType = Enum.RaycastFilterType.Exclude
                v113.FilterDescendantsInstances = u37.culledParts
                local v114 = u18:GetPartBoundsInBox(v112.CFrame, Vector3.new(1, 1, 1) * u27.BLOCK_CULL_RADIUS, v113)
                local function v128(u115) --[[ Line: 514 ]]
                    --[[
                    Upvalues:
                        [1] = u37
                        [2] = u27
                    --]]
                    if u115.CollisionGroup == "StyxGhost" then
                        return nil
                    end
                    if not u115:IsA("BasePart") then
                        return nil
                    end
                    if u115:GetAttribute("Block") ~= true then
                        return nil
                    end
                    local v116 = u37.culledParts
                    table.insert(v116, u115)
                    local u117 = u115.Transparency
                    u115.Transparency = u27.BLOCK_TRANSPARENCY
                    local u118 = u115.CanCollide
                    u115.CanCollide = false
                    u37.ghostStateMaid:GiveTask(function() --[[ Line: 531 ]]
                        --[[
                        Upvalues:
                            [1] = u115
                            [2] = u117
                            [3] = u118
                        --]]
                        u115.Transparency = u117
                        u115.CanCollide = u118
                    end)
                    local v119 = u115:GetChildren()
                    local function v125(u120) --[[ Line: 537 ]]
                        --[[
                        Upvalues:
                            [1] = u37
                            [2] = u27
                        --]]
                        if not u120:IsA("BasePart") then
                            return nil
                        end
                        local v121 = u37.culledParts
                        if table.find(v121, u120) ~= nil then
                            return nil
                        end
                        local v122 = u37.culledParts
                        table.insert(v122, u120)
                        local u123 = u120.Transparency
                        u120.Transparency = u27.BLOCK_TRANSPARENCY
                        local u124 = u120.CanCollide
                        u120.CanCollide = false
                        u37.ghostStateMaid:GiveTask(function() --[[ Line: 553 ]]
                            --[[
                            Upvalues:
                                [1] = u120
                                [2] = u123
                                [3] = u124
                            --]]
                            u120.Transparency = u123
                            u120.CanCollide = u124
                        end)
                    end
                    for v126, v127 in v119 do
                        v125(v127, v126 - 1, v119)
                    end
                end
                for v129, v130 in v114 do
                    v128(v130, v129 - 1, v114)
                end
            end)
            if v131 then
                u37.ghostStateMaid:GiveTask(v131)
                return
            end
        else
            local v132 = p111.player.Character
            if v132 then
                v132:SetAttribute("Transparency", 0.6)
            end
        end
    end))
    p38:GiveTask(u28.Client:Get("StyxEndGhostStateFromServer"):Connect(function(p133) --[[ Line: 578 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u37
        --]]
        if p133.player == u15.LocalPlayer then
            if u37.colorCorrectionEffect then
                u37.colorCorrectionEffect.Enabled = false
            end
            u37.ghostStateMaid:DoCleaning()
            table.clear(u37.culledParts)
        end
    end))
    p38:GiveTask(u37.exitPortalCooldownSignal:Connect(function(p134) --[[ Line: 592 ]]
        --[[
        Upvalues:
            [1] = u37
        --]]
        local v135 = 0
        local v136 = {}
        for v137, v138 in u37.exitPortals do
            local _ = v137 - 1
            if (v138.proximityPrompt and true or false) == true then
                v135 = v135 + 1
                v136[v135] = v138
            end
        end
        for v139, v140 in v136 do
            local _ = v139 - 1
            v140.proximityPrompt.ActionText = u37:getPortalPromptText(p134)
        end
    end))
end
function u31.onKitReplicationDeactivated(_) --[[ Line: 615 ]] end
function u31.onInnateAbilityEnabled(_, _, _) --[[ Line: 617 ]] end
function u31.onAbilityUsed(_, _, _) --[[ Line: 619 ]] end
function u31.KnitStart(p141) --[[ Line: 621 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    u30.KnitStart(p141)
end
function u31.spawnExitPortal(u142, u143, p144) --[[ Line: 624 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u18
        [3] = u9
        [4] = u5
    --]]
    local v145 = u142.exitPortals
    table.insert(v145, u143)
    local v146 = u16.Assets.Misc.StyxPortal:Clone()
    v146.Parent = u18
    v146:PivotTo(CFrame.new(u143.worldPosition))
    u143.model = v146
    u143.promptParent = v146.Pivot.PromptParent
    u143.particleEmitter = v146.Pivot.StyxPortalParticleUp.Smoke
    if p144 then
        if u142:getThisPlayersCurrentEntrancePortal() then
            local v147 = u9.Controllers.ProximityPromptController:createProximityPrompt({
                ["ObjectText"] = "Styx\'s Exit Portal",
                ["AutoLocalize"] = false,
                ["RequiresLineOfSight"] = false,
                ["MaxActivationDistance"] = 10,
                ["ActionText"] = u142:getPortalPromptText(),
                ["ClickablePrompt"] = u5.isMobileControls(),
                ["KeyboardKeyCode"] = Enum.KeyCode.F,
                ["Parent"] = u143.promptParent
            })
            if not v147 then
                return u143
            end
            u143.proximityPrompt = v147
            v147.Triggered:Connect(function(_) --[[ Line: 656 ]]
                --[[
                Upvalues:
                    [1] = u142
                    [2] = u143
                --]]
                u142:tryOpenExitPortal(u143)
            end)
            return u143
        end
        local v148 = u9.Controllers.ProximityPromptController:createProximityPrompt({
            ["ObjectText"] = "Needs an Entrance Portal",
            ["ActionText"] = "",
            ["AutoLocalize"] = false,
            ["RequiresLineOfSight"] = false,
            ["MaxActivationDistance"] = 10,
            ["Parent"] = u143.promptParent
        })
        if not v148 then
            return u143
        end
        u143.proximityPrompt = v148
    end
    return u143
end
function u31.despawnExitPortal(p149, p150, p151) --[[ Line: 677 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u18
    --]]
    local v152 = nil
    for v153, v154 in p149.entrancePortals do
        local _ = v153 - 1
        if v154.uuid == p150.connectedEntrancePortalUUID == true then
            v152 = v154
            break
        end
    end
    local v155 = v152 and u3:getStore():getBlockAt(v152.blockPosition)
    if v155 then
        p149:closeEntrancePortalVisuals(v155, v152.whirpoolSpinHeartbeatConnection, v152, v152.proximityPrompt)
    end
    if p151 ~= 0 and (p151 == p151 and p151) then
        p149:hideExitPortalExceptParticleAndBeam(p150)
        while u18:GetServerTimeNow() < p151 do
            task.wait(0.1)
        end
    end
    if p150.beam then
        p150.beam:Destroy()
    end
    local v156 = 0
    local v157 = {}
    for v158, v159 in p149.exitPortals do
        local _ = v158 - 1
        if v159.uuid ~= p150.uuid == true then
            v156 = v156 + 1
            v157[v156] = v159
        end
    end
    p149.exitPortals = v157
    if p150.model then
        p150.model:Destroy()
    end
end
function u31.tryOpenExitPortal(u160, p161) --[[ Line: 748 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
        [3] = u28
        [4] = u21
        [5] = u27
    --]]
    if u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u23.STYX_ENTRANCE_PORTAL) then
        return nil
    end
    if u28.Client:Get("StyxTryOpenExitPortalFromClient"):CallServer(p161.uuid) then
        local v162 = u21.AbilityCooldownModifierCheck:fire(u27.PORTAL_OPEN_COOLDOWN_SECONDS).cooldown
        local v163 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController")
        local v164 = u23.STYX_ENTRANCE_PORTAL
        local v165 = {
            ["cooldownBar"] = {
                ["color"] = Color3.fromRGB(80, 80, 255)
            }
        }
        v163:setOnCooldown(v164, v162, v165)
        u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(u23.STYX_ENTRANCE_PORTAL, "styx_entrance_portal_cooldown_update", function() --[[ Line: 762 ]]
            --[[
            Upvalues:
                [1] = u160
            --]]
            u160.exitPortalCooldownSignal:Fire(false)
        end)
        u160.exitPortalCooldownSignal:Fire(true)
    end
end
function u31.tryUseEntrancePortal(_, p166) --[[ Line: 768 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.Client:Get("UseStyxPortalFromClient"):SendToServer({
        ["entrancePortalData"] = p166
    })
end
function u31.getThisPlayersCurrentEntrancePortal(p167) --[[ Line: 773 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v168 = nil
    for v169, v170 in p167.entrancePortals do
        local _ = v169 - 1
        if v170.player == u15.LocalPlayer == true then
            return v170
        end
    end
    return v168
end
function u31.openEntrancePortalVisuals(p171, p172, _) --[[ Line: 789 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
        [3] = u17
    --]]
    if p172 then
        local u173 = p172:FindFirstChild("Styx_Gate")
        if u173 ~= nil then
            u173 = u173:FindFirstChild("Pivot")
            if u173 ~= nil then
                u173 = u173:FindFirstChild("left cover")
            end
        end
        local u174 = p172:FindFirstChild("Styx_Gate")
        if u174 ~= nil then
            u174 = u174:FindFirstChild("Pivot")
            if u174 ~= nil then
                u174 = u174:FindFirstChild("right cover")
            end
        end
        if u173 and u174 then
            local v175 = p172:GetPivot().Position
            local v176 = u173.Position - v175
            local v177 = u174.Position - v175
            local v178 = p171.entrancePortalDoorOpenXPosition
            local v179 = v176.Y
            local v180 = v176.Z
            local v181 = Vector3.new(v178, v179, v180)
            local v182 = -p171.entrancePortalDoorOpenXPosition
            local v183 = v177.Y
            local v184 = v177.Z
            local v185 = Vector3.new(v182, v183, v184)
            local v186 = v175 + v176
            local v187 = v175 + v177
            local v188 = v175 + v181
            local v189 = v175 + v185
            local u190 = CFrame.new(v186)
            local u191 = CFrame.new(v187)
            local u192 = CFrame.new(v188)
            local u193 = CFrame.new(v189)
            u20(0.5, u10, function(p194) --[[ Line: 822 ]]
                --[[
                Upvalues:
                    [1] = u173
                    [2] = u190
                    [3] = u192
                --]]
                u173:PivotTo(u190:Lerp(u192, p194))
            end):Play()
            u20(0.5, u10, function(p195) --[[ Line: 825 ]]
                --[[
                Upvalues:
                    [1] = u174
                    [2] = u191
                    [3] = u193
                --]]
                u174:PivotTo(u191:Lerp(u193, p195))
            end):Play()
        end
        local v196 = p172:FindFirstChild("Styx_Gate")
        if v196 ~= nil then
            v196 = v196:FindFirstChild("Pivot")
            if v196 ~= nil then
                v196 = v196:FindFirstChild("StyxPortalParticleDown")
                if v196 ~= nil then
                    v196 = v196:FindFirstChild("Smoke")
                end
            end
        end
        if v196 then
            v196.Enabled = true
        end
        local u197 = p172:FindFirstChild("Styx_Gate")
        if u197 ~= nil then
            u197 = u197:FindFirstChild("Pivot")
            if u197 ~= nil then
                u197 = u197:FindFirstChild("tornado")
            end
        end
        local u198 = p172:FindFirstChild("Styx_Gate")
        if u198 ~= nil then
            u198 = u198:FindFirstChild("Pivot")
            if u198 ~= nil then
                u198 = u198:FindFirstChild("tornado1")
            end
        end
        if u197 and u198 then
            return u17.Heartbeat:Connect(function() --[[ Line: 862 ]]
                --[[
                Upvalues:
                    [1] = u197
                    [2] = u198
                --]]
                u197.CFrame = u197.CFrame * CFrame.Angles(0, 0.06981317007977318, 0)
                u198.CFrame = u198.CFrame * CFrame.Angles(0, -0.12217304763960307, 0)
            end)
        end
    end
    return nil
end
function u31.closeEntrancePortalVisuals(p199, p200, u201, _, p202) --[[ Line: 875 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
    --]]
    if p200 then
        local u203 = p200:FindFirstChild("Styx_Gate")
        if u203 ~= nil then
            u203 = u203:FindFirstChild("Pivot")
            if u203 ~= nil then
                u203 = u203:FindFirstChild("left cover")
            end
        end
        local u204 = p200:FindFirstChild("Styx_Gate")
        if u204 ~= nil then
            u204 = u204:FindFirstChild("Pivot")
            if u204 ~= nil then
                u204 = u204:FindFirstChild("right cover")
            end
        end
        if u203 and u204 then
            local v205 = p200:GetPivot().Position
            local v206 = u203.Position - v205
            local v207 = u204.Position - v205
            local v208 = p199.entrancePortalDoorClosedXPosition
            local v209 = v206.Y
            local v210 = v206.Z
            local v211 = Vector3.new(v208, v209, v210)
            local v212 = -p199.entrancePortalDoorClosedXPosition
            local v213 = v207.Y
            local v214 = v207.Z
            local v215 = Vector3.new(v212, v213, v214)
            local v216 = v205 + v206
            local v217 = v205 + v207
            local v218 = v205 + v211
            local v219 = v205 + v215
            local u220 = CFrame.new(v216)
            local u221 = CFrame.new(v217)
            local u222 = CFrame.new(v218)
            local u223 = CFrame.new(v219)
            u20(0.5, u10, function(p224) --[[ Line: 908 ]]
                --[[
                Upvalues:
                    [1] = u203
                    [2] = u220
                    [3] = u222
                --]]
                u203:PivotTo(u220:Lerp(u222, p224))
            end):Play()
            u20(0.5, u10, function(p225) --[[ Line: 911 ]]
                --[[
                Upvalues:
                    [1] = u204
                    [2] = u221
                    [3] = u223
                --]]
                u204:PivotTo(u221:Lerp(u223, p225))
            end):Play()
        end
        if u201 then
            task.delay(0.5, function() --[[ Line: 917 ]]
                --[[
                Upvalues:
                    [1] = u201
                --]]
                if u201 then
                    u201:Disconnect()
                end
            end)
        end
        local v226 = p200:FindFirstChild("Styx_Gate")
        if v226 ~= nil then
            v226 = v226:FindFirstChild("Pivot")
            if v226 ~= nil then
                v226 = v226:FindFirstChild("StyxPortalParticleDown")
                if v226 ~= nil then
                    v226 = v226:FindFirstChild("Smoke")
                end
            end
        end
        if v226 then
            v226.Enabled = false
        end
        if p202 then
            p202:Destroy()
        end
    end
    return nil
end
function u31.openExitPortalVisuals(p227, p228, p229) --[[ Line: 945 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
        [3] = u17
    --]]
    if p228 then
        local u230 = p228:FindFirstChild("Pivot")
        if u230 ~= nil then
            u230 = u230:FindFirstChild("left_cover")
        end
        local u231 = p228:FindFirstChild("Pivot")
        if u231 ~= nil then
            u231 = u231:FindFirstChild("right_cover")
        end
        if u230 and u231 then
            local v232 = p228:GetPivot().Position
            local v233 = u230.Position - v232
            local v234 = u231.Position - v232
            local v235 = p227.exitPortalDoorOpenXPosition
            local v236 = v233.Y
            local v237 = v233.Z
            local v238 = Vector3.new(v235, v236, v237)
            local v239 = -p227.exitPortalDoorOpenXPosition
            local v240 = v234.Y
            local v241 = v234.Z
            local v242 = Vector3.new(v239, v240, v241)
            local v243 = v232 + v233
            local v244 = v232 + v234
            local v245 = v232 + v238
            local v246 = v232 + v242
            local u247 = CFrame.new(v243)
            local u248 = CFrame.new(v244)
            local u249 = CFrame.new(v245)
            local u250 = CFrame.new(v246)
            u20(0.5, u10, function(p251) --[[ Line: 972 ]]
                --[[
                Upvalues:
                    [1] = u230
                    [2] = u247
                    [3] = u249
                --]]
                u230:PivotTo(u247:Lerp(u249, p251))
            end):Play()
            u20(0.5, u10, function(p252) --[[ Line: 975 ]]
                --[[
                Upvalues:
                    [1] = u231
                    [2] = u248
                    [3] = u250
                --]]
                u231:PivotTo(u248:Lerp(u250, p252))
            end):Play()
        end
        if p229.particleEmitter then
            p229.particleEmitter.Enabled = true
        end
        local u253 = p228:FindFirstChild("Pivot")
        if u253 ~= nil then
            u253 = u253:FindFirstChild("tornado")
        end
        local u254 = p228:FindFirstChild("Pivot")
        if u254 ~= nil then
            u254 = u254:FindFirstChild("tornado1")
        end
        if u253 and u254 then
            return u17.Heartbeat:Connect(function() --[[ Line: 995 ]]
                --[[
                Upvalues:
                    [1] = u253
                    [2] = u254
                --]]
                u253.CFrame = u253.CFrame * CFrame.Angles(0, 0.06981317007977318, 0)
                u254.CFrame = u254.CFrame * CFrame.Angles(0, -0.12217304763960307, 0)
            end)
        end
    end
    return nil
end
function u31.getPortalPromptText(_, p255) --[[ Line: 1008 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u23
    --]]
    if p255 == nil then
        p255 = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(u23.STYX_ENTRANCE_PORTAL)
    end
    return p255 and "On Cooldown" or "Connect"
end
function u31.hideExitPortalExceptParticleAndBeam(p256, p257) --[[ Line: 1015 ]]
    print(" client hide exit portal")
    if p257.model then
        p256:recursiveHideMeshParts(p257.model)
    end
end
function u31.recursiveHideMeshParts(p258, p259) --[[ Line: 1021 ]]
    for v260, v261 in p259:GetChildren() do
        local _ = v260 - 1
        if v261:IsA("MeshPart") then
            v261.Transparency = 1
        end
        p258:recursiveHideMeshParts(v261)
    end
end
u8.CreateController(u31.new())
return nil