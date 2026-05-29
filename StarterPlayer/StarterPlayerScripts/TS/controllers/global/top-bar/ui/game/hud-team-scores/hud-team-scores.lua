local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v32 = v6.new(u5)(function(u8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u5
        [3] = u4
    --]]
    local _ = p9.useState
    local v10 = u8.TeamScores
    local function v24(p11, _) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u3
            [3] = u5
            [4] = u4
        --]]
        local v12 = nil
        for v13, v14 in u8.Teams do
            local _ = v13 - 1
            if v14.id == p11.teamId == true then
                v12 = v14
                break
            end
        end
        local v15 = {}
        local v16
        if v12 == nil then
            v16 = v12
        else
            v16 = v12.color
        end
        if v16 == nil then
            v16 = u3.BLACK
        end
        v15.BackgroundColor3 = v16
        v15.LayoutOrder = u8.LayoutOrder
        local v17 = {}
        local _ = #v17
        local v18 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.new(0, 0, 1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.X
        }
        local v19 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 8)
            }) }
        local v20 = #v19
        local v21 = {}
        if v12 ~= nil then
            v12 = v12.name
        end
        local v22 = tostring(v12)
        local v23 = p11.score
        v21.Text = v22 .. ": " .. tostring(v23)
        v21.BackgroundTransparency = 1
        v21.BorderSizePixel = 0
        v21.AutomaticSize = Enum.AutomaticSize.X
        v21.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v21.TextSize = 16
        v21.TextXAlignment = Enum.TextXAlignment.Left
        v21.TextColor3 = u3.WHITE
        v19[v20 + 1] = u5.createElement("TextLabel", v21)
        v17.HudTeaScoreWrapper = u5.createElement("Frame", v18, v19)
        return u5.createElement(u4, v15, v17)
    end
    local v25 = table.create(#v10)
    for v26, v27 in v10 do
        v25[v26] = v24(v27, v26 - 1, v10)
    end
    local v28 = {}
    local v29 = #v28
    for v30, v31 in v25 do
        v28[v29 + v30] = v31
    end
    return u5.createFragment(v28)
end)
return {
    ["HudTeamScores"] = v7.connect(function(p33, p34) --[[ Line: 87 ]]
        local v35 = {}
        for v36, v37 in p34 do
            v35[v36] = v37
        end
        v35.Teams = p33.Game.teams
        v35.TeamScores = p33.Game.teamScores
        return v35
    end)(v32)
}