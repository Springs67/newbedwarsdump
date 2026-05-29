local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["PlayerProfileTabButton"] = v6.new(u5)(function(p8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u3
            [3] = u4
            [4] = u7
        --]]
        local _ = p9.useState
        local v10 = u5.createElement
        local v11 = u3
        local v12 = {
            ["Size"] = p8.Size or UDim2.fromScale(u4.isSmallScreen() and 0.16 or 0.13, 1),
            ["LayoutOrder"] = p8.LayoutOrder,
            ["Text"] = "<b>" .. p8.Text .. "</b>",
            ["OnClick"] = p8.OnClick,
            ["CornerRadius"] = UDim.new(0, 0)
        }
        local v13
        if p8.Tab == p8.ActiveTab then
            v13 = u7.backgroundTertiaryCard
        else
            v13 = u7.backgroundTertiary
        end
        v12.BackgroundColor3 = v13
        return v10(v11, v12)
    end)
}