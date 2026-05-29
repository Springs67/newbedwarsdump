local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AnimationUtil
local u5 = v3.DeviceUtil
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local u8 = v3.WatchCollectionTag
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u10 = v9.KnitClient
local u11 = v9.KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutBack
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u18 = v17.CollectionService
local u19 = v17.Players
local u20 = v17.RunService
local u21 = v17.TweenService
local u22 = v17.Workspace
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent, "games", "bedwars", "kit", "kits", "star-collector", "ui", "star-collector-notification").StarCollectorNotification
local u25 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE
local v29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "blocks", "fire-sheep-meta")
local u30 = v29.FIRE_SHEEP_BASE_STATS
local u31 = v29.FireSheepLevel
local u32 = v29.FireSheepLevelColor
local u33 = v29.MaxedFireSheep
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u35 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u36 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u37 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u38 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "team", "team-controller").TeamController
local u39 = v1.import(script, script.Parent, "ui", "fire-sheep-hp-bar").FireSheepHpBar
local u40 = { u37.FIRE_SHEEP_ROTATE_1, u37.FIRE_SHEEP_ROTATE_2, u37.FIRE_SHEEP_ROTATE_3 }
local u41 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 47 ]]
        return "FireSheepStatueController"
    end,
    ["__index"] = u25
})
u41.__index = u41
function u41.new(...) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u41
    --]]
    local v42 = u41
    local v43 = setmetatable({}, v42)
    return v43:constructor(...) or v43
end
function u41.constructor(p44, ...) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u25
    --]]
    u25.constructor(p44, ...)
    p44.Name = "FireSheepStatueController"
    p44.statueTargetMap = {}
    p44.statueRotationMaidMap = {}
    p44.statueAttackMaidMap = {}
    p44.fireSheepStatMap = {}
    p44.statueEffectMap = {}
