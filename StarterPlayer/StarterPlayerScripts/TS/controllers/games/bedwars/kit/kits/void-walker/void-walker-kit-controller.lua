local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.MathExtras
local u5 = v3.RandomUtil
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions")
local u10 = v9.InOutQuad
local u11 = v9.InQuad
local u12 = v9.Linear
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.ReplicatedStorage
local u19 = v16.RunService
local u20 = v16.Workspace
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u22 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u23 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "character", "character-util").CharacterUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "void-walker", "void-walker-kit-balance").VoidWalkerKitBalance
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u36 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u37 = v1.import(script, script.Parent, "ui", "void-walker-kit-rewind-ui").VoidWalkerRewindUI
local u38 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 44 ]]
        return "VoidWalkerKitController"
    end,
    ["__index"] = u36
})
u38.__index = u38
function u38.new(...) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u38
    --]]
    local v39 = u38
    local v40 = setmetatable({}, v39)
    return v40:constructor(...) or v40
end
function u38.constructor(p41) --[[ Line: 54 ]]
    --[[
    Upvalues:
        [1] = u36
        [2] = u29
        [3] = u33
        [4] = u13
    --]]
    u36.constructor(p41, u29.VOID_WALKER, {
        ["sounds"] = {
            u33.VOID_WALKER_PORTAL_OPEN_1,
            u33.VOID_WALKER_PORTAL_OPEN_2,
            u33.VOID_WALKER_PORTAL_OPEN_3,
            u33.VOID_WALKER_PORTAL_CLOSE_1,
            u33.VOID_WALKER_PORTAL_CLOSE_2,
            u33.VOID_WALKER_PORTAL_CLOSE_3,
            u33.VOID_WALKER_WEE_1,
            u33.VOID_WALKER_HEHE,
            u33.VOID_WALKER_LAUGH,
            u33.VOID_WALKER_WOOHOO,
            u33.VOID_WALKER_GIGGLE,
            u33.VOID_WALKER_WEE_2,
            u33.VOID_WALKER_UHH,
            u33.VOID_WALKER_SASSY_LAUGH,
            u33.VOID_WALKER_WOOP
        },
        ["imageIds"] = {},
        ["animations"] = {}
    })
    p41.Name = "VoidWalkerKitController"
    p41.mostRecentMovementDirection = Vector3.new(0, 0, 1)
    p41.playerBeamMap = {}
    p41.playerBeamDestinationMap = {}
    p41.playerBeamOriginOverrideMap = {}
    p41.warpDataMap = {}
    p41.playerWarpDataMap = {}
    p41.rewindUIMaid = u13.new()
    p41.rewindAbilityMaid = u13.new()
    p41.portalOpenSounds = { u33.VOID_WALKER_PORTAL_OPEN_1, u33.VOID_WALKER_PORTAL_OPEN_2, u33.VOID_WALKER_PORTAL_OPEN_3 }
    p41.portalCloseSounds = { u33.VOID_WALKER_PORTAL_CLOSE_1, u33.VOID_WALKER_PORTAL_CLOSE_2, u33.VOID_WALKER_PORTAL_CLOSE_3 }
    p41.harlequinWarpSounds = { u33.VOID_WALKER_LAUGH, u33.VOID_WALKER_WOOHOO, u33.VOID_WALKER_WOOP }
    p41.harlequinRewindSounds = { u33.VOID_WALKER_HEHE, u33.VOID_WALKER_GIGGLE }
    p41.portals = {}
    p41.portalVisualData = {}
end
function u38.KnitStart(p42) --[[ Line: 76 ]]
    --[[
    Upvalues:
        [1] = u36
    --]]
    u36.KnitStart(p42)
