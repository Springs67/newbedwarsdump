local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.ExpireList
local u7 = v3.MobileTouchType
local u8 = v3.SoundManager
local u9 = v3.WatchCollectionTag
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v11 = v10.KnitClient
local u12 = v10.KnitClient
local u13 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v16 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u17 = v16.Players
local u18 = v16.ReplicatedStorage
local u19 = v16.RunService
local u20 = v16.StarterPlayer
local u21 = v16.TweenService
local u22 = v16.Workspace
local u23 = u1.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u24 = u1.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u25 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u26 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u27 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u28 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil
local u30 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "squad-launcher", "squad-launcher-util").SquadLauncherUtil
local u31 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v32 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u33 = u1.import(script, script.Parent, "squad-launcher-ui").SquadLauncherUI
local u34 = Color3.fromRGB(4, 175, 236)
local u35 = Color3.fromRGB(219, 97, 99)
local u36 = { v32.SQUAD_LAUNCH_1, v32.SQUAD_LAUNCH_2, v32.SQUAD_LAUNCH_3 }
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 46 ]]
        return "SquadLauncherController"
    end,
    ["__index"] = u24
})
u37.__index = u37
function u37.new(...) --[[ Line: 52 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u22
        [3] = u13
        [4] = u6
        [5] = u30
    --]]
    u24.constructor(p40)
    p40.Name = "SquadLauncherController"
    p40.camera = u22.CurrentCamera
    p40.targetMarked = false
    p40.aimCameraMaid = u13.new()
    p40.preLaunchMaid = u13.new()
    p40.fakeCharacterMap = {}
    p40.fakeCharacterMaidMap = {}
    p40.fakeCharacterInvisibilityMaidMap = {}
    p40.isLaunchingMap = {}
    p40.launchInitiatedMap = {}
    p40.launchInitiatedTimeMap = {}
    p40.launcherPlayersMap = {}
    p40.launcherPromptMap = {}
    p40.launcherOpenHeadHoleMap = {}
    p40.headHoleMaidMap = {}
    p40.launcherCooldownList = u6.new(u30.LAUNCHER_COOLDOWN_TIME)
