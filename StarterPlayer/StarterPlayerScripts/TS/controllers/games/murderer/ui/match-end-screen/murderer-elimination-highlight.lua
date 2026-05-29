local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.PlayerRender
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["MurdererEliminationHighlight"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u5
            [4] = u3
            [5] = u8
            [6] = u4
        --]]
        local _ = p11.useState
        local v12 = {
            ["Size"] = UDim2.fromScale(0.3, 1)
        }
        local v13 = p10.FrameProps
        if v13 then
            for v14, v15 in v13 do
                v12[v14] = v15
            end
        end
        local v16 = { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.04, 0)
            }) }
        local v17 = #v16
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.5),
            ["PlayerUserId"] = p10.UserId,
            ["ImageTransparency"] = p10.IsVictim and 0.3 or 0
        }
        local v19 = { u6.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v20 = #v19
        local v21 = p10.IsVictim
        if v21 then
            v21 = u6.createFragment({
                ["DeadIcon"] = u6.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.6, 0.6),
                    ["Position"] = UDim2.fromScale(0.9, 0.9),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u9.PIRATE_SKULL_ICON
                })
            })
        end
        if v21 then
            v19[v20 + 1] = v21
        end
        v16[v17 + 1] = u6.createElement(u5, v18, v19)
        v16.DisplayName = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["Font"] = "GothamBlack",
            ["TextXAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.24),
            ["Text"] = p10.DisplayName,
            ["TextColor3"] = u3.WHITE
        })
        v16.Role = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["Font"] = "GothamBlack",
            ["TextXAlignment"] = "Center",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.14),
            ["Text"] = string.upper(p10.Role),
            ["TextColor3"] = u8:getRoleColor(p10.Role)
        })
        return u6.createFragment({
            ["PlayerElimCard"] = u6.createElement(u4, v12, v16)
        })
    end)
}