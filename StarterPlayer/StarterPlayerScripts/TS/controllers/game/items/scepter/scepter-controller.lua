local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.GameQueryUtil
local u5 = v3.MobileTouchType
local u6 = v3.SoundManager
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u8 = v7.KnitClient
local u9 = v7.KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.ContextActionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.TweenService
local u18 = v12.Workspace
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local v21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "network")
local u22 = v21.EntityDamageEventZap
local u23 = v21.EntityHealEventZap
local u24 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u32 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u33 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u34 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil
local u35 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 40 ]]
        return "ScepterController"
    end,
    ["__index"] = u20
})
u35.__index = u35
function u35.new(...) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u35
    --]]
    local v36 = u35
    local v37 = setmetatable({}, v36)
    return v37:constructor(...) or v37
end
function u35.constructor(p38) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u10
    --]]
    u20.constructor(p38)
    p38.Name = "ScepterController"
    p38.maid = u10.new()
    p38.lowHealthTeammates = {}
    p38.isAngel = false
    p38.sessionId = 0
    p38.soundLock = false
    p38.isPreloaded = false
end
function u35.KnitStart(u39) --[[ Line: 60 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u32
        [3] = u14
        [4] = u19
        [5] = u25
        [6] = u13
        [7] = u31
        [8] = u24
    --]]
    u20.KnitStart(u39)
    u39:runPreload()
    u32.Client:Get("EntityDeathEvent"):Connect(function(p40) --[[ Line: 63 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u39
        --]]
        local v41 = u14:GetPlayerFromCharacter(p40.entityInstance)
        if v41 then
            u39.lowHealthTeammates[v41] = nil
        end
    end)
    u19.AbilityUsed:connect(function(p42) --[[ Line: 71 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u25
            [3] = u13
            [4] = u39
            [5] = u32
        --]]
        if p42.userCharacter == u14.LocalPlayer.Character and p42.ability == u25.PALADIN_ABILITY then
            u13:UnbindAction("Paladin Ability")
            local v43 = {
                ["target"] = u14:GetPlayerFromCharacter(u39.target)
            }
            u32.Client:Get("PaladinAbilityRequest"):SendToServer(v43)
            u39:destroyAngel()
            u39:removeTarget()
            u39.maid:DoCleaning()
        end
    end)
    u19.ItemConsumed:connect(function(p44) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u31
            [3] = u24
            [4] = u39
        --]]
        local v45 = u14:GetPlayerFromCharacter(p44.entity:getInstance())
        if p44.itemType == u31.SCEPTER and v45 == u14.LocalPlayer then
            u24:dispatch({
                ["type"] = "UnequipItemInHand",
                ["equip"] = false
            })
            task.delay(0.8, function() --[[ Line: 90 ]]
                --[[
                Upvalues:
                    [1] = u39
                --]]
                u39:useAbility()
            end)
        end
    end)
    u32.Client:Get("PaladinTeleport"):Connect(function(p46) --[[ Line: 95 ]]
        --[[
        Upvalues:
            [1] = u39
        --]]
        u39:teleportEffect(p46.player, p46.targetPosition, p46.character, p46.oldPosition, p46.ascend)
    end)
end
function u35.runPreload(p47) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u26
        [3] = u33
    --]]
    if not p47.isPreloaded then
        u8.Controllers.PreloadController:runPreload({
            ["animations"] = { u26.PALADIN_JUMP, u26.PALADIN_LAND, u26.USE_CROSS },
            ["sounds"] = {
                u33.LANI_LANDING,
                u33.LANI_SUMMON,
                u33.LANI_ASCEND,
                u33.LANI_USE_STAFF,
                u33.LANI_DASH
            }
        })
        p47.isPreloaded = true
    end
end
function u35.isRelevantItem(_, p48) --[[ Line: 108 ]]
    --[[
    Upvalues:
        [1] = u31
    --]]
    return p48.itemType == u31.SCEPTER
