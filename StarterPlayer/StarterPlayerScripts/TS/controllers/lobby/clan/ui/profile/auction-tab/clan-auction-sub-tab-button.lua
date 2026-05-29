local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.SoundManager
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["ClanAuctionSubTabButton"] = v6.new(u5)(function(u8) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
            [3] = u4
            [4] = u7
        --]]
        local v9 = u8.Tab == u8.ActiveTab
        local v10 = {
            ["Size"] = u8.Size,
            ["Text"] = u8.Text
        }
        local v11
        if v9 then
            v11 = u3.darken(u8.BackgroundColor3, 0.75)
        else
            v11 = u8.BackgroundColor3
        end
        v10.BackgroundColor3 = v11
        v10.BorderSizePixel = 0
        v10.TextColor3 = u8.TextColor3
        v10.TextTransparency = v9 and 0 or 0.3
        v10.ClipsDescendants = true
        v10[u5.Event.Activated] = function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u4
                [3] = u7
            --]]
            u8.SetTab(u8.Tab)
            u4:playSound(u7.UI_CLICK)
        end
        v10.LayoutOrder = u8.LayoutOrder
        local v12 = { u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 3)
            }) }
        local v13 = #v12
        if v9 then
            v9 = u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 2),
                ["AnchorPoint"] = Vector2.new(0.5, 1),
                ["Position"] = UDim2.fromScale(0.5, 1),
                ["BackgroundColor3"] = u3.WHITE
            })
        end
        if v9 then
            v12[v13 + 1] = v9
        end
        return u5.createFragment({
            ["ClanAuctionSubTabButton"] = u5.createElement("TextButton", v10, v12)
        })
    end)
}