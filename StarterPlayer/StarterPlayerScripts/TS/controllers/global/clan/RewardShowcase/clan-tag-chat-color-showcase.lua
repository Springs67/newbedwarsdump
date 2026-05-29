local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-chat-tag-color").ChatTagColorDefinition
local v32 = v3.new(u2)(function(u6, p7) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    local v8 = p7.useState
    local v9 = p7.useEffect
    local v10 = u5[u6.ClanTagChatColor]
    local v11 = u6.Transparency
    local v12 = v11 == nil and 0 or v11
    local v13 = u6.store.Clans.myClan
    if v13 ~= nil then
        v13 = v13.tag
    end
    local v14, u15 = v8(v13 == nil and "CLAN" or v13)
    local function v17() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
        --]]
        local v16 = u6.store.Clans.myClan
        if v16 ~= nil then
            v16 = v16.tag
        end
        u15(v16 == nil and "CLAN" or v16)
    end
    local v18 = u6.store.Clans.myClan
    if v18 ~= nil then
        v18 = v18.tag
    end
    v9(v17, { v18 })
    local v19 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1),
        ["ZIndex"] = u6.ZIndex
    }
    local v20 = {}
    local v21 = #v20
    local v22 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.32),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v23 = { u2.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 4)
        }) }
    local v24 = #v23
    local v25 = v10.kind == "Gradient"
    if v25 then
        local v26 = {
            ["Color"] = v10.gradient
        }
        local v27 = v10.rotation
        v26.Rotation = v27 == nil and 0 or v27
        v25 = u2.createElement("UIGradient", v26)
    end
    local v28 = {
        ["BackgroundTransparency"] = 1,
        ["TextSize"] = 20,
        ["LayoutOrder"] = 1,
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["Size"] = UDim2.new(0, 0, 1, 0),
        ["Text"] = "[" .. v14 .. "]",
        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
        ["TextTransparency"] = v12
    }
    local v29
    if v10.kind == "Color" then
        v29 = v10.color
    else
        v29 = Color3.fromRGB(255, 255, 255)
    end
    v28.TextColor3 = v29
    v28.TextXAlignment = Enum.TextXAlignment.Center
    v28.TextYAlignment = Enum.TextYAlignment.Center
    v28.ZIndex = u6.ZIndex
    local v30 = {}
    local v31 = #v30
    if v25 then
        v30[v31 + 1] = v25
    end
    v23[v24 + 1] = u2.createElement("TextLabel", v28, v30)
    v20[v21 + 1] = u2.createElement("Frame", v22, v23)
    return u2.createElement("Frame", v19, v20)
end)
return {
    ["ClanTagChatColorShowcase"] = v4.connect(function(p33, p34) --[[ Line: 100 ]]
        local v35 = {
            ["store"] = p33
        }
        for v36, v37 in p34 do
            v35[v36] = v37
        end
        return v35
    end)(v32)
}