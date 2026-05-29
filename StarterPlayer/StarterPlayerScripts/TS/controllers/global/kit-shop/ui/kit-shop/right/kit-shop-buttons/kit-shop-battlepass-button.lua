local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.ImageId
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["KitShopBattlePassButton"] = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u9
            [4] = u2
            [5] = u8
            [6] = u5
        --]]
        local _ = p11.useState
        return u6.createElement(u4, {
            ["Selectable"] = false,
            ["Size"] = p10.Size,
            ["BackgroundColor3"] = u9.backgroundSuccess,
            ["OnClick"] = function() --[[ Name: OnClick, Line 17 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u8
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u8.BATTLEPASS, {})
            end,
            ["LayoutOrder"] = p10.LayoutOrder
        }, { u6.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["Image"] = u5.TICKET,
                ["ImageColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.67, 0.65),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.2, 0.5)
            }), u6.createElement("TextLabel", {
                ["Text"] = "BATTLE PASS",
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["TextScaled"] = true,
                ["TextXAlignment"] = "Left",
                ["Size"] = UDim2.fromScale(0.42, 0.45),
                ["Position"] = UDim2.fromScale(0.36, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) })
    end)
}