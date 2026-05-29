local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.PlayerRender
local u5 = v2.SoundManager
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["GiftingSuggestedListElement"] = v7.new(u6)(function(u10, _) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u6
            [3] = u5
            [4] = u8
            [5] = u4
            [6] = u3
        --]]
        local v11 = {
            ["Size"] = UDim2.new(0.95, 0, 0, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["BackgroundColor3"] = u9.backgroundSecondary,
            ["BorderSizePixel"] = 0,
            [u6.Event.Activated] = function() --[[ Line: 17 ]]
                --[[
                Upvalues:
                    [1] = u5
                    [2] = u8
                    [3] = u10
                --]]
                u5:playSound(u8.UI_CLICK)
                u10.SetSelectedUser(u10.OfflineDisplayPlayer)
            end
        }
        local v12 = {
            u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }),
            u6.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 8),
                ["PaddingBottom"] = UDim.new(0, 8),
                ["PaddingRight"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0, 10)
            }),
            u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }),
            u6.createElement(u4, {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromOffset(32, 32),
                ["PlayerUserId"] = u10.OfflineDisplayPlayer.userId
            }, { u6.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }) })
        }
        local _ = #v12
        local v13 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, -42, 0, 32)
        }
        local v14 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }), u6.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["LayoutOrder"] = 1,
                ["AutoLocalize"] = false,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.6, 0),
                ["Text"] = "@" .. u10.OfflineDisplayPlayer.name,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 20
                }) }) }
        local v15 = #v14
        local v16
        if u10.OfflineDisplayPlayer.displayName == "" then
            v16 = false
        else
            v16 = u6.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["LayoutOrder"] = 1,
                ["AutoLocalize"] = false,
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["Size"] = UDim2.new(1, 0, 0.4, 0),
                ["Text"] = u10.OfflineDisplayPlayer.displayName,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 14
                }) })
        end
        if v16 then
            v14[v15 + 1] = v16
        end
        v12.FriendNameInfo = u6.createElement("Frame", v13, v14)
        return u6.createElement("ImageButton", v11, v12)
    end)
}