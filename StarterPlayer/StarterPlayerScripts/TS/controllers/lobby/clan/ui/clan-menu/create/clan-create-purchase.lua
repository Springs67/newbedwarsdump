local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.ImageId
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
return {
    ["ClanCreatePurchase"] = v9.new(u8)(function(_, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u11
            [3] = u7
            [4] = u8
            [5] = u5
            [6] = u10
            [7] = u12
            [8] = u4
            [9] = u3
            [10] = u6
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(0)
        v16(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u11
                [3] = u18
            --]]
            u13.getGamePassProductInfoAsync(u11.CLAN_CREATE_PASS):andThen(function(p19) --[[ Line: 21 ]]
                --[[
                Upvalues:
                    [1] = u18
                --]]
                local v20
                if p19 == nil then
                    v20 = p19
                else
                    v20 = p19.PriceInRobux
                end
                if v20 == nil then
                    return nil
                end
                if p19 ~= nil then
                    p19 = p19.PriceInRobux
                end
                u18(p19)
            end):catch(function() --[[ Line: 35 ]] end)
        end, {})
        local function v21() --[[ Line: 37 ]]
            --[[
            Upvalues:
                [1] = u7
            --]]
            u7.Controllers.ClanController:promptClanPassPurchase()
        end
        return u8.createElement(u5, {
            ["Size"] = UDim2.fromScale(1, 0.9)
        }, {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 20)
            }),
            u8.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["Image"] = u10.CLAN
            }),
            u8.createElement(u5, {
                ["AutomaticSize"] = "Y",
                ["Size"] = UDim2.fromScale(1, 0)
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, 6)
                }), u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "<b>CLAN PASS</b>",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["TextColor3"] = u12.textPrimary
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 24
                    }) }), u8.createElement("TextLabel", {
                    ["AutomaticSize"] = "Y",
                    ["SizeConstraint"] = "RelativeXX",
                    ["Text"] = "Purchase the Clan Pass to create a clan",
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextTransparency"] = 0.4,
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Center",
                    ["Size"] = UDim2.fromScale(1, 0),
                    ["TextColor3"] = u4.WHITE
                }, { u8.createElement("UITextSizeConstraint", {
                        ["MaxTextSize"] = 20
                    }) }) }),
            u8.createElement(u3, {
                ["Selectable"] = false,
                ["Size"] = UDim2.new(0.8, 0, 0, 50),
                ["BackgroundColor3"] = u12.backgroundSuccess,
                ["OnClick"] = v21
            }, { u8.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, 10)
                }), u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u6.ROBUX,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.55),
                    ["AnchorPoint"] = Vector2.new(1, 0.5)
                }), u8.createElement("TextLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["TextXAlignment"] = "Left",
                    ["Text"] = "<b>" .. tostring(v17) .. "</b>",
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }) })
        })
    end)
}