end
function u38.onKitLocalActivated(u43, p44) --[[ Line: 79 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u24
        [3] = u27
        [4] = u19
        [5] = u30
        [6] = u17
        [7] = u7
    --]]
    p44:GiveTask(u22.CanUseLocalAbility:connect(function(p45) --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u24
            [2] = u27
        --]]
        if p45.ability == u24.VOID_WALKER_WARP or p45.ability == u24.VOID_WALKER_REWIND then
            local v46 = u27:getEntity(p45.userCharacter)
            local v47
            if v46 == nil then
                v47 = v46
            else
                v47 = v46:isAlive()
            end
            if not v47 then
                p45:setCancelled(true)
                return nil
            end
            if not v46:getInstance() then
                p45:setCancelled(true)
            end
        end
    end))
    p44:GiveTask(u19.Heartbeat:Connect(function(_) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u30
            [2] = u43
            [3] = u17
            [4] = u7
        --]]
        if not u30.WARP_USES_CAMERA_DIRECTION then
            local v48 = not u43.humanoid
            if not v48 then
                local v49 = u43.humanoid
                if v49 ~= nil then
                    v49 = v49.Parent
                end
                v48 = v49 == nil
            end
            if v48 then
                local v50 = u17.LocalPlayer.Character
                if v50 ~= nil then
                    v50 = v50:FindFirstChildOfClass("Humanoid")
                end
                u43.humanoid = v50
                if not u43.humanoid then
                    return nil
                end
            end
            local v51 = u43.humanoid.MoveDirection
            if v51 and v51.Magnitude > 0.2 then
                u43.mostRecentMovementDirection = v51
            end
        end
        for v52, _ in u43.playerBeamDestinationMap do
            u43:updateBeamPosition(v52)
        end
        local v53 = u17.LocalPlayer.Character
        if v53 ~= nil then
            v53 = v53.PrimaryPart
        end
        if v53 and u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            for v54, v55 in u43.portals do
                local _ = v54 - 1
                if v55 ~= nil and v55.Parent ~= nil then
                    if v55.PrimaryPart then
                        u43:checkPortalVisibility(v55, v53.Position)
                    end
                end
            end
        end
    end))
