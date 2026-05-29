local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.LineFrame
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "flamethrower-upgrade").FlamethrowerUpgrade
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
local u12 = v1.import(script, script.Parent, "flamethrower-tier-card").FlamethrowerTierCard
local u13 = v11("CloseIcon")
local v14 = u7.Component:extend("FlamethrowerComponent")
function v14.init(p15, p16) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u10
    --]]
    p15:setState({
        ["upgrades"] = not p16.tool and {} or u10.getUpgradesFromFlamethrower(p16.tool)
    })
end
function v14.onClose(_) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u8.FLAMETHROWER_UPGRADES)
end
function v14.render(u17) --[[ Line: 26 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u5
        [4] = u13
        [5] = u6
        [6] = u12
        [7] = u9
    --]]
    local function v19(p18) --[[ Line: 27 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        u17:setState({
            ["upgrades"] = p18
        })
    end
    local v20 = nil
    for v21, v22 in u3.values(u17.state.upgrades) do
        local _ = v21 - 1
        if v22 >= 3 == true then
            v20 = v22
            break
        end
    end
    local v23 = v20 ~= nil
    return u7.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.6, 0.6)
    }, { u7.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }), u7.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.0729559748427673)
        }, { u7.createElement("TextLabel", {
                ["Font"] = "RobotoCondensed",
                ["Text"] = "Flamethrower Upgrades",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.4, 0.9),
                ["Position"] = UDim2.fromScale(0, 0),
                ["TextColor3"] = u5.WHITE
            }), u7.createElement("TextButton", {
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -15, 0.5, -2),
                ["Size"] = UDim2.fromOffset(28, 28),
                ["BackgroundTransparency"] = 0.7,
                ["BackgroundColor3"] = u5.BLACK,
                ["Text"] = "",
                [u7.Event.Activated] = function() --[[ Line: 80 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    return u17:onClose()
                end
            }, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }), u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 3,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromOffset(10, 10),
                    ["Image"] = u13.Image,
                    ["ImageRectOffset"] = u13.ImageRectOffset,
                    ["ImageRectSize"] = u13.ImageRectSize
                }) }) }), u7.createElement("Frame", {
            ["BackgroundTransparency"] = 0.4,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9270440251572327),
            ["BackgroundColor3"] = u5.hexColor(0)
        }, { u7.createElement(u6, {
                ["BorderWidthPixels"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BorderColor3"] = u5.WHITE
            }, {
                u7.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://7286588591",
                    ["BackgroundTransparency"] = 1,
                    ["ScaleType"] = "Fit",
                    ["Size"] = UDim2.fromScale(1.85, 1.85),
                    ["Position"] = UDim2.fromScale(0.5, 0.4),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.4)
                }),
                u7.createElement(u12, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.5953405017921147, 0.04748982360922659),
                    ["Upgrade"] = u9.HEAT,
                    ["SetUpgrades"] = v19,
                    ["Locked"] = v23,
                    ["UpgradeMap"] = u17.state.upgrades
                }),
                u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://7287862213",
                    ["ScaleType"] = "Fit",
                    ["Position"] = UDim2.fromScale(0.7168458781362007, 0.29850746268656714),
                    ["Size"] = UDim2.fromScale(0.06164874551971326, 0.10990502035278155)
                }),
                u7.createElement(u12, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.1867383512544803, 0.7055630936227951),
                    ["Upgrade"] = u9.RANGE,
                    ["SetUpgrades"] = v19,
                    ["Locked"] = v23,
                    ["UpgradeMap"] = u17.state.upgrades
                }),
                u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://7292733307",
                    ["ScaleType"] = "Fit",
                    ["Position"] = UDim2.fromScale(0.30824372759856633, 0.6241519674355496),
                    ["Size"] = UDim2.fromScale(0.08028673835125448, 0.09905020352781546)
                }),
                u7.createElement(u12, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.13010752688172045, 0.04748982360922659),
                    ["Upgrade"] = u9.POWER,
                    ["SetUpgrades"] = v19,
                    ["Locked"] = v23,
                    ["UpgradeMap"] = u17.state.upgrades
                }),
                u7.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = "rbxassetid://7292841146",
                    ["ScaleType"] = "Fit",
                    ["Position"] = UDim2.fromScale(0.21505376344086022, 0.29850746268656714),
                    ["Size"] = UDim2.fromScale(0.03655913978494624, 0.07462686567164178)
                }),
                u7.createElement("TextLabel", {
                    ["Font"] = "RobotoCondensed",
                    ["Text"] = "*You can only upgrade one component to Tier 4.",
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Right",
                    ["TextYAlignment"] = "Bottom",
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.6702508960573477, 0.9430122116689281),
                    ["Size"] = UDim2.fromScale(0.3154121863799283, 0.037991858887381276),
                    ["TextColor3"] = u5.WHITE
                })
            }) }) })
end
return {
    ["FlamethrowerComponent"] = v14
}