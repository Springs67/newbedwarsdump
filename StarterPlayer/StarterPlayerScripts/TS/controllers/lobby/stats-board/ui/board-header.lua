local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["StatsBoardHeader"] = v3.new(u2)(function(p6, _) --[[ Line: 7 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u2
            [3] = u5
        --]]
        local v7 = u4.LocalPlayer
        if v7 ~= nil then
            v7 = v7.DisplayName
        end
        local v8 = v7 == nil and "ology" or v7
        return u2.createElement("ImageLabel", {
            ["Image"] = "rbxassetid://7106394844",
            ["BorderSizePixel"] = 0,
            ["Size"] = p6.Size
        }, {
            u2.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 2)
            }),
            u2.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.1, 0),
                ["PaddingBottom"] = UDim.new(0.1, 0),
                ["PaddingLeft"] = UDim.new(0.075, 0),
                ["PaddingRight"] = UDim.new(0.075, 0)
            }),
            u2.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["AutoLocalize"] = false,
                ["Text"] = v8 .. "\'s Stats",
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            u2.createElement("TextLabel", {
                ["Text"] = "All-Time",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u5.textPrimary
            })
        })
    end)
}