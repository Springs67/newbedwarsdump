local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Empty
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "seahorse", "seahorse-util").SeahorseUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = {
    "rbxassetid://11902486870",
    "rbxassetid://11902487235",
    "rbxassetid://11902487139",
    "rbxassetid://11902486968"
}
return {
    ["SeahorseDisplay"] = v7.new(u6)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u6
            [3] = u5
            [4] = u3
            [5] = u9
            [6] = u4
            [7] = u10
        --]]
        local _ = p12.useState
        local v13 = u8:getSeahorseLevelFromStackCount(p11.stacks)
        local v14 = u6.createElement
        local v15 = "Frame"
        local v16 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v17 = {}
        local v18 = u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.667
        })
        local v19 = u6.createElement
        local v20 = u5
        local v21 = {}
        local v22 = {}
        local v23 = u6.createElement(u3, {
            ["Text"] = "Seahorse",
            ["TextSize"] = 16,
            ["Font"] = Enum.Font.SourceSansBold,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Limits"] = Vector2.new(300, 60)
        })
        local v24 = u6.createElement(u3, {
            ["TextSize"] = 14,
            ["Text"] = "Level " .. tostring(v13),
            ["Font"] = Enum.Font.SourceSans,
            ["TextColor3"] = u9.mcGold,
            ["Limits"] = Vector2.new(300, 60)
        })
        local v25 = u6.createElement
        local v26 = u3
        local v27 = {
            ["TextSize"] = 14
        }
        local v28
        if v13 == u8.MAX_SEAHORSE_LEVEL then
            v28 = "MAX LEVEL"
        else
            local v29 = u8
            local v30 = p11.stacks
            v28 = tostring(v29:getStacksNeededToLevel(v30)) .. " more stacks to level up"
        end
        v27.Text = v28
        v27.Font = Enum.Font.SourceSans
        v27.Limits = Vector2.new(300, 60)
        __set_list(v22, 1, {v23, v24, v25(v26, v27)})
        local v31 = v19(v20, v21, v22)
        local v32 = u6.createElement
        local v33 = u4
        local v34 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v35 = {}
        local v36 = u6.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 2)
        })
        local v37 = u6.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Image"] = u10[u8:getSeahorseLevelFromStackCount(p11.stacks) + 1]
        }, { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v38 = u6.createElement
        local v39 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v40 = p11.stacks
        v39.Text = tostring(v40)
        v39.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v35, 1, {v36, v37, v38("TextLabel", v39, { u6.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.3
    }) })})
        __set_list(v17, 1, {v18, v31, v32(v33, v34, v35)})
        return v14(v15, v16, v17)
    end)
}