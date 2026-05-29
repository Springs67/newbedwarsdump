local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local v32 = v5.new(u4)(function(_, p9) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u7
        [3] = u8
        [4] = u4
        [5] = u2
    --]]
    local v10 = p9.useState
    local v11 = p9.useEffect
    local v12 = u3.Controllers.TeamController:getTeams()
    local u13 = u3.Controllers.TeamController:getPlayerTeam(u7.LocalPlayer)
    local u14 = nil
    for v15, v16 in v12 do
        local _ = v15 - 1
        if v16.id ~= u13.id == true then
            u14 = v16
            break
        end
    end
    local v17 = u13.color
    local v18 = u14.color
    local v19 = Color3.fromHex("#BA9B6C")
    local v20, u21 = v10(0)
    local v22, u23 = v10(0)
    v11(function() --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u7
            [4] = u13
            [5] = u14
            [6] = u21
            [7] = u23
        --]]
        u8.Client:Get("LassoWars_RefreshScore"):Connect(function(p24) --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u3
                [2] = u7
                [3] = u13
                [4] = u14
                [5] = u21
                [6] = u23
            --]]
            local v25 = u3.Controllers.TeamController:getPlayerTeam(u7.LocalPlayer)
            if v25 ~= nil then
                v25 = v25.id
            end
            if v25 == "" or not v25 then
                return nil
            end
            local v26 = p24.scoreMap[v25]
            local v27 = p24.scoreMap
            local v28
            if v25 == u13.id then
                v28 = u14.id
            else
                v28 = u13.id
            end
            local v29 = v27[v28]
            if v26 ~= 0 and (v26 == v26 and v26) then
                u21(v26)
            end
            if v29 ~= 0 and (v29 == v29 and v29) then
                u23(v29)
            end
        end)
    end, { v20, v22 })
    local v30 = u4.createFragment
    local v31 = {
        ["LasssoWarsDeathmatchHud"] = u4.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, {
            ["HudContainer"] = u4.createElement("Frame", {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.07, 0.05),
                ["Position"] = UDim2.fromScale(0.5, 0.02)
            }, {
                u4.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = u2.brighten(v19, 0.1)
                }),
                u4.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u4.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new(v19, u2.darken(v19, 0.8))
                }),
                ["LassoIcon"] = u4.createElement("ImageLabel", {
                    ["Image"] = "rbxassetid://7192710930",
                    ["LayoutOrder"] = 2,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.6, 2),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeXY,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.35)
                }),
                ["ScoreContainer"] = u4.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, { u4.createElement("UIListLayout", {
                        ["FillDirection"] = Enum.FillDirection.Horizontal,
                        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                        ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                        ["Padding"] = UDim.new(0.3, 0)
                    }), u4.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextStrokeTransparency"] = 0.7,
                        ["LayoutOrder"] = 1,
                        ["TextScaled"] = true,
                        ["Text"] = tostring(v20),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.3, 1),
                        ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["TextColor3"] = v17
                    }), u4.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextStrokeTransparency"] = 0.7,
                        ["LayoutOrder"] = 3,
                        ["TextScaled"] = true,
                        ["Text"] = tostring(v22),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0.3, 1),
                        ["FontFace"] = Font.fromName("GothamBold", Enum.FontWeight.Bold),
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["TextColor3"] = v18
                    }) })
            })
        })
    }
    return v30(v31)
end)
return {
    ["LassoWarsDeathmatchHud"] = v6.connect(function(_, p33) --[[ Line: 135 ]]
        local v34 = {}
        for v35, v36 in p33 do
            v34[v35] = v36
        end
        return v34
    end)(v32)
}