local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.PlayerRender
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MurdererPlayerBox"] = v6.new(u5)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u9
            [3] = u7
            [4] = u3
            [5] = u8
            [6] = u4
        --]]
        local _ = p11.useState
        local v12 = {
            ["BorderSizePixel"] = 0,
            ["PlayerUserId"] = p10.UserId,
            ["BackgroundColor3"] = Color3.fromRGB(51, 51, 51),
            ["ImageTransparency"] = p10.IsDead and 0.75 or 0
        }
        local v13 = { u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            }) }
        local v14 = #v13
        local v15 = p10.IsDead
        if v15 then
            v15 = u5.createFragment({
                ["DeadIcon"] = u5.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 11,
                    ["Size"] = UDim2.fromScale(0.4, 0.4),
                    ["Position"] = UDim2.fromScale(0.9, 0.9),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u9.PIRATE_SKULL_ICON
                })
            })
        end
        if v15 then
            v13[v14 + 1] = v15
        end
        local v16 = #v13
        local v17
        if p10.Role == u7.MURDERER then
            local v18 = u5.createElement
            local v19 = {
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Center",
                ["Font"] = "GothamBlack",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.8, 0.2),
                ["AnchorPoint"] = Vector2.new(0.5, 0),
                ["Position"] = UDim2.fromScale(0.5, 0.05)
            }
            local v20 = p10.NumElims
            v19.Text = tostring(v20) .. " KILLS"
            v19.TextColor3 = u3.WHITE
            v17 = v18("TextLabel", v19)
        else
            v17 = false
        end
        if v17 then
            v13[v16 + 1] = v17
        end
        v13[#v13 + 1] = u5.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = u8:getRoleColor(p10.Role)
        })
        return u5.createElement(u4, v12, v13)
    end)
}