local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.ProgressBar
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "game", "movement", "move-mount-ui").MoveMountUI
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
return {
    ["HotAirBalloonUi"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u6
            [4] = u2
            [5] = u8
            [6] = u10
            [7] = u12
            [8] = u5
            [9] = u11
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(u13.vehicleModel:GetAttribute("Health"))
        local v19, u20 = v15(u13.vehicleModel:GetAttribute("MaxHealth"))
        v16(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u13
                [3] = u18
                [4] = u20
                [5] = u4
                [6] = u6
            --]]
            local u21 = u7.new()
            u21:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u13
                --]]
                u18(u13.vehicleModel:GetAttribute("Health"))
            end))
            u21:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u13
                --]]
                u20(u13.vehicleModel:GetAttribute("MaxHealth"))
            end))
            if u4.isMobileControls() then
                u6.Controllers.MobileUiController:toggleMountMovementControls(true)
                u21:GiveTask(function() --[[ Line: 29 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                    --]]
                    u6.Controllers.MobileUiController:toggleMountMovementControls(false)
                end)
            end
            return function() --[[ Line: 33 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end)
        local v22 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue()
        local v23 = {}
        local v24 = #v23
        local v25 = not u4.isMobileControls()
        if v25 then
            v25 = u8.createElement(u10)
        end
        if v25 then
            v23[v24 + 1] = v25
        end
        local v26 = #v23
        local v27
        if u12.isLobbyServer() or not v22 then
            v27 = nil
        else
            v27 = u8.createElement(u8.Portal, {
                ["target"] = v22
            }, { u8.createElement(u5, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = u11.actionBarProgressBarSize,
                    ["Progress"] = v17 / v19,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) })
        end
        if v27 then
            v23[v26 + 1] = v27
        end
        return u8.createFragment(v23)
    end)
}