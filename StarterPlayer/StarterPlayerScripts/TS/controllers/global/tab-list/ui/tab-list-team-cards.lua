local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local u6 = v1.import(script, script.Parent, "tab-list-card", "team-card").TeamCard
local u7 = v1.import(script, script.Parent, "tab-list-column-layout", "tab-list-column-layout").TabListColumnLayout
local v29 = v3.new(u2)(function(u8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
        [3] = u6
        [4] = u7
    --]]
    local _ = p9.useState
    local _ = p9.useEffect
    local v10 = u5.visible.teamCards
    if v10 then
        local v11 = u8.Teams
        local function v17(p12, p13) --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u2
                [3] = u6
            --]]
            local v14 = {}
            local v15 = p12.id
            local v16 = u8.MyTeam
            if v16 ~= nil then
                v16 = v16.id
            end
            v14.LayoutOrder = v15 == v16 and -1 or p13
            v14.Team = p12
            v14.CardDimensions = u8.CardDimensions
            return u2.createElement(u6, v14)
        end
        local v18 = table.create(#v11)
        for v19, v20 in v11 do
            v18[v19] = v17(v20, v19 - 1, v11)
        end
        local v21 = {
            ["Columns"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v22 = {}
        local v23 = #v22
        for v24, v25 in v18 do
            v22[v23 + v24] = v25
        end
        v10 = u2.createElement(u7, v21, v22)
    end
    local v26 = {
        ["AutomaticCanvasSize"] = "Y",
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["ScrollBarThickness"] = 0,
        ["Size"] = UDim2.fromScale(1, u5.rows.cards.height),
        ["CanvasSize"] = UDim2.fromScale(1, u5.rows.cards.height),
        ["ScrollingDirection"] = Enum.ScrollingDirection.Y
    }
    local v27 = {}
    local v28 = #v27
    if v10 then
        v27[v28 + 1] = v10
    end
    return u2.createElement("ScrollingFrame", v26, v27)
end)
return {
    ["TabListTeamCards"] = v4.connect(function(p30, p31) --[[ Line: 61 ]]
        local v32 = {}
        for v33, v34 in p31 do
            v32[v33] = v34
        end
        v32.Teams = p30.Game.teams
        v32.MyTeam = p30.Game.myTeam
        return v32
    end)(v29)
}