end
function u38.onKitLocalDeactivated(_) --[[ Line: 171 ]] end
function u38.onKitReplicationActivated(u56, _) --[[ Line: 173 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u26
        [3] = u20
        [4] = u28
        [5] = u5
        [6] = u6
    --]]
    u32.Client:Get("VoidWalker_UseWarpAbility"):Connect(function(p57) --[[ Line: 174 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56:useWarpAbility(p57.player, p57.uuid, p57.startPosition, p57.endPosition, p57.warpStartTime, p57.warpEndTime)
    end)
    u32.Client:Get("VoidWalker_DisableRewind"):Connect(function(p58) --[[ Line: 177 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        local v59 = u56.warpDataMap[p58.uuid]
        if not v59 then
            return nil
        end
        v59.maid:DoCleaning()
    end)
    u32.Client:Get("VoidWalker_CleanupRewind"):Connect(function(p60) --[[ Line: 186 ]]
        --[[
        Upvalues:
            [1] = u56
        --]]
        u56:cleanupRewind(p60.player)
    end)
    u32.Client:Get("VoidWalker_Rewind"):Connect(function(u61) --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u26
            [2] = u20
            [3] = u56
            [4] = u28
            [5] = u5
            [6] = u6
        --]]
        local v62 = u26.getPlayerCameraFocusPosition(u61.player) or u61.startPosition
        local v63 = u26.getPlayerCameraFocusOffsetHeight(u61.player)
        local v64 = v63 == nil and 0 or v63
        local v65 = u61.endPosition + Vector3.new(0, v64, 0)
        local v66 = u61.endTime - u20:GetServerTimeNow()
        local v67 = v66 <= 0 and 0.5 or v66
        task.delay(v67, function() --[[ Line: 204 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u61
            --]]
            for _, v68 in u56.warpDataMap do
                if v68.player == u61.player then
                    v68.maid:DoCleaning()
                    u56.warpDataMap[v68.uuid] = nil
                    u56.playerWarpDataMap[u61.player] = nil
                end
            end
        end)
        u56:cleanupRewind(u61.player)
        u56:createPortal(v62, 0.5, true, u56:getPlayerSkin(u61.player))
        u56:teleportPlayer(u61.player, v62, v65, v67, true)
        u56:playPortalOpenSound(v62, u56:getPlayerSkin(u61.player))
        if u56:getPlayerSkin(u61.player) == u28.VOID_WALKER_HARLEQUIN then
            local v69 = u5.fromList
            local v70 = u56.harlequinRewindSounds
            local v71 = v69(unpack(v70))
            u6:playSound(v71, {
                ["position"] = v62
            })
            u6:playSound(v71, {
                ["position"] = v65
            })
        end
    end)
end
function u38.onKitReplicationDeactivated(_) --[[ Line: 240 ]] end
function u38.onInnateAbilityEnabled(_, _, _) --[[ Line: 242 ]] end
function u38.onAbilityUsed(p72, _, p73) --[[ Line: 244 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u17
        [3] = u35
        [4] = u29
        [5] = u24
        [6] = u30
        [7] = u20
        [8] = u34
        [9] = u32
    --]]
    local v74 = u27:getPlayerFromEntityInstance(p73.userCharacter)
    if not v74 then
        return nil
    end
    if v74 ~= u17.LocalPlayer then
        return nil
    end
    if not u35(v74, u29.VOID_WALKER) then
        return nil
    end
    local v75 = v74.Character
    if v75 ~= nil then
        v75 = v75.PrimaryPart
        if v75 ~= nil then
            v75 = v75.Position
        end
    end
    if not v75 then
        return nil
    end
    if p73.ability == u24.VOID_WALKER_WARP then
        local v76
        if u30.WARP_USES_CAMERA_DIRECTION then
            local v77 = u20.CurrentCamera
            if not v77 then
                return nil
            end
            v76 = v77.CFrame.LookVector
            if not v76 then
                return nil
            end
            if v76.Magnitude == 0 then
                return nil
            end
        else
            local v78 = p72.mostRecentMovementDirection
            local v79 = v78.X
            local v80 = v78.Z
            v76 = Vector3.new(v79, 0, v80).Unit
        end
        local v81 = v76.Unit
        local v82 = v75 + v81 * u30.WARP_DISTANCE
        local v83 = u34.raycastWithOnlyWorldCollision(v75, v81, u30.WARP_DISTANCE)
        if v83 then
            v82 = v83.Position
        end
        u32.Client:Get("VoidWalker_ClientUsedWarpAbility"):SendToServer({
            ["clientStartPosition"] = v75,
            ["direction"] = v81,
            ["clientDestinationPosition"] = v82
        })
    end
end
function u38.useWarpAbility(u84, u85, u86, u87, u88, u89, u90) --[[ Line: 333 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u2
        [3] = u15
        [4] = u37
        [5] = u30
        [6] = u20
        [7] = u26
        [8] = u7
        [9] = u13
        [10] = u28
        [11] = u5
        [12] = u6
        [13] = u24
        [14] = u31
    --]]
    task.spawn(function() --[[ Line: 334 ]]
        --[[
        Upvalues:
            [1] = u85
            [2] = u17
            [3] = u84
            [4] = u2
            [5] = u15
            [6] = u37
            [7] = u89
            [8] = u90
            [9] = u30
            [10] = u20
            [11] = u26
            [12] = u87
            [13] = u88
            [14] = u7
            [15] = u13
            [16] = u86
            [17] = u28
            [18] = u5
            [19] = u6
            [20] = u24
            [21] = u31
        --]]
        if u85 == u17.LocalPlayer then
            if u84.rewindUIMaid then
                u84.rewindUIMaid:DoCleaning()
            end
            u84.rewindUIMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u15.createElement(u37, {
                ["HideOnComplete"] = true,
                ["Size"] = UDim2.fromScale(0.3, 0.03),
                ["StartTime"] = u89,
                ["EndTime"] = u90 + u30.REWIND_AVAILABILITY_DURATION,
                ["ProgressBarConfig"] = {
                    ["Flip"] = true,
                    ["GradientRotation"] = 0,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(153, 38, 199), Color3.fromRGB(99, 232, 255))
                }
            }))
        end
        local v91 = u85.Character
        if v91 ~= nil then
            v91 = v91.PrimaryPart
        end
        local v92 = u90 - u20:GetServerTimeNow()
        local u93 = u26.getPlayerCameraFocusPosition(u85) or u87
        local v94 = u26.getPlayerCameraFocusOffsetHeight(u85)
        local u95 = v94 == nil and 0 or v94
        local u96 = u88 + Vector3.new(0, u95, 0)
        for _, v97 in u84.warpDataMap do
            if v97.player == u85 then
                v97.maid:DoCleaning()
                u84.warpDataMap[v97.uuid] = nil
            end
        end
        local u98
        if u30.WARP_CREATES_FIRST_PORTAL then
            u98 = u84:createPortal(u93, 0.5, true, u84:getPlayerSkin(u85))
        else
            u98 = nil
        end
        if u98 ~= nil then
            local v99 = u84.portals
            table.insert(v99, u98)
            if u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
                u84:setPortalHiddenState(u98, true)
            end
        end
        local v100 = u84
        local v101 = u90 - u20:GetServerTimeNow() + u30.REWIND_AVAILABILITY_DURATION
        local u102 = v100:createPortal(u96, math.max(1, v101), false, u84:getPlayerSkin(u85))
        if u7.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
            u84:setPortalHiddenState(u102, true)
        end
        local v103 = u84.portals
        table.insert(v103, u102)
        local v104 = u13.new()
        local v105 = {
            ["rewindTrail"] = nil,
            ["rewindTrailMaid"] = nil,
            ["uuid"] = u86,
            ["player"] = u85,
            ["portal1"] = u98,
            ["portal2"] = u102,
            ["maid"] = v104,
            ["rewindPoints"] = { u88 },
            ["nextRewindPointCaptureTime"] = time() + v92 + 0.1
        }
        u84.warpDataMap[u86] = v105
        u84.playerWarpDataMap[u85] = v105
        if u84:getPlayerSkin(u85) == u28.VOID_WALKER_HARLEQUIN then
            local v106 = u5.fromList
            local v107 = u84.harlequinWarpSounds
            local v108 = v106(unpack(v107))
            u6:playSound(v108, {
                ["position"] = u93
            })
            u6:playSound(v108, {
                ["position"] = u96
            })
        end
        if v91 then
            v91.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        end
        v104:GiveTask(function() --[[ Line: 443 ]]
            --[[
            Upvalues:
                [1] = u98
                [2] = u84
                [3] = u93
                [4] = u85
                [5] = u102
                [6] = u96
            --]]
            local v109 = u98
            if v109 then
                local v110 = u98
                if v110 ~= nil then
                    v110 = v110.Parent
                end
                v109 = v110 ~= nil
            end
            if v109 then
                u84:playPortalCloseSound(u93, u84:getPlayerSkin(u85))
                u98:Destroy()
                local v111 = (table.find(u84.portals, u98) or 0) - 1
                if v111 > -1 then
                    table.remove(u84.portals, v111 + 1)
                end
            end
            local v112 = u102
            if v112 then
                local v113 = u102
                if v113 ~= nil then
                    v113 = v113.Parent
                end
                v112 = v113 ~= nil
            end
            if v112 then
                u84:playPortalCloseSound(u96, u84:getPlayerSkin(u85))
                u102:Destroy()
                local v114 = (table.find(u84.portals, u102) or 0) - 1
                if v114 > -1 then
                    table.remove(u84.portals, v114 + 1)
                end
            end
        end)
        u84:disablePlayerBeam(u85)
        u84:teleportPlayer(u85, u93, u96, v92)
        task.delay(v92, function() --[[ Line: 482 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u85
                [3] = u88
                [4] = u95
                [5] = u17
                [6] = u2
                [7] = u24
                [8] = u31
            --]]
            local v115 = u84:getPlayerBeam(u85)
            local v116 = u95
            u84.playerBeamDestinationMap[u85] = u88 + Vector3.new(0, v116, 0)
            u84:updateBeamPosition(u85)
            u84:enableBeam(v115)
            if u85 == u17.LocalPlayer then
                if u84.rewindAbilityMaid then
                    u84.rewindAbilityMaid:DoCleaning()
                end
                local v117 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
                local v118 = u24.VOID_WALKER_REWIND
                local v119 = {
                    ["abilityType"] = "KitSecondary",
                    ["abilityButton"] = {
                        ["icon"] = u31.VOID_WALKER_REWIND_ICON
                    }
                }
                v117:enableAbility(v118, v119):andThen(function(p120) --[[ Line: 505 ]]
                    --[[
                    Upvalues:
                        [1] = u84
                    --]]
                    u84.rewindAbilityMaid:GiveTask(p120)
                end)
            end
        end)
        task.delay(u90 - u20:GetServerTimeNow() + u30.REWIND_AVAILABILITY_DURATION, function() --[[ Line: 516 ]]
            --[[
            Upvalues:
                [1] = u84
                [2] = u85
                [3] = u86
                [4] = u17
            --]]
            local v121 = u84.playerWarpDataMap[u85]
            if v121 and v121.uuid == u86 then
                u84:disablePlayerBeam(u85)
                if v121.rewindTrailMaid then
                    v121.rewindTrailMaid:DoCleaning()
                end
                if u85 == u17.LocalPlayer and u84.rewindAbilityMaid then
                    u84.rewindAbilityMaid:DoCleaning()
                end
                u84.playerWarpDataMap[u85] = nil
            end
        end)
    end)