end
function u35.onEnable(u49, _, _) --[[ Line: 111 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u22
        [3] = u23
        [4] = u19
        [5] = u33
        [6] = u31
        [7] = u6
        [8] = u9
        [9] = u26
    --]]
    local u50 = nil
    u49:destroyAllHealthBar()
    local v51 = u14.LocalPlayer.Team
    if v51 ~= nil then
        for v52, v53 in v51:GetPlayers() do
            local _ = v52 - 1
            if v53 ~= u14.LocalPlayer then
                u49.lowHealthTeammates[v53] = true
            end
        end
    end
    for v54 in u49.lowHealthTeammates do
        u49:createHealthBar(v54)
    end
    u49.cleanupDamageConnection = u22.On(function(p55, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 131 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u49
        --]]
        local v56 = u14:GetPlayerFromCharacter(p55)
        local v57 = not v56
        if not v57 then
            local v58 = u49.lowHealthTeammates[v56] ~= nil
            v57 = not v58
        end
        if v57 then
            return nil
        end
        u49:updateHealthBar(v56)
    end)
    local u63 = u23.On(function(p59, _, _, _) --[[ Line: 145 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u49
        --]]
        local v60 = u14:GetPlayerFromCharacter(p59)
        local v61 = not v60
        if not v61 then
            local v62 = u49.lowHealthTeammates[v60] ~= nil
            v61 = not v62
        end
        if v61 then
            return nil
        end
        u49:updateHealthBar(v60)
    end)
    u49.maid:GiveTask(function() --[[ Line: 158 ]]
        --[[
        Upvalues:
            [1] = u63
        --]]
        u63()
    end)
    u19.NewHandItem:connect(function(p64) --[[ Line: 161 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        local v65 = u14.LocalPlayer:GetAttribute("Untargetable")
        if v65 ~= 0 and (v65 == v65 and (v65 ~= "" and v65)) then
            p64:setCancelled(true)
        end
    end)
    u19.StartConsuming:connect(function(p66) --[[ Line: 167 ]]
        --[[
        Upvalues:
            [1] = u49
            [2] = u33
            [3] = u31
            [4] = u6
            [5] = u50
            [6] = u9
            [7] = u26
        --]]
        if p66:isCancelled() then
            return nil
        end
        local v67 = u49.sound
        if v67 ~= nil then
            v67 = v67.SoundId
        end
        if v67 == u33.LANI_SUMMON then
            local v68 = u49.sound
            if v68 ~= nil then
                v68:Stop()
            end
        end
        if p66.itemType == u31.SCEPTER then
            u49.sound = u6:playModifiableSound(u33.LANI_SUMMON, {
                ["volumeMultiplier"] = 0.4
            })
        end
        u50 = u9.Controllers.ViewmodelController:playAnimation(u26.FP_SHIELD_USE)
    end)
    u19.StopConsuming:connect(function(p69) --[[ Line: 188 ]]
        --[[
        Upvalues:
            [1] = u50
            [2] = u31
            [3] = u49
        --]]
        local v70 = u50
        if v70 ~= nil then
            v70:Stop()
        end
        local v71 = u50
        if v71 ~= nil then
            v71:Destroy()
        end
        if p69.itemType == u31.SCEPTER and p69.completed then
            u49.soundLock = true
            task.delay(0.2, function() --[[ Line: 199 ]]
                --[[
                Upvalues:
                    [1] = u49
                --]]
                u49.soundLock = false
            end)
        elseif p69.itemType == u31.SCEPTER and not (p69.completed or u49.soundLock) then
            local v72 = u49.sound
            if v72 ~= nil then
                v72:Stop()
            end
        end
    end)
end
function u35.onDisable(p73) --[[ Line: 210 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    p73:destroyAllHealthBar()
    local v74 = not p73.angel
    if v74 then
        local v75 = p73.sound
        if v75 ~= nil then
            v75 = v75.SoundId
        end
        v74 = v75 == u33.LANI_SUMMON
    end
    if v74 then
        local v76 = p73.sound
        if v76 ~= nil then
            v76:Stop()
        end
    end
    local v77 = p73.cleanupDamageConnection
    if v77 ~= nil then
        v77()
    end
    local v78 = p73.healConnection
    if v78 ~= nil then
        v78:Disconnect()
    end
end
function u35.useAbility(u79) --[[ Line: 235 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u25
        [3] = u30
        [4] = u31
        [5] = u5
        [6] = u16
        [7] = u18
        [8] = u28
        [9] = u11
    --]]
    u79.sessionId = u79.sessionId + 1
    local u80 = u79.sessionId
    u79.maid:DoCleaning()
    u79:summonAngel()
    local v81 = u79.maid
    local v82 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
    local v83 = u25.PALADIN_ABILITY
    local v84 = {}
    local v85 = {}
    local v86 = u30(u31.SCEPTER).image
    v85.icon = v86 == nil and "" or v86
    v84.abilityButton = v85
    v84.abilityType = "ItemPrimary"
    v81:GiveTask(v82:enableAbility(v83, v84):expect())
    local v87 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        ["action"] = "Attack",
        ["actionId"] = "Paladin Ability",
        ["boundFunction"] = function(_, _, _) --[[ Name: boundFunction, Line 259 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u25
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u25.PALADIN_ABILITY)
        end,
        ["mobile"] = {
            ["touchType"] = u5.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 264 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u25
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u25.PALADIN_ABILITY)
            end
        }
    })
    u79.maid:GiveTask(v87)
    u79.maid:GiveTask(u16.Heartbeat:Connect(function() --[[ Line: 270 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u79
            [3] = u28
            [4] = u11
        --]]
        local v88 = u18.CurrentCamera
        if v88 ~= nil then
            v88 = v88.CFrame
        end
        if not v88 then
            u79:removeTarget()
            return nil
        end
        if not u28:getLocalPlayerEntity() then
            u79:removeTarget()
            return nil
        end
        local v89 = u79:getTargetTeammates(v88 * Vector3.new(0, 0, -600), 600)
        local v90 = Ray.new(v88.Position, v88.LookVector).Unit
        local v91 = (1 / 0)
        local v92 = nil
        for _, v93 in v89 do
            local v94 = v93:getInstance():GetPrimaryPartCFrame().Position
            local v95 = v90:ClosestPoint(v94)
            local v96 = (v94 - v95).Magnitude
            local v97 = (v94 - v88.Position).Unit
            if v88.LookVector:Dot(v97) >= 0.6 then
                local v98 = v96 + (v90.Origin - v95).Magnitude / 6
                if v98 < v91 then
                    v92 = v93:getInstance()
                    v91 = v98
                end
            end
        end
        if u79.target ~= v92 then
            u79:removeTarget()
            if v92 then
                local v99 = Color3.fromRGB(255, 215, 0)
                local v100 = u79
                local v101 = u11
                local v102 = {
                    ["StudsOffset"] = Vector3.new(0, 7, 0),
                    ["AlwaysOnTop"] = true,
                    ["Parent"] = v92.PrimaryPart,
                    ["Size"] = UDim2.fromOffset(40, 40),
                    ["Children"] = { u11("ImageLabel", {
                            ["Image"] = "rbxassetid://9429977101",
                            ["BackgroundTransparency"] = 1,
                            ["ImageTransparency"] = 0,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["ScaleType"] = Enum.ScaleType.Fit,
                            ["ImageColor3"] = v99
                        }) }
                }
                v100.targetIcon = v101("BillboardGui", v102)
            end
        end
        u79.target = v92
    end))
    task.delay(5, function() --[[ Line: 334 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u79
        --]]
        if u80 == u79.sessionId and u79.isAngel then
            u79:cleanUp()
        end
    end)
end
function u35.removeTarget(p103) --[[ Line: 340 ]]
    p103.target = nil
    local v104 = p103.targetIcon
    if v104 ~= nil then
        v104:Destroy()
    end
end
function u35.getTargetTeammates(p105, p106, p107) --[[ Line: 347 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u28
    --]]
    local v108 = {}
    for v109 in p105.lowHealthTeammates do
        local v110 = (v109.Character:GetPivot().Position - p106).Magnitude < p107
        if v110 then
            if v109.Team == u14.LocalPlayer.Team then
                v110 = v109 ~= u14.LocalPlayer
            else
                v110 = false
            end
        end
        if v110 then
            local v111 = u28:getEntity(v109)
            if v111 then
                table.insert(v108, v111)
            end
        end
    end
    return v108
end
function u35.summonAngel(u112) --[[ Line: 367 ]]
    --[[
    Upvalues:
        [1] = u22
        [2] = u14
        [3] = u23
    --]]
    u112.isAngel = true
    u112:destroyAllHealthBar()
    for v113 in u112.lowHealthTeammates do
        u112:createHealthBar(v113)
    end
    u22.On(function(p114, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 373 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u112
        --]]
        local v115 = u14:GetPlayerFromCharacter(p114)
        local v116 = not v115
        if not v116 then
            local v117 = u112.lowHealthTeammates[v115] ~= nil
            v116 = not v117
        end
        if v116 then
            return nil
        end
        u112:updateHealthBar(v115)
    end)
    local u122 = u23.On(function(p118, _, _, _) --[[ Line: 386 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u112
        --]]
        local v119 = u14:GetPlayerFromCharacter(p118)
        local v120 = not v119
        if not v120 then
            local v121 = u112.lowHealthTeammates[v119] ~= nil
            v120 = not v121
        end
        if v120 then
            return nil
        end
        u112:updateHealthBar(v119)
    end)
    u112.maid:GiveTask(function() --[[ Line: 399 ]]
        --[[
        Upvalues:
            [1] = u122
        --]]
        u122()
    end)
end
function u35.destroyAngel(p123) --[[ Line: 403 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u29
        [3] = u14
        [4] = u31
        [5] = u18
    --]]
    local v124 = p123.angel
    if v124 ~= nil then
        v124:Destroy()
    end
    p123.isAngel = false
    u24:dispatch({
        ["type"] = "UnequipItemInHand",
        ["equip"] = true
    })
    local v125 = u29.getInventory(u14.LocalPlayer).hand
    if v125 ~= nil then
        v125 = v125.itemType
    end
    if v125 ~= u31.SCEPTER then
        p123:destroyAllHealthBar()
    end
    local v126 = u18.CurrentCamera
    local v127 = u14.LocalPlayer.Character
    if not v127 then
        return nil
    end
    v126.CameraSubject = v127.Humanoid
end
function u35.cleanUp(p128) --[[ Line: 428 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u32
    --]]
    p128:removeTarget()
    p128.maid:DoCleaning()
    u13:UnbindAction("Paladin Ability")
    if p128.isAngel then
        p128:destroyAngel()
        u32.Client:Get("PaladinAbilityRequest"):SendToServer({
            ["target"] = nil
        })
    end
    if not p128:isEnabled() then
        p128:destroyAllHealthBar()
        local v129 = p128.cleanupDamageConnection
        if v129 ~= nil then
            v129()
        end
        local v130 = p128.healConnection
        if v130 ~= nil then
            v130:Disconnect()
        end
    end
end
function u35.teleportEffect(u131, u132, u133, u134, p135, u136) --[[ Line: 450 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u6
        [3] = u33
        [4] = u15
        [5] = u34
        [6] = u4
        [7] = u18
        [8] = u17
    --]]
    u134.Archivable = true
    if u136 then
        if u132 ~= u14.LocalPlayer then
            u6:playSound(u33.LANI_ASCEND, {
                ["rollOffMaxDistance"] = 70,
                ["volumeMultiplier"] = 1,
                ["position"] = u133
            })
        end
        u15.Assets.Effects.PaladinWings:Clone().Parent = u134
        u34:weldCharacterAccessories(u134)
    else
        u6:playSound(u33.LANI_DASH, {
            ["rollOffMaxDistance"] = 70,
            ["volumeMultiplier"] = 1,
            ["position"] = u133
        })
    end
    local u137 = u134:Clone()
    for _, v138 in u137:GetDescendants() do
        if v138.Name == "cross" then
            v138:Destroy()
        end
        if v138:IsA("BasePart") then
            v138.CanCollide = false
            u4:setQueryIgnored(v138, true)
        end
    end
    local v139 = u132.Character
    if v139 ~= nil then
        v139:SetAttribute("Transparency", 1)
    end
    u137:PivotTo(CFrame.new(p135))
    u137.Parent = u18
    if u132 == u14.LocalPlayer then
        u18.CurrentCamera.CameraSubject = u137.Humanoid
    end
    local v140 = TweenInfo.new(0.4)
    local u141 = u17:Create(u137.PrimaryPart, v140, {
        ["CFrame"] = CFrame.new(u133)
    })
    if u136 then
        u131:playAscendEffect(u134, u137)
        task.delay(0.3, function() --[[ Line: 496 ]]
            --[[
            Upvalues:
                [1] = u141
            --]]
            u141:Play()
        end)
    else
        u131:playLandingEffect(u134, u137)
        u141:Play()
        task.delay(3, function() --[[ Line: 502 ]]
            --[[
            Upvalues:
                [1] = u134
            --]]
            local v142 = u134:WaitForChild("PaladinWings", 3)
            if v142 then
                v142:Destroy()
            end
        end)
    end
    u141.Completed:Connect(function() --[[ Line: 509 ]]
        --[[
        Upvalues:
            [1] = u137
            [2] = u132
            [3] = u136
            [4] = u131
            [5] = u133
            [6] = u6
            [7] = u33
            [8] = u14
            [9] = u18
        --]]
        u137:Destroy()
        local v143 = u132.Character
        if v143 ~= nil then
            v143:SetAttribute("Transparency", 0)
        end
        if not u136 then
            u131:createAura(u133)
            local v144 = {
                ["rollOffMaxDistance"] = 45,
                ["volumeMultiplier"] = 0.5,
                ["position"] = u133
            }
            u6:playSound(u33.LANI_LANDING, v144)
        end
        if u132 == u14.LocalPlayer then
            u18.CurrentCamera.CameraSubject = u14.LocalPlayer.Character.Humanoid
        end
    end)
end
function u35.createHealthBar(_, p145) --[[ Line: 529 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u11
    --]]
    local v146 = u28:getEntity(p145)
    if not v146 then
        return nil
    end
    local v147 = v146:getHealth() / v146:getMaxHealth()
    local v148 = u11
    local v149 = {
        ["Name"] = "Teammate HP bar",
        ["AlwaysOnTop"] = true,
        ["StudsOffset"] = Vector3.new(0, 3, 0),
        ["MaxDistance"] = 600,
        ["Parent"] = v146:getInstance().Head,
        ["Size"] = UDim2.new(8, 10, 1.5, 1),
        ["Adornee"] = v146:getInstance().Head
    }
    local v150 = {}
    local v151 = u11
    local v152 = {
        ["Name"] = "Main HP Bar",
        ["BackgroundTransparency"] = 0.5,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.new(0.5, 0, 0.75, 0),
        ["Size"] = UDim2.new(1, 0, 0.5, 0),
        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
        ["Children"] = { u11("Frame", {
                ["Name"] = "Health",
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.new(0, 0, 0.5, 0),
                ["Size"] = UDim2.new(v147, 0, 1, 0),
                ["BackgroundColor3"] = Color3.fromRGB(3, 207, 3)
            }) }
    }
    __set_list(v150, 1, {v151("Frame", v152)})
    v149.Children = v150
    v148("BillboardGui", v149)
end
function u35.updateHealthBar(_, p153) --[[ Line: 563 ]]
    --[[
    Upvalues:
        [1] = u28
        [2] = u17
    --]]
    local v154 = u28:getEntity(p153)
    if not v154 then
        return nil
    end
    local v155 = p153.Character
    if v155 ~= nil then
        v155 = v155:FindFirstChild("Head")
        if v155 ~= nil then
            v155 = v155:FindFirstChild("Teammate HP bar")
            if v155 ~= nil then
                v155 = v155:FindFirstChild("Main HP Bar")
                if v155 ~= nil then
                    v155 = v155:FindFirstChild("Health")
                end
            end
        end
    end
    if v155 then
        local v156 = v154:getHealth() / v154:getMaxHealth()
        u17:Create(v155, TweenInfo.new(0.2), {
            ["Size"] = UDim2.new(v156, 0, 1, 0)
        }):Play()
        if v156 >= 0.6 then
            v155.BackgroundColor3 = Color3.fromRGB(3, 207, 3)
            return
        end
        if v156 >= 0.4 then
            v155.BackgroundColor3 = Color3.fromRGB(224, 235, 0)
            return
        end
        if v156 >= 0.2 then
            v155.BackgroundColor3 = Color3.fromRGB(242, 166, 0)
            return
        end
        if v156 >= 0 then
            v155.BackgroundColor3 = Color3.fromRGB(207, 3, 3)
        end
    end
end
function u35.destroyAllHealthBar(p157) --[[ Line: 598 ]]
    if p157.isAngel then
        return nil
    end
    for v158 in p157.lowHealthTeammates do
        local v159 = v158.Character
        if v159 ~= nil then
            v159 = v159:FindFirstChild("Head")
            if v159 ~= nil then
                v159 = v159:FindFirstChild("Teammate HP bar")
            end
        end
        if v159 then
            v159:Destroy()
        end
    end
end
function u35.playAscendEffect(_, p160, p161) --[[ Line: 616 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u26
        [3] = u14
    --]]
    local v162 = p161.Humanoid.Animator:LoadAnimation(u27:getAnimation(u26.PALADIN_JUMP))
    v162:AdjustSpeed(3)
    local u163 = p160.Humanoid.Animator:LoadAnimation(u27:getAnimation(u26.PALADIN_JUMP))
    u163:AdjustSpeed(3)
    v162:Play()
    u163:Play()
    u163:GetMarkerReachedSignal("end"):Connect(function() --[[ Line: 625 ]]
        --[[
        Upvalues:
            [1] = u163
        --]]
        local v164 = u163
        if v164 ~= nil then
            v164:AdjustSpeed(0)
        end
    end)
    local v165 = u14:GetPlayerFromCharacter(p160)
    if v165 then
        local u166 = nil
        u166 = v165:GetAttributeChangedSignal("Untargetable"):Connect(function(_) --[[ Line: 635 ]]
            --[[
            Upvalues:
                [1] = u163
                [2] = u166
            --]]
            u163:Stop()
            u163:Destroy()
            u166:Disconnect()
            return nil
        end)
    end
end
function u35.playLandingEffect(_, p167, p168) --[[ Line: 643 ]]
    --[[
    Upvalues:
        [1] = u27
        [2] = u26
    --]]
    local v169 = p168.Humanoid.Animator:LoadAnimation(u27:getAnimation(u26.PALADIN_LAND))
    v169:AdjustSpeed(3)
    local v170 = p167.Humanoid.Animator:LoadAnimation(u27:getAnimation(u26.PALADIN_LAND))
    v170:AdjustSpeed(3)
    v169:Play()
    v170:Play()
end
function u35.createAura(_, p171) --[[ Line: 653 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u18
    --]]
    local u172 = u15.Assets.Effects.PaladinAura:Clone()
    u172.Position = p171 - Vector3.new(0, 2, 0)
    u172.Parent = u18
    for v173, v174 in u172:GetDescendants() do
        local _ = v173 - 1
        if v174:IsA("ParticleEmitter") then
            v174:Emit(30)
        end
    end
    task.delay(1, function() --[[ Line: 669 ]]
        --[[
        Upvalues:
            [1] = u172
        --]]
        u172:Destroy()
    end)
end
u8.CreateController(u35.new())
return nil