local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["TrainingRoomKitSelectionEquipButton"] = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u4
            [3] = u3
            [4] = u7
        --]]
        local _ = p9.useState
        return u5.createElement(u4, {
            ["Size"] = u8.Size or UDim2.fromScale(1, 1)
        }, { u5.createElement(u3, {
                ["Text"] = "<b>ENTER TRAINING!</b>",
                ["Selectable"] = false,
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u7.backgroundSuccess,
                ["OnClick"] = function() --[[ Line: 11 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                    --]]
                    u8.EquipKit()
                end,
                ["TextLabel"] = {
                    ["Size"] = UDim2.fromScale(0, 0.5),
                    ["AutomaticSize"] = Enum.AutomaticSize.X
                }
            }) })
    end)
}