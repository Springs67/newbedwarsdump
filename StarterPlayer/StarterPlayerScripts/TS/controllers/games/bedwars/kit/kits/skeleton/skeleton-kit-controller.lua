local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u5 = v4.KnitClient
local u6 = v4.KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InQuad
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u11 = v10.Players
local u12 = v10.ReplicatedStorage
local u13 = v10.RunService
local u14 = v10.Workspace
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cframe", "cframe-util").CFrameUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "skeleton", "skeleton-kit-balance").SkeletonKitBalance
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "armor-slot").ArmorSlot
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").isUsingKit
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = v1.import(script, script.Parent, "skeleton-kit-revive-bar-gui").SkeletonKitReviveBarGUI
local u30 = v1.import(script, script.Parent, "skeleton-kit-revive-cooldown-bar-gui").SkeletonKitReviveCooldownBarGUI
local v31 = {}
local u32 = setmetatable({}, {
    ["__index"] = v31
})
u32.Leather = 0
v31[0] = "Leather"
u32.Iron = 1
v31[1] = "Iron"
u32.Diamond = 2
v31[2] = "Diamond"
u32.Emerald = 3
v31[3] = "Emerald"
local u33 = {
    [u32.Leather] = "rbxassetid://109332518176712",
    [u32.Iron] = "rbxassetid://114619942907625",
    [u32.Diamond] = "rbxassetid://74381834739852",
    [u32.Emerald] = "rbxassetid://73530637208617"
}
local u34 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 57 ]]
        return "SkeletonKitController"
    end,
    ["__index"] = u28
})
u34.__index = u34
function u34.new(...) --[[ Line: 63 ]]
    --[[
    Upvalues:
        [1] = u34
    --]]
    local v35 = u34
    local v36 = setmetatable({}, v35)
    return v36:constructor(...) or v36
end
function u34.constructor(p37) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u21
        [3] = u25
        [4] = u8
    --]]
    u28.constructor(p37, u21.SKELETON, {
        ["sounds"] = { u25.SKELETON_KIT_DISASSEMBLE, u25.SKELETON_KIT_REASSEMBLE, u25.SKELETON_KIT_SMOKE_LOOP }
    })
    p37.Name = "SkeletonKitController"
    p37.playerReviveStateData = {}
    p37.playerReviveMeterMaids = {}
    p37.localReviveCooldownMaid = u8.new()
    p37.poisonStatusMaid = u8.new()
end
function u34.KnitStart(p38) --[[ Line: 77 ]]
    --[[
    Upvalues:
        [1] = u28
    --]]
    u28.KnitStart(p38)
