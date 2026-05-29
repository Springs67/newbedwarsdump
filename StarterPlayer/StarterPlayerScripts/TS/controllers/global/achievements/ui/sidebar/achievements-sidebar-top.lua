local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
return {
    ["AchievementsSidebarTop"] = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src").new(u3)(function(p4, p5) --[[ Line: 6 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u3
        --]]
        local _ = p5.useState
        local v6 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.02)
        }
        local v7 = p4.FrameProps
        if v7 then
            for v8, v9 in v7 do
                v6[v8] = v9
            end
        end
        local v10 = {}
        local _ = #v10
        local v11 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v12
        if p4.DateAchieved == nil or not p4.Achieved then
            v12 = "Not yet achieved"
        else
            local v13 = p4.DateAchieved
            v12 = "Achieved " .. ((v13 == "" or not v13) and "" or p4.DateAchieved)
        end
        v11.Text = v12
        v11.TextScaled = true
        v11.Font = Enum.Font.Roboto
        v11.TextColor3 = u2.WHITE
        v11.BackgroundTransparency = 1
        v11.TextXAlignment = Enum.TextXAlignment.Right
        v11.LayoutOrder = 0
        v11.ZIndex = 10
        v10.AchievementDate = u3.createElement("TextLabel", v11)
        return u3.createFragment({
            ["SidebarTop"] = u3.createElement("Frame", v6, v10)
        })
    end)
}