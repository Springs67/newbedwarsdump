local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u5 = v4.ColorUtil
local u6 = v4.LineFrame
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-upgrades").FrostyHammerUpgrade
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "frosty-hammer", "frosty-hammer-util").FrostyHammerUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tarmac", "tarmac-helpers").GetTarmacAsset
local u15 = v1.import(script, script.Parent, "frosty-hammer-tier-card").FrostyHammerTierCard
local u16 = v14("CloseIcon")
local v17 = u8.Component:extend("FrostyHammerComponent")
function v17.init(p18, p19) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u12
        [2] = u9
        [3] = u7
        [4] = u13
    --]]
    p18:setState({
        ["upgrades"] = not p19.tool and {} or u12.getUpgradesFromHammer(u9.LocalPlayer)
    })
    local v20 = u7.Controllers.KitSkinController:getPlayerKitSkinMeta(u9.LocalPlayer)
    local v21 = {}
    if v20 ~= nil then
        v20 = v20.adetunde
        if v20 ~= nil then
            v20 = v20.hammerRender
        end
    end
    if v20 == nil then
        v20 = u13.ADETUNDE_HAMMER_RENDER
    end
    v21.hammerBackgroundImage = v20
    p18:setState(v21)
end
function v17.onClose(_) --[[ Line: 43 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u10
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u10.FROSTY_HAMMER_UPGRADES)
end
function v17.render(u22) --[[ Line: 46 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u5
        [4] = u16
        [5] = u6
        [6] = u15
        [7] = u11
    --]]
    local function v24(p23) --[[ Line: 47 ]]
        --[[
        Upvalues:
            [1] = u22
        --]]
        u22:setState({
            ["upgrades"] = p23
        })
    end
    local v25 = nil
    for v26, v27 in u3.values(u22.state.upgrades) do
        local _ = v26 - 1
        if v27 >= 3 == true then
            v25 = v27
            break
        end
    end
    local v28 = v25 ~= nil
    return u8.createElement("Frame", {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(0.6, 0.6)
    }, { u8.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }), u8.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.0729559748427673)
        }, { u8.createElement("TextLabel", {
                ["Font"] = "RobotoCondensed",
                ["Text"] = "Frosty Hammer Upgrades",
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.4, 0.9),
                ["Position"] = UDim2.fromScale(0, 0),
                ["TextColor3"] = u5.WHITE
            }), u8.createElement("TextButton", {
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.new(1, -15, 0.5, -2),
                ["Size"] = UDim2.fromOffset(28, 28),
                ["BackgroundTransparency"] = 0.7,
                ["BackgroundColor3"] = u5.BLACK,
                ["Text"] = "",
                [u8.Event.Activated] = function() --[[ Line: 100 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                    --]]
                    return u22:onClose()
                end
            }, { u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }), u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 3,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromOffset(10, 10),
                    ["Image"] = u16.Image,
                    ["ImageRectOffset"] = u16.ImageRectOffset,
                    ["ImageRectSize"] = u16.ImageRectSize
                }) }) }), u8.createElement("Frame", {
            ["BackgroundTransparency"] = 0.4,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9270440251572327),
            ["BackgroundColor3"] = u5.hexColor(0)
        }, { u8.createElement(u6, {
                ["BorderWidthPixels"] = 2,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BorderColor3"] = u5.WHITE
            }, {
                u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["ScaleType"] = "Fit",
                    ["Image"] = u22.state.hammerBackgroundImage,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.4),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.4)
                }),
                u8.createElement(u15, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.5953405017921147, 0.27137042062415195),
                    ["Upgrade"] = u11.STRENGTH,
                    ["SetUpgrades"] = v24,
                    ["Locked"] = v28,
                    ["UpgradeMap"] = u22.state.upgrades
                }),
                u8.createElement(u15, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.22258064516129034, 0.7055630936227951),
                    ["Upgrade"] = u11.SPEED,
                    ["SetUpgrades"] = v24,
                    ["Locked"] = v28,
                    ["UpgradeMap"] = u22.state.upgrades
                }),
                u8.createElement(u15, {
                    ["Size"] = UDim2.fromScale(0.24301075268817204, 0.20081411126187246),
                    ["Position"] = UDim2.fromScale(0.3093189964157706, 0.04748982360922659),
                    ["Upgrade"] = u11.SHIELD,
                    ["SetUpgrades"] = v24,
                    ["Locked"] = v28,
                    ["UpgradeMap"] = u22.state.upgrades
                }),
                u8.createElement("TextLabel", {
                    ["Font"] = "RobotoCondensed",
                    ["Text"] = "*You can only upgrade one component to Tier 3.",
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
    ["FrostyHammerComponent"] = v17
}