end
function u34.onKitLocalActivated(_, _) --[[ Line: 80 ]] end
function u34.onKitLocalDeactivated(_) --[[ Line: 82 ]] end
function u34.onKitReplicationActivated(u39, u40) --[[ Line: 84 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u11
        [4] = u14
        [5] = u5
        [6] = u8
        [7] = u3
        [8] = u25
        [9] = u27
        [10] = u13
        [11] = u19
        [12] = u9
        [13] = u29
        [14] = u2
        [15] = u17
        [16] = u30
        [17] = u16
        [18] = u7
        [19] = u12
        [20] = u6
        [21] = u18
        [22] = u20
        [23] = u26
        [24] = u21
        [25] = u23
    --]]
    u24.Client:Get("SkeletonKit_StartReviveState"):Connect(function(u41) --[[ Line: 85 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u22
            [3] = u11
            [4] = u14
            [5] = u5
            [6] = u8
            [7] = u3
            [8] = u25
            [9] = u27
            [10] = u13
            [11] = u19
            [12] = u9
            [13] = u29
            [14] = u2
            [15] = u40
        --]]
        local u42 = u41.player.Character
        if not u42 then
            return nil
        end
        local v43 = u39.playerReviveStateData[u41.player]
        if v43 then
            local v44 = v43.transparencyMaid
            if v44 ~= nil then
                v44:DoCleaning()
            end
            local v45 = v43.headFollowMaid
            if v45 ~= nil then
                v45:DoCleaning()
            end
        end
        local u46 = {}
        u39.playerReviveStateData[u41.player] = u46
        if u22.FreezeMovementDuration > 0 and (u41.player == u11.LocalPlayer and u14:GetServerTimeNow() < u41.stoppedMovementEndTime) then
            local u47 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["moveSpeedMultiplier"] = 0,
                ["blockSprint"] = true
            })
            task.delay(u41.stoppedMovementEndTime - u14:GetServerTimeNow(), function() --[[ Line: 115 ]]
                --[[
                Upvalues:
                    [1] = u47
                --]]
                u47.Destroy()
            end)
        end
        if u41.player == u11.LocalPlayer then
            if u22.DisableSprintDuringReviveState ~= true then
                local _ = u22.SpeedMultiplierDuringReviveState == 1
            end
            local u48 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = u22.DisableSprintDuringReviveState,
                ["moveSpeedMultiplier"] = u22.SpeedMultiplierDuringReviveState
            })
            local v49 = u8.new()
            v49:GiveTask(function() --[[ Line: 128 ]]
                --[[
                Upvalues:
                    [1] = u48
                --]]
                u48.Destroy()
            end)
            u46.disableSprintMaid = v49
        end
        u3:playSound(u25.SKELETON_KIT_DISASSEMBLE, {
            ["position"] = u42:GetPivot().Position,
            ["parent"] = u42
        })
        u42.Archivable = true
        local v50 = 0
        local v51 = {}
        for v52, v53 in u42:GetChildren() do
            local _ = v52 - 1
            if v53:IsA("BasePart") == true then
                v50 = v50 + 1
                v51[v50] = v53
            end
        end
        local v54 = u42:FindFirstChild("3DClothing")
        if v54 ~= nil then
            local v55 = 0
            v54 = {}
            for v56, v57 in v54:GetChildren() do
                local _ = v56 - 1
                if v57:IsA("BasePart") == true then
                    v55 = v55 + 1
                    v54[v55] = v57
                end
            end
        end
        local u58 = {}
        local u59 = {}
        local u60 = {}
        if v54 ~= nil then
            for v61, v62 in v54 do
                local _ = v61 - 1
                if v62.Name ~= "Head" then
                    local v63 = v62:Clone()
                    v63:SetAttribute("NoSuffocation", true)
                    table.insert(u59, v63)
                    v63:ClearAllChildren()
                    v63.Parent = u14
                    v63.Anchored = false
                    v63.CanCollide = true
                    v63.CollisionGroup = "DisablePlayerCollisions"
                end
            end
        end
        local function v74(p64) --[[ Line: 196 ]]
            --[[
            Upvalues:
                [1] = u58
                [2] = u60
                [3] = u14
                [4] = u59
                [5] = u27
            --]]
            if p64.Name == "HumanoidRootPart" then
                return nil
            end
            if p64.Name == "Head" then
                return nil
            end
            local v65 = p64:Clone()
            v65:SetAttribute("NoSuffocation", true)
            local v66 = u58
            table.insert(v66, v65)
            u60[v65] = p64
            v65:ClearAllChildren()
            v65.Parent = u14
            v65.Anchored = false
            v65.CanCollide = true
            v65.CollisionGroup = "DisablePlayerCollisions"
            local v67 = nil
            for v68, v69 in u59 do
                local _ = v68 - 1
                if v69.Name == p64.Name == true then
                    v67 = v69
                    break
                end
            end
            if v67 then
                local v70 = Instance.new("WeldConstraint")
                v70.Part0 = v67
                v70.Part1 = v65
                v70.Parent = v67
            end
            local v71 = u27.randomFloatMaxInclusive(-1, 1)
            local v72 = u27.randomFloatMaxInclusive(0, 1)
            local v73 = u27.randomFloatMaxInclusive
            v65:ApplyImpulse(Vector3.new(v71, v72, v73(-1, 1)).Unit * u27.randomFloatMaxInclusive(5, 8) * v65.Mass)
        end
        for v75, v76 in v51 do
            v74(v76, v75 - 1, v51)
        end
        u46.clonedBodyParts = u58
        u46.clonedClothingParts = u59
        u46.clonedBodyPartToOriginalMap = u60
        local v77 = u42:FindFirstChild("Head")
        local u78
        if u42 == nil then
            u78 = u42
        else
            u78 = u42:FindFirstChild("HumanoidRootPart")
        end
        if v77 and u78 then
            local u79 = v77:Clone()
            u79.Anchored = false
            u79.CanCollide = false
            u79.CanTouch = false
            u79.CanQuery = false
            u79:SetAttribute("NoSuffocation", true)
            u79.Name = "SkeletonKit_HeadClone"
            for v80, v81 in u79:GetChildren() do
                local _ = v80 - 1
                if not v81:IsA("SpecialMesh") then
                    v81:Destroy()
                end
            end
            u79.Parent = u14
            u46.head = u79
            local v82 = u42:FindFirstChild("3DClothing")
            if v82 ~= nil then
                v82 = v82:FindFirstChild("Head")
            end
            if v82 then
                local v83 = v82:Clone()
                v83.CanCollide = false
                v83.CanTouch = false
                v83.CanQuery = false
                v83.Parent = u79
                v83.Name = "SkeletonKit_HeadClothingClone"
                u46.headClothing = v83
                local v84 = Instance.new("WeldConstraint")
                v84.Part0 = v83
                v84.Part1 = u79
                v84.Parent = v83
            end
            local u85 = 0
            local u86 = false
            local u87 = nil
            u87 = u13.Heartbeat:Connect(function(p88) --[[ Line: 304 ]]
                --[[
                Upvalues:
                    [1] = u42
                    [2] = u78
                    [3] = u87
                    [4] = u79
                    [5] = u85
                    [6] = u19
                    [7] = u41
                    [8] = u11
                    [9] = u5
                    [10] = u86
                --]]
                local v89 = u42
                if v89 ~= nil then
                    v89 = v89.Parent
                end
                local v90 = v89 == nil
                if not v90 then
                    local v91 = u78
                    if v91 ~= nil then
                        v91 = v91.Parent
                    end
                    v90 = v91 == nil
                end
                if v90 then
                    u87:Disconnect()
                    return nil
                end
                u79:PivotTo(u78.CFrame)
                local v92 = u78:GetPivot().Position - Vector3.new(0, 1.6, 0)
                local v93 = u85 * 13
                local v94 = (math.sin(v93) + 1) / 2 * 2 + 0.5
                local v95 = v92 + Vector3.new(0, v94, 0)
                u19.setPosition(u79, v95)
                u85 = u85 + p88
                if u41.player == u11.LocalPlayer then
                    if u5.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 and not u86 then
                        u86 = true
                        for v96, v97 in u79:GetDescendants() do
                            local _ = v96 - 1
                            if v97:IsA("BasePart") then
                                v97.Transparency = 1
                            end
                        end
                        return
                    end
                    if u5.Controllers.CameraPerspectiveController:getCameraPerspective() ~= 0 and u86 then
                        u86 = false
                        for v98, v99 in u79:GetDescendants() do
                            local _ = v98 - 1
                            if v99:IsA("BasePart") then
                                v99.Transparency = 0
                            end
                        end
                    end
                end
            end)
            u46.headFollowMaid = u8.new()
            u46.headFollowMaid:GiveTask(function() --[[ Line: 362 ]]
                --[[
                Upvalues:
                    [1] = u87
                --]]
                u87:Disconnect()
            end)
        end
        u42.Archivable = false
        local u100 = {
            ["transparency"] = 1
        }
        u5.Controllers.CharacterTransparencyController:getTransparencyModifier(u42):addModifier(u100)
        if u42 ~= nil then
            u42:SetAttribute("DisableInvisibilityFootstepParticles", true)
        end
        local v101 = u8.new()
        v101:GiveTask(function() --[[ Line: 379 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u42
                [3] = u100
            --]]
            u5.Controllers.CharacterTransparencyController:getTransparencyModifier(u42):removeModifier(u100)
            local v102 = u42
            if v102 ~= nil then
                v102:SetAttribute("DisableInvisibilityFootstepParticles", false)
            end
        end)
        u46.transparencyMaid = v101
        if u41.player == u11.LocalPlayer then
            u5.Controllers.ViewmodelController:setHandItemVisibilityMode(false)
            v101:GiveTask(function() --[[ Line: 390 ]]
                --[[
                Upvalues:
                    [1] = u5
                --]]
                u5.Controllers.ViewmodelController:setHandItemVisibilityMode(true)
            end)
        end
        if u39.playerReviveMeterMaids[u41.player] ~= nil then
            local v103 = u39.playerReviveMeterMaids[u41.player]
            if v103 ~= nil then
                v103:DoCleaning()
            end
            u39.playerReviveMeterMaids[u41.player] = nil
        end
        if u41.player == u11.LocalPlayer then
            local v104 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u29, {
                ["IsOnActionBar"] = true,
                ["Target"] = u42:FindFirstChild("HumanoidRootPart"),
                ["StartServerTime"] = u41.startServerTime,
                ["EndServerTime"] = u41.reviveEndServerTime
            }))
            local v105 = u8.new()
            v105:GiveTask(v104)
            u39.playerReviveMeterMaids[u41.player] = v105
        else
            local v106 = u41.reviveEndServerTime - u14:GetServerTimeNow()
            local _ = u14:GetServerTimeNow() + v106
            local u107 = u9.mount(u9.createElement(u29, {
                ["IsOnActionBar"] = false,
                ["Target"] = u42:FindFirstChild("HumanoidRootPart"),
                ["StartServerTime"] = u41.startServerTime,
                ["EndServerTime"] = u41.reviveEndServerTime
            }), u11.LocalPlayer:WaitForChild("PlayerGui"), "SkeletonKitReviveBarGUI")
            local v108 = u8.new()
            v108:GiveTask(function() --[[ Line: 419 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u107
                --]]
                u9.unmount(u107)
            end)
            u39.playerReviveMeterMaids[u41.player] = v108
        end
        u40:GiveTask(function() --[[ Line: 439 ]]
            --[[
            Upvalues:
                [1] = u46
            --]]
            local v109 = u46.transparencyMaid
            if v109 ~= nil then
                v109:DoCleaning()
            end
            local v110 = u46.headFollowMaid
            if v110 ~= nil then
                v110:DoCleaning()
            end
            local v111 = u46.disableSprintMaid
            if v111 ~= nil then
                v111:DoCleaning()
            end
            local v112 = u46.clonedBodyParts
            if v112 ~= nil then
                for v113, v114 in v112 do
                    local _ = v113 - 1
                    v114:Destroy()
                end
            end
            local v115 = u46.clonedClothingParts
            if v115 ~= nil then
                for v116, v117 in v115 do
                    local _ = v116 - 1
                    v117:Destroy()
                end
            end
        end)
        task.delay(u22.ReviveStateDuration + 5, function() --[[ Line: 472 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u41
                [3] = u46
            --]]
            if u39.playerReviveStateData[u41.player] == u46 then
                local v118 = u46.transparencyMaid
                if v118 ~= nil then
                    v118:DoCleaning()
                end
                local v119 = u46.headFollowMaid
                if v119 ~= nil then
                    v119:DoCleaning()
                end
                local v120 = u46.disableSprintMaid
                if v120 ~= nil then
                    v120:DoCleaning()
                end
                local v121 = u46.clonedBodyParts
                if v121 ~= nil then
                    for v122, v123 in v121 do
                        local _ = v122 - 1
                        v123:Destroy()
                    end
                end
                local v124 = u46.clonedClothingParts
                if v124 ~= nil then
                    for v125, v126 in v124 do
                        local _ = v125 - 1
                        v126:Destroy()
                    end
                end
            end
        end)
    end)
    u24.Client:Get("SkeletonKit_EndReviveState"):Connect(function(u127) --[[ Line: 511 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
            [3] = u5
            [4] = u22
            [5] = u17
            [6] = u2
            [7] = u9
            [8] = u30
            [9] = u14
            [10] = u3
            [11] = u25
            [12] = u16
            [13] = u7
        --]]
        task.spawn(function() --[[ Line: 512 ]]
            --[[
            Upvalues:
                [1] = u39
                [2] = u127
                [3] = u11
                [4] = u5
                [5] = u22
                [6] = u17
                [7] = u2
                [8] = u9
                [9] = u30
                [10] = u14
                [11] = u3
                [12] = u25
                [13] = u16
                [14] = u7
            --]]
            if u39.playerReviveMeterMaids[u127.player] ~= nil then
                local v128 = u39.playerReviveMeterMaids[u127.player]
                if v128 ~= nil then
                    v128:DoCleaning()
                end
                u39.playerReviveMeterMaids[u127.player] = nil
            end
            local u129 = u39.playerReviveStateData[u127.player]
            if not u129 then
                return nil
            end
            if u127.successfulRevive then
                if u127.player == u11.LocalPlayer then
                    local u130 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
                        ["moveSpeedMultiplier"] = 0,
                        ["blockSprint"] = true
                    })
                    task.delay(u22.ReviveReassembleDuration + 0.1, function() --[[ Line: 542 ]]
                        --[[
                        Upvalues:
                            [1] = u130
                        --]]
                        u130.Destroy()
                    end)
                    local v131 = u17.AbilityCooldownModifierCheck:fire(u22.ReviveCooldown).cooldown
                    local v132 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u9.createElement(u30, {
                        ["StartServerTime"] = u127.serverStartTime,
                        ["EndServerTime"] = u127.serverStartTime + v131
                    }))
                    u39.localReviveCooldownMaid:GiveTask(v132)
                    local v133 = u127.serverStartTime + v131 - u14:GetServerTimeNow()
                    task.delay(v133, function() --[[ Line: 554 ]]
                        --[[
                        Upvalues:
                            [1] = u39
                        --]]
                        u39.localReviveCooldownMaid:DoCleaning()
                    end)
                end
                local v134 = u127.serverStartTime + u22.ReviveReassembleDuration - u14:GetServerTimeNow()
                local v135 = u129.headFollowMaid
                if v135 ~= nil then
                    v135:DoCleaning()
                end
                if u129.head then
                    u129.head.CanCollide = false
                    u129.head.CanTouch = false
                    u129.head.CanQuery = false
                    u129.head.Anchored = true
                end
                local v136 = u129.clonedBodyParts
                if v136 ~= nil then
                    for v137, v138 in v136 do
                        local _ = v137 - 1
                        v138.CanCollide = false
                        v138.CanTouch = false
                        v138.CanQuery = false
                        v138.Anchored = true
                    end
                end
                if v134 < 1 then
                    v134 = 1
                    local _ = u14:GetServerTimeNow() + v134
                end
                local v139 = u129.headFollowMaid
                if v139 ~= nil then
                    v139:DoCleaning()
                end
                local v140 = u127.player.Character
                if v140 then
                    u3:playSound(u25.SKELETON_KIT_REASSEMBLE, {
                        ["position"] = v140:GetPivot().Position,
                        ["parent"] = v140
                    })
                end
                local u141 = u127.player.Character
                if u141 ~= nil then
                    u141 = u141:FindFirstChild("Head")
                end
                local u142 = {}
                if u129.head then
                    u142[u129.head] = u129.head:GetPivot()
                end
                local v143 = u129.clonedBodyParts
                if v143 ~= nil then
                    for v144, v145 in v143 do
                        local _ = v144 - 1
                        u142[v145] = v145:GetPivot()
                    end
                end
                u16(v134, u7, function(p146) --[[ Line: 626 ]]
                    --[[
                    Upvalues:
                        [1] = u129
                        [2] = u141
                        [3] = u142
                    --]]
                    if u129.head and u141 then
                        u129.head:PivotTo(u142[u129.head]:Lerp(u141:GetPivot(), p146))
                    end
                    local v147 = u129.clonedBodyParts
                    if v147 ~= nil then
                        for v148, v149 in v147 do
                            local _ = v148 - 1
                            local v150 = u129.clonedBodyPartToOriginalMap
                            if v150 ~= nil then
                                v150 = v150[v149]
                            end
                            if v150 then
                                v149:PivotTo(u142[v149]:Lerp(v150:GetPivot(), p146))
                            end
                        end
                    end
                end, 0, 1):Play()
                task.wait(v134 + 0.1)
                local v151 = u129.transparencyMaid
                if v151 ~= nil then
                    v151:DoCleaning()
                end
                local v152 = u129.disableSprintMaid
                if v152 ~= nil then
                    v152:DoCleaning()
                end
                local v153 = u129.head
                if v153 ~= nil then
                    v153:Destroy()
                end
                local v154 = u129.clonedBodyParts
                if v154 ~= nil then
                    for v155, v156 in v154 do
                        local _ = v155 - 1
                        v156:Destroy()
                    end
                end
                local v157 = u129.clonedClothingParts
                if v157 ~= nil then
                    for v158, v159 in v157 do
                        local _ = v158 - 1
                        v159:Destroy()
                    end
                end
            else
                local v160 = u129.transparencyMaid
                if v160 ~= nil then
                    v160:DoCleaning()
                end
                local v161 = u129.headFollowMaid
                if v161 ~= nil then
                    v161:DoCleaning()
                end
                local v162 = u129.disableSprintMaid
                if v162 ~= nil then
                    v162:DoCleaning()
                end
                local v163 = u129.clonedBodyParts
                if v163 ~= nil then
                    for v164, v165 in v163 do
                        local _ = v164 - 1
                        v165:Destroy()
                    end
                end
                local v166 = u129.clonedClothingParts
                if v166 ~= nil then
                    for v167, v168 in v166 do
                        local _ = v167 - 1
                        v168:Destroy()
                    end
                end
                local v169 = u129.head
                if v169 ~= nil then
                    v169:Destroy()
                end
            end
            u39.playerReviveStateData[u127.player] = nil
        end)
    end)
    u24.Client:Get("SkeletonKit_SpawnPoisonCloud"):Connect(function(p170) --[[ Line: 730 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u12
        --]]
        local v171 = p170.endServerTime - u14:GetServerTimeNow()
        if v171 <= 0 then
            return nil
        end
        local u172 = u12.Assets.Effects.SkeletonKit_Smoke:Clone()
        u172:PivotTo(CFrame.new(p170.position))
        u172.Parent = u14
        u172.Smoke:Emit(10)
        task.delay(v171, function() --[[ Line: 739 ]]
            --[[
            Upvalues:
                [1] = u172
            --]]
            u172:Destroy()
        end)
    end)
    u24.Client:Get("SkeletonKit_PlayerEnteredPoisonCloud"):Connect(function(p173) --[[ Line: 744 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u39
            [3] = u22
            [4] = u6
        --]]
        if p173.player ~= u11.LocalPlayer then
            return nil
        end
        u39.poisonStatusMaid:DoCleaning()
        if u22.PoisonDisablesJump then
            u39.poisonStatusMaid:GiveTask(u6.Controllers.JumpHeightController:getJumpModifier():addModifier({
                ["jumpHeightMultiplier"] = 0,
                ["airJumps"] = 0
            }))
        end
        if u22.PoisonDisablesSprint or u22.PoisonMoveSpeedMultiplier ~= 1 then
            u39.poisonStatusMaid:GiveTask(u6.Controllers.SprintController:getMovementStatusModifier():addModifier({
                ["blockSprint"] = u22.PoisonDisablesSprint,
                ["moveSpeedMultiplier"] = u22.PoisonMoveSpeedMultiplier
            }))
        end
    end)
    u24.Client:Get("SkeletonKit_PlayerExitedPoisonCloud"):Connect(function(p174) --[[ Line: 764 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u39
        --]]
        if p174.player ~= u11.LocalPlayer then
            return nil
        end
        u39.poisonStatusMaid:DoCleaning()
    end)
    u17.CanUseLocalAbility:connect(function(p175) --[[ Line: 771 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u18
        --]]
        if p175.userCharacter ~= u11.LocalPlayer.Character then
            return nil
        end
        if p175.ability ~= u18.SKELETON_ABILITY then
            return nil
        end
        if p175.userCharacter:GetAttribute("SkeletonKit_IsInReviveState") == true then
            p175:setCancelled(true)
        end
    end)
    u17.PlaceBlock:connect(function(p176) --[[ Line: 784 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
        --]]
        if not u39:isPlayerInReviveState(u11.LocalPlayer) then
            return nil
        end
        p176:setCancelled(true)
    end)
    u17.EntityEquipArmorVisuals:connect(function(p177) --[[ Line: 791 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u26
            [3] = u21
        --]]
        local v178 = p177.entity:getInstance()
        if not v178 then
            return nil
        end
        local v179 = u20:getPlayerFromEntityInstance(v178)
        if not v179 then
            return nil
        end
        if not u26(v179, u21.SKELETON) then
            return nil
        end
        if v179:GetAttribute("UsingKitSkinModel") ~= true then
            return nil
        end
        p177.hideArmor = true
    end)
    u24.Client:Get("EntityDeathEvent"):Connect(function(p180) --[[ Line: 811 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u39
        --]]
        if not u11:GetPlayerFromCharacter(p180.entityInstance) then
            return nil
        end
        u39.localReviveCooldownMaid:DoCleaning()
    end)
    u17.EntityChangeArmorSlotItem:connect(function(p181) --[[ Line: 818 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u20
            [3] = u26
            [4] = u21
            [5] = u39
        --]]
        if p181.item == nil then
            return nil
        end
        if p181.armorSlot ~= u23.CHESTPLATE then
            return nil
        end
        local v182 = p181.entity:getInstance()
        if not v182 then
            return nil
        end
        local v183 = u20:getPlayerFromEntityInstance(v182)
        if not v183 then
            return nil
        end
        if not u26(v183, u21.SKELETON) then
            return nil
        end
        local v184 = u39:getArmorTypeFromItemName(p181.item.Name)
        if v184 == nil then
            return nil
        end
        if v183:GetAttribute("UsingKitSkinModel") ~= true then
            return nil
        end
        u39:setCharacterArmorTexture(v182, v184)
    end)
    u40:GiveTask(u17.BeginProjectileTargeting:connect(function(p185) --[[ Line: 847 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
        --]]
        u39:cancelEventIfPlayerIsInReviveState(u11.LocalPlayer, p185)
    end))
    u40:GiveTask(u17.ProjectileTargetingEnded:connect(function(p186) --[[ Line: 855 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
        --]]
        u39:cancelEventIfPlayerIsInReviveState(u11.LocalPlayer, p186)
    end))
    u40:GiveTask(u17.ProjectileLaunched:connect(function(p187) --[[ Line: 858 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u39
        --]]
        if not p187.shooter then
            return nil
        end
        local v188 = u20:getPlayerFromEntityInstance(p187.shooter)
        if not v188 then
            return nil
        end
        u39:cancelEventIfPlayerIsInReviveState(v188, p187)
    end))
    u40:GiveTask(u17.StartLaunchProjectile:connect(function(p189) --[[ Line: 868 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
        --]]
        u39:cancelEventIfPlayerIsInReviveState(u11.LocalPlayer, p189)
    end))
    u40:GiveTask(u17.StartConsuming:connect(function(p190) --[[ Line: 871 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u11
        --]]
        u39:cancelEventIfPlayerIsInReviveState(u11.LocalPlayer, p190)
    end))