end
function u37.KnitStart(u41) --[[ Line: 75 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u9
        [3] = u12
        [4] = u30
        [5] = u5
        [6] = u31
        [7] = u23
        [8] = u1
        [9] = u27
        [10] = u17
        [11] = u22
    --]]
    u24.KnitStart(u41)
    u9("squad-launcher", function(u42) --[[ Line: 77 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u30
            [3] = u5
            [4] = u41
            [5] = u31
        --]]
        local u43 = u12.Controllers.ProximityPromptController:createProximityPrompt({
            ["ActionText"] = "Initialize Launch Sequence",
            ["ObjectText"] = "Squad Launcher",
            ["RequiresLineOfSight"] = false,
            ["Parent"] = u42,
            ["MaxActivationDistance"] = u30.PROXIMITY_PROMPT_DISTANCE,
            ["HoldDuration"] = u30.PROXIMITY_PROMPT_HOLD_DURATION,
            ["ClickablePrompt"] = u5.isMobileControls()
        })
        u41.launcherPromptMap[u42] = u43
        local u44 = nil
        u43.PromptButtonHoldBegan:Connect(function(p45) --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u42
                [3] = u43
                [4] = u44
            --]]
            local v46 = {
                ["player"] = p45,
                ["squadLauncher"] = u42
            }
            if not u31.Client:Get("RequestSquadLauncherProximityHold"):CallServer(v46) then
                u43:InputHoldEnd()
            end
            u44 = u31.Client:Get("RejectSquadLauncherProximityHold"):Connect(function() --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u43
                --]]
                u43:InputHoldEnd()
            end)
        end)
        u43.Triggered:Connect(function(u47) --[[ Line: 103 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u44
                [3] = u31
                [4] = u42
            --]]
            if u41.launchInitiatedMap[u47] then
                return nil
            end
            u41.launchInitiatedMap[u47] = true
            u41.preLaunchMaid:GiveTask(function() --[[ Line: 113 ]]
                --[[
                Upvalues:
                    [1] = u41
                    [2] = u47
                --]]
                u41.launchInitiatedMap[u47] = false
            end)
            u44:Disconnect()
            local v48 = {
                ["squadLauncher"] = u42
            }
            u31.Client:Get("RequestEnterSquadLauncher"):CallServer(v48)
        end)
    end)
    u23.SharedStatefulEntityDeath:connect(function(p49) --[[ Line: 124 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u27
            [3] = u41
            [4] = u17
        --]]
        if not u1.instanceof(p49.entity, u27) then
            return nil
        end
        local v50 = p49.entity:getPlayer()
        if v50 == nil then
            return nil
        end
        u41.isLaunchingMap[v50] = false
        if v50 == u17.LocalPlayer then
            u41.aimCameraMaid:DoCleaning()
            u41.preLaunchMaid:DoCleaning()
        end
    end)
    u31.Client:Get("PlayerLaunched"):Connect(function(p51) --[[ Line: 138 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u30
            [3] = u17
        --]]
        u41:launchEffect(p51.player, p51.playerNumber, p51.squadLauncher, p51.target)
        u41.launcherOpenHeadHoleMap[p51.squadLauncher] = 0
        local v52 = u41.launcherPlayersMap[p51.squadLauncher]
        if v52 ~= nil then
            local v53 = 0
            v52 = {}
            for v54, v55 in v52 do
                local _ = v54 - 1
                if v55 ~= p51.player == true then
                    v53 = v53 + 1
                    v52[v53] = v55
                end
            end
        end
        if v52 then
            u41.launcherPlayersMap[p51.squadLauncher] = v52
        end
        if not u41.launcherCooldownList:has(p51.squadLauncher) then
            u41.launcherCooldownList:add(p51.squadLauncher)
            local u56 = u41.launcherPromptMap[p51.squadLauncher]
            if u56 then
                u56.ActionText = "Launcher on Cooldown!"
                u56.Enabled = true
                task.delay(u30.LAUNCHER_COOLDOWN_TIME, function() --[[ Line: 177 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                    --]]
                    u56.ActionText = "Initialize Launch Sequence"
                end)
            end
        end
        if p51.player == u17.LocalPlayer then
            u41.preLaunchMaid:DoCleaning()
            u41.isLaunchingMap[p51.player] = false
        end
    end)
    u31.Client:Get("SquadLauncherEntered"):Connect(function(u57) --[[ Line: 189 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u30
            [3] = u17
            [4] = u22
        --]]
        local v58 = u41.launcherPlayersMap[u57.squadLauncher] or {}
        local v59 = u57.player
        table.insert(v58, v59)
        u41.launcherPlayersMap[u57.squadLauncher] = v58
        local v60 = u41.launcherPromptMap[u57.squadLauncher]
        if v60 then
            local v61 = #v58
            local v62 = tostring(v61)
            local v63 = u30.MAX_LAUNCH_SQUAD_SIZE
            v60.ActionText = "Join Launch!" .. " " .. v62 .. "/" .. tostring(v63)
        end
        local v64 = u41.launcherPlayersMap[u57.squadLauncher]
        local v65 = v64 ~= nil and #v64 or v64
        if (((v65 == 0 or (v65 ~= v65 or not v65)) and 0 or v65) >= u30.MAX_LAUNCH_SQUAD_SIZE or u57.player == u17.LocalPlayer) and v60 then
            v60.Enabled = false
        end
        if u57.isOperator and not u41.indicator then
            u41.launchInitiatedTimeMap[u57.squadLauncher] = u22:GetServerTimeNow()
            if u57.player == u17.LocalPlayer then
                task.delay(0.8, function() --[[ Line: 233 ]]
                    --[[
                    Upvalues:
                        [1] = u41
                        [2] = u57
                    --]]
                    u41:enableLaunchControls(u57.player, u57.squadLauncher)
                end)
            end
        end
        if u57.player == u17.LocalPlayer then
            local v66 = u41.launchInitiatedTimeMap[u57.squadLauncher]
            if v66 == 0 or (v66 ~= v66 or not v66) then
                return nil
            end
            u41:mountLauncherUI(u57.squadLauncher, v66, v66 + u30.LAUNCH_SEQUENCE_TIME_LIMIT)
        end
        u41:enterLauncherEffect(u57.player, u57.squadLauncher)
    end)
    u31.Client:Get("SquadLauncherExited"):Connect(function(p67) --[[ Line: 249 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u30
            [3] = u17
        --]]
        u41.isLaunchingMap[p67.player] = false
        u41:exitLauncherEffect(p67.player, p67.squadLauncher)
        local v68 = u41.headHoleMaidMap[p67.player]
        if v68 ~= nil then
            v68:DoCleaning()
        end
        local v69 = u41.launcherPromptMap[p67.squadLauncher]
        if v69 then
            v69.Enabled = true
        end
        local v70 = u41.launcherPlayersMap[p67.squadLauncher]
        if v70 ~= nil then
            local v71 = 0
            v70 = {}
            for v72, v73 in v70 do
                local _ = v72 - 1
                if v73 ~= p67.player == true then
                    v71 = v71 + 1
                    v70[v71] = v73
                end
            end
        end
        if v70 then
            u41.launcherPlayersMap[p67.squadLauncher] = v70
            if v69 then
                if #v70 == 0 then
                    v69.ActionText = "Initialize Launch Sequence"
                else
                    local v74 = #v70
                    local v75 = tostring(v74)
                    local v76 = u30.MAX_LAUNCH_SQUAD_SIZE
                    v69.ActionText = "Join Launch!" .. " " .. v75 .. "/" .. tostring(v76)
                end
            end
        end
        if p67.newOperator == u17.LocalPlayer then
            u41:enableLaunchControls(p67.newOperator, p67.squadLauncher)
        end
    end)
