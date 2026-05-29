local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.Button
local u6 = v3.ColorUtil
local u7 = v3.DeviceUtil
local u8 = v3.TooltipContainer
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["KitShopContractButton"] = v10.new(u9)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u9
            [3] = u5
            [4] = u2
            [5] = u11
            [6] = u6
            [7] = u7
            [8] = u14
            [9] = u8
            [10] = u4
            [11] = u13
        --]]
        local _ = p16.useState
        if u15.SelectedKit == u12.NONE then
            return u9.createFragment()
        end
        local v17 = u9.createFragment
        local v18 = {
            ["ContractButton"] = u9.createElement(u5, {
                ["BackgroundTransparency"] = 1,
                ["Selectable"] = true,
                ["Size"] = u15.Size,
                ["OnClick"] = function() --[[ Name: OnClick, Line 26 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u11
                        [3] = u15
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u11.KIT_CONTRACT_APP, {
                        ["SelectedKit"] = u15.SelectedKit
                    })
                end,
                ["LayoutOrder"] = u15.LayoutOrder
            }, {
                u9.createElement("UIStroke", {
                    ["Color"] = u6.hexColor(12077930),
                    ["Thickness"] = u7.isSmallScreen() and 1 or 2
                }),
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1000, 0)
                }),
                u9.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["Image"] = u14.SCROLL_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Size"] = UDim2.fromScale(0.65, 0.65),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }),
                u9.createElement(u8, {}, { u9.createElement(u4, {
                        ["Text"] = "Open Contract",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u9.createElement(u4, {
                        ["TextSize"] = 14,
                        ["Text"] = u13(u15.SelectedKit).name,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["Limits"] = Vector2.new(300, 500)
                    }) })
            })
        }
        return v17(v18)
    end)
}