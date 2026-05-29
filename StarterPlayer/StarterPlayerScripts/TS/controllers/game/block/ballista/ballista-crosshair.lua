local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = u2.Component:extend("BallistaCrosshair")
function u4.init(_) --[[ Line: 8 ]] end
function u4.render(_) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u3
    --]]
    local v5 = u2.createFragment
    local v6 = {
        ["BallistaCrosshair"] = u2.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["ImageTransparency"] = 0.2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.08, 0.08),
            ["Image"] = u3.TURRET_CROSSHAIR
        }, { u2.createElement("UIAspectRatioConstraint") })
    }
    return v5(v6)
end
return {
    ["BallistaCrosshairWrapper"] = function() --[[ Name: BallistaCrosshairWrapper, Line 25 ]]
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
    ["BallistaCrosshair"] = u4
}