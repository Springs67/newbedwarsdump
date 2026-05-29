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
    ["HelicopterUi"] = v9.new(u8)(function(u13, p14) --[[ Line: 14 ]]
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
        local v21, u22 = v15(u13.vehicleModel:GetAttribute("IsAttack"))
        local v23, u24 = v15(u13.vehicleModel:GetAttribute("AttackEnergy"))
        v16(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u13
                [3] = u18
                [4] = u20
                [5] = u22
                [6] = u24
            --]]
            local u25 = u7.new()
            u25:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("Health"):Connect(function() --[[ Line: 23 ]]
                --[[
                Upvalues:
                    [1] = u18
                    [2] = u13
                --]]
                u18(u13.vehicleModel:GetAttribute("Health"))
            end))
            u25:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("MaxHealth"):Connect(function() --[[ Line: 26 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u13
                --]]
                u20(u13.vehicleModel:GetAttribute("MaxHealth"))
            end))
            u25:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("IsAttack"):Connect(function() --[[ Line: 29 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u13
                --]]
                u22(u13.vehicleModel:GetAttribute("IsAttack"))
            end))
            u25:GiveTask(u13.vehicleModel:GetAttributeChangedSignal("AttackEnergy"):Connect(function() --[[ Line: 32 ]]
                --[[
                Upvalues:
                    [1] = u24
                    [2] = u13
                --]]
                u24(u13.vehicleModel:GetAttribute("AttackEnergy"))
            end))
            return function() --[[ Line: 35 ]]
                --[[
                Upvalues:
                    [1] = u25
                --]]
                u25:DoCleaning()
            end
        end)
        local v26 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "")
        local v27 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "")
        local v28 = u2.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController").actionBarRef:getValue()
        local v29 = {}
        local v30 = #v29
        local v31 = {
            ["Image"] = u11.UP_MOBILE
        }
        local v32
        if u4.isMobileControls() then
            v32 = u10:getActionMobileButtonPosition()
        else
            v32 = UDim2.fromScale(0.2, u10:getActionBarPosition().Y.Scale)
        end
        v31.Position = v32
        function v31.OnPressDown() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(true)
        end
        function v31.OnPressUp() --[[ Line: 50 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.upChanged(false)
        end
        local v33 = {}
        local v34 = #v33
        local v35 = not u4.isMobileControls()
        if v35 then
            v35 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextStrokeTransparency"] = 0,
                ["TextXAlignment"] = "Left",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(1.2, 0.5),
                ["Text"] = v26,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v35 then
            v33[v34 + 1] = v35
        end
        v29[v30 + 1] = u8.createElement(u5, v31, v33)
        local v36 = {
            ["Image"] = u11.DOWN_MOBILE
        }
        local v37
        if u4.isMobileControls() then
            v37 = u10:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
        else
            v37 = UDim2.fromScale(0.8, u10:getActionBarPosition().Y.Scale)
        end
        v36.Position = v37
        function v36.OnPressDown() --[[ Line: 85 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(true)
        end
        function v36.OnPressUp() --[[ Line: 88 ]]
            --[[
            Upvalues:
                [1] = u13
            --]]
            u13.downChanged(false)
        end
        local v38 = {}
        local v39 = #v38
        local v40 = not u4.isMobileControls()
        if v40 then
            v40 = u8.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextXAlignment"] = "Right",
                ["TextStrokeTransparency"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(-0.2, 0.5),
                ["Text"] = v27,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v40 then
            v38[v39 + 1] = v40
        end
        v29[v30 + 2] = u8.createElement(u5, v36, v38)
        local v41
        if v28 then
            local v42 = {
                ["target"] = v28
            }
            local v43 = { u8.createElement(u6, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 1,
                    ["Size"] = u12.actionBarProgressBarSize,
                    ["Progress"] = v17 / v19,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(217, 51, 51), Color3.fromRGB(138, 38, 18))
                }) }
            local v44 = #v43
            local v45
            if v21 then
                v45 = u8.createElement(u6, {
                    ["AcceptZero"] = true,
                    ["LayoutOrder"] = 2,
                    ["Size"] = u12.actionBarProgressBarSize,
                    ["Progress"] = v23,
                    ["BarGradient"] = ColorSequence.new(Color3.fromRGB(42, 170, 255), Color3.fromRGB(26, 108, 159))
                })
            else
                v45 = nil
            end
            if v45 then
                v43[v44 + 1] = v45
            end
            v41 = u8.createElement(u8.Portal, v42, v43)
        else
            v41 = nil
        end
        if v41 then
            v29[v30 + 3] = v41
        end
        return u8.createFragment(v29)
    end)
}