local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = u2.Component:extend("EngineerCrosshair")
function u4.init(_) --[[ Line: 8 ]] end
function u4.render(_) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    return u2.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.08, 0.08),
        ["Image"] = u3.TURRET_CROSSHAIR
    }, { u2.createElement("UIAspectRatioConstraint") })
end
return {
    ["EngineerCrosshairWrapper"] = function() --[[ Name: EngineerCrosshairWrapper, Line 22 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u4
        --]]
        return u2.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false,
            ["IgnoreGuiInset"] = true
        }, { u2.createElement(u4) })
    end,
    ["EngineerCrosshair"] = u4
}