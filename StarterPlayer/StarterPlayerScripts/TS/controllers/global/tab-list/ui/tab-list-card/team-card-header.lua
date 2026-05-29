local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "tab-list", "tab-list-config").tabListLayout
local u14 = v1.import(script, script.Parent, "team-upgrade-display").TeamUpgradeDisplay
local v32 = v7.new(u6)(function(p15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
        [3] = u5
        [4] = u13
        [5] = u3
        [6] = u11
        [7] = u12
        [8] = u14
    --]]
    local _ = p16.useState
    local v17 = u4.isSmallScreen() and 13 or 16
    local v18 = p15.Team.name .. " Team"
    local v19 = u6.createElement
    local v20 = u5
    local v21 = {
        ["AutomaticSize"] = "Y",
        ["Size"] = UDim2.new(1, 0, 0, 0)
    }
    local v22 = {}
    local v23 = u6.createElement("UISizeConstraint", {
        ["MaxSize"] = u13.maxRowSize,
        ["MinSize"] = Vector2.new(0, 0)
    })
    local v24 = u6.createElement
    local v25 = "Frame"
    local v26 = {
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.fromScale(1, 1),
        ["BackgroundColor3"] = p15.Team.color,
        ["BackgroundTransparency"] = u13.bgTransparency.cardHeader
    }
    local v27 = {
        u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }),
        u6.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10)
        }),
        ["TeamName"] = u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextXAlignment"] = "Left",
            ["RichText"] = true,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.42, 1),
            ["Text"] = "<b>" .. v18 .. "</b>",
            ["Font"] = Enum.Font.Roboto,
            ["TextSize"] = v17,
            ["TextColor3"] = u3.WHITE
        })
    }
    local v28 = u6.createElement
    local v29 = "ImageLabel"
    local v30 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["ZIndex"] = 61,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(0.07, 0.9),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v31
    if p15.TeamBedStatus == u11.BedStatus.BED_PLATING_ACTIVE then
        v31 = u12.BED_PLATING_ACTIVE_ICON
    elseif p15.TeamBedStatus == u11.BedStatus.BED_ALIVE then
        v31 = u12.BED_ALIVE_ICON
    else
        v31 = u12.BED_BROKEN_ICON
    end
    v30.Image = v31
    v30.ImageColor3 = u3.WHITE
    v27.BedStatusIcon = v28(v29, v30)
    __set_list(v27, 3, {u6.createElement(u5, {
    ["LayoutOrder"] = 3,
    ["Size"] = UDim2.fromScale(0.48, 1)
}, { u6.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
        ["SortOrder"] = Enum.SortOrder.LayoutOrder
    }), u6.createElement(u14, {
        ["Team"] = p15.Team,
        ["FrameProps"] = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.8, 0.95)
        }
    }), u6.createElement("TextLabel", {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Text"] = "<b>Kills</b>",
        ["RichText"] = true,
        ["LayoutOrder"] = 4,
        ["Size"] = UDim2.fromScale(0.2, 0.95),
        ["TextXAlignment"] = Enum.TextXAlignment.Center,
        ["Font"] = Enum.Font.Roboto,
        ["TextSize"] = v17,
        ["TextColor3"] = u3.WHITE
    }) })})
    __set_list(v22, 1, {v23, v24(v25, v26, v27)})
    return v19(v20, v21, v22)
end)
return {
    ["TabListTeamHeader"] = v8.connect(function(p33, p34) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u10
        --]]
        local v35 = {}
        local v36 = #v35
        for v37, v38 in p34.Team.members do
            v36 = v36 + 1
            v35[v36] = { v37, v38 }
        end
        local v39 = 0
        for v40 = 1, #v35 do
            local v41 = v35[v40]
            local _ = v40 - 1
            local _ = v41[1]
            local v42 = v41[2]
            if not p33.Bedwars.finalDeaths[v42.userId] then
                v39 = v39 + 1
            end
        end
        local v43 = u9.BEDWARS
        local v44 = p33.Game.queueType
        if v44 then
            if not u10(v44).disableTablistStats then
                local v45 = 0
                for v46 = 1, #v35 do
                    local v47 = v35[v46]
                    local _ = v46 - 1
                    local _ = v47[1]
                    local v48 = v47[2]
                    local v49 = p33.Bedwars.kills[v48.userId]
                    if v49 ~= 0 and (v49 == v49 and v49) then
                        v45 = v45 + v49
                    end
                end
            end
            v43 = u10(v44).game
        end
        local v50 = {}
        for v51, v52 in p34 do
            v50[v51] = v52
        end
        v50.NumActiveMembers = v39
        v50.NumTeamKills = 0
        v50.TeamLevel = 0
        v50.TeamBedStatus = p33.Bedwars.teamBedStatus[p34.Team.id]
        v50.GameType = v43
        return v50
    end)(v32)
}