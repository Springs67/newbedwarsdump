local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").TNT_WARS_IMAGE_ID
local v4 = u2.Component:extend("TNTWarsLogo")
function v4.init(_) --[[ Line: 8 ]] end
function v4.render(_) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    return u2.createFragment({ u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u3.LOGO,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, -0.27),
            ["SizeConstraint"] = Enum.SizeConstraint.RelativeXX,
            ["Size"] = UDim2.fromScale(0.1, 0.1)
        }), u2.createElement("TextLabel", {
            ["Text"] = "WARS!",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Rotation"] = -21,
            ["TextStrokeTransparency"] = 0,
            ["ZIndex"] = 4,
            ["Position"] = UDim2.fromScale(0.535, -0.205),
            ["Size"] = UDim2.fromScale(0.1, 0.1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Font"] = Enum.Font.Arcade,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["TextStrokeColor3"] = Color3.fromRGB(0, 0, 0)
        }) })
end
return {
    ["TNTWarsLogo"] = v4
}