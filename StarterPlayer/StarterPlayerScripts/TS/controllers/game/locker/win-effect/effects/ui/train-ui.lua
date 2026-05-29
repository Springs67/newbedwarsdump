local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.MobileButton
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["TrainUi"] = v7.new(u6)(function(u10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u9
            [3] = u4
            [4] = u8
            [5] = u6
            [6] = u5
        --]]
        local _ = p11.useState
        local _ = p11.useEffect
        local v12 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountUp")[1].Name, "Button", "")
        local v13 = string.gsub(u2.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):getActionKeycodes("MoveMountDown")[1].Name, "Button", "")
        local v14 = {}
        local v15 = #v14
        local v16 = {
            ["Image"] = u9.UP_MOBILE
        }
        local v17
        if u4.isMobileControls() then
            v17 = u8:getActionMobileButtonPosition()
        else
            v17 = UDim2.fromScale(0.2, u8:getActionBarPosition().Y.Scale)
        end
        v16.Position = v17
        function v16.OnPressDown() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.upChanged(true)
        end
        function v16.OnPressUp() --[[ Line: 24 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.upChanged(false)
        end
        local v18 = {}
        local v19 = #v18
        local v20 = not u4.isMobileControls()
        if v20 then
            v20 = u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextStrokeTransparency"] = 0,
                ["TextXAlignment"] = "Left",
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(1.2, 0.5),
                ["Text"] = v12,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v20 then
            v18[v19 + 1] = v20
        end
        v14[v15 + 1] = u6.createElement(u5, v16, v18)
        local v21 = {
            ["Image"] = u9.DOWN_MOBILE
        }
        local v22
        if u4.isMobileControls() then
            v22 = u8:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0)
        else
            v22 = UDim2.fromScale(0.8, u8:getActionBarPosition().Y.Scale)
        end
        v21.Position = v22
        function v21.OnPressDown() --[[ Line: 59 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.downChanged(true)
        end
        function v21.OnPressUp() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u10
            --]]
            u10.downChanged(false)
        end
        local v23 = {}
        local v24 = #v23
        local v25 = not u4.isMobileControls()
        if v25 then
            v25 = u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Font"] = "RobotoCondensed",
                ["TextXAlignment"] = "Right",
                ["TextStrokeTransparency"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.3),
                ["Position"] = UDim2.fromScale(-0.2, 0.5),
                ["Text"] = v13,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextStrokeColor3"] = Color3.fromRGB(18, 18, 18)
            })
        end
        if v25 then
            v23[v24 + 1] = v25
        end
        v14[v15 + 2] = u6.createElement(u5, v21, v23)
        return u6.createFragment(v14)
    end)
}