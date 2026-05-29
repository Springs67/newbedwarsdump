local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "steam-engineer", "gather-bot-constants").GatherBotBalance
return {
    ["SteamEngineerDisplay"] = v3.new(u2)(function(p5, p6) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        local _ = p6.useState
        local v7 = u2.createElement
        local v8 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.2, 1)
        }
        local v9 = {}
        local v10 = u2.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.667
        })
        local v11 = u2.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 2)
        })
        local v12 = u2.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://15364584971",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        local v13 = u2.createElement
        local v14 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.8, 0.8)
        }
        local v15 = {}
        local v16 = u2.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["VerticalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 0)
        })
        local v17 = u2.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0, 0.3)
        })
        local v18 = u2.createElement
        local v19 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 0.7)
        }
        local v20 = p5.gatherBotBasicAmount
        local v21 = tostring(v20)
        local v22 = u4.GATHER_BOT_MAX_AMOUNT
        v19.Text = v21 .. "/" .. tostring(v22)
        v19.TextColor3 = Color3.fromRGB(255, 255, 255)
        local v23 = v18("TextLabel", v19, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1.3
            }) })
        local v24 = u2.createElement
        local v25 = {
            ["Font"] = "LuckiestGuy",
            ["TextScaled"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.7, 0.7)
        }
        local v26 = p5.gatherBotProAmount
        local v27 = tostring(v26)
        local v28 = u4.GATHER_BOT_MAX_AMOUNT
        v25.Text = v27 .. "/" .. tostring(v28)
        v25.TextColor3 = Color3.fromRGB(255, 255, 255)
        __set_list(v15, 1, {v16, v17, v23, v24("TextLabel", v25, { u2.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.3
    }) })})
        __set_list(v9, 1, {v10, v11, v12, v13("Frame", v14, v15)})
        return v7("Frame", v8, v9)
    end)
}