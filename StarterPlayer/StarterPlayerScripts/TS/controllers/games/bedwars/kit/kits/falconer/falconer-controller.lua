local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AbilityState
local u5 = v3.DeviceUtil
local u6 = v3.MobileTouchType
local u7 = v3.SoundManager
local u8 = v3.WatchCollectionTag
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.ContextActionService
local u14 = v12.Players
local u15 = v12.ReplicatedStorage
local u16 = v12.RunService
local u17 = v12.Workspace
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "ability-indicator", "ability-indicator-util").AbilityIndicatorUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local v24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "falconer", "falcon-constants")
local u25 = v24.SEND_BIRD_MIN_HEALTH
local u26 = v24.SEND_BIRD_RANGE
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-tags").StatefulEntityTag
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u32 = v1.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController
local u33 = v1.import(script, script.Parent, "falcon-client").FalconClient
local u34 = v1.import(script, script.Parent, "falcon-healthbar-app").FalconHealthbarAppWrapper
local u35 = Color3.fromRGB(4, 175, 236)
local u36 = Color3.fromRGB(219, 97, 99)
local u37 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 43 ]]
        return "FalconerController"
    end,
    ["__index"] = u32
})
u37.__index = u37
function u37.new(...) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u37
    --]]
    local v38 = u37
    local v39 = setmetatable({}, v38)
    return v39:constructor(...) or v39
end
function u37.constructor(p40) --[[ Line: 53 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u23
        [3] = u17
        [4] = u10
    --]]
    u32.constructor(p40, u23.FALCONER)
    p40.Name = "FalconerController"
    p40.camera = u17.CurrentCamera
    p40.maid = u10.new()
    p40.indicatorShown = false
    p40.ownerFalconMap = {}
end
function u37.KnitStart(p41) --[[ Line: 61 ]]
    --[[
    Upvalues:
        [1] = u32
        [2] = u17
    --]]
    u32.KnitStart(p41)
    p41.camera = u17.CurrentCamera
end
function u37.onKitLocalActivated(u42, u43) --[[ Line: 65 ]]
    --[[
    Upvalues:
        [1] = u18
        [2] = u20
        [3] = u9
        [4] = u14
        [5] = u23
        [6] = u21
        [7] = u27
        [8] = u28
        [9] = u25
    --]]
    u43:GiveTask(u18.CanUseLocalAbility:connect(function(p44) --[[ Line: 67 ]]
        --[[
        Upvalues:
            [1] = u20
            [2] = u9
            [3] = u14
            [4] = u23
            [5] = u21
        --]]
        if p44.ability ~= u20.SEND_FALCON and p44.ability ~= u20.RECALL_FALCON then
            return nil
        end
        if not u9.Controllers.KitController:isUsingKit(u14.LocalPlayer, u23.FALCONER) then
            return nil
        end
        local v45 = u21:getEntity(p44.userCharacter)
        if v45 ~= nil then
            v45 = v45:isAlive()
        end
        if not v45 then
            p44:setCancelled(true)
        end
    end))
    u43:GiveTask(u18.MatchStateChange:connect(function(p46) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u14
            [3] = u23
            [4] = u27
            [5] = u42
        --]]
        if not u9.Controllers.KitController:isUsingKit(u14.LocalPlayer, u23.FALCONER) then
            return nil
        end
        if p46.matchState ~= u27.RUNNING then
            return nil
        end
        u42:disableRecallFalcon(u14.LocalPlayer)
    end))
    u28.Client:OnEvent("MonitorFalconHealth", function() --[[ Line: 94 ]]
        --[[
        Upvalues:
            [1] = u42
            [2] = u14
            [3] = u25
        --]]
        u42:disableSendFalcon(u14.LocalPlayer)
        local u47 = nil
        u47 = u42.falconInstance:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 97 ]]
            --[[
            Upvalues:
                [1] = u42
                [2] = u25
                [3] = u14
                [4] = u47
            --]]
            if not u42.falconInstance then
                return nil
            end
            if u25 <= u42.falconInstance:GetAttribute("Health") then
                u42:enableSendFalcon(u14.LocalPlayer)
                u47:Disconnect()
            end
        end)
    end):andThen(function(p48) --[[ Line: 108 ]]
        --[[
        Upvalues:
            [1] = u43
        --]]
        u43:GiveTask(p48)
    end)
    u42:mountFalconHealthbarGui()
    u42:disableRecallFalcon(u14.LocalPlayer)