end
function u37.enableLaunchControls(u77, u78, u79) --[[ Line: 304 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u22
    --]]
    u77:activateIndicator()
    u77:setupAimCamera(u79:GetPivot().Position, u78)
    task.delay(u30.LAUNCH_SEQUENCE_TIME_LIMIT, function() --[[ Line: 310 ]]
        --[[
        Upvalues:
            [1] = u77
            [2] = u79
            [3] = u78
            [4] = u30
            [5] = u22
        --]]
        if not u77.indicator then
            return nil
        end
        local v80 = u77.launchInitiatedTimeMap[u79]
        if v80 == 0 or (v80 ~= v80 or not v80) then
            u77:exitLauncher(u78, u79)
            return nil
        end
        if v80 + u30.LAUNCH_SEQUENCE_TIME_LIMIT <= u22:GetServerTimeNow() then
            u77:launch(u78)
        end
    end)
end
function u37.enterLauncherEffect(u81, u82, u83) --[[ Line: 327 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u13
        [3] = u22
        [4] = u17
        [5] = u20
        [6] = u30
        [7] = u21
        [8] = u4
        [9] = u26
        [10] = u25
        [11] = u14
    --]]
    local u84 = u82.Character
    local u85 = u28:getEntity(u82)
    if u85 ~= nil then
        u85:hideNametag()
    end
    local v86 = u84.PrimaryPart
    if v86 ~= nil then
        v86 = v86.Position
    end
    if not (u84 and v86) then
        return nil
    end
    u84.Archivable = true
    local v87 = u81.fakeCharacterMaidMap[u82]
    if v87 == nil then
        v87 = u13.new()
    else
        v87:DoCleaning()
    end
    local u88 = u84:Clone()
    u88:SetAttribute("Transparency", 0)
    u88.Parent = u22
    if not u88.PrimaryPart then
        return nil
    end
    u81.fakeCharacterMap[u82] = u88
    if u82 == u17.LocalPlayer and u22.CurrentCamera then
        u22.CurrentCamera.CameraSubject = u83:FindFirstChild("CameraSubject")
        u17.LocalPlayer.CameraMaxZoomDistance = 40
        u17.LocalPlayer.CameraMinZoomDistance = 15
    end
    v87:GiveTask(function() --[[ Line: 367 ]]
        --[[
        Upvalues:
            [1] = u81
            [2] = u82
            [3] = u22
            [4] = u17
            [5] = u84
            [6] = u20
            [7] = u85
        --]]
        local v89 = u81.fakeCharacterMap[u82]
        if v89 ~= nil then
            v89:Destroy()
        end
        u81.fakeCharacterMap[u82] = nil
        if u22.CurrentCamera and u82 == u17.LocalPlayer then
            u22.CurrentCamera.CameraSubject = u84.Humanoid
            u17.LocalPlayer.CameraMaxZoomDistance = u20.CameraMaxZoomDistance
            u17.LocalPlayer.CameraMinZoomDistance = u20.CameraMinZoomDistance
        end
        u84:SetAttribute("Transparency", 0)
        local v90 = u85
        if v90 ~= nil then
            v90:showNametag()
        end
    end)
    u81.fakeCharacterMaidMap[u82] = v87
    u84:SetAttribute("Transparency", 1)
    local v91 = u81.launcherOpenHeadHoleMap[u83]
    local u92 = ((v91 == 0 or (v91 ~= v91 or not v91)) and 0 or v91) % u30.MAX_LAUNCH_SQUAD_SIZE
    u81.launcherOpenHeadHoleMap[u83] = u92 + 1
    local v93 = u81.headHoleMaidMap[u82] or u13.new()
    v93:GiveTask(function() --[[ Line: 412 ]]
        --[[
        Upvalues:
            [1] = u81
            [2] = u83
            [3] = u92
        --]]
        u81.launcherOpenHeadHoleMap[u83] = u92
    end)
    u81.headHoleMaidMap[u82] = v93
    local v94 = nil
    for v95, v96 in u83:GetDescendants() do
        local _ = v95 - 1
        if v96.Name == "Head" .. tostring(u92) == true then
            v94 = v96
            break
        end
    end
    local v97 = v94:GetPivot().LookVector
    local v98 = v94:GetPivot().Position
    local v99 = v94:GetPivot()
    local v100 = u81:getHighPoint(v86, v98, 12)
    local v101 = TweenInfo.new(0.3)
    local v102 = u21:Create(u88.PrimaryPart, v101, {
        ["CFrame"] = CFrame.new(v100, v97)
    })
    local u103 = u4:playAnimation(u88.Humanoid.Animator, u26:getAssetId(u25.ROBLOX_NINJA_JUMP))
    v102:Play()
    local u104 = u21:Create(u88.PrimaryPart, TweenInfo.new(0.2), {
        ["CFrame"] = v99
    })
    v102.Completed:Connect(function() --[[ Line: 448 ]]
        --[[
        Upvalues:
            [1] = u104
        --]]
        u104:Play()
    end)
    u104.Completed:Connect(function() --[[ Line: 451 ]]
        --[[
        Upvalues:
            [1] = u103
            [2] = u83
            [3] = u88
            [4] = u14
            [5] = u81
            [6] = u82
            [7] = u13
        --]]
        local v105 = u103
        if v105 ~= nil then
            v105:Stop()
        end
        local v106 = u103
        if v106 ~= nil then
            v106:Destroy()
        end
        local v107 = u83:FindFirstChild("Top")
        local v108
        if v107 == nil then
            v108 = v107
        else
            v108 = v107.PrimaryPart
        end
        if v108 then
            local v109 = {}
            if v107 ~= nil then
                v107 = v107.PrimaryPart
            end
            v109.Part0 = v107
            v109.Part1 = u88.PrimaryPart
            v109.Parent = u88.PrimaryPart
            u14("WeldConstraint", v109)
        end
        local u110 = u88:FindFirstChild("Head")
        local u111 = u88:FindFirstChild("3DClothing")
        if u111 ~= nil then
            u111 = u111:FindFirstChild("Head")
        end
        local v112 = u88:GetDescendants()
        local function v117(p113) --[[ Line: 485 ]]
            --[[
            Upvalues:
                [1] = u110
                [2] = u111
            --]]
            if u110 then
                if p113:IsDescendantOf(u110) or p113 == u110 then
                    return nil
                end
                local v114 = nil
                for v115, v116 in p113:GetDescendants() do
                    local _ = v115 - 1
                    if v116:IsA("Weld") == true then
                        v114 = v116
                        break
                    end
                end
                if v114 ~= nil then
                    v114 = v114.Part1
                end
                if v114 == u110 then
                    return nil
                end
            end
            if u111 and (p113:IsDescendantOf(u111) or p113 == u111) then
                return nil
            elseif p113:IsA("BasePart") then
                p113.Transparency = 1
            elseif p113:IsA("Decal") then
                p113.Transparency = 1
            end
        end
        for v118, v119 in v112 do
            v117(v119, v118 - 1, v112)
        end
        local v120 = u81.fakeCharacterInvisibilityMaidMap[u82] or u13.new()
        v120:GiveTask(function() --[[ Line: 534 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u110
                [3] = u111
            --]]
            local v121 = u88:GetDescendants()
            local function v123(p122) --[[ Line: 536 ]]
                --[[
                Upvalues:
                    [1] = u110
                    [2] = u111
                --]]
                if u110 and (p122:IsDescendantOf(u110) or p122 == u110) then
                    return nil
                elseif u111 and (p122:IsDescendantOf(u111) or p122 == u111) then
                    return nil
                elseif p122:IsA("BasePart") then
                    p122.Transparency = 0
                elseif p122:IsA("Decal") then
                    p122.Transparency = 0
                end
            end
            for v124, v125 in v121 do
                v123(v125, v124 - 1, v121)
            end
        end)
        u81.fakeCharacterInvisibilityMaidMap[u82] = v120
    end)
