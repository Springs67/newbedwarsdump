local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
return {
    ["KillFeedPayout"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u5
            [3] = u8
            [4] = u4
            [5] = u3
        --]]
        local _ = p10.useState
        local v11 = u6.createRef()
        local v12 = u5.entries(p9.killPayout)
        local function v26(p13, _) --[[ Line: 14 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u6
                [3] = u4
                [4] = u3
            --]]
            local v14 = p13[1]
            local v15 = p13[2]
            local v16 = u8(v14)
            local v17 = u6.createElement
            local v18 = u4
            local v19 = {
                ["AutomaticSize"] = "X",
                ["Size"] = UDim2.fromScale(0, 1)
            }
            local v20 = {}
            local v21 = u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 3)
            })
            local v22 = u6.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1.6),
                ["Image"] = v16.image,
                ["ScaleType"] = Enum.ScaleType.Crop
            })
            local v23 = u6.createElement
            local v24 = {
                ["Font"] = "GothamBold",
                ["TextXAlignment"] = "Left",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["AutomaticSize"] = "X",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 0.95)
            }
            local v25 = v15.amount
            v24.Text = "+" .. tostring(v25)
            v24.TextColor3 = v16.displayNameColor or Color3.fromRGB(255, 255, 255)
            v24.TextYAlignment = u3.isSmallScreen() and "Bottom" or "Center"
            __set_list(v20, 1, {v21, v22, v23("TextLabel", v24)})
            return v17(v18, v19, v20)
        end
        local v27 = table.create(#v12)
        for v28, v29 in v12 do
            v27[v28] = v26(v29, v28 - 1, v12)
        end
        local v30 = {
            ["AnchorPoint"] = p9.AnchorPoint,
            ["Position"] = p9.Position,
            ["Size"] = p9.Size,
            ["LayoutOrder"] = 1,
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
            ["BackgroundTransparency"] = 0.3,
            [u6.Ref] = v11,
            ["AutomaticSize"] = "X"
        }
        local v31 = { u6.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 0),
                ["PaddingRight"] = UDim.new(0, 0)
            }), u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Left",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, -3)
            }) }
        local v32 = #v31
        for v33, v34 in v27 do
            v31[v32 + v33] = v34
        end
        return u6.createFragment({
            ["KillFeedPayoutContainer"] = u6.createElement("Frame", v30, v31)
        })
    end)
}