end
function u37.onKitLocalDeactivated(p49) --[[ Line: 116 ]]
    p49:unmountFalconHealthbarGui()
end
function u37.onKitReplicationActivated(u50, u51) --[[ Line: 119 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u30
        [3] = u14
        [4] = u28
    --]]
    u51:GiveTask(u8(u30.FALCON, function(p52) --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u50
        --]]
        local v53 = p52:GetAttribute("OwnerId")
        if v53 == nil then
            return nil
        end
        local v54 = tonumber(v53)
        if v54 == nil then
            return nil
        end
        local v55 = u14:GetPlayerByUserId(v54)
        if not v55 then
            return nil
        end
        local v56 = u50:spawnFalcon(p52, v55)
        u50.ownerFalconMap[v55] = v56
    end))
    u28.Client:OnEvent("SendFalcon", function(p57) --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v58 = u50.ownerFalconMap[p57.player]
        if not v58 then
            return nil
        end
        v58:setStrikeZoneEpicenter(p57.strikeZoneEpicenter)
    end):andThen(function(p59) --[[ Line: 146 ]]
        --[[
        Upvalues:
            [1] = u51
        --]]
        u51:GiveTask(p59)
    end)
    u51:GiveTask(u28.Client:Get("FalconsEyeMarked"):Connect(function(p60) --[[ Line: 150 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v61 = u50.ownerFalconMap[p60.giver]
        if not v61 then
            return nil
        end
        v61:setTarget(p60.target)
    end))
    u51:GiveTask(u28.Client:Get("FalconsEyeUnmarked"):Connect(function(p62) --[[ Line: 159 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v63 = u50.ownerFalconMap[p62.giver]
        if not v63 then
            return nil
        end
        v63:setTarget(nil)
    end))
    u51:GiveTask(u28.Client:Get("FalconPositionSync"):Connect(function(p64, p65) --[[ Line: 168 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v66 = u50.ownerFalconMap[p64]
        if not v66 then
            return nil
        end
        v66:setPosition(p65)
    end))
end
function u37.onKitReplicationDeactivated(_) --[[ Line: 178 ]] end
function u37.onInnateAbilityEnabled(_, _, _) --[[ Line: 180 ]] end
function u37.onAbilityUsed(p67, p68, p69) --[[ Line: 182 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u9
        [3] = u23
        [4] = u20
        [5] = u7
        [6] = u29
        [7] = u28
    --]]
    if p68 == u14.LocalPlayer.Character then
        if p69:isCancelled() then
            return nil
        elseif u9.Controllers.KitController:isUsingKit(u14.LocalPlayer, u23.FALCONER) then
            if p69.userCharacter == u14.LocalPlayer.Character then
                if p69.ability == u20.RECALL_FALCON then
                    u7:playSound(u29.FALCONER_RECALL_FALCON, {
                        ["rollOffMaxDistance"] = 50,
                        ["position"] = p69.userCharacter:GetPivot().Position
                    })
                    u28.Client:Get("RecallFalconRequested"):SendToServer()
                    return
                elseif p69.ability == u20.ACTIVATE_FALCON_INDICATOR then
                    if p67.indicator then
                        local v70 = u14.LocalPlayer.Character
                        if v70 ~= nil then
                            v70:SetAttribute("Transparency", 0)
                        end
                        p67:setIndicatorTransparency(1)
                        p67.maid:DoCleaning()
                        p67:disableIndicator(true)
                    else
                        p67:activateIndicator()
                    end
                else
                    if p69.ability == u20.SEND_FALCON then
                        local v71 = u14.LocalPlayer.Character
                        if v71 ~= nil then
                            v71:SetAttribute("Transparency", 0)
                        end
                        p67:setIndicatorTransparency(1)
                        p67.maid:DoCleaning()
                        p67:disableIndicator(true)
                        p67:enableRecallFalcon(u14.LocalPlayer)
                    end
                    return
                end
            else
                return nil
            end
        else
            return nil
        end
    else
        return nil
    end
end
function u37.disableRecallFalcon(p72, p73) --[[ Line: 224 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u20
        [4] = u4
    --]]
    if p73 ~= u14.LocalPlayer then
        return nil
    end
    p72.recallFalconAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u20.RECALL_FALCON)
    if not p72.recallFalconAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p72.recallFalconAbility, u4.DISABLED)
end
function u37.enableRecallFalcon(p74, p75) --[[ Line: 234 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u4
    --]]
    if p75 ~= u14.LocalPlayer then
        return nil
    end
    if not p74.recallFalconAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p74.recallFalconAbility, u4.READY)
end
function u37.disableSendFalcon(p76, p77) --[[ Line: 243 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u20
        [4] = u4
    --]]
    if p77 ~= u14.LocalPlayer then
        return nil
    end
    p76.sendFalconAbility = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):getEnabledAbility(u20.ACTIVATE_FALCON_INDICATOR)
    if not p76.sendFalconAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p76.sendFalconAbility, u4.DISABLED)
end
function u37.enableSendFalcon(p78, p79) --[[ Line: 253 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u2
        [3] = u4
    --]]
    if p79 ~= u14.LocalPlayer then
        return nil
    end
    if not p78.sendFalconAbility then
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):setAbilityState(p78.sendFalconAbility, u4.READY)
end
function u37.activateIndicator(u80) --[[ Line: 262 ]]
    --[[
    Upvalues:
        [1] = u14
        [2] = u15
        [3] = u17
        [4] = u2
        [5] = u20
        [6] = u28
        [7] = u6
        [8] = u16
        [9] = u5
        [10] = u22
        [11] = u26
        [12] = u35
        [13] = u36
    --]]
    local v81 = u14.LocalPlayer.Character
    if v81 ~= nil then
        v81:SetAttribute("Transparency", 0.9)
    end
    if u80.indicator then
        return nil
    end
    u80.indicator = u15.Assets.Misc.FalconerIndicator:Clone()
    u80.indicator.Parent = u17
    local u82 = Vector3.new()
    local v83 = u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController")
    local v89 = {
        ["action"] = "Attack",
        ["actionId"] = "Send Falcon",
        ["boundFunction"] = function(_, _, p84) --[[ Name: boundFunction, Line 277 ]]
            --[[
            Upvalues:
                [1] = u82
                [2] = u2
                [3] = u20
                [4] = u28
            --]]
            if not u82 then
                return nil
            end
            local v85 = {
                ["target"] = u82
            }
            u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u20.SEND_FALCON, p84, v85)
            local v86 = {
                ["strikeZoneEpicenter"] = u82
            }
            u28.Client:Get("SendFalconRequested"):SendToServer(v86)
        end,
        ["mobile"] = {
            ["touchType"] = u6.TouchTap,
            ["mobileBoundFunction"] = function() --[[ Name: mobileBoundFunction, Line 290 ]]
                --[[
                Upvalues:
                    [1] = u82
                    [2] = u2
                    [3] = u20
                    [4] = u28
                --]]
                if not u82 then
                    return nil
                end
                local v87 = {
                    ["target"] = u82
                }
                u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):useAbility(u20.SEND_FALCON, nil, v87)
                local v88 = {
                    ["strikeZoneEpicenter"] = u82
                }
                u28.Client:Get("SendFalconRequested"):SendToServer(v88)
            end
        }
    }
    local v90 = v83:bindAction(v89)
    u80.maid:GiveTask(v90)
    local u91 = nil
    u91 = u16.Heartbeat:Connect(function() --[[ Line: 305 ]]
        --[[
        Upvalues:
            [1] = u80
            [2] = u91
            [3] = u14
            [4] = u5
            [5] = u82
            [6] = u22
            [7] = u26
            [8] = u35
            [9] = u36
        --]]
        if u80.camera then
            if u80.indicator then
                local v92 = u14.LocalPlayer.Character
                if v92 ~= nil then
                    v92 = v92:GetPivot().Position
                end
                if v92 then
                    local v93 = u14.LocalPlayer:GetMouse().UnitRay
                    local v94
                    if u5.isMobileControls() then
                        v94 = u80.camera.CFrame.LookVector.Unit
                    else
                        v94 = v93.Direction
                    end
                    u82 = u22:calculateBlockTargetPoint(u80.camera.CFrame.Position, v94, u26, v92)
                    if u82 then
                        local v95 = u80.camera.CFrame.Position.X
                        local v96 = u82.Y
                        local v97 = u80.camera.CFrame.Position.Z
                        local v98 = Vector3.new(v95, v96, v97)
                        u80.indicator:PivotTo(CFrame.lookAt(u82, v98) * CFrame.Angles(0, 3.141592653589793, 0))
                        if not u80.indicatorShown then
                            u80:setIndicatorTransparency(0)
                            u80.indicatorShown = true
                        end
                        local v99 = u35
                        if (u82 - v92).Magnitude > 125 then
                            v99 = u36
                        end
                        for v100, v101 in u80.indicator:GetChildren() do
                            local _ = v100 - 1
                            if v101:IsA("BasePart") then
                                v101.Color = v99
                            end
                        end
                    elseif u80.indicatorShown then
                        u80:setIndicatorTransparency(1)
                        u80.indicatorShown = false
                    end
                else
                    return nil
                end
            else
                u91:Disconnect()
                return nil
            end
        else
            return nil
        end
    end)
