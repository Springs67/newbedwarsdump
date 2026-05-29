local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceType
local u4 = v2.DeviceUtil
local u5 = v2.GameQueryUtil
local u6 = v2.RandomUtil
local u7 = v2.SoundManager
local u8 = v2.WatchCharacter
local u9 = v2.WatchCollectionTag
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.CollectionService
local u15 = v13.Players
local u16 = v13.ReplicatedStorage
local u17 = v13.RunService
local u18 = v13.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "slime-tamer", "slime-util")
local u23 = v22.SlimeMeta
local u24 = v22.SlimeState
local u25 = v22.SlimeType
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u28 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u29 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 38 ]]
        return "SlimeTamerController"
    end,
    ["__index"] = u28
})
u29.__index = u29
function u29.new(...) --[[ Line: 44 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    local v30 = u29
    local v31 = setmetatable({}, v30)
    return v31:constructor(...) or v31
end
function u29.constructor(p32) --[[ Line: 48 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u21
        [3] = u12
        [4] = u18
    --]]
    u28.constructor(p32, u21.SLIME_TAMER)
    p32.Name = "SlimeTamerController"
    p32.slimeModelFolder = u12("Folder", {
        ["Name"] = "SlimeModelFolder",
        ["Parent"] = u18
    })
    p32.isPreloaded = false
end
function u29.onKitLocalActivated(p33, _) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u27
        [3] = u19
        [4] = u26
    --]]
    if not p33.isPreloaded then
        u10.Controllers.PreloadController:runPreload({
            ["sounds"] = {
                u27.SLIME_ALERT_1,
                u27.SLIME_OK_1,
                u27.SLIME_ALERT_2,
                u27.SLIME_OK_2,
                u27.SLIME_ALERT_3,
                u27.SLIME_OK_3,
                u27.SLIME_ALERT_4,
                u27.SLIME_OK_4,
                u27.SLIME_BOUNCE_1,
                u27.SLIME_BOUNCE_2,
                u27.SLIME_BOUNCE_3,
                u27.SLIME_BOUNCE_4
            },
            ["animations"] = { u19.SLIME_IDLE, u19.SLIME_JUMP, u19.SLIME_MOVEMENT },
            ["imageIds"] = { u26.SLIME_CYCLE, u26.SLIME_DIRECT }
        })
        p33.isPreloaded = true
    end
end
function u29.onKitReplicationActivated(u34, p35) --[[ Line: 67 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u9
        [3] = u8
        [4] = u15
        [5] = u10
    --]]
    task.spawn(function() --[[ Line: 68 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u18
        --]]
        u34.slimeDataFolder = u18:WaitForChild("SlimeDataFolder")
    end)
    p35:GiveTask(u9("SlimeData", function(p36) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u34
        --]]
        u34:createSlimeModel(p36)
    end))
    p35:GiveTask(u8(function(u37, u38) --[[ Line: 75 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u34
            [3] = u10
        --]]
        u38:GetAttributeChangedSignal("FrostySlimeSlow"):Connect(function() --[[ Line: 76 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u15
                [3] = u37
                [4] = u34
                [5] = u10
            --]]
            if u38:GetAttribute("FrostySlimeSlow") == nil then
                if u15.LocalPlayer == u37 and u34.speedMaid then
                    u34.speedMaid:Destroy()
                    u34.speedMaid = nil
                end
            elseif u15.LocalPlayer == u37 then
                u34.speedMaid = u10.Controllers.SprintController:getMovementStatusModifier():addModifier({
                    ["blockSprint"] = false,
                    ["moveSpeedMultiplier"] = u38:GetAttribute("FrostySlimeSlow")
                })
                return
            end
        end)
    end))
