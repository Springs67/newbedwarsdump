local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameCoreClientSyncEvents
local u6 = v3.MobileButton
local u7 = v3.getLegacyMobileLayoutDimensions
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.Players
local u15 = v13.RunService
local u16 = v13.Workspace
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "base-weapon", "base-weapon-balance").BaseWeaponBalance
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v23 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ping", "ping-type")
local u24 = v23.PING_SLOTS
local u25 = v23.PingType
local u26 = v23.Pings
local u27 = v23.getPingFromSlot
local u28 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting
local u29 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u30 = v1.import(script, script.Parent.Parent.Parent, "sprint", "ui", "sprint-ui").SprintUI
local u31 = v1.import(script, script.Parent, "move-mount-mobile-ui").MoveMountMobileUI
return {
    ["MobileUI"] = v12.new(u11)(function(u32, p33) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u25
            [2] = u10
            [3] = u4
            [4] = u7
            [5] = u2
            [6] = u8
            [7] = u5
            [8] = u28
            [9] = u17
            [10] = u11
            [11] = u29
            [12] = u6
            [13] = u26
            [14] = u24
            [15] = u27
            [16] = u9
            [17] = u20
            [18] = u14
            [19] = u18
            [20] = u19
            [21] = u22
            [22] = u21
            [23] = u15
            [24] = u30
            [25] = u16
            [26] = u31
        --]]
        local v34 = p33.useState
        local v35 = p33.useEffect
        local v36 = p33.useValue
        local v37, u38 = v34(u25.GENERIC)
        local u39, u40 = v34(true)
        local u41 = v36(u10.new())
        local v42
        if u4.isHoarceKat() then
            v42 = u7().Ping
        else
            v42 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Ping")
        end
        local v43, u44 = v34(v42)
        local v45
        if u4.isHoarceKat() then
            v45 = u7().SwordSwing
        else
            v45 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("SwordSwing")
        end
        local v46, u47 = v34(v45)
        local v48
        if u4.isHoarceKat() then
            v48 = u7().Interact
        else
            v48 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Interact")
        end
        local v49, u50 = v34(v48)
        local v51
        if u4.isHoarceKat() then
            v51 = u7().AutoBridge
        else
            v51 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("AutoBridge")
        end
        local v52, u53 = v34(v51)
        local v54, u55 = v34(false)
        local u56 = false
        local u57 = nil
        local u58 = 0
        v35(function() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u10
                [3] = u2
                [4] = u8
                [5] = u44
                [6] = u47
                [7] = u50
                [8] = u53
                [9] = u5
                [10] = u32
                [11] = u55
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            local u59 = u10.new()
            local u60 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController")
            local u61 = u8.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() --[[ Line: 55 ]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = u60
                    [3] = u47
                    [4] = u50
                    [5] = u53
                --]]
                u44(u60:getLayoutDimensions("Ping"))
                u47(u60:getLayoutDimensions("SwordSwing"))
                u50(u60:getLayoutDimensions("Interact"))
                u53(u60:getLayoutDimensions("AutoBridge"))
            end)
            u59:GiveTask(function() --[[ Line: 61 ]]
                --[[
                Upvalues:
                    [1] = u61
                --]]
                return u61:cancel()
            end)
            u59:GiveTask(u5.MobileLayoutRegistered:connect(function() --[[ Line: 64 ]]
                --[[
                Upvalues:
                    [1] = u44
                    [2] = u60
                    [3] = u47
                    [4] = u50
                    [5] = u53
                --]]
                u44(u60:getLayoutDimensions("Ping"))
                u47(u60:getLayoutDimensions("SwordSwing"))
                u50(u60:getLayoutDimensions("Interact"))
                u53(u60:getLayoutDimensions("AutoBridge"))
            end))
            u59:GiveTask(u32.isMoveMountEnabledSignal:Connect(function(p62) --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u55
                --]]
                u55(p62)
            end))
            return function() --[[ Line: 73 ]]
                --[[
                Upvalues:
                    [1] = u59
                --]]
                return u59:DoCleaning()
            end
        end, {})
        v35(function() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u40
                [3] = u28
                [4] = u17
            --]]
            u8.Controllers.SettingsController:waitForSettingsAsync():andThen(function(p63) --[[ Line: 79 ]]
                --[[
                Upvalues:
                    [1] = u40
                    [2] = u28
                --]]
                u40(p63[u28.MOBILE_SWORD_HOLD])
            end)
            u17.SettingChanged:connect(function(p64) --[[ Line: 84 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u40
                --]]
                if p64.setting == u28.MOBILE_SWORD_HOLD then
                    u40(p64.value)
                end
            end)
        end, {})
        local v65 = {
            ["ResetOnSpawn"] = false
        }
        local v66 = {}
        local v67 = #v66
        local v68 = u32[u11.Children]
        if v68 then
            for v69, v70 in v68 do
                if type(v69) == "number" then
                    v66[v67 + v69] = v70
                else
                    v66[v69] = v70
                end
            end
        end
        local v71 = #v66
        local v72 = u29.isGameServer() and not u4.isHoarceKat()
        if v72 then
            v72 = u11.createElement(u6, {
                ["GenerateCircleBackground"] = true,
                ["Image"] = u26[v37].image,
                ["ImageColor3"] = u26[v37].color,
                ["Size"] = v43.size,
                ["Position"] = v43.position or UDim2.fromOffset(0, 0),
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 112 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                        [2] = u58
                        [3] = u57
                        [4] = u2
                        [5] = u38
                        [6] = u25
                        [7] = u24
                        [8] = u27
                        [9] = u11
                        [10] = u8
                        [11] = u9
                    --]]
                    u56 = false
                    u58 = os.time()
                    if u57 then
                        task.cancel(u57)
                    end
                    u57 = task.delay(0.5, function() --[[ Line: 118 ]]
                        --[[
                        Upvalues:
                            [1] = u56
                            [2] = u2
                            [3] = u38
                            [4] = u25
                            [5] = u24
                            [6] = u27
                            [7] = u11
                            [8] = u8
                            [9] = u9
                        --]]
                        if not u56 then
                            local u73 = u2.resolveDependency("client/controllers/game/ping/ping-controller@PingController")
                            u73:setSelectedSlot(nil)
                            u38(u25.GENERIC)
                            local u74 = 1
                            local v75 = false
                            local v76 = {}
                            while true do
                                if true then
                                    if v75 then
                                        u74 = u74 + 1
                                    else
                                        v75 = true
                                    end
                                end
                                if u74 > u24 then
                                    break
                                end
                                local u77 = u27(u74)
                                v76[u74] = {
                                    ["element"] = u11.createElement("ImageLabel", {
                                        ["BackgroundTransparency"] = 1,
                                        ["Image"] = u77.data.image,
                                        ["ImageColor3"] = u77.data.color,
                                        ["Size"] = UDim2.fromScale(0.9, 0.9)
                                    }),
                                    ["title"] = u77.data.title,
                                    ["onSelect"] = function() --[[ Name: onSelect, Line 147 ]]
                                        --[[
                                        Upvalues:
                                            [1] = u73
                                            [2] = u74
                                            [3] = u38
                                            [4] = u77
                                            [5] = u8
                                        --]]
                                        u73:setSelectedSlot(u74)
                                        u38(u77.pingType)
                                        u8.Controllers.RadialWheelController:closeRadialWheel()
                                    end
                                }
                            end
                            u8.Controllers.RadialWheelController:openRadialWheel(u9.values(v76), u24, nil, true, UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.6, 0.6), function() --[[ Line: 157 ]]
                                --[[
                                Upvalues:
                                    [1] = u2
                                --]]
                                u2.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):enableTouchPing()
                            end)
                        end
                    end)
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 163 ]]
                    --[[
                    Upvalues:
                        [1] = u56
                        [2] = u58
                        [3] = u2
                    --]]
                    u56 = true
                    if os.time() - u58 <= 0.5 then
                        u2.resolveDependency("client/controllers/game/ping/ping-controller@PingController"):enableTouchPing()
                    end
                end
            })
        end
        if v72 then
            v66[v71 + 1] = v72
        end
        local v78 = #v66
        v66[v78 + 1] = u11.createElement(u6, {
            ["Image"] = u20.ATTACK_MOBILE,
            ["Position"] = v46.position or UDim2.fromOffset(0, 0),
            ["Size"] = v46.size,
            ["OnPressDown"] = function(p79) --[[ Name: OnPressDown, Line 178 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u18
                    [3] = u8
                    [4] = u19
                    [5] = u22
                    [6] = u17
                    [7] = u39
                    [8] = u21
                    [9] = u41
                    [10] = u15
                --]]
                local v80 = u14.LocalPlayer:GetAttribute("IsCasting")
                if v80 ~= 0 and (v80 == v80 and (v80 ~= "" and v80)) then
                    return nil
                end
                if u18:getState().Inventory.observedPlayer == u14.LocalPlayer then
                    local v81 = u19:getLocalPlayerEntity()
                    if not v81 then
                        return nil
                    end
                    local v82 = v81:getItemInHandClient()
                    if v82 == nil then
                        u8.Controllers.SwordController:bufferMobileAttack()
                        u8.Controllers.HotbarController:selectHotbarItemGroup("sword")
                        return nil
                    end
                    if not u22(v82.Name).sword then
                        u8.Controllers.SwordController:bufferMobileAttack()
                        u8.Controllers.HotbarController:selectHotbarItemGroup("sword")
                        return nil
                    end
                end
                if not u17.MobileSwordButtonPressed:fire("down", p79):isCancelled() then
                    local u83 = u8.Controllers.SwordController
                    u83:mobileSwingPressed()
                    if u39 then
                        local v84 = u19:getLocalPlayerEntity()
                        local v85 = v84 and v84:getItemInHandClient()
                        if v85 then
                            u83.activeSwordActionId = u83.swordActionIdHandler:getNextId()
                            local v86 = u22(v85.Name).sword
                            if v86 ~= nil then
                                v86 = v86.attackSpeed
                            end
                            if v86 == nil then
                                v86 = u21.SWORD_SWING_COOLDOWN
                            end
                            local u87 = v86 * 0.5
                            task.delay(u87, function() --[[ Line: 225 ]]
                                --[[
                                Upvalues:
                                    [1] = u83
                                    [2] = u41
                                    [3] = u15
                                    [4] = u87
                                    [5] = u8
                                --]]
                                if u83.activeSwordActionId ~= u83.swordActionIdHandler:getCurrId() then
                                    return nil
                                end
                                u41.value:DoCleaning()
                                local u88 = 0
                                u83:mobileSwingPressed()
                                u41.value:GiveTask(u15.Heartbeat:Connect(function(p89) --[[ Line: 233 ]]
                                    --[[
                                    Upvalues:
                                        [1] = u88
                                        [2] = u87
                                        [3] = u8
                                        [4] = u41
                                        [5] = u83
                                    --]]
                                    if u87 < u88 then
                                        if u8.Controllers.SwordController:isHoldAutoSwingDisabled() then
                                            u41.value:DoCleaning()
                                            return nil
                                        end
                                        u83:mobileSwingPressed()
                                        u88 = 0
                                    else
                                        u88 = u88 + p89
                                    end
                                end))
                            end)
                        end
                    end
                end
            end,
            ["OnPressUp"] = function(p90) --[[ Name: OnPressUp, Line 251 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u8
                    [3] = u41
                --]]
                u17.MobileSwordButtonPressed:fire("up", p90)
                u17.SwordSwingUp:fire()
                u8.Controllers.SwordController.activeSwordActionId = -1
                u41.value:DoCleaning()
            end
        })
        local v91 = v49.position
        if v91 then
            v91 = u11.createElement(u6, {
                ["Image"] = u20.INTERACT_MOBILE,
                ["Position"] = v49.position,
                ["Size"] = v49.size,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 262 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8.Controllers.MobileInteractController:abilityInteract()
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 265 ]] end
            })
        end
        if v91 then
            v66[v78 + 2] = v91
        end
        local v92 = #v66
        local v93 = {
            ["OnClick"] = function() --[[ Name: OnClick, Line 272 ]]
                --[[
                Upvalues:
                    [1] = u8
                --]]
                if u8.Controllers.SprintController:isSprinting() then
                    u8.Controllers.SprintController:stopSprinting(true)
                else
                    u8.Controllers.SprintController:startSprinting()
                end
            end
        }
        v66[v92 + 1] = u11.createElement(u30, v93)
        local v94 = v52.position
        if v94 then
            v94 = u11.createElement(u6, {
                ["Image"] = u20.BUILD_MOBILE,
                ["Position"] = v52.position,
                ["Size"] = v52.size,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 284 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u16
                    --]]
                    u8.Controllers.HotbarController:selectHotbarItemGroup("block")
                    local v95 = u16:GetServerTimeNow() - u8.Controllers.KnockbackController:getLastKnockbackTime() >= 0.2
                    local v96 = u8.Controllers.BlockPlacementController:getBlockPlacer()
                    if v96 ~= nil then
                        v96:autoBridge(v95)
                    end
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 296 ]] end
            })
        end
        if v94 then
            v66[v92 + 2] = v94
        end
        local v97 = #v66
        if v54 then
            v54 = u11.createElement(u31)
        end
        if v54 then
            v66[v97 + 1] = v54
        end
        return u11.createFragment({
            ["MobileUI"] = u11.createElement("ScreenGui", v65, v66)
        })
    end)
}