end
function u41.KnitStart(u45) --[[ Line: 66 ]]
    --[[
    Upvalues:
        [1] = u25
        [2] = u10
        [3] = u35
        [4] = u26
        [5] = u37
        [6] = u8
        [7] = u14
        [8] = u30
        [9] = u36
        [10] = u19
        [11] = u31
        [12] = u18
        [13] = u7
    --]]
    u25.KnitStart(u45)
    u10.Controllers.PreloadController:preloadForItemType(u35.FIRE_SHEEP_STATUE, {
        ["animations"] = { u26.FIRE_SHEEP_ATTACK, u26.FIRE_SHEEP_CHARGE, u26.FIRE_SHEEP_SPAWN },
        ["sounds"] = {
            u37.FIRE_SHEEP_BREAK,
            u37.FIRE_SHEEP_FLAMETHROWER_CHARGE,
            u37.FIRE_SHEEP_FLAMETHROWER_LOOP,
            u37.FIRE_SHEEP_ROTATE_1,
            u37.FIRE_SHEEP_ROTATE_2,
            u37.FIRE_SHEEP_ROTATE_3,
            u37.FIRE_SHEEP_SPAWN,
            u37.FIRE_SHEEP_TARGET,
            u37.FIRE_SHEEP_UPGRADE
        }
    })
    u8("FireSheepStatue", function(p46) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u45
            [3] = u30
        --]]
        local v47 = u14.new()
        u45.statueRotationMaidMap[p46] = v47
        u45:spawnStatueEffect(p46)
        u45:recolorTeamIndicator(p46)
        u45.fireSheepStatMap[p46] = u30
        u45:initializeHayPrompt(p46)
        u45:initializeTargetIndicator(p46)
        u45:createHpBar(p46)
        u45:updateParticleTransparency()
    end)
    u36.Client:OnEvent("ChangeFireSheepTarget", function(p48) --[[ Line: 87 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45.statueTargetMap[p48.statue] = p48.target
        u45:updateParticleTransparency()
        u45:cleanUpAttack(p48.statue)
        u45:cleanUpRotation(p48.statue)
        u45:rotateStatue(p48.statue)
    end)
    u36.Client:OnEvent("ActivateFireSheepFlamethrower", function(p49) --[[ Line: 97 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:cleanUpAttack(p49.statue)
        u45:createFlamethrowerEffect(p49.statue, p49.target)
        u45:updateParticleTransparency()
    end)
    u36.Client:OnEvent("FireSheepUpgraded", function(p50) --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u45
            [2] = u19
            [3] = u31
        --]]
        u45.fireSheepStatMap[p50.statue] = p50.upgradeStats
        if p50.upgrader == u19.LocalPlayer then
            u45:sendLevelNotification(p50.deltaStats, p50.level)
        end
        if p50.level == u31.MAX then
            u45:enableMaxFireSheepEffect(p50.statue)
        end
    end)
    u18:GetInstanceRemovedSignal("FireSheepStatue"):Connect(function(p51) --[[ Line: 115 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u37
            [3] = u45
        --]]
        u7:playSound(u37.FIRE_SHEEP_BREAK, {
            ["position"] = p51.Position
        })
        u45:cleanUpAttack(p51)
        u45:cleanUpRotation(p51)
        u45:removeHpBar()
        u45.fireSheepStatMap[p51] = nil
    end)
    u10.Controllers.CameraPerspectiveController.PerspectiveChanged:Connect(function(_) --[[ Line: 125 ]]
        --[[
        Upvalues:
            [1] = u45
        --]]
        u45:updateParticleTransparency()
    end)
end
function u41.updateParticleTransparency(p52) --[[ Line: 129 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u19
    --]]
    local v53
    if u10.Controllers.CameraPerspectiveController:getCameraPerspective() == 0 then
        v53 = NumberSequence.new(0.9, 1)
    else
        v53 = NumberSequence.new(0, 1)
    end
    for _, v54 in p52:getAllFireSheepStatues() do
        if p52.statueTargetMap[v54] == u19.LocalPlayer.Character then
            local v55 = p52.statueEffectMap[v54]
            if v55 then
                for _, v56 in v55 do
                    v56.Transparency = v53
                end
            end
        end
    end
end
function u41.createHpBar(p57, p58) --[[ Line: 143 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u16
        [3] = u39
    --]]
    p58:SetAttribute("NoHealthbar", true)
    local v59 = u30.blockHealth
    p57.hpBarTree = u16.mount(u16.createElement(u39, {
        ["statue"] = p58,
        ["currentHp"] = v59,
        ["maxHp"] = v59
    }), p58)
end
function u41.removeHpBar(p60) --[[ Line: 153 ]]
    --[[
    Upvalues:
        [1] = u16
    --]]
    if p60.hpBarTree then
        u16.unmount(p60.hpBarTree)
    end
end
function u41.sendLevelNotification(_, p61, p62) --[[ Line: 158 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u31
        [3] = u28
        [4] = u2
        [5] = u16
        [6] = u24
    --]]
    for _, v63 in u12.entries(p61) do
        local v64 = v63[1]
        local v65 = v63[2]
        if v65 ~= 0 and v65 ~= false then
            local v66 = Color3.fromRGB(240, 145, 56)
            local v67 = Color3.fromRGB(242, 105, 13)
            if p62 == u31.MAX then
                v66 = Color3.fromRGB(181, 89, 237)
                v67 = Color3.fromRGB(140, 23, 237)
            end
            local v68 = nil
            if v64 == "attackDuration" then
                v68 = "+" .. tostring(v65) .. "s Attack Duration"
            elseif v64 == "blastResistance" then
                v68 = "Blast Resistance"
            elseif v64 == "blockHealth" then
                v68 = "+" .. tostring(v65) .. " Sheep Health"
            elseif v64 == "damagePerSecond" then
                v68 = "+" .. tostring(v65) .. " Attack Damage"
            elseif v64 == "enterSearchRadius" then
                local v69 = v65 / u28
                v68 = "+" .. tostring(v69) .. " Blocks Attack Range"
            end
            if v68 ~= "" and v68 then
                local u70 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u16.createElement(u24, {
                    ["text"] = v68,
                    ["textColor3"] = v66,
                    ["textStrokeColor3"] = v67
                }))
                task.delay(3, function() --[[ Line: 200 ]]
                    --[[
                    Upvalues:
                        [1] = u70
                    --]]
                    u70:DoCleaning()
                end)
                task.wait(0.3)
            end
        end
    end
end
function u41.enableMaxFireSheepEffect(_, p71) --[[ Line: 207 ]]
    --[[
    Upvalues:
        [1] = u21
        [2] = u33
    --]]
    for v72, v73 in p71.Rotating.Pedestal.SpawnEffectAttachment:GetChildren() do
        local _ = v72 - 1
        if v73:IsA("ParticleEmitter") then
            v73:Emit()
        end
    end
    u21:Create(p71.Rotating.Sheep.horns, TweenInfo.new(1), {
        ["Color"] = u33.HornsColor
    }):Play()
    u21:Create(p71.Rotating.Sheep.legs_mesh, TweenInfo.new(1), {
        ["Color"] = u33.LegsColor
    }):Play()
    local v74 = p71.StatueBase.Levels:GetChildren()
    local function v76(p75) --[[ Line: 227 ]]
        --[[
        Upvalues:
            [1] = u21
            [2] = u33
        --]]
        if p75:IsA("BasePart") then
            u21:Create(p75, TweenInfo.new(1), {
                ["Color"] = u33.LevelIndicatorColor
            }):Play()
        end
    end
    for v77, v78 in v74 do
        v76(v78, v77 - 1, v74)
    end
    for v79, v80 in p71.Rotating.Sheep.wool_mesh:GetChildren() do
        local _ = v79 - 1
        if v80:IsA("ParticleEmitter") then
            v80.Color = u33.ParticleColor
        end
    end
end
function u41.rotateStatue(p81, p82) --[[ Line: 247 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u7
        [3] = u6
        [4] = u40
        [5] = u23
        [6] = u13
        [7] = u19
        [8] = u37
        [9] = u4
        [10] = u27
        [11] = u26
        [12] = u20
    --]]
    if u22:GetServerTimeNow() < p82:GetAttribute("ActivationTime") then
        return nil
    elseif p82.Parent == nil then
        return nil
    else
        local v83 = p81.statueRotationMaidMap[p82]
        if v83 then
            local u84 = p82:WaitForChild("Rotating")
            if u84 then
                local u85 = p81.statueTargetMap[p82]
                if u85 == nil then
                    local v86 = u40
                    u7:playSound(u6.fromList(unpack(v86)), {
                        ["position"] = p82.Position
                    })
                    local u87 = u84:GetPivot()
                    local u88 = u87 * CFrame.Angles(0, math.random(0, 1.5707963267948966), 0)
                    local u90 = u23(0.4, u13, function(p89) --[[ Line: 280 ]]
                        --[[
                        Upvalues:
                            [1] = u84
                            [2] = u87
                            [3] = u88
                        --]]
                        u84:PivotTo(u87:Lerp(u88, p89))
                    end)
                    u90:Play()
                    v83:GiveTask(function() --[[ Line: 284 ]]
                        --[[
                        Upvalues:
                            [1] = u90
                        --]]
                        u90:Cancel()
                    end)
                else
                    local v91 = u85 == u19.LocalPlayer.Character
                    if v91 then
                        p81:animateTargetIndicator(p82)
                    end
                    local v92 = u40
                    u7:playSound(u6.fromList(unpack(v92)), {
                        ["position"] = p82.Position
                    })
                    local v93 = u7
                    local v94 = u37.FIRE_SHEEP_TARGET
                    local v95 = {}
                    local v96
                    if v91 then
                        v96 = nil
                    else
                        v96 = p82.Position
                    end
                    v95.position = v96
                    v93:playSound(v94, v95)
                    local v97 = u85:GetPivot().Position
                    local v98 = v97.X
                    local v99 = u84:GetPivot().Position.Y
                    local v100 = v97.Z
                    local v101 = Vector3.new(v98, v99, v100)
                    local u102 = u84:GetPivot()
                    local u103 = CFrame.new(u84:GetPivot().Position, v101)
                    local u105 = u23(0.4, u13, function(p104) --[[ Line: 302 ]]
                        --[[
                        Upvalues:
                            [1] = u84
                            [2] = u102
                            [3] = u103
                        --]]
                        u84:PivotTo(u102:Lerp(u103, p104))
                    end)
                    u105:Play()
                    v83:GiveTask(function() --[[ Line: 306 ]]
                        --[[
                        Upvalues:
                            [1] = u105
                        --]]
                        u105:Cancel()
                    end)
                    v83:GiveTask(function() --[[ Line: 309 ]]
                        --[[
                        Upvalues:
                            [1] = u105
                        --]]
                        return u105:Cancel()
                    end)
                    local v106 = p81:getAnimator(p82)
                    local v107 = v106 and u4:playAnimation(v106, u27:getAssetId(u26.FIRE_SHEEP_CHARGE))
                    if v107 then
                        v107:AdjustSpeed(1.3)
                        v83:GiveTask(v107)
                    end
                    local u108 = u7:playSound(u37.FIRE_SHEEP_FLAMETHROWER_CHARGE, {
                        ["position"] = p82.Position
                    })
                    v83:GiveTask(function() --[[ Line: 323 ]]
                        --[[
                        Upvalues:
                            [1] = u108
                        --]]
                        local v109 = u108
                        if v109 ~= nil then
                            v109:Destroy()
                        end
                    end)
                    v83:GiveTask(u20.Heartbeat:Connect(function() --[[ Line: 329 ]]
                        --[[
                        Upvalues:
                            [1] = u85
                            [2] = u84
                        --]]
                        local v110 = u85:GetPivot().Position
                        local v111 = v110.X
                        local v112 = u84:GetPivot().Position.Y
                        local v113 = v110.Z
                        local v114 = Vector3.new(v111, v112, v113)
                        u84:PivotTo((CFrame.new(u84:GetPivot().Position, v114)))
                    end))
                end
            else
                return nil
            end
        else
            return nil
        end
    end
end
function u41.animateTargetIndicator(p115, p116) --[[ Line: 337 ]]
    --[[
    Upvalues:
        [1] = u30
        [2] = u21
    --]]
    local u117 = p116.Rotating.Sheep.TargetIndicator
    local v118 = p115.fireSheepStatMap[p116]
    if v118 ~= nil then
        v118 = v118.enterSearchRadius
    end
    if v118 == nil then
        v118 = u30.enterSearchRadius
    end
    u117.MaxDistance = v118 + 3
    if u117.Enabled then
        return nil
    end
    u117.Enabled = true
    local v119 = u21:Create(u117, TweenInfo.new(0.75, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        ["StudsOffset"] = Vector3.new(0, 2.5, 0)
    })
    v119:Play()
    v119.Completed:Connect(function() --[[ Line: 358 ]]
        --[[
        Upvalues:
            [1] = u117
        --]]
        if u117 ~= nil then
            u117.StudsOffset = Vector3.new(0, 1.5, 0)
            u117.Enabled = false
        end
    end)
end
u41.initializeTargetIndicator = v1.async(function(_, p120) --[[ Line: 365 ]]
    --[[
    Upvalues:
        [1] = u30
    --]]
    local v121 = p120.Rotating.Sheep:WaitForChild("TargetIndicator", 3)
    v121.MaxDistance = u30.enterSearchRadius + 3
    v121.StudsOffset = Vector3.new(0, 1.5, 0)
    v121.Enabled = false
    v121:WaitForChild("ImageLabel").Image = "rbxassetid://12179386990"
end)
u41.recolorTeamIndicator = v1.async(function(_, p122) --[[ Line: 373 ]]
    --[[
    Upvalues:
        [1] = u38
        [2] = u19
        [3] = u21
    --]]
    local v123 = 0
    local v124 = {}
    for v125, v126 in p122:WaitForChild("StatueBase"):GetChildren() do
        local _ = v125 - 1
        if v126.Name == "Team" == true then
            v123 = v123 + 1
            v124[v123] = v126
        end
    end
    if v124 == nil then
        return nil
    end
    local v127 = Color3.fromRGB(18, 196, 28)
    local v128 = Color3.fromRGB(191, 28, 28)
    local v129 = u38:getTeamById(p122:GetAttribute("Team"))
    if not v129 then
        return nil
    end
    local v130 = u38:getPlayerTeam(u19.LocalPlayer)
    if not v130 then
        return nil
    end
    if v129 == v130 then
        v128 = v127
    end
    for _, v131 in v124 do
        u21:Create(v131, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
            ["Color"] = v128
        }):Play()
    end
end)
function u41.initializeHayPrompt(u132, u133) --[[ Line: 409 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u11
        [3] = u5
        [4] = u31
        [5] = u34
        [6] = u35
        [7] = u36
    --]]
    local v134 = u133:GetAttribute("PlacedByUserId")
    if v134 == 0 or (v134 ~= v134 or not v134) then
        return nil
    end
    local v135 = u19:GetPlayerByUserId(v134)
    if not v135 then
        return nil
    end
    if u19.LocalPlayer ~= v135 then
        return nil
    end
    local u136 = u11.Controllers.ProximityPromptController:createProximityPrompt({
        ["ActionText"] = "Feed Purple Hay",
        ["RequiresLineOfSight"] = false,
        ["MaxActivationDistance"] = 6,
        ["Parent"] = u133,
        ["ClickablePrompt"] = u5.isMobileControls()
    })
    u133:GetAttributeChangedSignal("Level"):Connect(function() --[[ Line: 428 ]]
        --[[
        Upvalues:
            [1] = u133
            [2] = u31
            [3] = u136
            [4] = u132
        --]]
        local v137 = u133:GetAttribute("Level")
        if v137 == u31.MAX then
            u136:Destroy()
        end
        if v137 ~= 0 then
            u132:upgradeFireSheepEffect(u133)
            u132:updatePodiumLevel(u133, v137 + 1)
        end
    end)
    u136.Triggered:Connect(function(p138) --[[ Line: 438 ]]
        --[[
        Upvalues:
            [1] = u34
            [2] = u35
            [3] = u133
            [4] = u31
            [5] = u36
        --]]
        if not u34.hasEnough(p138, u35.PURPLE_HAY_BALE, 1) then
            return nil
        end
        if u133:GetAttribute("Level") == u31.MAX then
            return nil
        end
        u36.Client:Get("RequestUpgradeFireSheep"):CallServer(u133)
    end)