end
function u37.launchEffect(u126, u127, u128, p129, p130) --[[ Line: 562 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
        [3] = u21
        [4] = u30
        [5] = u4
        [6] = u26
        [7] = u25
    --]]
    local u131 = u127.Character
    local u132 = u126.fakeCharacterMaidMap[u127]
    local v133 = p129:GetPivot().Position.X
    local v134 = p129:GetPivot().Position.Y + 6
    local v135 = p129:GetPivot().Position.Z
    local v136 = Vector3.new(v133, v134, v135)
    if not (u131 and v136) then
        return nil
    end
    u131.Archivable = true
    local u137 = u126.fakeCharacterMap[u127]
    local v138
    if u137 == nil then
        v138 = u137
    else
        v138 = u137.PrimaryPart
    end
    if not v138 then
        return nil
    end
    if u127 == u17.LocalPlayer then
        u22.CurrentCamera.CameraSubject = u137.Humanoid
        if u132 ~= nil then
            u132:GiveTask(function() --[[ Line: 586 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u131
                --]]
                u22.CurrentCamera.CameraSubject = u131.Humanoid
            end)
        end
    end
    local v139 = p129:FindFirstChild("Top")
    local v140
    if v139 == nil then
        v140 = v139
    else
        v140 = v139.PrimaryPart
    end
    if not v140 then
        return nil
    end
    local v141 = u21
    local v142 = v139.PrimaryPart
    local v143 = TweenInfo.new(0.5)
    local v144 = {}
    local v145 = CFrame.new
    local v146 = v139.PrimaryPart.CFrame.Position
    local v147 = p130.X
    local v148 = p130.Y + 50
    local v149 = p130.Z
    v144.CFrame = v145(v146, (Vector3.new(v147, v148, v149)))
    local v150 = v141:Create(v142, v143, v144)
    v150:Play()
    local u151 = nil
    local u152 = nil
    local u153 = u137.Humanoid.Animator
    local v154 = u126:getHighPoint(v136, p130, u30.LAUNCH_HEIGHT)
    local v155 = TweenInfo.new(0.5, Enum.EasingStyle.Sine)
    local u156 = u21:Create(u137.PrimaryPart, v155, {
        ["CFrame"] = CFrame.new(v154, p130)
    })
    v150.Completed:Connect(function() --[[ Line: 612 ]]
        --[[
        Upvalues:
            [1] = u137
            [2] = u151
            [3] = u4
            [4] = u153
            [5] = u26
            [6] = u25
            [7] = u126
            [8] = u128
            [9] = u127
            [10] = u156
        --]]
        local v157 = u137
        if v157 ~= nil then
            v157 = v157.PrimaryPart
        end
        if not v157 then
            return nil
        end
        task.wait(0.5)
        local v158 = u137.PrimaryPart:FindFirstChildWhichIsA("WeldConstraint")
        if v158 ~= nil then
            v158:Destroy()
        end
        u151 = u4:playAnimation(u153, u26:getAssetId(u25.ROBLOX_NINJA_JUMP))
        u126:playEffects(u137.PrimaryPart.CFrame, u128)
        local v159 = u126.fakeCharacterInvisibilityMaidMap[u127]
        if v159 ~= nil then
            v159:DoCleaning()
        end
        u156:Play()
    end)
    local u160 = nil
    u156.Completed:Connect(function() --[[ Line: 639 ]]
        --[[
        Upvalues:
            [1] = u151
            [2] = u152
            [3] = u4
            [4] = u153
            [5] = u26
            [6] = u25
            [7] = u137
            [8] = u21
            [9] = u131
            [10] = u160
            [11] = u132
        --]]
        local v161 = u151
        if v161 ~= nil then
            v161:Destroy()
        end
        u152 = u4:playAnimation(u153, u26:getAssetId(u25.ROBLOX_DEFAULT_FREEFALL))
        local v162 = u137
        if v162 ~= nil then
            v162 = v162.PrimaryPart
        end
        if not v162 then
            return nil
        end
        local v163 = u21
        local v164 = u137.PrimaryPart
        local v165 = TweenInfo.new(0.3)
        local v166 = {}
        local v167 = u131.PrimaryPart
        if v167 ~= nil then
            v167 = v167.CFrame
        end
        v166.CFrame = v167
        u160 = v163:Create(v164, v165, v166)
        u160:Play()
        u160.Completed:Connect(function() --[[ Line: 664 ]]
            --[[
            Upvalues:
                [1] = u132
                [2] = u152
            --]]
            local v168 = u132
            if v168 ~= nil then
                v168:DoCleaning()
            end
            local v169 = u152
            if v169 ~= nil then
                v169:Destroy()
            end
        end)
    end)
