local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u5)(function(p6, p7) --[[ Line: 8 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    local _ = p7.useState
    local v8 = UDim2.fromScale(0.98, 0.03)
    local v9 = UDim2.fromScale(0.99, 0.01)
    local v10 = {
        ["Size"] = UDim2.fromScale(0.2, 1)
    }
    if not u3.isMobileControls() then
        v8 = v9
    end
    v10.Position = v8
    v10.AnchorPoint = Vector2.new(1, 0)
    local v11 = { u5.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Right",
            ["Padding"] = UDim.new(0, u3.isSmallScreen() and 2 or 5)
        }) }
    local v12 = #v11
    local v13 = p6[u5.Children]
    if v13 then
        for v14, v15 in v13 do
            if type(v14) == "number" then
                v11[v12 + v14] = v15
            else
                v11[v14] = v15
            end
        end
    end
    return u5.createFragment({
        ["KillFeedContainer"] = u5.createElement(u4, v10, v11)
    })
end)
return {
    ["KillFeedWrapper"] = function(_) --[[ Name: KillFeedWrapper, Line 40 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u16
        --]]
        return u5.createFragment({
            ["KillFeedGui"] = u5.createElement("ScreenGui", {
                ["ResetOnSpawn"] = false,
                ["DisplayOrder"] = 20
            }, { u5.createElement(u16) })
        })
    end,
    ["KillFeed"] = u16
}