local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v2 = u1.Component:extend("WorldGuardRegionNametag")
function v2.init(_) --[[ Line: 7 ]] end
function v2.render(p3) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u1
    --]]
    local v4 = u1.createFragment
    local v5 = {}
    local v6 = "WorldGuardRegionBillboard_" .. p3.props.regionId
    local v7 = u1.createElement
    local v8 = {
        ["ExtentsOffset"] = Vector3.new(0, 0, 0),
        ["MaxDistance"] = 110,
        ["AlwaysOnTop"] = true,
        ["Adornee"] = p3.props.adornee,
        ["Size"] = UDim2.fromScale(7.5, 2.5)
    }
    local v9 = {}
    local v10 = u1.createElement
    local v11 = {
        ["BackgroundTransparency"] = 0.2,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = Color3.fromRGB(43, 20, 38),
        ["Visible"] = p3.props.visible
    }
    local v12 = { (u1.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.15, 0)
        })) }
    local v13 = u1.createElement
    local v14 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.85, 0.85)
    }
    local v15 = {
        ["Id"] = u1.createElement("TextLabel", {
            ["TextStrokeTransparency"] = 0,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Text"] = p3.props.regionId,
            ["Font"] = Enum.Font.Arial,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0, 0),
            ["TextStrokeColor3"] = Color3.fromRGB(43, 20, 38),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255)
        })
    }
    v12.TextArea = v13("Frame", v14, v15)
    v9.BillboardFrame = v10("ImageLabel", v11, v12)
    v5[v6] = v7("BillboardGui", v8, v9)
    return v4(v5)
end
function v2.didMount(_) --[[ Line: 53 ]] end
return {
    ["WorldGuardRegionNametag"] = v2
}