end
function u37.disableIndicator(p102, p103) --[[ Line: 356 ]]
    --[[
    Upvalues:
        [1] = u13
        [2] = u14
    --]]
    local v104 = p102.indicator
    if v104 ~= nil then
        v104:Destroy()
    end
    p102.indicator = nil
    u13:UnbindAction("Send Falcon")
    if p103 then
        return nil
    end
    local v105 = u14.LocalPlayer.Character
    if v105 ~= nil then
        v105:SetAttribute("Transparency", 0)
    end
end
function u37.setIndicatorTransparency(p106, p107) --[[ Line: 371 ]]
    if not p106.indicator then
        return nil
    end
    for v108, v109 in p106.indicator:GetChildren() do
        local _ = v108 - 1
        if v109:IsA("Part") or (v109:IsA("MeshPart") or v109:IsA("UnionOperation")) then
            v109.Transparency = p107
        end
    end
end
function u37.mountFalconHealthbarGui(p110) --[[ Line: 385 ]]
    --[[
    Upvalues:
        [1] = u19
        [2] = u34
    --]]
    if not p110.falconInstance then
        return nil
    end
    p110:unmountFalconHealthbarGui()
    p110.falconHealthbarGui = u19("FalconHealthbar", u34, {
        ["instance"] = p110.falconInstance
    })
end
function u37.unmountFalconHealthbarGui(p111) --[[ Line: 396 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    if p111.falconHealthbarGui then
        u11.unmount(p111.falconHealthbarGui)
    end
end
function u37.setFalconReference(p112, p113) --[[ Line: 402 ]]
    p112.falconInstance = p113
    p112:mountFalconHealthbarGui()
end
function u37.spawnFalcon(_, p114, p115) --[[ Line: 406 ]]
    --[[
    Upvalues:
        [1] = u31
        [2] = u33
    --]]
    local v116 = u31:getGameEntityCFrame(p114)
    local v117 = p114:GetAttribute("EntityUUID")
    return u33.new(v116, v117, p114, p115)
end
u9.CreateController(u37.new())
return nil