local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src")
local u4 = v3.KnitClient
local u5 = v3.KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u10 = v9.CollectionService
local u11 = v9.Players
local u12 = v9.RunService
local u13 = v9.UserInputService
local u14 = v9.Workspace
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "network").EntityDamageEventZap
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "turret", "turret-id").TurretId
local u24 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "vulcan", "vulcan-util").VulcanUtil
local u27 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType
local u30 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u31 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil
local u32 = v1.import(script, script.Parent, "ui", "engineer-camera-view").EngineerCameraViewWrapper
local u33 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 39 ]]
        return "EngineerTabletController"
    end,
    ["__index"] = u16
})
u33.__index = u33
function u33.new(...) --[[ Line: 45 ]]
    --[[
    Upvalues:
        [1] = u33
    --]]
    local v34 = u33
    local v35 = setmetatable({}, v34)
    return v35:constructor(...) or v35
end
function u33.constructor(p36) --[[ Line: 49 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u6
    --]]
    u16.constructor(p36)
    p36.Name = "EngineerTabletController"
    p36.nextAllowActivation = -1
    p36.maid = u6.new()
    p36.isTabletSessionActive = false
    p36.areTabletAbilitiesEnabled = false
end
function u33.KnitStart(p37) --[[ Line: 57 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u19
        [3] = u29
    --]]
    u16.KnitStart(p37)
    u19.changed:connect(function(p38, p39) --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u29
            [2] = u19
        --]]
        local v40 = p38.Game.selectedTurret
        local v41 = p39.Game.selectedTurret
        if v40 == nil and v40 ~= v41 then
            local v42 = p38.Inventory.observedInventory.inventory.hand
            if v42 ~= nil then
                v42 = v42.itemType
            end
            if v42 == u29.TABLET then
                return nil
            end
            u19:dispatch({
                ["type"] = "InventorySelectHotbarSlot",
                ["slot"] = 0
            })
        end
    end)
end
function u33.closeTurretCameraView(p43) --[[ Line: 78 ]]
    p43.maid:DoCleaning()
end
function u33.getOwnedVulcanTurretCount(_) --[[ Line: 81 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u23
        [3] = u11
    --]]
    local v44 = 0
    local v45 = {}
    for v46, v47 in u10:GetTagged(u23.VULCAN_TURRET) do
        local _ = v46 - 1
        if v47:GetAttribute("PlacedByUserId") == u11.LocalPlayer.UserId == true then
            v44 = v44 + 1
            v45[v44] = v47
        end
    end
    return #v45
end
function u33.attemptToActivate(u48) --[[ Line: 99 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u2
        [3] = u5
        [4] = u22
        [5] = u11
        [6] = u21
        [7] = u4
        [8] = u18
        [9] = u32
        [10] = u8
        [11] = u17
    --]]
    if time() < u48.nextAllowActivation then
        return false
    end
    u48.nextAllowActivation = time() + 1
    if u24:getLocalPlayerEntity() == nil then
        warn("Could not find entity for localplayer")
        return false
    end
    if u48:getOwnedVulcanTurretCount() == 0 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/notification-controller@NotificationController"):sendErrorNotification({
            ["message"] = "You do not have any turrets placed yet."
        })
        return false
    end
    local u49 = u5.Controllers.SprintController:getMovementStatusModifier():addModifier({
        ["blockSprint"] = true,
        ["moveSpeedMultiplier"] = 0
    })
    u48:setTabletAbilitiesEnabled(false)
    u48.maid:GiveTask(function() --[[ Line: 121 ]]
        --[[
        Upvalues:
            [1] = u48
            [2] = u49
        --]]
        if u48.isTabletSessionActive then
            u48:setTabletAbilitiesEnabled(true)
        end
        u49.Destroy()
    end)
    local u50 = u22:playAnimation(u11.LocalPlayer, u21.USE_TABLET, {
        ["looped"] = true
    })
    u48.maid:GiveTask(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u50
        --]]
        local v51 = u50
        if v51 ~= nil then
            v51:Stop()
        end
    end)
    local u52 = u4.Controllers.ViewmodelController:addDisabler()
    u48.maid:GiveTask(function() --[[ Line: 137 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u52
        --]]
        u4.Controllers.ViewmodelController:removeDisabler(u52)
    end)
    local u53 = u18("EngineerCameraView", u32)
    u48.maid:GiveTask(function() --[[ Line: 141 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u53
        --]]
        u8.unmount(u53)
    end)
    local u55 = u17.On(function(p54, _, _, _, _, _, _, _, _, _, _, _, _, _) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u48
        --]]
        if u11.LocalPlayer.Character and p54 == u11.LocalPlayer.Character then
            u48.maid:DoCleaning()
        end
    end)
    u48.maid:GiveTask(function() --[[ Line: 149 ]]
        --[[
        Upvalues:
            [1] = u55
        --]]
        return u55()
    end)
    return true