end
function u37.exitLauncherEffect(u170, u171, p172) --[[ Line: 676 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u22
        [3] = u21
        [4] = u4
        [5] = u26
        [6] = u25
    --]]
    local v173 = u170.fakeCharacterMap[u171]
    local v174
    if v173 == nil then
        v174 = v173
    else
        v174 = v173.PrimaryPart
    end
    if not v174 then
        return nil
    end
    if u171 == u17.LocalPlayer then
        u22.CurrentCamera.CameraSubject = v173.Humanoid
    end
    local v175 = u171.Character
    local v176 = p172:GetPivot().Position.X
    local v177 = p172:GetPivot().Position.Y + 6
    local v178 = p172:GetPivot().Position.Z
    local v179 = Vector3.new(v176, v177, v178)
    local v180
    if v175 == nil then
        v180 = v175
    else
        v180 = v175.PrimaryPart
        if v180 ~= nil then
            v180 = v180.Position
        end
    end
    if not (v175 and (v179 and v180)) then
        local v181 = u170.fakeCharacterMaidMap[u171]
        if v181 ~= nil then
            v181:DoCleaning()
        end
        local v182 = u170.fakeCharacterInvisibilityMaidMap[u171]
        if v182 ~= nil then
            v182:DoCleaning()
        end
        return nil
    end
    v175.Archivable = true
    local v183 = u170:getHighPoint(v179, v180, 10)
    local v184 = u170.fakeCharacterInvisibilityMaidMap[u171]
    if v184 ~= nil then
        v184:DoCleaning()
    end
    local v185 = TweenInfo.new(0.3)
    local v186 = u21:Create(v173.PrimaryPart, v185, {
        ["CFrame"] = CFrame.new(v183, p172.Position)
    })
    local u187 = u4:playAnimation(v173.Humanoid.Animator, u26:getAssetId(u25.ROBLOX_NINJA_JUMP))
    v186:Play()
    local v188 = u21
    local v189 = v173.PrimaryPart
    local v190 = TweenInfo.new(0.2)
    local v191 = {}
    local v192 = v175.PrimaryPart
    if v192 ~= nil then
        v192 = v192.CFrame
    end
    v191.CFrame = v192
    local u193 = v188:Create(v189, v190, v191)
    v186.Completed:Connect(function() --[[ Line: 743 ]]
        --[[
        Upvalues:
            [1] = u193
        --]]
        u193:Play()
    end)
    u193.Completed:Connect(function() --[[ Line: 746 ]]
        --[[
        Upvalues:
            [1] = u170
            [2] = u171
            [3] = u187
        --]]
        local v194 = u170.fakeCharacterMaidMap[u171]
        if v194 ~= nil then
            v194:DoCleaning()
        end
        local v195 = u187
        if v195 ~= nil then
            v195:Destroy()
        end
    end)
