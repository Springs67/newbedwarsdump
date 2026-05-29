local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.CornerFiller
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SlideIn
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u10 = v1.import(script, script.Parent, "avatar-upper").AvatarUpper
local u11 = u8.Component:extend("BountyHunterPoster")
function u11.init(_) --[[ Line: 15 ]] end
function u11.render(p12) --[[ Line: 17 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u7
        [4] = u5
        [5] = u9
        [6] = u4
        [7] = u6
        [8] = u10
    --]]
    local v13 = p12.props.store.Kit.bountyHunterTarget
    if v13 == nil then
        return nil
    end
    local v14 = nil
    for v15, v16 in p12.props.store.Game.teams do
        local _ = v15 - 1
        local v17 = v16.name
        local v18 = v13.Team
        if v18 ~= nil then
            v18 = v18.Name
        end
        if v17 == v18 == true then
            v14 = v16
            break
        end
    end
    local v19 = u3
    if v14 ~= nil then
        v14 = v14.color
    end
    if v14 == nil then
        v14 = Color3.fromRGB(255, 255, 255)
    end
    local v20 = v19.richTextColor(v14)
    local v21 = u8.createElement
    local v22 = u7
    local v23 = {
        ["BountyHunterPoster"] = u8.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.new(0, 16, u5.isSmallScreen() and 0.4 or 0.5, 0),
            ["Size"] = UDim2.fromScale(0.35, 0.35),
            ["BackgroundColor3"] = u9.backgroundSecondary
        }, {
            u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.8432601880877743
            }),
            u8.createElement("UISizeConstraint", {
                ["MaxSize"] = Vector2.new(269, 319)
            }),
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder"
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }),
            ["Header"] = u8.createElement("Frame", {
                ["ZIndex"] = 2,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 0.15, 0),
                ["BackgroundColor3"] = u9.backgroundPrimary
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 4)
                }), u8.createElement(u4, {
                    ["BottomLeft"] = true,
                    ["BottomRight"] = true
                }), u8.createElement("TextLabel", {
                    ["ZIndex"] = 3,
                    ["BackgroundTransparency"] = 1,
                    ["Font"] = "Roboto",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["AutoLocalize"] = false,
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0, 0.5),
                    ["Size"] = UDim2.fromScale(1, 0.6),
                    ["Text"] = "<b>Target:</b> <b><font face=\"RobotoMono\" color=\"" .. v20 .. "\">" .. v13.DisplayName .. "</font></b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }) }),
            ["Background"] = u8.createElement(u6, {
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0.86, 0)
            }, {
                u8.createElement("UIListLayout", {
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["FillDirection"] = "Vertical",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.03, 0)
                }),
                ["Avatar"] = u8.createElement(u10, {
                    ["LayoutOrder"] = 1,
                    ["store"] = p12.props.store,
                    ["player"] = v13,
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Size"] = UDim2.fromScale(0.9, 0.7),
                    ["BackgroundColor3"] = u9.backgroundTertiary
                }, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }) }),
                ["TextSection"] = u8.createElement("Frame", {
                    ["LayoutOrder"] = 2,
                    ["AnchorPoint"] = Vector2.new(0.5, 0),
                    ["Size"] = UDim2.fromScale(0.9, 0.2),
                    ["BackgroundColor3"] = u9.backgroundTertiary
                }, { u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }), u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Font"] = "SourceSansSemibold",
                        ["Text"] = "Eliminate to receive rewards.",
                        ["RichText"] = true,
                        ["TextScaled"] = true,
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.9, 0.9),
                        ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                    }) })
            })
        })
    }
    return v21(v22, {}, v23)
end
function u11.shouldUpdate(p24, p25) --[[ Line: 148 ]]
    return p24.props.store.Kit.bountyHunterTarget ~= p25.store.Kit.bountyHunterTarget
end
return {
    ["BountyHunterPosterWrapper"] = function(p26) --[[ Name: BountyHunterPosterWrapper, Line 152 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u11
        --]]
        return u8.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u8.createElement(u11, {
                ["store"] = p26.store
            }) })
    end,
    ["BountyHunterPoster"] = u11
}