local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u4 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievements-core").AchievementsCore
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u6 = v1.import(script, script.Parent, "player-profile-empty").PlayerProfileEmpty
return {
    ["PlayerProfileAchievements"] = v3.new(u2)(function(p7, p8) --[[ Line: 8 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u2
            [3] = u6
            [4] = u4
        --]]
        local _ = p8.useState
        local v9 = 0
        for _, v10 in p7.ProfileData.achievements do
            if v10.achieved then
                v9 = v9 + 1
            end
        end
        local v11 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.95, 0.98),
            ["BackgroundColor3"] = u5.backgroundPrimary,
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.02)
        }
        local v12 = p7.FrameProps
        if v12 then
            for v13, v14 in v12 do
                v11[v13] = v14
            end
        end
        local v15 = {}
        local v16 = #v15
        local v17
        if v9 <= 0 then
            v17 = u2.createElement(u6, {
                ["Text"] = "No achievements yet!",
                ["Size"] = UDim2.fromScale(1, 1)
            })
        else
            v17 = false
        end
        if v17 then
            v15[v16 + 1] = v17
        end
        local v18 = #v15
        local v19
        if v9 > 0 then
            v19 = u2.createElement(u4, {
                ["ViewingAsLocalPlayer"] = false,
                ["ViewingOnProfile"] = true,
                ["ProfileData"] = p7.ProfileData
            })
        else
            v19 = false
        end
        if v19 then
            v15[v18 + 1] = v19
        end
        return u2.createElement("Frame", v11, v15)
    end)
}