end
function u33.onEnable(u56, _, u57) --[[ Line: 154 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u2
        [3] = u20
        [4] = u27
        [5] = u28
        [6] = u29
        [7] = u15
        [8] = u4
        [9] = u11
        [10] = u25
        [11] = u30
        [12] = u12
        [13] = u14
        [14] = u24
        [15] = u31
        [16] = u26
        [17] = u7
    --]]
    u56:setupYield(function() --[[ Line: 155 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u56
            [3] = u2
            [4] = u20
            [5] = u27
            [6] = u28
            [7] = u29
            [8] = u15
            [9] = u4
            [10] = u11
            [11] = u25
            [12] = u30
            [13] = u12
            [14] = u57
            [15] = u14
            [16] = u24
            [17] = u31
            [18] = u26
            [19] = u7
        --]]
        local u58 = u6.new()
        u56.isTabletSessionActive = true
        u58:GiveTask(u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.VULCAN_ARTILLERY_MARK, {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = u27.TURRET_CROSSHAIR
            }
        }):expect())
        u56.areTabletAbilitiesEnabled = true
        local v59 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v60 = u20.VULCAN_TABLET_TURRET_CONTROL
        local v61 = {}
        local v62 = {}
        local v63 = u28(u29.TABLET).image
        v62.icon = v63 == nil and "" or v63
        v61.abilityButton = v62
        v61.abilityType = "KitSecondary"
        u58:GiveTask(v59:enableAbility(v60, v61):expect())
        u58:GiveTask(u15.CanUseLocalAbility:connect(function(p64) --[[ Line: 180 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u4
                [3] = u11
                [4] = u25
                [5] = u56
            --]]
            if p64.ability ~= u20.VULCAN_ARTILLERY_MARK and p64.ability ~= u20.VULCAN_TABLET_TURRET_CONTROL then
                return nil
            end
            if not u4.Controllers.KitController:isUsingKit(u11.LocalPlayer, u25.VULCAN) then
                return nil
            end
            if p64.ability == u20.VULCAN_ARTILLERY_MARK then
                if not u56.target then
                    p64:setCancelled(true)
                    return
                end
            elseif u56:getOwnedVulcanTurretCount() == 0 then
                p64:setCancelled(true)
            end
        end))
        u58:GiveTask(u15.AbilityUsed:connect(function(p65) --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u4
                [3] = u25
                [4] = u20
                [5] = u56
                [6] = u30
            --]]
            if p65.userCharacter == u11.LocalPlayer.Character then
                if u4.Controllers.KitController:isUsingKit(u11.LocalPlayer, u25.VULCAN) then
                    if p65.ability == u20.VULCAN_ARTILLERY_MARK then
                        if not u56.target then
                            return nil
                        end
                        local v66 = u11:GetPlayerFromCharacter(u56.target)
                        if not v66 then
                            return nil
                        end
                        u30.Client:Get("VulcanArtilleryMark"):CallServer(v66)
                    elseif p65.ability == u20.VULCAN_TABLET_TURRET_CONTROL then
                        u56:attemptToActivate()
                    end
                else
                    return nil
                end
            else
                return nil
            end
        end))
        u58:GiveTask(u12.Heartbeat:Connect(function() --[[ Line: 215 ]]
            --[[
            Upvalues:
                [1] = u57
                [2] = u14
                [3] = u56
                [4] = u24
                [5] = u31
                [6] = u26
                [7] = u7
            --]]
            if not u57() then
                return nil
            end
            local v67 = u14.CurrentCamera
            if v67 ~= nil then
                v67 = v67.CFrame
            end
            if not v67 then
                u56:removeTarget()
                return nil
            end
            local v68 = u24:getLocalPlayerEntity()
            if not v68 then
                u56:removeTarget()
                return nil
            end
            local v69 = v67 * Vector3.new(0, 0, -20)
            local v70 = u31.getEntitiesWithinRadius(v69, 20)
            local v71 = Ray.new(v67.Position, v67.LookVector).Unit
            local v72 = (1 / 0)
            local v73 = nil
            for _, v74 in v70 do
                if v68:canAttack(v74) then
                    local v75 = v74:getInstance():GetPrimaryPartCFrame().Position
                    local v76 = v71:ClosestPoint(v75)
                    local v77 = (v75 - v76).Magnitude
                    if v77 <= 6 then
                        local v78 = v77 + (v71.Origin - v76).Magnitude / 3
                        if v78 < v72 then
                            v73 = v74:getInstance()
                            v72 = v78
                        end
                    end
                end
            end
            local v79 = v68:getInstance().PrimaryPart
            local v80
            if v73 == nil then
                v80 = v73
            else
                v80 = v73.PrimaryPart
            end
            local v81
            if v73 then
                v81 = not (v79 and v80) or (v79.Position - v80.Position).Magnitude > u26.NEARBY_TURRET_RANGE + 6
            else
                v81 = v73
            end
            if v81 then
                v73 = nil
            end
            if u56.target ~= v73 then
                u56:removeTarget()
                if v73 then
                    u56.targetIcon = u7("BillboardGui", {
                        ["AlwaysOnTop"] = true,
                        ["Parent"] = v73.PrimaryPart,
                        ["Size"] = UDim2.new(0.8, 10, 0.8, 10),
                        ["Children"] = { u7("ImageLabel", {
                                ["Image"] = "rbxassetid://9429977101",
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["ScaleType"] = Enum.ScaleType.Fit,
                                ["ImageColor3"] = Color3.fromRGB(255, 37, 222)
                            }) }
                    })
                end
            end
            u56.target = v73
        end))
        return function() --[[ Line: 294 ]]
            --[[
            Upvalues:
                [1] = u56
                [2] = u58
            --]]
            u56.isTabletSessionActive = false
            u56.areTabletAbilitiesEnabled = false
            u58:DoCleaning()
            u56:removeTarget()
        end
    end)
