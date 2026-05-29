local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.GameCoreClientSyncEvents
local u6 = v3.getLegacyMobileLayoutDimensions
local u7 = v3.MobileButton
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents
local v12 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "event", "move-mount-event")
local u13 = v12.InputActionType
local u14 = v12.MoveMountDirection
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MoveMountMobileUI"] = v10.new(u9)(function(_, p16) --[[ Line: 17 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
            [3] = u2
            [4] = u8
            [5] = u5
            [6] = u9
            [7] = u7
            [8] = u15
            [9] = u11
            [10] = u14
            [11] = u13
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local v19
        if u4.isHoarceKat() then
            v19 = u6().MoveMountUp
        else
            v19 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("MoveMountUp")
        end
        local v20, u21 = v17(v19)
        local v22
        if u4.isHoarceKat() then
            v22 = u6().MoveMountDown
        else
            v22 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("MoveMountDown")
        end
        local v23, u24 = v17(v22)
        v18(function() --[[ Line: 22 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u2
                [3] = u8
                [4] = u21
                [5] = u24
                [6] = u5
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            local u25 = u2.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController")
            u8.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():andThen(function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u25
                    [3] = u24
                --]]
                u21(u25:getLayoutDimensions("MoveMountUp"))
                u24(u25:getLayoutDimensions("MoveMountDown"))
            end)
            u5.MobileLayoutRegistered:connect(function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u25
                    [3] = u24
                --]]
                u21(u25:getLayoutDimensions("MoveMountUp"))
                u24(u25:getLayoutDimensions("MoveMountDown"))
            end)
        end, {})
        return u9.createFragment({ u9.createElement(u7, {
                ["Image"] = u15.UP_MOBILE,
                ["Position"] = v20.position or UDim2.fromOffset(0, 0),
                ["Size"] = v20.size,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 41 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u14
                        [3] = u13
                    --]]
                    u11.MoveMountButtonChange:fire(u14.UP, u13.PRESS)
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 44 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u14
                        [3] = u13
                    --]]
                    u11.MoveMountButtonChange:fire(u14.UP, u13.RELEASE)
                end
            }), u9.createElement(u7, {
                ["Image"] = u15.DOWN_MOBILE,
                ["Position"] = v23.position or UDim2.fromOffset(0, 0),
                ["Size"] = v23.size,
                ["OnPressDown"] = function() --[[ Name: OnPressDown, Line 52 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u14
                        [3] = u13
                    --]]
                    u11.MoveMountButtonChange:fire(u14.DOWN, u13.PRESS)
                end,
                ["OnPressUp"] = function() --[[ Name: OnPressUp, Line 55 ]]
                    --[[
                    Upvalues:
                        [1] = u11
                        [2] = u14
                        [3] = u13
                    --]]
                    u11.MoveMountButtonChange:fire(u14.DOWN, u13.RELEASE)
                end
            }) })
    end)
}