local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.GameTheme
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, script.Parent, "tournament-app-emote-grid").TournamentAppEmoteGrid
return {
    ["TournamentAppEmotePopup"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
            [4] = u7
        --]]
        local _ = p9.useState
        local _ = p9.useEffect
        local v10 = u5.createFragment
        local v11 = {}
        local v12 = u5.createElement
        local v13 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.55),
            ["Size"] = UDim2.fromScale(0.9, 1),
            ["BackgroundColor3"] = Color3.fromHex("#6467A7")
        }
        local v14 = {}
        local v15 = u5.createElement
        local v16 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["BackgroundColor3"] = Color3.fromHex("#403E74")
        }
        local v17 = {
            ["EmotePopupTitle"] = u5.createElement("TextLabel", {
                ["Text"] = "<b>Select a Team Icon</b>",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["Font"] = "Roboto",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 4,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.03, 0.5),
                ["Size"] = UDim2.fromScale(0.9, 0.7),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }),
            u5.createElement("TextButton", {
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -15, 0.5, 0),
                ["Size"] = UDim2.fromOffset(28, 28),
                ["BackgroundColor3"] = u4.backgroundPrimary,
                ["Text"] = "",
                [u5.Event.Activated] = function() --[[ Line: 47 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    return u8.onClose()
                end,
                ["ZIndex"] = 4
            }, { u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }), u5.createElement("TextLabel", {
                    ["Text"] = "<b>X</b>",
                    ["Font"] = "Arial",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 4,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.7, 0.7),
                    ["TextColor3"] = u3.WHITE
                }) })
        }
        v14.EmotePopupHeader = v15("Frame", v16, v17)
        v14.EmotePopupContent = u5.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["ZIndex"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["Position"] = UDim2.fromScale(0, 0.1)
        }, { u5.createElement(u7, {
                ["onClose"] = function() --[[ Name: onClose, Line 77 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    return u8.onClose()
                end,
                ["onSetIcon"] = u8.onSetIcon
            }) })
        v11.EmotePopup = v12("Frame", v13, v14)
        return v10(v11)
    end)
}