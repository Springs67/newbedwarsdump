local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u5 = v1.import(script, script.Parent, "avatar-upper").AvatarUpper
local u6 = u2.Component:extend("TargetMarker")
function u6.init(_) --[[ Line: 10 ]] end
function u6.render(p7) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u4
        [3] = u3
        [4] = u5
    --]]
    return u2.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["ScaleType"] = "Fit",
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["ImageColor3"] = u4.backgroundPrimary,
        ["Size"] = UDim2.new(1, 0, 1, 0),
        ["Image"] = u3.BOUNTY_HUNTER_MARKER
    }, { u2.createElement(u5, {
            ["store"] = p7.props.store,
            ["player"] = p7.props.player,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.2),
            ["Size"] = UDim2.fromScale(0.3, 0.3),
            ["BackgroundColor3"] = u4.backgroundSecondary
        }, { u2.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1,
                ["DominantAxis"] = "Width"
            }), u2.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }) }) })
end
function u6.shouldUpdate(p8, p9) --[[ Line: 40 ]]
    return p8.props.store.Kit.bountyHunterTarget ~= p9.store.Kit.bountyHunterTarget
end
return {
    ["TargetMarkerWrapper"] = function(p10) --[[ Name: TargetMarkerWrapper, Line 44 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u6
        --]]
        return u2.createElement("BillboardGui", {
            ["ExtentsOffsetWorldSpace"] = Vector3.new(0, 3, 0),
            ["ResetOnSpawn"] = false,
            ["Size"] = UDim2.fromOffset(100, 100),
            ["SizeOffset"] = Vector2.new(0, 1),
            ["Adornee"] = p10.adornee
        }, { u2.createElement(u6, {
                ["store"] = p10.store,
                ["player"] = p10.player
            }) })
    end,
    ["TargetMarker"] = u6
}