end
function u38.createPortal(u122, u123, u124, p125, u126) --[[ Line: 539 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u18
        [3] = u25
        [4] = u20
        [5] = u19
        [6] = u21
        [7] = u11
        [8] = u4
    --]]
    local v127 = u126 == u28.VOID_WALKER_HARLEQUIN
    local u128
    if p125 then
        if v127 then
            u128 = u18.Assets.Misc.VoidWalker_Harlequin_Portal_Spirit:Clone()
        else
            u128 = u18.Assets.Misc.VoidWalker_Portal_Spirit:Clone()
        end
    elseif v127 then
        u128 = u18.Assets.Misc.VoidWalker_Harlequin_Portal_Void:Clone()
    else
        u128 = u18.Assets.Misc.VoidWalker_Portal_Void:Clone()
    end
    u128:PivotTo(CFrame.new(u123))
    u25.billboardToCameraOnlyOnYAxis(u128, 90)
    u128:ScaleTo(0.01)
    u128.Parent = u20
    task.spawn(function() --[[ Line: 547 ]]
        --[[
        Upvalues:
            [1] = u122
            [2] = u123
            [3] = u126
            [4] = u19
            [5] = u128
            [6] = u25
            [7] = u21
            [8] = u11
            [9] = u4
            [10] = u124
        --]]
        u122:playPortalOpenSound(u123, u126)
        local u129 = nil
        u129 = u19.Heartbeat:Connect(function(_) --[[ Line: 552 ]]
            --[[
            Upvalues:
                [1] = u128
                [2] = u129
                [3] = u25
            --]]
            if u128 and u128.Parent ~= nil then
                u25.billboardToCameraOnlyOnYAxis(u128, 90)
            elseif u129.Connected then
                u129:Disconnect()
                return
            end
        end)
        u21(0.2, u11, function(p130) --[[ Line: 562 ]]
            --[[
            Upvalues:
                [1] = u128
                [2] = u4
            --]]
            if not u128 or u128.Parent == nil then
                return nil
            end
            u128:ScaleTo((u4:lerp(0.01, 1, p130)))
        end, 0, 1)
        task.delay(u124, function() --[[ Line: 570 ]]
            --[[
            Upvalues:
                [1] = u128
                [2] = u122
                [3] = u123
                [4] = u126
                [5] = u21
                [6] = u11
                [7] = u4
                [8] = u129
            --]]
            if not u128 or u128.Parent == nil then
                return nil
            end
            u122:playPortalCloseSound(u123, u126)
            u21(0.2, u11, function(p131) --[[ Line: 576 ]]
                --[[
                Upvalues:
                    [1] = u128
                    [2] = u4
                --]]
                if not u128 or u128.Parent == nil then
                    return nil
                end
                u128:ScaleTo((u4:lerp(1, 0.01, p131)))
            end, 0, 1):Wait()
            if u129.Connected then
                u129:Disconnect()
            end
            if u128 and u128.Parent ~= nil then
                u128:Destroy()
            end
            local v132 = (table.find(u122.portals, u128) or 0) - 1
            if v132 > -1 then
                table.remove(u122.portals, v132 + 1)
            end
        end)
    end)
    return u128
