local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
return {
    ["PlayerStats"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u3
            [3] = u4
            [4] = u5
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(nil)
        v11(function() --[[ Line: 13 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u13
            --]]
            if u8.Eliminated == true then
                u13(true)
            end
        end, { u8.Eliminated })
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(u7.columns.right.totalWidth, 0, 1, 0),
            ["BackgroundTransparency"] = u7.bgTransparency.playerRow,
            ["BackgroundColor3"] = u3.hexColor(3750752)
        }
        local v15 = {}
        local _ = #v15
        local v16 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["TextXAlignment"] = Enum.TextXAlignment.Center
        }
        local v17 = u8.Kills
        local v18 = v17 == nil and 0 or v17
        v16.Text = tostring(v18)
        v16.TextTransparency = v12 and 0.5 or 0
        v16.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v16.TextSize = u4.isSmallScreen() and 13 or 16
        v16.TextColor3 = u3.WHITE
        v16.LayoutOrder = 1
        v15.KillsStat = u5.createElement("TextLabel", v16)
        return u5.createElement("Frame", v14, v15)
    end)
}