end
function u37.getHighPoint(_, p196, p197, p198) --[[ Line: 760 ]]
    local v199 = (p196.X + p197.X) / 2
    local v200 = (p196.Z + p197.Z) / 2
    local v201 = p196.Y
    local v202 = p197.Y
    local v203 = math.max(v201, v202) + p198
    return Vector3.new(v199, v203, v200)
end
function u37.launch(p204, p205) --[[ Line: 766 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    if p204.isLaunchingMap[p205] then
        return false
    end
    if not p204.indicator then
        return false
    end
    local v206
    if p204.targetMarked then
        v206 = p204.indicator.Position
    else
        if not p204.lastValidLandingTarget then
            return false
        end
        v206 = p204.lastValidLandingTarget
    end
    p204.isLaunchingMap[p205] = true
    p204.preLaunchMaid:DoCleaning()
    return u31.Client:Get("RequestSquadLaunch"):CallServer({
        ["player"] = p205,
        ["target"] = v206
    })
end
function u37.exitLauncher(u207, _, p208) --[[ Line: 795 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    task.delay(0.5, function() --[[ Line: 796 ]]
        --[[
        Upvalues:
            [1] = u207
        --]]
        u207.aimCameraMaid:DoCleaning()
        u207.preLaunchMaid:DoCleaning()
    end)
    if p208 then
        u31.Client:Get("RequestExitSquadLauncher"):CallServer({
            ["squadLauncher"] = p208
        })
    end
end
function u37.activateIndicator(u209) --[[ Line: 806 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u22
        [3] = u2
        [4] = u17
        [5] = u7
        [6] = u19
        [7] = u5
        [8] = u29
        [9] = u34
        [10] = u30
        [11] = u35
    --]]
    if u209.indicator then
        return nil
    end
    u209.indicator = u18.Assets.Misc.WizardIndicator:Clone()
    u209.indicator.Parent = u22
    local u210 = Vector3.new()
    u209.preLaunchMaid:GiveTask(function() --[[ Line: 813 ]]
        --[[
        Upvalues:
            [1] = u209
        --]]
        u209:disableIndicator()
    end)
    local v211 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v212 = {
        ["action"] = "Attack",
        ["actionId"] = "Squad Launch",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 820 ]]
            --[[
            Upvalues:
                [1] = u209
                [2] = u17
            --]]
            if not u209.targetMarked then
                return nil
            end
            u209:launch(u17.LocalPlayer)
        end,
        ["mobile"] = {
            ["touchType"] = u7.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 828 ]]
                --[[
                Upvalues:
                    [1] = u209
                    [2] = u17
                --]]
                if not u209.targetMarked then
                    return nil
                end
                u209:launch(u17.LocalPlayer)
            end
        }
    }
    local v213 = v211:bindAction(v212)
    u209.preLaunchMaid:GiveTask(v213)
    local u214 = nil
    u214 = u19.Heartbeat:Connect(function() --[[ Line: 838 ]]
        --[[
        Upvalues:
            [1] = u209
            [2] = u214
            [3] = u17
            [4] = u5
            [5] = u210
            [6] = u29
            [7] = u34
            [8] = u30
            [9] = u35
        --]]
        if u209.camera then
            if u209.indicator then
                local v215 = u17.LocalPlayer.Character
                if v215 ~= nil then
                    v215 = v215:GetPivot().Position
                end
                if v215 then
                    local v216 = u17.LocalPlayer:GetMouse().UnitRay
                    local v217
                    if u5.isMobileControls() then
                        v217 = u209.camera.CFrame.LookVector.Unit
                    else
                        v217 = v216.Direction
                    end
                    u210 = u29:calculateBlockTargetPoint(u209.camera.CFrame.Position, v217, 300, v215)
                    if u210 then
                        local v218 = u209.camera.CFrame.Position.X
                        local v219 = u210.Y
                        local v220 = u209.camera.CFrame.Position.Z
                        local v221 = Vector3.new(v218, v219, v220)
                        u209.indicator:PivotTo(CFrame.lookAt(u210, v221) * CFrame.Angles(0, 3.141592653589793, 0))
                        local v222 = u34
                        if (u210 - v215).Magnitude > u30.LAUNCH_RANGE then
                            v222 = u35
                            u209.targetMarked = false
                        else
                            u209.targetMarked = true
                            u209.lastValidLandingTarget = u210
                        end
                        for v223, v224 in u209.indicator:GetChildren() do
                            local _ = v223 - 1
                            if v224:IsA("BasePart") then
                                v224.Color = v222
                            end
                        end
                    else
                        u209.targetMarked = false
                    end
                else
                    return nil
                end
            else
                u214:Disconnect()
                return nil
            end
        else
            return nil
        end
    end)