end
function u38.teleportPlayer(u133, u134, u135, u136, u137, u138) --[[ Line: 600 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u20
        [3] = u17
        [4] = u23
        [5] = u21
        [6] = u12
        [7] = u10
        [8] = u26
    --]]
    if u138 == nil then
        u138 = false
    end
    task.spawn(function() --[[ Line: 604 ]]
        --[[
        Upvalues:
            [1] = u135
            [2] = u14
            [3] = u20
            [4] = u133
            [5] = u134
            [6] = u17
            [7] = u23
            [8] = u21
            [9] = u137
            [10] = u12
            [11] = u136
            [12] = u10
            [13] = u26
            [14] = u138
        --]]
        local u139 = u135
        local u140 = u14("Part", {
            ["Size"] = Vector3.new(1, 1, 1),
            ["Anchored"] = true,
            ["CanCollide"] = false,
            ["Transparency"] = 1,
            ["CFrame"] = CFrame.new(u139),
            ["Parent"] = u20
        })
        u133.playerBeamOriginOverrideMap[u134] = u140
        u133.playerBeamOriginOverrideMap[u134] = u140
        if u134 == u17.LocalPlayer then
            local v141 = u20.CurrentCamera
            if u140 and v141 then
                v141.CameraSubject = u140
            end
            u23:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = false
            })
        end
        u21(u137, u12, function(p142) --[[ Line: 635 ]]
            --[[
            Upvalues:
                [1] = u140
                [2] = u139
                [3] = u136
            --]]
            u140:PivotTo(CFrame.new(u139):Lerp(CFrame.new(u136), p142))
        end):Wait()
        if u134 == u17.LocalPlayer then
            u23:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = true
            })
            local u143 = u17.LocalPlayer.Character
            if u143 ~= nil then
                u143 = u143:FindFirstChildOfClass("Humanoid")
            end
            local v144
            if u143 == nil then
                v144 = u143
            else
                v144 = u143.RootPart
            end
            if v144 then
                local u145 = CFrame.new(u140.Position)
                local u146 = nil
                u146 = u21(0.2, u10, function(p147) --[[ Line: 657 ]]
                    --[[
                    Upvalues:
                        [1] = u143
                        [2] = u146
                        [3] = u26
                        [4] = u140
                        [5] = u145
                    --]]
                    local v148 = u143
                    if v148 ~= nil then
                        v148 = v148.RootPart
                    end
                    if not v148 then
                        u146:Cancel()
                        return nil
                    end
                    local v149 = u26.getHumanoidCameraFocusPosition(u143)
                    if not v149 then
                        return nil
                    end
                    u140:PivotTo(u145:Lerp(CFrame.new(v149), p147))
                end):Wait()
                u20.CurrentCamera.CameraSubject = u143
            end
        end
        u140:Destroy()
        u133.playerBeamOriginOverrideMap[u134] = nil
        if u138 then
            u133:disablePlayerBeam(u134)
        end
    end)
