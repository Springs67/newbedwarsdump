local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v20 = v4.new(u3)(function(p7, p8) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
        [3] = u6
    --]]
    local _ = p8.useState
    local v11 = {
        ["Size"] = UDim2.new(1, 0, 0, p7.Disabled and 0 or 32),
        ["LayoutOrder"] = p7.LayoutOrder,
        [u3.Event.Activated] = p7.OnClick,
        [u3.Event.MouseEnter] = function(p9) --[[ Line: 14 ]]
            p9.BackgroundTransparency = 0.7
        end,
        [u3.Event.MouseLeave] = function(p10) --[[ Line: 17 ]]
            p10.BackgroundTransparency = 1
        end,
        ["BorderSizePixel"] = 0,
        ["BackgroundColor3"] = u2.WHITE,
        ["BackgroundTransparency"] = 1,
        ["Visible"] = not p7.Disabled
    }
    local v12 = { u3.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        }), u3.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0, 8),
            ["PaddingRight"] = UDim.new(0, 8)
        }), u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v13 = #v12
    local v14 = {}
    local v15 = p7.Image
    if v15 == nil then
        v15 = u6.STAR_ALT_SOLID
    end
    v14.Image = v15
    v14.Size = UDim2.new(0, 16, 0, 16)
    v14.BackgroundTransparency = 1
    v14.BorderSizePixel = 0
    v12[v13 + 1] = u3.createElement("ImageLabel", v14)
    local v16 = v13 + 2
    local v17 = u3.createElement
    local v18 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["TextSize"] = 16
    }
    local v19 = p7.Text
    v18.Text = tostring(v19)
    v18.AutomaticSize = Enum.AutomaticSize.X
    v18.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v18.TextXAlignment = Enum.TextXAlignment.Left
    v18.TextColor3 = u2.WHITE
    v12[v16] = v17("TextLabel", v18)
    return u3.createElement("ImageButton", v11, v12)
end)
return {
    ["TopBarDropdownItem"] = v5.connect(function(_, p21) --[[ Line: 64 ]]
        local v22 = {}
        for v23, v24 in p21 do
            v22[v23] = v24
        end
        return v22
    end)(v20)
}