end
function u37.setupAimCamera(p225, p226, p227) --[[ Line: 886 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u17
        [3] = u14
    --]]
    if not u22.CurrentCamera then
        return nil
    end
    if p227 ~= u17.LocalPlayer then
        return nil
    end
    local u228 = p227.Character
    if not (u228 and p227.Character) then
        return nil
    end
    local u229 = u14("Part", {
        ["Size"] = Vector3.new(1, 1, 1),
        ["CFrame"] = CFrame.new(p226 + Vector3.new(0, 50, 0), p227.Character:GetPivot().LookVector),
        ["Anchored"] = true,
        ["CanCollide"] = false,
        ["Transparency"] = 1,
        ["Parent"] = u22
    })
    u22.CurrentCamera.CameraSubject = u229
    p225.aimCameraMaid:GiveTask(function() --[[ Line: 910 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u228
            [3] = u229
        --]]
        if u22.CurrentCamera then
            u22.CurrentCamera.CameraSubject = u228.Humanoid
        end
        u229:Destroy()
    end)
end
function u37.setIndicatorTransparency(p230, p231) --[[ Line: 917 ]]
    if not p230.indicator then
        return nil
    end
    for v232, v233 in p230.indicator:GetChildren() do
        local _ = v232 - 1
        if v233:IsA("Part") or (v233:IsA("MeshPart") or v233:IsA("UnionOperation")) then
            v233.Transparency = p231
        end
    end
