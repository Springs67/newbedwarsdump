local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make")
return {
    ["PingGuiObject"] = function(p4, p5, p6) --[[ Line: 5 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local v7 = {}
        local v8
        if p6 == nil then
            v8 = p6
        else
            v8 = p6.disableDistanceTracker
        end
        if not v8 then
            local v9 = {
                ["Name"] = "DistanceTracker",
                ["Text"] = ""
            }
            local v10 = UDim2
            local v11
            if p6 == nil then
                v11 = p6
            else
                v11 = p6.disablePlayerAvatar
            end
            local v12 = v11 and 0.7 or 0.6
            local v13
            if p6 == nil then
                v13 = p6
            else
                v13 = p6.disablePlayerAvatar
            end
            v9.Size = v10.fromScale(v12, v13 and 0.6 or 0.35)
            v9.AnchorPoint = Vector2.new(0, 0.5)
            local v14 = UDim2
            local v15
            if p6 == nil then
                v15 = p6
            else
                v15 = p6.disablePlayerAvatar
            end
            v9.Position = v14.fromScale(0.9, v15 and 0.5 or 0.9)
            v9.TextScaled = true
            v9.RichText = true
            v9.Font = Enum.Font.Roboto
            v9.TextColor3 = u2.WHITE
            v9.BackgroundTransparency = 1
            v9.Children = { u3("UIStroke", {
                    ["Color"] = u2.BLACK
                }) }
            local v16 = u3("TextLabel", v9)
            table.insert(v7, v16)
        end
        if p6 ~= nil then
            p6 = p6.disablePlayerAvatar
        end
        if not p6 then
            local v17 = u3("ImageLabel", {
                ["Name"] = "PingCreatorAvatar",
                ["BackgroundTransparency"] = 1,
                ["Image"] = "",
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.9, 0.4),
                ["Size"] = UDim2.fromScale(0.5, 0.5),
                ["Children"] = { u3("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }), u3("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }
            })
            table.insert(v7, v17)
        end
        local v18 = {
            ["Name"] = "Container",
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v19 = { u3("ImageLabel", {
                ["Name"] = "PingIcon",
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 0.85),
                ["Size"] = UDim2.fromScale(0.6, 0.6),
                ["ImageColor3"] = p5 or u2.WHITE,
                ["Image"] = p4
            }) }
        local v20 = #v19
        table.move(v7, 1, #v7, v20 + 1, v19)
        v18.Children = v19
        return u3("Frame", v18)
    end
}