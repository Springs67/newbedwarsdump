local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ActionButton
local u4 = v2.UIUtil
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["DroneItemUi"] = v6.new(u5)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u8
            [3] = u4
            [4] = u3
            [5] = u7
        --]]
        local _ = p10.useState
        local v11 = u5.createFragment
        local v12 = {}
        local v13 = u5.createElement
        local v14 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["LayoutOrder"] = u8.abilityActionBarPriority,
            ["Position"] = u4:getActionBarPosition()
        }
        local v15 = u9.amount
        v14.Text = tostring(v15)
        v14.TextColor3 = Color3.fromRGB(255, 255, 255)
        v14.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        v14.Size = u8.actionBarButtonSize
        __set_list(v12, 1, {v13("TextLabel", v14), u5.createElement(u3, {
    ["actionName"] = "release-item",
    ["text"] = "Release Item",
    ["priority"] = 50,
    ["onActivated"] = function() --[[ Name: onActivated, Line 26 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u9
        --]]
        u7.Client:Get("DropDroneItem"):SendToServer({
            ["position"] = u9.drone:GetPrimaryPartCFrame().Position,
            ["direction"] = u9.drone:GetPrimaryPartCFrame().LookVector
        })
    end,
    ["interactionKey"] = Enum.KeyCode.X
})})
        return v11(v12)
    end)
}