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
return {
    ["FlyingBroomUi"] = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u4
            [3] = u6
            [4] = u2
            [5] = u8
            [6] = u10
            [7] = u5
            [8] = u11
        --]]
        local v14 = p13.useState
        local v15 = p13.useEffect
        local v16, u17 = v14(u12.vehicleModel:GetAttribute("Health"))
        local v18, u19 = v14(u12.vehicleModel:GetAttribute("MaxHealth"))
        v15(function() --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u12
                [3] = u17
                [4] = u19
                [5] = u4
                [6] = u6
            --]]
            local u20 = u7.new()
            u20:GiveTask(u12.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 20 ]]
                --[[
                Upvalues:
                    [1] = u17
                    [2] = u12
                --]]
                u17(u12.vehicleModel:GetAttribute("Health"))
            end))
            u20:GiveTask(u12.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u12
                --]]
                u19(u12.vehicleModel:GetAttribute("MaxHealth"))
            end))
            if u4.isMobileControls() then
                u6.Controllers.MobileUiController:toggleMountMovementControls(true)
                u20:GiveTask(function() --[[ Line: 28 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                    --]]
                    u6.Controllers.MobileUiController:toggleMountMovementControls(false)
                end)
            end
            return function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                u20:DoCleaning()
            end
        end, {})
        local v21 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue()
        local v22 = {}
        local v23 = #v22
        local v24 = not u4.isMobileControls()
        if v24 then
            v24 = u8.createElement(u10)
        end
        if v24 then
            v22[v23 + 1] = v24
        end
        local v25 = #v22
        local v26
        if v21 then
            v26 = u8.createElement(u8.Portal, {
                ["target"] = v21
            }, { u8.createElement(u5, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = u11.actionBarProgressBarSize,
                    ["Progress"] = v16 / v18,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) })
        else
            v26 = nil
        end
        if v26 then
            v22[v25 + 1] = v26
        end
        return u8.createFragment(v22)
    end)
}