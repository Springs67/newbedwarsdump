local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local u7 = v1.import(script, script.Parent, "player-row", "player-row").PlayerRow
local u8 = v1.import(script, script.Parent, "team-card-header").TabListTeamHeader
local v36 = v4.new(u3)(function(u9, p10) --[[ Line: 10 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u7
        [4] = u2
        [5] = u8
    --]]
    local _ = p10.useState
    local _ = p10.useEffect
    local v11 = u9.CardDimensions
    local u12 = v11[1]
    local _ = v11[2]
    local function v35() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u12
            [3] = u6
            [4] = u3
            [5] = u7
            [6] = u2
        --]]
        local v13 = {}
        local v14 = #v13
        for v15, v16 in u9.Team.members do
            v14 = v14 + 1
            v13[v14] = { v15, v16 }
        end
        table.sort(v13, function(p17, p18) --[[ Line: 23 ]]
            local _ = p17[1]
            local v19 = p17[2]
            local _ = p18[1]
            local v20 = p18[2]
            return string.lower(v19.displayName) < string.lower(v20.displayName)
        end)
        local function v26(p21, p22) --[[ Line: 31 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u12
                [3] = u6
                [4] = u3
                [5] = u7
            --]]
            local _ = p21[1]
            local v23 = p21[2]
            local v24 = 0
            local v25 = {}
            for _ in u9.Team.members do
                v24 = v24 + 1
            end
            v25.LastRow = p22 == v24 - 1
            v25.LayoutOrder = p22
            v25.Player = v23
            v25.Team = u9.Team
            v25.RowWidth = u12
            v25.RowHeight = u6.maxRowSizeY
            return u3.createElement(u7, v25)
        end
        local v27 = table.create(#v13)
        for v28, v29 in v13 do
            v27[v28] = v26(v29, v28 - 1, v13)
        end
        local v30 = {
            ["AutomaticSize"] = "Y",
            ["Size"] = UDim2.fromScale(1, 0)
        }
        local v31 = { u3.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v32 = #v31
        for v33, v34 in v27 do
            v31[v32 + v33] = v34
        end
        return u3.createElement(u2, v30, v31)
    end
    return u3.createElement("Frame", {
        ["AutomaticSize"] = "Y",
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.new(1, 0, u6.rows.cards.card.height, 0),
        ["LayoutOrder"] = u9.LayoutOrder
    }, { u3.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 0)
        }), u3.createElement(u8, {
            ["Team"] = u9.Team,
            ["RowWidth"] = u12
        }), u3.createElement(v35) })
end)
return {
    ["TeamCard"] = v5.connect(function(_, p37) --[[ Line: 97 ]]
        local v38 = {}
        for v39, v40 in p37 do
            v38[v39] = v40
        end
        return v38
    end)(v36)
}