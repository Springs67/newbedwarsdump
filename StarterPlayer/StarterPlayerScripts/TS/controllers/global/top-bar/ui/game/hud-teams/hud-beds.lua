local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").TopBarCard
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, script.Parent, "hud-team-box").HudTeamBox
local v25 = v5.new(u4)(function(p8, p9) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u4
        [3] = u7
        [4] = u2
    --]]
    local _ = p9.useState
    p9.useEffect(function() --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u3
        --]]
        u3.Controllers.TopBarController:preloadBedsTopbarHud()
    end, {})
    local v10 = {
        ["LayoutOrder"] = p8.LayoutOrder
    }
    local v11 = {}
    local v12 = #v11
    local v13 = p8.Teams
    local v14 = table.create(#v13)
    for v15, v16 in v13 do
        local v17 = v15 - 1
        local v18 = p8.MyTeam
        if v18 ~= nil then
            v18 = v18.id
        end
        local v19 = v18 == v16.id
        v14[v15] = u4.createElement(u7, {
            ["Team"] = v16,
            ["IsLocalTeam"] = v19,
            ["LayoutOrder"] = v19 and -1 or v17
        })
    end
    local v20 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(0, 0, 1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.X
    }
    local v21 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }) }
    local v22 = #v21
    for v23, v24 in v14 do
        v21[v22 + v23] = v24
    end
    v11[v12 + 1] = u4.createElement("Frame", v20, v21)
    return u4.createElement(u2, v10, v11)
end)
return {
    ["HudTeamBeds"] = v6.connect(function(p26, p27) --[[ Line: 62 ]]
        local v28 = {}
        for v29, v30 in p27 do
            v28[v29] = v30
        end
        v28.MyTeam = p26.Game.myTeam
        return v28
    end)(v25)
}