end
function u34.onKitReplicationDeactivated(_) --[[ Line: 875 ]] end
function u34.onInnateAbilityEnabled(_, _, _) --[[ Line: 877 ]] end
function u34.onAbilityUsed(_, _, _) --[[ Line: 879 ]] end
function u34.isPlayerInReviveState(p191, p192) --[[ Line: 881 ]]
    return p191.playerReviveStateData[p192] ~= nil
end
function u34.setCharacterArmorTexture(_, p193, p194) --[[ Line: 886 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v195 = p193:FindFirstChild("3DClothing")
    if v195 ~= nil then
        v195 = v195:FindFirstChild("UpperTorso")
    end
    local v196 = u33[p194]
    local v197 = v195 and v196
    if v197 ~= "" and v197 then
        v195.TextureID = v196
    end
end
function u34.getArmorTypeFromItemName(_, p198) --[[ Line: 899 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u32
    --]]
    local v199 = string.lower(p198)
    if u15.includes(v199, "leather") then
        return u32.Leather
    end
    if u15.includes(v199, "iron") then
        return u32.Iron
    end
    if u15.includes(v199, "diamond") then
        return u32.Diamond
    end
    if u15.includes(v199, "emerald") then
        return u32.Emerald
    end
end
function u34.cancelEventIfPlayerIsInReviveState(p200, p201, p202) --[[ Line: 914 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u26
        [3] = u21
    --]]
    if not p201 then
        return nil
    end
    if u11.LocalPlayer ~= p201 then
        return nil
    end
    if not u26(p201, u21.SKELETON) then
        return nil
    end
    if p200:isPlayerInReviveState(p201) then
        p202:setCancelled(true)
    end
end
u5.CreateController(u34.new())
return nil