local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.TooltipContainer
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local v7 = u5.Component:extend("ItemToolTip")
function v7.init(_, _) --[[ Line: 11 ]] end
function v7.render(p8) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u5
        [3] = u3
        [4] = u4
    --]]
    local v9 = p8.props.item
    if v9 == nil then
        return nil
    end
    local v10 = u6(v9)
    local v11
    if v10 == nil then
        v11 = v10
    else
        v11 = v10.description
    end
    local v12 = v11 ~= nil
    if v12 then
        v12 = u5.createElement(u3, {
            ["TextSize"] = 14,
            ["Text"] = v10.description,
            ["Font"] = Enum.Font.SourceSansSemibold,
            ["Limits"] = Vector2.new(300, 500)
        })
    end
    local v13 = { u5.createElement(u3, {
            ["TextSize"] = 16,
            ["Text"] = v10.displayName,
            ["Font"] = Enum.Font.SourceSansBold,
            ["Limits"] = Vector2.new(300, 60)
        }) }
    local v14 = #v13
    if v12 then
        v13[v14 + 1] = v12
    end
    local v15 = #v13
    local v16 = p8.props.showTechnicalName
    if v16 then
        v16 = u5.createElement(u3, {
            ["TextSize"] = 12,
            ["TextTransparency"] = 0.3,
            ["Text"] = v9,
            ["Font"] = Enum.Font.SourceSansSemibold,
            ["Limits"] = Vector2.new(300, 500)
        })
    end
    if v16 then
        v13[v15 + 1] = v16
    end
    return u5.createElement(u4, {}, v13)
end
return {
    ["ItemToolTip"] = v7
}