end
function u41.updatePodiumLevel(_, p139, p140) --[[ Line: 448 ]]
    --[[
    Upvalues:
        [1] = u32
    --]]
    local v141 = nil
    for v142, v143 in p139.StatueBase.Levels:GetChildren() do
        local _ = v142 - 1
        if v143.Name == "Level" .. tostring(p140) == true then
            v141 = v143
            break
        end
    end
    if not v141 then
        return nil
    end
    v141.Color = u32
    v141.Material = Enum.Material.Neon
end
function u41.upgradeFireSheepEffect(_, p144) --[[ Line: 469 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u37
    --]]
    u7:playSound(u37.FIRE_SHEEP_UPGRADE)
    local v145 = p144.Rotating.Sheep:WaitForChild("head_mesh")
    if v145 then
        for v146, v147 in v145:GetChildren() do
            local _ = v146 - 1
            if v147:IsA("ParticleEmitter") then
                v147:Emit(5)
            end
        end
    end
end
function u41.spawnStatueEffect(p148, p149) --[[ Line: 484 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u4
        [3] = u27
        [4] = u26
        [5] = u7
        [6] = u37
    --]]
    local v150 = p149:WaitForChild("Rotating"):WaitForChild("Sheep")
    local v151 = p148:getAnimator(p149)
    local v152 = { v150 }
    local v153 = #v152
    local v154 = v150:GetDescendants()
    table.move(v154, 1, #v154, v153 + 1, v152)
    if u22:GetServerTimeNow() < p149:GetAttribute("ActivationTime") then
        local v155 = p149.Rotating:WaitForChild("Pedestal")
        if v155 ~= nil then
            v155 = v155:WaitForChild("SpawnEffectAttachment")
        end
        if v155 then
            for v156, v157 in v155:GetChildren() do
                local _ = v156 - 1
                if v157:IsA("ParticleEmitter") then
                    v157:Emit()
                end
            end
        end
        if v151 then
            u4:playAnimation(v151, u27:getAssetId(u26.FIRE_SHEEP_SPAWN))
        end
        u7:playSound(u37.FIRE_SHEEP_SPAWN, {
            ["position"] = p149.Position
        })
    end
end
function u41.cleanUpRotation(p158, p159) --[[ Line: 517 ]]
    local v160 = p158.statueRotationMaidMap[p159]
    if v160 then
        v160:DoCleaning()
    end
end
function u41.cleanUpAttack(p161, p162) --[[ Line: 525 ]]
    local v163 = p161.statueAttackMaidMap[p162]
    if v163 then
        v163:DoCleaning()
        p161.statueAttackMaidMap[p162] = nil
    end
end
function u41.createFlamethrowerEffect(u164, u165, p166) --[[ Line: 536 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u4
        [3] = u27
        [4] = u26
        [5] = u19
        [6] = u7
        [7] = u37
    --]]
    if u165.Parent == nil then
        return nil
    end
    local v167 = u14.new()
    local v168 = p166:WaitForChild("UpperTorso")
    if v168 ~= nil then
        v168 = v168:WaitForChild("BodyFrontAttachment")
    end
    if not v168 then
        error("Could not find targetAttachment")
    end
    local v169 = u165.Rotating.Sheep.nose_mesh.FlameSourceAttachment:GetDescendants()
    local v170 = u164:getAnimator(u165)
    local u171 = v170 and u4:playAnimation(v170, u27:getAssetId(u26.FIRE_SHEEP_ATTACK))
    if u171 then
        v167:GiveTask(function() --[[ Line: 555 ]]
            --[[
            Upvalues:
                [1] = u171
            --]]
            u171:Destroy()
        end)
    end
    local v172 = p166 == u19.LocalPlayer.Character
    local v173 = u7
    local v174 = u37.FLAMETHROWER_USE
    local v175 = {
        ["looped"] = true
    }
    local v176
    if v172 then
        v176 = nil
    else
        v176 = u165.Position
    end
    v175.position = v176
    local v177 = v173:playSound(v174, v175)
    if v177 then
        v167:GiveTask(v177)
    end
    local v178 = {}
    for v179, u180 in v169 do
        local _ = v179 - 1
        if u180:IsA("ParticleEmitter") then
            u180.Enabled = true
            table.insert(v178, u180)
            v167:GiveTask(function() --[[ Line: 575 ]]
                --[[
                Upvalues:
                    [1] = u180
                --]]
                u180.Enabled = false
            end)
        end
    end
    u164.statueEffectMap[u165] = v178
    v167:GiveTask(function() --[[ Line: 600 ]]
        --[[
        Upvalues:
            [1] = u164
            [2] = u165
        --]]
        local v181 = u164.statueEffectMap[u165]
        if v181 ~= nil then
            table.clear(v181)
        end
    end)
    u164.statueAttackMaidMap[u165] = v167
end
function u41.getAnimator(_, p182) --[[ Line: 612 ]]
    --[[
    Upvalues:
        [1] = u15
    --]]
    local v183 = p182.Rotating.Sheep:WaitForChild("AnimationController")
    if not v183 then
        return nil
    end
    local v184
    if v183 == nil then
        v184 = v183
    else
        v184 = v183:WaitForChild("Animator")
    end
    return v184 or u15("Animator", {
        ["Parent"] = v183
    })
end
function u41.getAllFireSheepStatues(_) --[[ Line: 629 ]]
    --[[
    Upvalues:
        [1] = u18
    --]]
    return u18:GetTagged("FireSheepStatue")
end
u10.CreateController(u41.new())
return nil