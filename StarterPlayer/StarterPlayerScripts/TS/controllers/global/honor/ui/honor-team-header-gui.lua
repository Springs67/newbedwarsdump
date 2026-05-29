local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local v15 = v6.new(u5)(function(p10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u4
        [3] = u3
        [4] = u9
    --]]
    local _ = p11.useState
    local v12 = p10.Team.name .. " Team"
    local v13 = u5.createFragment
    local v14 = {
        ["HonorTeamHeaderGUI_" .. p10.Team.id] = u5.createElement(u4, {
            ["LayoutOrder"] = -1,
            ["Size"] = UDim2.new(1, 0, 0, u3.isSmallScreen() and 26 or 30)
        }, { u5.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(u3.isSmallScreen() and 0.6 or 0.3, 1),
                ["BackgroundColor3"] = p10.Team.color,
                ["BackgroundTransparency"] = u9.bgTransparency.cardHeader,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, {
                u5.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.1, 0),
                    ["PaddingBottom"] = UDim.new(0.1, 0),
                    ["PaddingLeft"] = UDim.new(0.05, 0),
                    ["PaddingRight"] = UDim.new(0.05, 0)
                }),
                ["TeamName"] = u5.createElement("TextLabel", {
                    ["AutomaticSize"] = "X",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["TextXAlignment"] = "Center",
                    ["TextSize"] = 32,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = v12,
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = p10.Team.color
                })
            }) })
    }
    return v13(v14)
end)
return {
    ["HonorTeamHeaderGUI"] = v7.connect(function(p16, p17) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u8
        --]]
        local v18 = {}
        local v19 = #v18
        for v20, v21 in p17.Team.members do
            v19 = v19 + 1
            v18[v19] = { v20, v21 }
        end
        local v22 = 0
        for v23 = 1, #v18 do
            local v24 = v18[v23]
            local _ = v23 - 1
            local _ = v24[1]
            local v25 = v24[2]
            if not p16.Bedwars.finalDeaths[v25.userId] then
                v22 = v22 + 1
            end
        end
        local v26 = p16.Game.queueType
        if v26 and not u8(v26).disableTablistStats then
            local v27 = 0
            for v28 = 1, #v18 do
                local v29 = v18[v28]
                local _ = v28 - 1
                local _ = v29[1]
                local v30 = v29[2]
                local v31 = p16.Bedwars.kills[v30.userId]
                if v31 ~= 0 and (v31 == v31 and v31) then
                    v27 = v27 + v31
                end
            end
        end
        local v32 = {}
        for v33, v34 in p17 do
            v32[v33] = v34
        end
        v32.NumActiveMembers = v22
        return v32
    end)(v15)
}