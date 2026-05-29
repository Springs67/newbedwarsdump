local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u7 = {
    Color3.fromRGB(255, 181, 38),
    Color3.fromRGB(194, 194, 194),
    Color3.fromRGB(171, 102, 28),
    Color3.fromRGB(56, 186, 0),
    Color3.fromRGB(18, 145, 237),
    Color3.fromRGB(0, 0, 0)
}
return {
    ["ScriptLeaderboardRow"] = v5.new(u4)(function(u8, p9) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u3
            [3] = u7
            [4] = u4
            [5] = u2
        --]]
        local v10 = p9.useState
        local v11 = p9.useEffect
        local v12, u13 = v10(u8.data.score)
        local v14 = nil
        if u8.data.keyType == "player" then
            v14 = u6:GetPlayerByUserId(u8.data.keyValue)
            if v14 ~= nil then
                v14 = v14.DisplayName
            end
        elseif u8.data.keyType == "team" then
            v14 = u3.Controllers.TeamController:getTeamById(u8.data.keyValue)
            if v14 ~= nil then
                v14 = v14.name
            end
        end
        if v14 == "" or not v14 then
            v14 = u8.data.keyValue
        end
        local v15 = u7
        local v16 = u8.data.place - 1
        local v17 = #u7 - 1
        local v18 = v15[math.min(v16, v17) + 1]
        v11(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u8
            --]]
            u13(u8.data.score)
        end, {})
        local v19 = u4.createFragment
        local v20 = {}
        local v21 = u8.data.place
        local v22 = "ScriptLeaderboard_" .. tostring(v21)
        local v23 = u4.createElement
        local v24 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.4,
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0, (u8.data.place - 1) * 0.12),
            ["Size"] = UDim2.fromScale(1, 0.12),
            ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
        }
        local v25 = {}
        local v26 = u8.data.place
        local v27 = "ScriptLeaderboardPlace_" .. tostring(v26)
        local v28 = u4.createElement
        local v29 = {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["AutoLocalize"] = false
        }
        local v30 = u8.data.place
        v29.Text = tostring(v30)
        v29.Font = Enum.Font.ArialBold
        v29.TextColor3 = Color3.fromRGB(255, 255, 255)
        v29.AnchorPoint = Vector2.new(0, 0)
        v29.Position = UDim2.fromScale(0, 0)
        v29.Size = UDim2.fromScale(0.12, 1)
        v29.BackgroundColor3 = v18
        v25[v27] = v28("TextLabel", v29, { u4.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = u2.darken(v18, 0.5)
            }) })
        local v31 = u8.data.place
        v25["ScriptLeaderboardName_" .. tostring(v31)] = u4.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["Text"] = v14,
            ["Font"] = Enum.Font.Arial,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0.12, 0.1),
            ["Size"] = UDim2.fromScale(0.68, 0.8),
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        }, { u4.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0.05, 0)
            }), u4.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = Color3.fromRGB(0, 0, 0)
            }) })
        local v32 = u8.data.place
        v25["ScriptLeaderboardScore_" .. tostring(v32)] = u4.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextScaled"] = true,
            ["AutoLocalize"] = false,
            ["Text"] = tostring(v12),
            ["Font"] = Enum.Font.Arial,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["AnchorPoint"] = Vector2.new(0, 0),
            ["Position"] = UDim2.fromScale(0.8, 0.1),
            ["Size"] = UDim2.fromScale(0.2, 0.8),
            ["TextXAlignment"] = Enum.TextXAlignment.Right
        }, { u4.createElement("UIPadding", {
                ["PaddingRight"] = UDim.new(0.075, 0)
            }), u4.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = Color3.fromRGB(0, 0, 0)
            }) })
        v20[v22] = v23("Frame", v24, v25)
        return v19(v20)
    end)
}