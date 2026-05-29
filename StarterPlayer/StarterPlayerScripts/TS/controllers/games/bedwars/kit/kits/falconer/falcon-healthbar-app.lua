local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u5 = v1.import(script, script.Parent, "falcon-healthbar").FalconHealthbar
local u6 = u4.Component:extend("FalconHealthbarApp")
function u6.init(p7, _) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    p7.maid = u3.new()
end
function u6.didMount(_) --[[ Line: 13 ]] end
function u6.willUnmount(p8) --[[ Line: 15 ]]
    p8.maid:DoCleaning()
end
function u6.render(p9) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u2
        [3] = u5
    --]]
    return u4.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(0.6, u2.isSmallScreen() and 0.13 or 0.08),
        ["AnchorPoint"] = Vector2.new(0.5, 1),
        ["Position"] = UDim2.fromScale(0.5, u2.isSmallScreen() and 0.95 or 0.99)
    }, { u4.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 9
        }), u4.createElement(u5, {
            ["instance"] = p9.props.instance
        }) })
end
return {
    ["FalconHealthbarAppWrapper"] = function(p10) --[[ Name: FalconHealthbarAppWrapper, Line 35 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u6
        --]]
        return u4.createElement("ScreenGui", {
            ["DisplayOrder"] = 9,
            ["ResetOnSpawn"] = false
        }, { u4.createElement(u6, {
                ["store"] = p10.store,
                ["instance"] = p10.instance
            }) })
    end,
    ["FalconHealthbarApp"] = u6
}