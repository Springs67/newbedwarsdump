local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ActionButton
local u5 = v3.GamepadAction
local u6 = v3.RandomUtil
local u7 = v3.SoundManager
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local v9 = v8.KnitClient
local u10 = v8.KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.ReplicatedStorage
local u16 = v13.RunService
local u17 = v13.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u27 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 32 ]]
        return "PlayerVacuumController"
    end,
    ["__index"] = u18
})
u27.__index = u27
function u27.new(...) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u27
    --]]
    local v28 = u27
    local v29 = setmetatable({}, v28)
    return v29:constructor(...) or v29
end
function u27.constructor(p30, ...) --[[ Line: 42 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u11
    --]]
    u18.constructor(p30, ...)
    p30.Name = "PlayerVacuumController"
    p30.maid = u11.new()
    p30.activeVacuumingEffects = {}
    p30.activeProximityPrompts = {}
end
function u27.KnitStart(u31) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u16
        [3] = u17
        [4] = u25
        [5] = u22
        [6] = u7
        [7] = u26
        [8] = u10
        [9] = u6
        [10] = u2
        [11] = u21
        [12] = u14
        [13] = u23
        [14] = u24
    --]]
    u18.KnitStart(u31)
    u16.Heartbeat:Connect(function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u31
            [2] = u17
        --]]
        for v32, v33 in u31.activeVacuumingEffects do
            if u17:GetServerTimeNow() - v33.startTime > 1.5 then
                u31:cleanVacuumingEffect(v32)
            end
        end
    end)
    u25.Client:OnEvent("PlayerReleasedFromVacuum", function(p34) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u7
            [3] = u26
            [4] = u17
            [5] = u10
            [6] = u31
        --]]
        local v35 = u22:getEntity(p34.victimEntityInstance)
        local v36 = u22:getEntity(p34.attackerEntityInstance)
        local v37 = u7
        local v38 = u26.GHOST_VACUUM_SHOOT
        local v39 = {}
        local v40
        if v35 == nil then
            v40 = v35
        else
            v40 = v35:isLocalPlayer()
        end
        local v41
        if v40 then
            v41 = nil
        else
            v41 = p34.victimEntityInstance:GetPrimaryPartCFrame().Position
        end
        v39.position = v41
        v37:playSound(v38, v39)
        local v42
        if v35 == nil then
            v42 = v35
        else
            v42 = v35:isLocalPlayer()
        end
        if v42 then
            v42 = u17.CurrentCamera
        end
        if v42 then
            u17.CurrentCamera.CameraSubject = p34.victimEntityInstance.Humanoid
        end
        local v43
        if v36 == nil then
            v43 = v36
        else
            v43 = v36:isLocalPlayer()
        end
        if v43 then
            local v44 = v36:getInstance():GetPrimaryPartCFrame()
            u10.Controllers.ScreenShakeController:shake(v44.Position, v44 * Vector3.new(-0.25, 0, -1) - v44.Position, {
                ["magnitude"] = 0.15,
                ["duration"] = 0.15,
                ["cycles"] = 2
            })
        end
        if v35 ~= nil then
            v35 = v35:isLocalPlayer()
        end
        if v35 then
            v36 = v35
        elseif v36 ~= nil then
            v36 = v36:isLocalPlayer()
        end
        if v36 then
            local v45 = u31.cooldownbarMaid
            if v45 ~= nil then
                v45:DoCleaning()
            end
        end
    end)
    u25.Client:OnEvent("PlayerVacuumed", function(p46) --[[ Line: 119 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u7
            [3] = u26
            [4] = u6
            [5] = u10
            [6] = u17
            [7] = u2
            [8] = u31
            [9] = u21
        --]]
        local v47 = u22:getEntity(p46.victimEntityInstance)
        local v48 = u22:getEntity(p46.attackerEntityInstance)
        local v49
        if v48 == nil then
            v49 = v48
        else
            v49 = v48:isLocalPlayer()
        end
        local v50
        if v47 == nil then
            v50 = v47
        else
            v50 = v47:isLocalPlayer()
        end
        local v51 = u7
        local v52 = u26.VACUUM_CATCH
        local v53 = {}
        local v54
        if v48 == nil then
            v54 = v48
        else
            v54 = v48:isLocalPlayer()
        end
        if v54 then
            v47 = v54
        elseif v47 ~= nil then
            v47 = v47:isLocalPlayer()
        end
        local v55
        if v47 then
            v55 = nil
        else
            v55 = p46.victimEntityInstance:GetPrimaryPartCFrame().Position
        end
        v53.position = v55
        v51:playSound(v52, v53)
        if v49 then
            u7:playSound(u6.fromList(u26.DAMAGE_1, u26.DAMAGE_2, u26.DAMAGE_3))
            if v48 ~= nil then
                v48 = v48:getInstance():GetPrimaryPartCFrame()
            end
            if v48 then
                u10.Controllers.ScreenShakeController:shake(v48.Position, v48 * Vector3.new(-0.25, 0, -1) - v48.Position, {
                    ["magnitude"] = 0.15,
                    ["duration"] = 0.15,
                    ["cycles"] = 2
                })
            end
        end
        if v50 and u17.CurrentCamera then
            u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendInfoNotification({
                ["message"] = "You are stuck in " .. p46.attackerEntityInstance.Name .. "\'s vacuum for the next few seconds!"
            })
            u17.CurrentCamera.CameraSubject = p46.attackerEntityInstance.Humanoid
        end
        if v49 or v50 then
            u31.cooldownbarMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(u21.PLAYER_VACUUM)
            u2.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(u21.PLAYER_VACUUM, p46.expirationTime - u17:GetServerTimeNow(), {
                ["cooldownBar"] = {
                    ["color"] = Color3.fromRGB(54, 145, 224)
                }
            })
            local u56 = u7:playSound(u26.ACTIVE_VACUUM_LOOP, {
                ["looped"] = true,
                ["volumeMultiplier"] = 0.1
            })
            u31.cooldownbarMaid:GiveTask(function() --[[ Line: 188 ]]
                --[[
                Upvalues:
                    [1] = u56
                --]]
                if u56 then
                    u56:Destroy()
                end
            end)
            task.delay(p46.expirationTime - u17:GetServerTimeNow(), function() --[[ Line: 193 ]]
                --[[
                Upvalues:
                    [1] = u31
                --]]
                local v57 = u31.cooldownbarMaid
                if v57 ~= nil then
                    v57:DoCleaning()
                end
            end)
        end
    end)
    u25.Client:OnEvent("PlayerVacuuming", function(p58) --[[ Line: 201 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u23
            [3] = u24
            [4] = u31
        --]]
        local v59 = u14:GetPlayerFromCharacter(p58.attacker)
        if v59 == nil then
            return nil
        else
            local v60 = u23.getInventory(v59).hand
            if v60 == nil or v60.itemType ~= u24.PLAYER_VACUUM then
                return nil
            elseif p58.action == "Start" then
                u31:cleanVacuumingEffect(v59)
                u31:createVacuumingEffect(v59, p58.attacker, p58.victim)
            elseif p58.action == "Stop" then
                u31:cleanVacuumingEffect(v59)
            end
        end
    end)