end
function u38.getPlayerBeam(p150, p151) --[[ Line: 687 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
    --]]
    local v152 = p150.playerBeamMap[p151]
    if v152 and v152.Parent ~= nil then
        return v152
    end
    local v153 = u18.Assets.Misc.VoidWalker_Beam:Clone()
    v153.Parent = u20
    p150.playerBeamMap[p151] = v153
    return v153
end
function u38.enableBeam(_, p154) --[[ Line: 703 ]]
    local v155 = 0
    local v156 = {}
    for v157, v158 in p154:GetDescendants() do
        local _ = v157 - 1
        if v158:IsA("Beam") == true then
            v155 = v155 + 1
            v156[v155] = v158
        end
    end
    for _, v159 in v156 do
        v159.Enabled = true
    end
end
function u38.disableBeam(_, p160) --[[ Line: 723 ]]
    local v161 = 0
    local v162 = {}
    for v163, v164 in p160:GetDescendants() do
        local _ = v163 - 1
        if v164:IsA("Beam") == true then
            v161 = v161 + 1
            v162[v161] = v164
        end
    end
    for _, v165 in v162 do
        v165.Enabled = false
    end
end
function u38.enablePlayerBeam(p166, p167) --[[ Line: 743 ]]
    local v168 = p166.playerBeamMap[p167]
    if not v168 then
        return nil
    end
    p166:enableBeam(v168)
end
function u38.disablePlayerBeam(p169, p170) --[[ Line: 752 ]]
    local v171 = p169.playerBeamMap[p170]
    if not v171 then
        return nil
    end
    p169:disableBeam(v171)
end
function u38.deleteBeamDestination(p172, p173) --[[ Line: 761 ]]
    p172.playerBeamDestinationMap[p173] = nil
