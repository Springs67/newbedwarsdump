local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.DeviceUtil
local u7 = v3.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["KitShopReadLoreButton"] = v9.new(u8)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u8
            [3] = u5
            [4] = u2
            [5] = u10
            [6] = u6
            [7] = u13
            [8] = u7
            [9] = u4
            [10] = u12
        --]]
        local _ = p15.useState
        if u14.SelectedKit == u11.NONE then
            return u8.createFragment()
        end
        local v16 = u8.createFragment
        local v17 = {
            ["ReadLoreButton"] = u8.createElement(u5, {
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Size"] = u14.Size,
                ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u10
                        [3] = u14
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u10.LORE, {
                        ["SelectedKit"] = u14.SelectedKit
                    })
                end,
                ["LayoutOrder"] = u14.LayoutOrder
            }, {
                u8.createElement("UIStroke", {
                    ["Color"] = Color3.fromRGB(255, 97, 252),
                    ["Thickness"] = u6.isSmallScreen() and 1 or 2
                }),
                u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1000, 0)
                }),
                u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u13.BOOK_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }),
                u8.createElement(u7, {}, { u8.createElement(u4, {
                        ["Text"] = "Read Lore",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u8.createElement(u4, {
                        ["TextSize"] = 14,
                        ["Text"] = u12(u14.SelectedKit).name,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["Limits"] = Vector2.new(300, 500)
                    }) })
            })
        }
        return v16(v17)
    end)
}