end
function u27.isRelevantItem(_, p61) --[[ Line: 218 ]]
    --[[
    Upvalues:
        [1] = u24
    --]]
    return p61.itemType == u24.PLAYER_VACUUM
end
function u27.onEnable(u62, _, _) --[[ Line: 221 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u22
        [3] = u2
        [4] = u12
        [5] = u4
        [6] = u25
        [7] = u5
        [8] = u14
        [9] = u10
        [10] = u20
        [11] = u19
    --]]
    u62.maid = u11.new()
    local u63 = u22:getLocalPlayerEntity()
    if u63 ~= nil then
        u63 = u63:getInstance()
    end
    if u63 then
        u62.maid:GiveTask(u63:GetAttributeChangedSignal("PlayerStoredInVacuum"):Connect(function() --[[ Line: 229 ]]
            --[[
            Upvalues:
                [1] = u63
                [2] = u62
                [3] = u2
                [4] = u12
                [5] = u4
                [6] = u25
                [7] = u5
            --]]
            if u63:GetAttribute("PlayerStoredInVacuum") == true then
                for v64 in u62.activeProximityPrompts do
                    v64.Enabled = false
                end
                u62.uiMaid = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u12.createElement(u4, {
                    ["actionName"] = "vacuum-release",
                    ["text"] = "Release Player Early",
                    ["priority"] = 50,
                    ["onActivated"] = function() --[[ Name: onActivated, Line 236 ]]
                        --[[
                        Upvalues:
                            [1] = u25
                        --]]
                        u25.Client:Get("UseVacuum"):SendToServer({
                            ["action"] = "Release"
                        })
                    end,
                    ["interactionKey"] = Enum.KeyCode.X,
                    ["gamepadInteractionKey"] = u5.CloseMenu
                }))
            else
                for v65 in u62.activeProximityPrompts do
                    v65.Enabled = true
                end
                if u62.uiMaid then
                    u62.uiMaid:DoCleaning()
                    u62.uiMaid = nil
                end
            end
        end))
    end
    for _, u66 in u22:getAliveEntityInstances() do
        if u66:GetAttribute("Team") ~= u14.LocalPlayer:GetAttribute("Team") and u66.PrimaryPart then
            local u67 = u11.new()
            u62.activeProximityPrompts[u10.Controllers.ProximityPromptController:createProximityPrompt({
                ["Name"] = "VacuumProximityPrompt",
                ["ActionText"] = "Vacuum",
                ["Enabled"] = true,
                ["HoldDuration"] = 1.5,
                ["MaxActivationDistance"] = 16,
                ["RequiresLineOfSight"] = false,
                ["ObjectText"] = u66.Name,
                ["PromptButtonHoldBegan"] = function() --[[ Name: PromptButtonHoldBegan, Line 268 ]]
                    --[[
                    Upvalues:
                        [1] = u20
                        [2] = u14
                        [3] = u19
                        [4] = u67
                        [5] = u25
                        [6] = u66
                    --]]
                    local u68 = u20:playAnimation(u14.LocalPlayer, u19.PLAYER_VACUUM_SUCK, {
                        ["looped"] = true
                    })
                    if u68 then
                        u67:GiveTask(function() --[[ Line: 273 ]]
                            --[[
                            Upvalues:
                                [1] = u68
                            --]]
                            return u68:Stop()
                        end)
                    end
                    local v69 = {
                        ["action"] = "BeginCharging",
                        ["entityInstance"] = u66
                    }
                    u25.Client:Get("UseVacuum"):SendToServer(v69)
                end,
                ["PromptButtonHoldEnded"] = function() --[[ Name: PromptButtonHoldEnded, Line 282 ]]
                    --[[
                    Upvalues:
                        [1] = u67
                        [2] = u25
                        [3] = u66
                    --]]
                    u67:DoCleaning()
                    local v70 = {
                        ["action"] = "StopCharging",
                        ["entityInstance"] = u66
                    }
                    u25.Client:Get("UseVacuum"):SendToServer(v70)
                end,
                ["Triggered"] = function() --[[ Name: Triggered, Line 289 ]]
                    --[[
                    Upvalues:
                        [1] = u25
                        [2] = u66
                    --]]
                    local v71 = {
                        ["action"] = "Suck",
                        ["entityInstance"] = u66
                    }
                    u25.Client:Get("UseVacuum"):SendToServer(v71)
                end,
                ["Parent"] = u66.PrimaryPart
            })] = true
        end
    end