end
function u38.updateBeamPosition(p174, p175) --[[ Line: 766 ]]
    --[[
    Upvalues:
        [1] = u26
    --]]
    local v176 = p174.playerBeamMap[p175]
    if not v176 then
        return nil
    end
    local v177 = p174.playerBeamDestinationMap[p175]
    if not v177 then
        return nil
    end
    local v178 = p174.playerBeamOriginOverrideMap[p175]
    local v179
    if v178 and v178.Parent ~= nil then
        v179 = p174.playerBeamOriginOverrideMap[p175]
        if v179 ~= nil then
            local v180 = v179.Position
            local v181 = u26.getPlayerCameraFocusOffsetHeight(p175)
            v179 = v180 - Vector3.new(0, v181, 0)
        end
    else
        v179 = p175.Character
        if v179 ~= nil then
            v179 = v179.PrimaryPart
            if v179 ~= nil then
                v179 = v179.Position
            end
        end
    end
    if not v179 then
        return nil
    end
    v176.BeamPoint1:PivotTo(CFrame.new(v179))
    v176.BeamPoint2:PivotTo(CFrame.new(v177))
end
function u38.destroyAllPortalsForPlayer(p182, p183) --[[ Line: 809 ]]
    --[[
    Upvalues:
        [1] = u8
    --]]
    local v184 = 0
    local v185 = {}
    for v186, v187 in u8.values(p182.warpDataMap) do
        local _ = v186 - 1
        if v187.player == p183 == true then
            v184 = v184 + 1
            v185[v184] = v187
        end
    end
    for _, v188 in v185 do
        v188.maid:DoCleaning()
        p182.warpDataMap[v188.uuid] = nil
    end
end
function u38.playPortalOpenSound(p189, p190, _) --[[ Line: 832 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    local v191 = u5.fromList
    local v192 = p189.portalOpenSounds
    u6:playSound(v191(unpack(v192)), {
        ["position"] = p190
    })
end
function u38.playPortalCloseSound(p193, p194, _) --[[ Line: 838 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
    --]]
    local v195 = u5.fromList
    local v196 = p193.portalCloseSounds
    u6:playSound(v195(unpack(v196)), {
        ["position"] = p194
    })
end
function u38.checkPortalVisibility(p197, p198, p199) --[[ Line: 844 ]]
    if p198.PrimaryPart then
        local v200 = p197.portalVisualData[p198]
        if v200 == nil then
            v200 = {
                ["isHidden"] = false
            }
            p197.portalVisualData[p198] = v200
        end
        local v201 = (p198.PrimaryPart.Position - p199).Magnitude
        if v201 < 10 and not v200.isHidden then
            v200.isHidden = true
            p197:setPortalHiddenState(p198, true)
        elseif v201 >= 10 and v200.isHidden then
            v200.isHidden = false
            p197:setPortalHiddenState(p198, false)
        end
    else
        return nil
    end
end
function u38.setPortalHiddenState(_, p202, p203) --[[ Line: 871 ]]
    if p203 then
        local v204 = p202:GetDescendants()
        local function v206(p205) --[[ Line: 874 ]]
            if p205:IsA("MeshPart") then
                p205.Transparency = 0.8
                return
            elseif p205:IsA("Decal") then
                p205.Transparency = 1
                return
            elseif p205:IsA("ParticleEmitter") then
                p205.Enabled = false
            elseif p205:IsA("Beam") then
                p205.Enabled = false
            end
        end
        for v207, v208 in v204 do
            v206(v208, v207 - 1, v204)
        end
    else
        local v209 = p202:GetDescendants()
        local function v211(p210) --[[ Line: 899 ]]
            if p210:IsA("MeshPart") then
                p210.Transparency = 0
                return
            elseif p210:IsA("Decal") then
                p210.Transparency = 0.65
                return
            elseif p210:IsA("ParticleEmitter") then
                p210.Enabled = true
            elseif p210:IsA("Beam") then
                p210.Enabled = true
            end
        end
        for v212, v213 in v209 do
            v211(v213, v212 - 1, v209)
        end
    end
end
function u38.cleanupRewind(p214, p215) --[[ Line: 924 ]]
    --[[
    Upvalues:
        [1] = u17
    --]]
    p214:disablePlayerBeam(p215)
    if p215 == u17.LocalPlayer then
        if p214.rewindAbilityMaid then
            p214.rewindAbilityMaid:DoCleaning()
        end
        if p214.rewindUIMaid then
            p214.rewindUIMaid:DoCleaning()
        end
    end
    p214.playerWarpDataMap[p215] = nil
end
function u38.getPlayerSkin(_, p216) --[[ Line: 939 ]]
    --[[
    Upvalues:
        [1] = u7
    --]]
    if p216.Character then
        return u7.Controllers.KitSkinController:getKitSkin(p216.Character)
    else
        return nil
    end
end
u7.CreateController(u38.new())
return nil