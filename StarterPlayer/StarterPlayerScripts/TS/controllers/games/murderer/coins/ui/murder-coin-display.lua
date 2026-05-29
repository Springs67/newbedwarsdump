local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "murderer-game", "murderer-balance").MurdererBalance
return {
    ["MurderCoinDisplay"] = v4.new(u3)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u2
            [4] = u6
        --]]
        local _ = p8.useState
        local v9 = u3.createFragment
        local v10 = {}
        local v11 = u3.createElement
        local v12 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v13 = {}
        local v14 = u3.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 4
        })
        local v15 = u3.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 4)
        })
        local v16 = u3.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.8),
            ["Image"] = u5.COIN,
            ["ScaleType"] = Enum.ScaleType.Fit
        }, { u3.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v17 = u3.createElement
        local v18 = {
            ["Font"] = "LuckiestGuy",
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v19 = p7.coins
        local v20 = tostring(v19)
        local v21 = u2.richTextColor(Color3.fromRGB(189, 189, 189))
        local v22 = u6.CRATE_COST
        v18.Text = v20 .. "<font color=\"" .. v21 .. "\">/" .. tostring(v22) .. "</font>"
        v18.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v13, 1, {v14, v15, v16, v17("TextLabel", v18)})
        v10.MurderCoinDisplay = v11("Frame", v12, v13)
        return v9(v10)
    end)
}