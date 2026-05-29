local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab")
local u7 = v6.LockerTab
local u8 = v6.LockerTabOrder
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LockerTabList"] = v5.new(u4)(function(u10, _) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u7
            [3] = u9
            [4] = u8
            [5] = u4
            [6] = u2
        --]]
        local v11 = u10.ExcludedTabs or {}
        local v12 = 0
        local v13 = {}
        for v14, v15 in u3.entries(u7) do
            local _ = v14 - 1
            local v16 = v15[2]
            if table.find(v11, v16) == nil == true then
                v12 = v12 + 1
                v13[v12] = v15
            end
        end
        local v17 = {
            ["BorderSizePixel"] = 0,
            ["ScrollBarThickness"] = 6,
            ["Size"] = u10.Size or UDim2.fromScale(1, 0.1),
            ["BackgroundColor3"] = u9.backgroundTertiary,
            ["ScrollingDirection"] = Enum.ScrollingDirection.X,
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.XY
        }
        local v18 = u10.LayoutOrder
        v17.LayoutOrder = v18 == nil and 0 or v18
        local function v29(p19, _) --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u7
                [3] = u8
                [4] = u4
                [5] = u2
            --]]
            local u20 = p19[1]
            local v21 = p19[2]
            local u22 = u10.Tab == u7[u20]
            local v25 = {
                ["Size"] = UDim2.fromScale(0, 1),
                ["AutomaticSize"] = "X",
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
                ["BackgroundTransparency"] = u22 and 0.7 or 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = u8[v21],
                [u4.Event.Activated] = function() --[[ Line: 56 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                        [2] = u7
                        [3] = u20
                    --]]
                    u10.ChangeTab(u7[u20])
                end,
                [u4.Event.MouseEnter] = function(p23) --[[ Line: 59 ]]
                    p23.BackgroundTransparency = 0.7
                end,
                [u4.Event.MouseLeave] = function(p24) --[[ Line: 62 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                    --]]
                    p24.BackgroundTransparency = u22 and 0.7 or 1
                end
            }
            local v26 = { u4.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }), u4.createElement("UIPadding", {
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingRight"] = UDim.new(0, 10)
                }) }
            local v27 = #v26
            local v28 = not u2.isSmallScreen()
            if v28 then
                v28 = u4.createElement("UIListLayout", {
                    ["VerticalAlignment"] = "Center"
                })
            end
            if v28 then
                v26[v27 + 1] = v28
            end
            v26[#v26 + 1] = u4.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["TextScaled"] = false,
                ["BackgroundTransparency"] = 1,
                ["TextWrap"] = false,
                ["Size"] = UDim2.fromScale(0, u2.isSmallScreen() and 1 or 0.8),
                ["Text"] = string.upper(v21),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }, { u4.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 22,
                    ["MinTextSize"] = 12
                }) })
            return u4.createElement("ImageButton", v25, v26)
        end
        local v30 = table.create(#v13)
        for v31, v32 in v13 do
            v30[v31] = v29(v32, v31 - 1, v13)
        end
        local v33 = { u4.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 12),
                ["PaddingRight"] = UDim.new(0, 8),
                ["PaddingTop"] = UDim.new(0, 6),
                ["PaddingBottom"] = UDim.new(0, 6)
            }), u4.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = u10.Padding or UDim.new(0, u2.isSmallScreen() and 20 or 10)
            }) }
        local v34 = #v33
        for v35, v36 in v30 do
            v33[v34 + v35] = v36
        end
        return u4.createFragment({
            ["Tabs"] = u4.createElement("ScrollingFrame", v17, v33)
        })
    end)
}