end
function u27.onDisable(p72) --[[ Line: 302 ]]
    p72.maid:DoCleaning()
    local v73 = p72.uiMaid
    if v73 ~= nil then
        v73:DoCleaning()
    end
    for v74 in p72.activeProximityPrompts do
        v74:Destroy()
    end
end
function u27.cleanVacuumingEffect(p75, p76) --[[ Line: 312 ]]
    local v77 = p75.activeVacuumingEffects[p76]
    if v77 then
        p75.activeVacuumingEffects[p76] = nil
        v77.beam:Destroy()
        v77.sound:Destroy()
        local v78 = v77.shakeMaid
        if v78 ~= nil then
            v78:DoCleaning()
        end
    end
end
function u27.createVacuumingEffect(p79, p80, p81, p82) --[[ Line: 328 ]]
    --[[
    Upvalues:
        [1] = u23
        [2] = u14
        [3] = u7
        [4] = u26
        [5] = u10
        [6] = u15
        [7] = u17
    --]]
    local v83 = u23.getInventory(p80).hand
    if v83 == nil then
        return nil
    end
    local v84 = p80 == u14.LocalPlayer
    local v85 = u7
    local v86 = u26.GHOST_VACUUM_SUCKING_LOOP
    local v87 = {}
    local v88
    if v84 then
        v88 = nil
    else
        v88 = p81:GetPrimaryPartCFrame().Position
    end
    v87.position = v88
    local v89
    if v84 then
        v89 = nil
    else
        v89 = p81.PrimaryPart
    end
    v87.parent = v89
    local v90 = v85:playSound(v86, v87)
    if v90 == nil then
        return nil
    end
    local v91
    if v84 == true then
        local v92 = p82:GetPrimaryPartCFrame()
        v91 = u10.Controllers.ScreenShakeController:shake(v92.Position, v92 * Vector3.new(-0.25, 0, -1) - v92.Position, {
            ["magnitude"] = 0.2,
            ["duration"] = 1.5,
            ["cycles"] = 40
        })
    else
        v91 = nil
    end
    local v93 = u15.Assets.Effects.VacuumBeam:Clone()
    v93.Name = "PlayerVacuumBeam"
    local v94 = v83.tool:FindFirstChild("Handle")
    if v94 ~= nil then
        v94 = v94:FindFirstChild("BeamAttachment")
    end
    v93.Attachment0 = v94
    v93.Attachment1 = p82.HumanoidRootPart.RootRigAttachment
    v93.Parent = p81
    p79.activeVacuumingEffects[p80] = {
        ["startTime"] = u17:GetServerTimeNow(),
        ["beam"] = v93,
        ["sound"] = v90,
        ["shakeMaid"] = v91
    }
end
v9.CreateController(u27.new())
return nil