local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.TooltipContainer
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "bed-plating", "bed-plating-util").BedPlatingUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v29 = v8.new(u7)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u7
        [3] = u5
        [4] = u3
        [5] = u12
    --]]
    local _ = p14.useState
    local _ = p14.useEffect
    local u15 = u4.hexColor(u13.Team.colorHex)
    local function v28() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u13
            [3] = u4
            [4] = u15
            [5] = u5
            [6] = u3
        --]]
        local v16 = u7.createElement
        local v17 = "Frame"
        local v18 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromOffset(18, 18),
            ["LayoutOrder"] = u13.LayoutOrder
        }
        local v19 = {}
        local v20 = u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 3)
        })
        local v21 = u7.createElement
        local v22 = "UIStroke"
        local v23 = {
            ["Thickness"] = 2
        }
        local v24
        if u13.IsLocalTeam then
            v24 = u4.WHITE
        else
            v24 = u4.darken(u15, 0.7)
        end
        v23.Color = v24
        __set_list(v19, 1, {v20, (v21(v22, v23))})
        local v25 = u7.createElement
        local v26 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 16,
            ["TextStrokeTransparency"] = 0,
            ["ZIndex"] = 100,
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v27 = u13.ActiveTeamMembers
        v26.Text = tostring(v27)
        v26.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v26.TextColor3 = Color3.fromRGB(255, 255, 255)
        v26.TextStrokeColor3 = u4.BLACK
        v19.NumTeamMembers = v25("TextLabel", v26)
        __set_list(v19, 3, {u7.createElement("Frame", {
    ["BorderSizePixel"] = 0,
    ["ZIndex"] = 99,
    ["Size"] = UDim2.fromScale(1, 1),
    ["BackgroundColor3"] = u15,
    ["BackgroundTransparency"] = u13.IsBedAlive and 0 or 0.9
}, { u7.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 3)
    }) }), u7.createElement(u5, {}, { u7.createElement(u3, {
        ["TextSize"] = 14,
        ["Text"] = string.upper(u13.Team.displayName) .. " BED",
        ["Font"] = Enum.Font.SourceSansBold,
        ["TextColor3"] = u15,
        ["Limits"] = Vector2.new(300, 60)
    }) })})
        return v16(v17, v18, v19)
    end
    return u7.createElement(v28)
end)
return {
    ["HudTeamBox"] = v9.connect(function(p30, p31) --[[ Line: 104 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u6
            [3] = u10
        --]]
        local v32 = { u11.BedStatus.BED_PLATING_ACTIVE, u11.BedStatus.BED_ALIVE }
        local v33 = p30.Bedwars.teamBedStatus[p31.Team.id]
        local v34 = table.find(v32, v33) ~= nil
        local v35 = u6.Controllers.TeamController:getTeam(p31.Team.id)
        if v35 ~= nil then
            v35 = v35.members
        end
        local v36
        if v35 then
            local v37 = {}
            local v38 = #v37
            for v39, v40 in v35 do
                v38 = v38 + 1
                v37[v38] = { v39, v40 }
            end
            v36 = 0
            for v41 = 1, #v37 do
                local v42 = v37[v41]
                local _ = v41 - 1
                local v43 = v42[1]
                local _ = v42[2]
                if not p30.Bedwars.finalDeaths[v43] and u10:GetPlayerByUserId(v43) then
                    v36 = v36 + 1
                end
            end
        else
            v36 = 0
        end
        local v44 = {}
        for v45, v46 in p31 do
            v44[v45] = v46
        end
        v44.IsBedAlive = v34
        v44.ActiveTeamMembers = v36
        return v44
    end)(v29)
}