end
function u37.disableIndicator(p234, _) --[[ Line: 931 ]]
    local v235 = p234.indicator
    if v235 ~= nil then
        v235:Destroy()
    end
    p234.indicator = nil
end
function u37.mountLauncherUI(p236, p237, p238, p239) --[[ Line: 938 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u15
        [3] = u33
    --]]
    local v240 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u15.createElement(u33, {
        ["StartTime"] = p238,
        ["EndTime"] = p239,
        ["SquadLauncher"] = p237
    }))
    p236.preLaunchMaid:GiveTask(v240)
end
function u37.playEffects(_, p241, p242) --[[ Line: 946 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u8
        [3] = u36
        [4] = u18
        [5] = u22
    --]]
    u8:playSound(u36[p242 % u30.MAX_LAUNCH_SQUAD_SIZE + 1], {
        ["rollOffMaxDistance"] = 100,
        ["volumeMultiplier"] = 5,
        ["position"] = p241.Position
    })
    local u243 = u18.Assets.Effects.SquadLauncherEffect:Clone()
    u243.Parent = u22
    u243.CFrame = p241
    u243.RootAttachment.OutlineExplosion:Emit(1)
    u243.Smoke:Emit(6)
    task.delay(1.5, function() --[[ Line: 961 ]]
        --[[
        Upvalues:
            [1] = u243
        --]]
        u243:Destroy()
    end)
end
v11.CreateController(u37.new())
return nil