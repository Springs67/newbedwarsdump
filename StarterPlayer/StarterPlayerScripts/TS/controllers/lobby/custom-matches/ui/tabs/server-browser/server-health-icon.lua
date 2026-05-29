local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ImageId
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "server-health", "server-health-state").ServerHealthMeta
return {
    ["ServerHealthIcon"] = v7.new(u6)(function(p9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u4
            [3] = u8
            [4] = u5
            [5] = u3
        --]]
        local _ = p10.useState
        local v11 = u6.createFragment
        local v12 = {
            ["ServerHealthStateIcon"] = u6.createElement("ImageLabel", {
                ["ImageTransparency"] = 0,
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u4.WIFI_SOLID,
                ["ImageColor3"] = u8[p9.serverHealthState].color,
                ["LayoutOrder"] = p9.layoutOrder
            }, { u6.createElement(u5, {}, { u6.createElement(u3, {
                        ["TextSize"] = 16,
                        ["Text"] = "Server Health: " .. p9.serverHealthState,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) })
        }
        return v11(v12)
    end)
}