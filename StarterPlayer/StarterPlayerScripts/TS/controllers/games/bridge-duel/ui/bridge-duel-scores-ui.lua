local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v60 = v6.new(u5)(function(u10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u8
        [3] = u5
        [4] = u9
        [5] = u4
    --]]
    local _ = p11.useState
    local v12 = {}
    local _ = #v12
    local v13 = u10.TeamScores
    local function v50(p14, p15) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u3
            [3] = u8
            [4] = u5
            [5] = u9
            [6] = u4
        --]]
        local v16 = nil
        for v17, v18 in u10.Teams do
            local _ = v17 - 1
            if v18.id == p14.teamId == true then
                v16 = v18
            end
        end
        local v19
        if v16 == nil then
            v19 = v16
        else
            v19 = v16.color
        end
        if v19 == nil then
            v19 = u3.WHITE
        end
        local v20 = u10.MyTeam
        if v20 ~= nil then
            v20 = v20.id
        end
        local v21
        if v16 == nil then
            v21 = v16
        else
            v21 = v16.id
        end
        local v22 = v20 == v21
        local v23 = false
        local v24 = 1
        local v25 = {}
        while true do
            if v23 then
                v24 = v24 + 1
            else
                v23 = true
            end
            if v24 > 5 then
                local v26 = p15 % 2 == 0 and 0.4 or 0.6
                local v27 = {
                    ["BackgroundTransparency"] = 0.4,
                    ["Size"] = UDim2.new(0, 0, 0, 24),
                    ["BackgroundColor3"] = u3.BLACK,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.new(v26, 0, 0, u9.topBarGuiSpacing)
                }
                local v28 = {}
                local _ = #v28
                local v29 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.new(0, 0, 1, 0),
                    ["AutomaticSize"] = Enum.AutomaticSize.X,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                local v30 = {}
                local v31 = #v30
                local v32 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromOffset(12, 12)
                }
                local v33 = {}
                local v34 = u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                })
                local v35 = u5.createElement
                local v36 = "UIStroke"
                local v37 = {
                    ["Thickness"] = 2
                }
                local v38
                if v22 then
                    v38 = u3.WHITE
                else
                    v38 = u3.darken(v19, 0.7)
                end
                v37.Color = v38
                __set_list(v33, 1, {v34, v35(v36, v37)})
                local v39 = #v33
                local v40 = {
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v41
                if v16 == nil then
                    v41 = v16
                else
                    v41 = v16.color
                end
                v40.BackgroundColor3 = v41
                v40.BackgroundTransparency = 0
                v40.BorderSizePixel = 0
                v40.ZIndex = 99
                local v42 = {}
                local v43 = #v42
                local v44 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }
                if v16 ~= nil then
                    v16 = string.split(v16.name, "")[1]
                end
                v44.Text = "<b>" .. tostring(v16) .. "</b>"
                v44.Font = "Roboto"
                v44.TextSize = 12
                v44.RichText = true
                v44.TextColor3 = Color3.fromRGB(255, 255, 255)
                v44.TextStrokeColor3 = u3.BLACK
                v44.TextStrokeTransparency = 0
                v44.ZIndex = 100
                v42.NumTeamMembers = u5.createElement("TextLabel", v44)
                v42[v43 + 1] = u5.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                })
                v33[v39 + 1] = u5.createElement("Frame", v40, v42)
                v33[v39 + 2] = u5.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 4)
                })
                for v45, v46 in v25 do
                    v33[v39 + 2 + v45] = v46
                end
                v30[v31 + 1] = u5.createElement("Frame", v32, v33)
                v28.BridgeDuelScoreWrapper = u5.createElement("Frame", v29, v30)
                return u5.createElement(u4, v27, v28)
            end
            local v47 = {
                ["ScaleType"] = "Fit",
                ["SizeConstraint"] = "RelativeYY",
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u8.CIRCLE_SOLID
            }
            local v48
            if v24 <= p14.score then
                if v16 == nil then
                    v48 = v16
                else
                    v48 = v16.color
                end
            else
                v48 = u3.WHITE
            end
            v47.ImageColor3 = v48
            v47.ImageTransparency = 0.4
            v47.BackgroundTransparency = 1
            local v49 = u5.createFragment({
                [v24] = u5.createElement("ImageLabel", v47)
            })
            table.insert(v25, v49)
        end
    end
    local v51 = table.create(#v13)
    local v52 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true,
        ["ResetOnSpawn"] = false
    }
    for v53, v54 in v13 do
        v51[v53] = v50(v54, v53 - 1, v13)
    end
    local v55 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.X,
        ["Position"] = UDim2.new(0.5, 0, 0, u9.topBarTopOffset * 11)
    }
    local v56 = {}
    local v57 = #v56
    for v58, v59 in v51 do
        v56[v57 + v58] = v59
    end
    v12.BridgeDuelScores = u5.createElement("Frame", v55, v56)
    return u5.createFragment({
        ["BridgeDuelScoresGui"] = u5.createElement("ScreenGui", v52, v12)
    })
end)
return {
    ["BridgeDuelScoresGui"] = v7.connect(function(p61, p62) --[[ Line: 203 ]]
        local v63 = {}
        for v64, v65 in p62 do
            v63[v64] = v65
        end
        v63.Teams = p61.Game.teams
        v63.TeamScores = p61.Game.teamScores
        v63.MyTeam = p61.Game.myTeam
        return v63
    end)(v60)
}