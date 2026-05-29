local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
return {
    ["SnowConeQueueUI"] = v4.new(u3)(function(u6, p7) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u2
        --]]
        local v8 = p7.useState
        local v9 = p7.useEffect
        local v10, u11 = v8(0)
        v9(function() --[[ Line: 11 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u6
                [3] = u11
            --]]
            u5.Client:OnEvent("SnowConeQueueChanged", function(p12) --[[ Line: 12 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u11
                --]]
                if p12.snowConeMachine == u6.SnowConeMachine then
                    u11(p12.numberInQueue)
                end
            end)
        end, {})
        if v10 == 0 then
            return u3.createElement(u2)
        end
        local v13 = u3.createElement
        local v14 = {
            ["Transparency"] = 1,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v15 = {}
        local v16 = u3.createElement("ImageLabel", {
            ["Transparency"] = 0.8,
            ["Position"] = UDim2.fromScale(0.5, 0.45),
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }, { u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }) })
        local v17 = u3.createElement
        local v18 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.4, 0.4),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v19 = {
            u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["SnowConeImage"] = u3.createElement("ImageLabel", {
                ["Image"] = "rbxassetid://10489888403",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 3,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.8, 0.8),
                ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                ["ScaleType"] = Enum.ScaleType.Fit
            }),
            u3.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Font"] = "LuckiestGuy",
                ["TextStrokeTransparency"] = 0.6,
                ["LayoutOrder"] = 1,
                ["Text"] = tostring(v10),
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 0)
            }),
            u3.createElement("TextLabel", {
                ["Text"] = "x",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["Font"] = "LuckiestGuy",
                ["TextStrokeTransparency"] = 0.6,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 0)
            })
        }
        __set_list(v15, 1, {v16, v17("Frame", v18, v19)})
        return v13("ImageLabel", v14, v15)
    end)
}