end
function u33.isRelevantItem(_, p82) --[[ Line: 302 ]]
    --[[
    Upvalues:
        [1] = u29
    --]]
    return p82.itemType == u29.TABLET
end
function u33.onDisable(p83) --[[ Line: 305 ]]
    --[[
    Upvalues:
        [1] = u13
    --]]
    p83.isTabletSessionActive = false
    p83.areTabletAbilitiesEnabled = false
    p83:removeTarget()
    p83.maid:DoCleaning()
    task.defer(function() --[[ Line: 310 ]]
        --[[
        Upvalues:
            [1] = u13
        --]]
        u13.MouseIconEnabled = true
        u13.MouseBehavior = Enum.MouseBehavior.Default
    end)
end
function u33.removeTarget(p84) --[[ Line: 315 ]]
    p84.target = nil
    local v85 = p84.targetIcon
    if v85 ~= nil then
        v85:Destroy()
    end
    p84.targetIcon = nil
end
function u33.setTabletAbilitiesEnabled(p86, p87) --[[ Line: 323 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u20
        [3] = u27
        [4] = u28
        [5] = u29
    --]]
    if p86.areTabletAbilitiesEnabled == p87 then
        return nil
    end
    p86.areTabletAbilitiesEnabled = p87
    if p87 then
        u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(u20.VULCAN_ARTILLERY_MARK, {
            ["abilityType"] = "KitPrimary",
            ["abilityButton"] = {
                ["icon"] = u27.TURRET_CROSSHAIR
            }
        }):expect()
        local v88 = u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController")
        local v89 = u20.VULCAN_TABLET_TURRET_CONTROL
        local v90 = {}
        local v91 = {}
        local v92 = u28(u29.TABLET).image
        v91.icon = v92 == nil and "" or v92
        v90.abilityButton = v91
        v90.abilityType = "KitSecondary"
        v88:enableAbility(v89, v90):expect()
        return nil
    end
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u20.VULCAN_ARTILLERY_MARK)
    u2.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):disableAbility(u20.VULCAN_TABLET_TURRET_CONTROL)
end
return {
    ["EngineerTabletController"] = u4.CreateController(u33.new())
}