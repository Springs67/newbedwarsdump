local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v3.ProgressBar
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["FlyingCloudUi"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u2
            [3] = u11
            [4] = u4
            [5] = u10
            [6] = u8
            [7] = u5
            [8] = u6
            [9] = u12
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
            return function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end)
        local v22 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "")
        local v23 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "")
        local v24 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue()
        local v25 = {}
        local v26 = #v25
        local v27 = {
            ["Image"] = u11.UP_MOBILE
        }
        local v28
        if u4.isMobileControls() then
            v28 = u10:getActionMobileButtonPosition()
        else
            v28 = UDim2.fromScale(0.2, u10:getActionBarPosition().Y.Scale)
        end
        v27.Position = v28
        function v27.OnPressDown() --[[ Line: 39 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(true)
        end
        function v27.OnPressUp() --[[ Line: 42 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(false)
        end
        local v29 = {}
        local v30 = #v29
        local v31 = not u4.isMobileControls()
        if v31 then
            v31 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextStrokeTransparency"] = 0,
                ["TextXAlignment"] = "Left",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(1.2, 0.5),
                ["Text"] = v22,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v31 then
            v29[v30 + 1] = v31
        end
        v25[v26 + 1] = u8.createElement(u5, v27, v29)
        local v32 = {
            ["Image"] = u11.DOWN_MOBILE
        }
        local v33
        if u4.isMobileControls() then
            v33 = u10:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
        else
            v33 = UDim2.fromScale(0.8, u10:getActionBarPosition().Y.Scale)
        end
        v32.Position = v33
        function v32.OnPressDown() --[[ Line: 77 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(true)
        end
        function v32.OnPressUp() --[[ Line: 80 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(false)
        end
        local v34 = {}
        local v35 = #v34
        local v36 = not u4.isMobileControls()
        if v36 then
            v36 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextXAlignment"] = "Right",
                ["TextStrokeTransparency"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(-0.2, 0.5),
                ["Text"] = v23,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v36 then
            v34[v35 + 1] = v36
        end
        v25[v26 + 2] = u8.createElement(u5, v32, v34)
        local v37
        if v24 then
            v37 = u8.createElement(u8.Portal, {
                ["target"] = v24
            }, { u8.createElement(u6, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = u12.actionBarProgressBarSize,
                    ["Progress"] = v17 / v19,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) })
        else
            v37 = nil
        end
        if v37 then
            v25[v26 + 3] = v37
        end
        return u8.createFragment(v25)
    end)
}