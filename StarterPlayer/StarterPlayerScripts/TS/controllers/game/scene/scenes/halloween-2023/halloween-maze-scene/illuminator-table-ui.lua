local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["IlluminatorTableUi"] = v4.new(u3)(function(_, p7) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u5
            [3] = u3
            [4] = u6
        --]]
        local v8, _ = p7.useState(true)
        local v9 = UDim2.fromScale(0.15, 0.15)
        if not u2.isSmallScreen() then
            v9 = UDim2.fromScale(0.11, 0.11)
        end
        if u5.KeyboardEnabled then
            return u3.createFragment()
        end
        local v10 = u3.createElement
        local v11 = "ScreenGui"
        local v12 = {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }
        local v13 = {}
        local v14 = u3.createElement
        local v15 = "ImageButton"
        local v16 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0
        }
        local v17
        if v8 then
            v17 = u6.FLASHLIGHT_ON_MOBILE
        else
            v17 = u6.FLASHLIGHT_OFF_MOBILE
        end
        v16.Image = v17
        v16.Size = v9
        v16.AnchorPoint = Vector2.new(0.5, 0.5)
        local v18
        if u2.isSmallScreen() then
            v18 = UDim2.fromScale(0.85, 0.4)
        else
            v18 = UDim2.fromScale(0.85, 0.52)
        end
        v16.Position = v18
        __set_list(v13, 1, {v14(v15, v16, { u3.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1,
        ["DominantAxis"] = "Height"
    }) })})
        return v10(v11, v12, v13)
    end)
}