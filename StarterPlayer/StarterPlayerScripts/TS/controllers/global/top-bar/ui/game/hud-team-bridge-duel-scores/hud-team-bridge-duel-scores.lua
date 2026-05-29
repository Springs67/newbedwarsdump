local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v54 = v6.new(u5)(function(u9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u5
        [4] = u4
    --]]
    local _ = p10.useState
    local v11 = u9.TeamScores
    local function v46(p12, _) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u3
            [3] = u8
            [4] = u5
            [5] = u4
        --]]
        local v13 = nil
        for v14, v15 in u9.Teams do
            local _ = v14 - 1
            if v15.id == p12.teamId == true then
                v13 = v15
            end
        end
        local v16 = u9.MyTeam
        if v16 ~= nil then
            v16 = v16.id
        end
        local v17
        if v13 == nil then
            v17 = v13
        else
            v17 = v13.id
        end
        local v18 = v16 == v17
        local v19
        if v13 == nil then
            v19 = v13
        else
            v19 = v13.color
        end
        if v19 == nil then
            v19 = u3.WHITE
        end
        local v20 = false
        local v21 = 1
        local v22 = {}
        while true do
            if v20 then
                v21 = v21 + 1
            else
                v20 = true
            end
            if v21 > 5 then
                local v23 = {
                    ["BackgroundTransparency"] = 0.4,
                    ["LayoutOrder"] = u9.LayoutOrder,
                    ["BackgroundColor3"] = u3.BLACK
                }
                local v24 = {}
                local _ = #v24
                local v25 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(0, 0, 1, 0),
                    ["AutomaticSize"] = Enum.AutomaticSize.X
                }
                local v26 = {}
                local v27 = #v26
                local v28 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromOffset(18, 18),
                    ["LayoutOrder"] = u9.LayoutOrder
                }
                local v29 = {}
                local v30 = u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                })
                local v31 = u5.createElement
                local v32 = "UIStroke"
                local v33 = {
                    ["Thickness"] = 2
                }
                local v34
                if v18 then
                    v34 = u3.WHITE
                else
                    v34 = u3.darken(v19, 0.7)
                end
                v33.Color = v34
                __set_list(v29, 1, {v30, v31(v32, v33)})
                local v35 = #v29
                local v36 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v37
                if v13 == nil then
                    v37 = v13
                else
                    v37 = v13.color
                end
                v36.BackgroundColor3 = v37
                v36.BackgroundTransparency = 0
                v36.BorderSizePixel = 0
                v36.ZIndex = 99
                local v38 = {}
                local v39 = #v38
                local v40 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                if v13 ~= nil then
                    v13 = string.split(v13.name, "")[1]
                end
                v40.Text = tostring(v13)
                v40.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
                v40.TextSize = 16
                v40.TextColor3 = Color3.fromRGB(255, 255, 255)
                v40.TextStrokeColor3 = u3.BLACK
                v40.TextStrokeTransparency = 0
                v40.ZIndex = 100
                v38.NumTeamMembers = u5.createElement("TextLabel", v40)
                v38[v39 + 1] = u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                })
                v29[v35 + 1] = u5.createElement("Frame", v36, v38)
                v29[v35 + 2] = u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 8)
                })
                for v41, v42 in v22 do
                    v29[v35 + 2 + v41] = v42
                end
                v26[v27 + 1] = u5.createElement("Frame", v28, v29)
                v24.HudTeaScoreWrapper = u5.createElement("Frame", v25, v26)
                return u5.createElement(u4, v23, v24)
            end
            local v43 = {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u8.CIRCLE_SOLID
            }
            local v44
            if v21 <= p12.score then
                if v13 == nil then
                    v44 = v13
                else
                    v44 = v13.color
                end
            else
                v44 = u3.WHITE
            end
            v43.ImageColor3 = v44
            v43.ImageTransparency = 0.4
            v43.BackgroundTransparency = 1
            local v45 = u5.createFragment({
                [v21] = u5.createElement("ImageLabel", v43)
            })
            table.insert(v22, v45)
        end
    end
    local v47 = table.create(#v11)
    for v48, v49 in v11 do
        v47[v48] = v46(v49, v48 - 1, v11)
    end
    local v50 = {}
    local v51 = #v50
    for v52, v53 in v47 do
        v50[v51 + v52] = v53
    end
    return u5.createFragment(v50)
end)
return {
    ["HudTeamBridgeDuelScores"] = v7.connect(function(p55, p56) --[[ Line: 180 ]]
        local v57 = {}
        for v58, v59 in p56 do
            v57[v58] = v59
        end
        v57.Teams = p55.Game.teams
        v57.TeamScores = p55.Game.teamScores
        v57.MyTeam = p55.Game.myTeam
        return v57
    end)(v54)
}