end
function u29.onKitLocalDeactivated(_) --[[ Line: 93 ]] end
function u29.onKitReplicationDeactivated(_) --[[ Line: 95 ]] end
function u29.onInnateAbilityEnabled(_, _, _) --[[ Line: 97 ]] end
function u29.onAbilityUsed(_, _, _) --[[ Line: 99 ]] end
function u29.createSlimeModel(p39, u40) --[[ Line: 101 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u15
        [3] = u12
        [4] = u14
        [5] = u20
        [6] = u19
        [7] = u24
        [8] = u27
        [9] = u7
        [10] = u6
        [11] = u23
        [12] = u16
        [13] = u18
        [14] = u5
        [15] = u4
        [16] = u3
        [17] = u17
    --]]
    u40:WaitForChild("Following")
    u40:WaitForChild("Tamer")
    if u40.Parent == nil then
        return nil
    end
    u40:GetAttribute("Id")
    local u41 = u40:GetAttribute("SlimeType")
    local u42 = u11.new()
    u40.AncestryChanged:Connect(function(_, p43) --[[ Line: 110 ]]
        --[[
        Upvalues:
            [1] = u42
        --]]
        if p43 == nil then
            u42:DoCleaning()
        end
    end)
    local v44 = u15:GetPlayerByUserId(u40.Tamer.Value)
    if not v44 then
        return nil
    end
    local u45 = p39:getSlimeModel(u41)
    local v46 = u45.Name
    if v44 ~= nil then
        v44 = v44.Name
    end
    u45.Name = v46 .. "_" .. v44
    for v47, v48 in u45:GetDescendants() do
        local _ = v47 - 1
        if v48:IsA("BasePart") then
            v48.CastShadow = false
        end
    end
    u12("ObjectValue", {
        ["Name"] = "SlimeData",
        ["Value"] = u40,
        ["Parent"] = u45
    })
    u45.Parent = p39.slimeModelFolder
    u14:AddTag(u45, "SlimeModel")
    u42:GiveTask(function() --[[ Line: 142 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:Destroy()
    end)
    local v49 = u45.AnimationController.Animator
    for v50, v51 in u45:GetDescendants() do
        local _ = v50 - 1
        if v51:IsA("BasePart") then
            u42:GiveTask(v51.AncestryChanged:Connect(function(_, p52) --[[ Line: 150 ]]
                --[[
                Upvalues:
                    [1] = u42
                --]]
                if p52 == nil then
                    u42:DoCleaning()
                end
            end))
        end
    end
    local function u59(u53) --[[ Line: 160 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        local v54 = u45:GetDescendants()
        local function v56(p55) --[[ Line: 162 ]]
            --[[
            Upvalues:
                [1] = u53
            --]]
            if p55:IsA("BasePart") then
                p55.LocalTransparencyModifier = u53
            elseif p55:IsA("ParticleEmitter") or (p55:IsA("Trail") or p55:IsA("Beam")) then
                if u53 == 1 then
                    p55.Enabled = false
                    return
                end
                if u53 == 0 then
                    p55.Enabled = true
                end
            end
        end
        for v57, v58 in v54 do
            v56(v58, v57 - 1, v54)
        end
    end
    local u60 = v49:LoadAnimation(u20:getAnimation(u19.SLIME_IDLE))
    u60.Priority = Enum.AnimationPriority.Movement
    u60.Looped = true
    local u61 = v49:LoadAnimation(u20:getAnimation(u19.SLIME_MOVEMENT))
    u61.Priority = Enum.AnimationPriority.Movement
    u61.Looped = true
    local u62 = 0
    local v63 = u45.PrimaryPart
    if v63 ~= nil then
        v63 = v63.CFrame
    end
    if v63 == nil then
        v63 = CFrame.new()
    end
    local u64 = v63
    local u65 = 0
    local u66 = u40:GetAttribute("SlimeState")
    local u67 = u11.new()
    local function u86(p68) --[[ Line: 202 ]]
        --[[
        Upvalues:
            [1] = u62
            [2] = u66
            [3] = u45
            [4] = u64
            [5] = u67
            [6] = u24
            [7] = u60
            [8] = u61
            [9] = u65
            [10] = u27
            [11] = u7
            [12] = u6
            [13] = u23
            [14] = u41
        --]]
        u62 = tick()
        u66 = p68
        local v69 = u45.PrimaryPart
        if v69 ~= nil then
            v69 = v69.CFrame
        end
        if v69 == nil then
            v69 = CFrame.new()
        end
        u64 = v69
        u67:DoCleaning()
        if p68 == u24.IDLE then
            local v70 = u60
            if v70 ~= nil then
                v70:Play()
            end
            u60.TimePosition = math.random() * 5
            u67:GiveTask(function() --[[ Line: 221 ]]
                --[[
                Upvalues:
                    [1] = u60
                --]]
                local v71 = u60
                if v71 ~= nil then
                    v71:Stop()
                end
            end)
        elseif p68 == u24.CHANGING_PLAYER then
            local v72 = u61
            if v72 ~= nil then
                v72:Play()
            end
            u67:GiveTask(function() --[[ Line: 232 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                local v73 = u61
                if v73 ~= nil then
                    v73:Stop()
                end
            end)
        end
        if p68 == u24.CHANGING_PLAYER and tick() - u65 > 1 then
            u65 = tick()
            local u74 = {
                u27.SLIME_BOUNCE_1,
                u27.SLIME_BOUNCE_2,
                u27.SLIME_BOUNCE_3,
                u27.SLIME_BOUNCE_4
            }
            task.spawn(function() --[[ Line: 243 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u6
                    [3] = u74
                    [4] = u45
                --]]
                local v75 = false
                local v76 = 0
                while true do
                    if v75 then
                        v76 = v76 + 1
                    else
                        v75 = true
                    end
                    if v76 >= 2 then
                        return
                    end
                    local v77 = u7
                    local v78 = u74
                    local v79 = u6.fromList(unpack(v78))
                    local v80 = {}
                    local v81 = u45.PrimaryPart
                    if v81 ~= nil then
                        v81 = v81.Position
                    end
                    v80.position = v81
                    v80.parent = u45.PrimaryPart
                    v80.volumeMultiplier = 0.7
                    v77:playSound(v79, v80)
                    task.wait(0.35)
                end
            end)
            task.delay(1, function() --[[ Line: 272 ]]
                --[[
                Upvalues:
                    [1] = u7
                    [2] = u23
                    [3] = u41
                    [4] = u45
                --]]
                local v82 = u7
                local v83 = u23[u41].okSound
                local v84 = {}
                local v85 = u45.PrimaryPart
                if v85 ~= nil then
                    v85 = v85.Position
                end
                v84.position = v85
                v84.volumeMultiplier = 0.7
                v82:playSound(v83, v84)
            end)
        end
    end
    u42:GiveTask(u40:GetAttributeChangedSignal("SlimeState"):Connect(function() --[[ Line: 288 ]]
        --[[
        Upvalues:
            [1] = u86
            [2] = u40
        --]]
        u86(u40:GetAttribute("SlimeState"))
    end))
    u86(u40:GetAttribute("SlimeState"))
    local u87 = u40.Following.Value
    local u88
    if u87 == 0 or (u87 ~= u87 or not u87) then
        u88 = nil
    else
        u88 = u15:GetPlayerByUserId(u87)
    end
    u40.Following.Changed:Connect(function() --[[ Line: 298 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u87
            [3] = u40
            [4] = u88
            [5] = u15
            [6] = u59
            [7] = u16
            [8] = u18
            [9] = u23
            [10] = u41
        --]]
        local u89 = u45:GetPivot()
        u87 = u40.Following.Value
        if u87 ~= 0 and (u87 == u87 and u87) then
            u88 = u15:GetPlayerByUserId(u87)
        end
        task.spawn(function() --[[ Line: 305 ]]
            --[[
            Upvalues:
                [1] = u88
                [2] = u45
                [3] = u59
                [4] = u16
                [5] = u18
                [6] = u89
                [7] = u23
                [8] = u41
            --]]
            local v90 = u88
            if v90 ~= nil then
                v90 = v90.Character
            end
            if v90 then
                v90 = (u88.Character:GetPivot().Position - u45:GetPivot().Position).Magnitude > 50
            end
            if v90 then
                u59(1)
                local u91 = u16.Assets.Effects.TeleportEffect:Clone()
                u91.Parent = u18
                local u92 = u16.Assets.Effects.AppearEffect:Clone()
                u92.Parent = u18
                u91:PivotTo(u89)
                for v93, v94 in u91:GetChildren() do
                    local _ = v93 - 1
                    if v94:IsA("ParticleEmitter") then
                        v94.Color = ColorSequence.new(u23[u41].color)
                        v94:Emit(15)
                    end
                end
                task.delay(0.8, function() --[[ Line: 333 ]]
                    --[[
                    Upvalues:
                        [1] = u91
                        [2] = u92
                        [3] = u45
                        [4] = u23
                        [5] = u41
                    --]]
                    u91:Destroy()
                    u92:PivotTo(u45:GetPivot())
                    local v95 = u92:GetDescendants()
                    local function v97(p96) --[[ Line: 337 ]]
                        --[[
                        Upvalues:
                            [1] = u23
                            [2] = u41
                        --]]
                        if p96:IsA("ParticleEmitter") then
                            p96.Color = ColorSequence.new(u23[u41].color)
                            if p96.Name == "Pulse" then
                                p96:Emit(1)
                                return
                            end
                            p96:Emit(10)
                        end
                    end
                    for v98, v99 in v95 do
                        v97(v99, v98 - 1, v95)
                    end
                    task.delay(0.5, function() --[[ Line: 350 ]]
                        --[[
                        Upvalues:
                            [1] = u92
                        --]]
                        u92:Destroy()
                    end)
                end)
            end
        end)
    end)
    local u100 = u12("Part", {
        ["Size"] = Vector3.new(0, 0, 0),
        ["Transparency"] = 1,
        ["CanCollide"] = false,
        ["Anchored"] = true,
        ["Parent"] = u45
    })
    u5:setQueryIgnored(u100, true)
    u5:setQueryIgnored(u45, true)
    local u101 = u64
    local u102 = u66
    local u103 = nil
    for v104, v105 in u45:GetDescendants() do
        local _ = v104 - 1
        if v105.Name == "stretch.B" == true then
            u103 = v105
            break
        end
    end
    local u106 = u4.guessCurrentDeviceType() == u3.Mobile
    u42:GiveTask(u17.Heartbeat:Connect(function(_) --[[ Line: 382 ]]
        --[[
        Upvalues:
            [1] = u87
            [2] = u88
            [3] = u45
            [4] = u41
            [5] = u106
            [6] = u5
            [7] = u62
            [8] = u102
            [9] = u24
            [10] = u59
            [11] = u101
            [12] = u103
            [13] = u100
        --]]
        if u87 == nil then
            return nil
        end
        if not u88 then
            return nil
        end
        if not u88.Character then
            return nil
        end
        if not u88.Character.PrimaryPart then
            return nil
        end
        if not u45.PrimaryPart then
            return nil
        end
        local v107 = select(2, u88.Character.PrimaryPart:GetPivot():ToOrientation())
        local v108 = u41 % 6 / 6 * 6.283185307179586 - v107
        local v109 = math.cos(v108) * 3.5
        local v110 = math.sin(v108) * 3.5
        local v111 = Vector3.new(v109, -2, v110)
        local v112 = u88.Character.PrimaryPart.CFrame + v111
        if not u106 then
            local v113 = RaycastParams.new()
            v113.CollisionGroup = "Players"
            v113.FilterDescendantsInstances = { u45, u88.Character }
            v113.FilterType = Enum.RaycastFilterType.Exclude
            local v115 = u5:raycast(v112.Position + Vector3.new(0, 9, 0), Vector3.new(0, -30, 0), v113, {
                ["ignorePart"] = function(p114) --[[ Name: ignorePart, Line 418 ]]
                    return p114.CanCollide == false
                end
            })
            local v116
            if v115 == nil then
                v116 = v115
            else
                v116 = v115.Position
            end
            if v116 then
                local v117 = math.cos(v108) * 3.5
                local v118 = v115.Position.Y - v112.Position.Y - 1
                local v119 = math.sin(v108) * 3.5
                local v120 = Vector3.new(v117, v118, v119)
                v112 = u88.Character.PrimaryPart.CFrame + v120
            end
        end
        local v121 = tick() - u62
        if u102 == u24.IDLE then
            u59(0)
            local v122 = u101
            local v123 = v121 / 0.3
            u45:PivotTo((v122:Lerp(v112, (math.clamp(v123, 0, 1)))))
        elseif u102 == u24.CHANGING_PLAYER then
            local v124 = u101
            local v125 = v121 / 0.8
            local v126 = v124:Lerp(v112, (math.clamp(v125, 0, 1)))
            if (v126.Position - v112.Position).Magnitude > 0.01 then
                v126 = CFrame.new(v126.Position, v112.Position)
            end
            u45:PivotTo(v126)
        end
        u100.CFrame = u103.TransformedWorldCFrame
    end))
end
function u29.getSlimeModel(_, p127) --[[ Line: 453 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u16
    --]]
    if p127 == u25.VOID then
        return u16.Assets.Misc.Slimes.VoidSlime:Clone()
    end
    if p127 == u25.FROSTY then
        return u16.Assets.Misc.Slimes.FrostySlime:Clone()
    end
    if p127 == u25.HEALING then
        return u16.Assets.Misc.Slimes.HealSlime:Clone()
    end
    local _ = p127 == u25.STICKY
    return u16.Assets.Misc.Slimes.StickySlime:Clone()
end
function u29.getFollowingSlimeData(_, p128) --[[ Line: 476 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v129 = 0
    local v130 = {}
    for v131, v132 in u14:GetTagged("SlimeData") do
        local _ = v131 - 1
        if v132.Following.Value == p128 == true then
            v129 = v129 + 1
            v130[v129] = v132
        end
    end
    return v130
end
function u29.getTamedSlimeData(_, p133) --[[ Line: 493 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v134 = 0
    local v135 = {}
    for v136, v137 in u14:GetTagged("SlimeData") do
        local _ = v136 - 1
        if v137.Tamer.Value == p133 == true then
            v134 = v134 + 1
            v135[v134] = v137
        end
    end
    return v135
end
function u29.getTamedSlimeOfType(_, p138, p139) --[[ Line: 510 ]]
    --[[
    Upvalues:
        [1] = u14
    --]]
    local v140 = 0
    local v141 = {}
    for v142, v143 in u14:GetTagged("SlimeData") do
        local _ = v142 - 1
        local v144
        if v143.Tamer.Value == p138 then
            v144 = v143:GetAttribute("SlimeType") == p139
        else
            v144 = false
        end
        if v144 == true then
            v140 = v140 + 1
            v141[v140] = v143
        end
    end
    return v141
end
function u29.getTamedSlimeTypes(p145, p146) --[[ Line: 527 ]]
    local v147 = {}
    for v148, v149 in p145:getTamedSlimeData(p146) do
        local _ = v148 - 1
        local v150 = v149:GetAttribute("SlimeType")
        if table.find(v147, v150) == nil then
            table.insert(v147, v150)
        end
    end
    return v147
end
u10.CreateController(u29.new())
return nil