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
    ["UfoUi"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
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
        local v21, u22 = v15(u13.vehicleModel:GetAttribute("TractorBeamEnergy"))
        v16(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u13
                [3] = u18
                [4] = u20
                [5] = u22
            --]]
            local u23 = u7.new()
            u23:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u13
                --]]
                u18(u13.vehicleModel:GetAttribute("Health"))
            end))
            u23:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 25 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u13
                --]]
                u20(u13.vehicleModel:GetAttribute("MaxHealth"))
            end))
            u23:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("TractorBeamEnergy"):Connect(function() --[[ Line: 28 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u13
                --]]
                u22(u13.vehicleModel:GetAttribute("TractorBeamEnergy"))
            end))
            return function() --[[ Line: 31 ]]
                --[[
                Upvalues:
                    [1] = u23
                --]]
                u23:DoCleaning()
            end
        end)
        local v24 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "")
        local v25 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "")
        local v26 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue()
        local v27 = {}
        local v28 = #v27
        local v29 = {
            ["Image"] = u11.UP_MOBILE
        }
        local v30
        if u4.isMobileControls() then
            v30 = u10:getActionMobileButtonPosition()
        else
            v30 = UDim2.fromScale(0.2, u10:getActionBarPosition().Y.Scale)
        end
        v29.Position = v30
        function v29.OnPressDown() --[[ Line: 43 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(true)
        end
        function v29.OnPressUp() --[[ Line: 46 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(false)
        end
        local v31 = {}
        local v32 = #v31
        local v33 = not u4.isMobileControls()
        if v33 then
            v33 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextStrokeTransparency"] = 0,
                ["TextXAlignment"] = "Left",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(1.2, 0.5),
                ["Text"] = v24,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v33 then
            v31[v32 + 1] = v33
        end
        v27[v28 + 1] = u8.createElement(u5, v29, v31)
        local v34 = {
            ["Image"] = u11.DOWN_MOBILE
        }
        local v35
        if u4.isMobileControls() then
            v35 = u10:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
        else
            v35 = UDim2.fromScale(0.8, u10:getActionBarPosition().Y.Scale)
        end
        v34.Position = v35
        function v34.OnPressDown() --[[ Line: 81 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(true)
        end
        function v34.OnPressUp() --[[ Line: 84 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(false)
        end
        local v36 = {}
        local v37 = #v36
        local v38 = not u4.isMobileControls()
        if v38 then
            v38 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextXAlignment"] = "Right",
                ["TextStrokeTransparency"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(-0.2, 0.5),
                ["Text"] = v25,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v38 then
            v36[v37 + 1] = v38
        end
        v27[v28 + 2] = u8.createElement(u5, v34, v36)
        local v39
        if v26 then
            v39 = u8.createElement(u8.Portal, {
                ["target"] = v26
            }, { u8.createElement(u6, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = u12.actionBarProgressBarSize,
                    ["Progress"] = v17 / v19,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }), u8.createElement(u6, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 2,
                    ["Size"] = u12.actionBarProgressBarSize,
                    ["Progress"] = v21,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(42, 170, 255), Color3.fromRGB(26, 108, 159))
                }) })
        else
            v39 = nil
        end
        if v39 then
            v27[v28 + 3] = v39
        end
        return u8.createFragment(v27)
    end)
}