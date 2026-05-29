local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "text-box-character-counter").TextBoxCharacterCounter
return {
    ["GiftingMessageInput"] = v4.new(u3)(function(u7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u2
            [3] = u5
            [4] = u6
        --]]
        local _ = p8.useState
        local _ = p8.useEffect
        local v9 = u3.createRef()
        return u3.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["Size"] = u7.Size,
            ["LayoutOrder"] = u7.LayoutOrder
        }, {
            u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 6)
            }),
            u3.createElement("TextLabel", {
                ["Text"] = "Message",
                ["TextTransparency"] = 0.3,
                ["RichText"] = true,
                ["TextSize"] = 20,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.13, 0),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["TextColor3"] = u2.WHITE,
                ["Font"] = Enum.Font.Roboto
            }),
            u3.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["BackgroundColor3"] = u5.backgroundTertiary,
                ["Size"] = UDim2.fromScale(1, 0.7)
            }, { u3.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }), u3.createElement("TextBox", {
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Text"] = "",
                    ["PlaceholderText"] = "message",
                    ["BackgroundTransparency"] = 1,
                    ["BackgroundColor3"] = u5.backgroundTertiary,
                    ["BorderSizePixel"] = 0,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Top,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["PlaceholderColor3"] = Color3.fromRGB(107, 110, 136),
                    ["MultiLine"] = true,
                    ["TextWrapped"] = true,
                    ["TextSize"] = 20,
                    ["Font"] = Enum.Font.Roboto,
                    ["ClearTextOnFocus"] = false,
                    [u3.Ref] = v9,
                    ["AutoLocalize"] = false,
                    [u3.Change.Text] = function(p10) --[[ Line: 13 ]]
                        --[[
                        Upvalues:
                            [1] = u7
                        --]]
                        if #p10.Text > 100 then
                            local v11 = p10.Text
                            p10.Text = string.sub(v11, 0, 100)
                            return nil
                        end
                        u7.SetMessage(p10.Text)
                    end
                }, { u3.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0, 8),
                        ["PaddingBottom"] = UDim.new(0, 8),
                        ["PaddingLeft"] = UDim.new(0, 12),
                        ["PaddingRight"] = UDim.new(0, 12)
                    }) }) }),
            u3.createElement(u6, {
                ["MaxCharCount"] = 100,
                ["LayoutOrder"] = 3,
                ["TextBox"] = v9
            })
        })
    end)
}