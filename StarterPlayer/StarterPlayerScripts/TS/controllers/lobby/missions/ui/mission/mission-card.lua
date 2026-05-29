local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.ImageId
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "mission", "mission").MissionIntervalType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "mission-description-row").MissionDescriptionRow
local u19 = v1.import(script, script.Parent, "mission-progress-row").MissionProgressRow
local v52 = v10.new(u9)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u12
        [3] = u14
        [4] = u17
        [5] = u9
        [6] = u6
        [7] = u4
        [8] = u18
        [9] = u19
        [10] = u3
        [11] = u5
        [12] = u15
        [13] = u7
        [14] = u16
        [15] = u13
    --]]
    local v22 = p21.useState
    local _ = p21.useEffect
    local v23, u24 = v22(u20.Mission.currProgress == u20.Mission.goalProgress)
    local v25 = 0
    local v26 = {}
    for v27, v28 in u8.entries(u20.ConsumablesReducer.inventory) do
        local _ = v27 - 1
        local _ = v28[1]
        if v28[2].consumable == u12.AUTO_COMPLETE_DAILY_MISSION_TICKET == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    local v29 = #v26
    local v30 = 0
    local v31 = {}
    for v32, v33 in u8.entries(u20.ConsumablesReducer.inventory) do
        local _ = v32 - 1
        local _ = v33[1]
        if v33[2].consumable == u12.AUTO_COMPLETE_WEEKLY_MISSION_TICKET == true then
            v30 = v30 + 1
            v31[v30] = v33
        end
    end
    local v34 = #v31
    local u35 = u20.Mission.intervalType == u14.DAILY
    if u35 then
        u35 = (v29 == nil and 0 or v29) > 0
    end
    if not u35 then
        u35 = u20.Mission.intervalType == u14.WEEKLY
        if u35 then
            u35 = (v34 == nil and 0 or v34) > 0
        end
    end
    local v36 = {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 0,
        ["Size"] = UDim2.fromScale(1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["BackgroundColor3"] = u17.backgroundTertiary
    }
    local v37 = {}
    local v38 = #v37
    local v39
    if u20.Mission.currProgress == u20.Mission.goalProgress or v23 then
        v39 = u9.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.1),
            ["Size"] = UDim2.fromOffset(24, 24),
            ["Image"] = u6.CHECK_CIRCLE_SOLID,
            ["ImageColor3"] = u4.hexColor(65305)
        })
    else
        v39 = v23
    end
    if v39 then
        v37[v38 + 1] = v39
    end
    local v40 = #v37
    v37[v40 + 1] = u9.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(0, 5)
    })
    v37[v40 + 2] = u9.createElement("Frame", {
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y
    }, {
        u9.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 11),
            ["PaddingBottom"] = UDim.new(0, 11),
            ["PaddingLeft"] = UDim.new(0, 18),
            ["PaddingRight"] = UDim.new(0, 26)
        }),
        u9.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["Padding"] = UDim.new(0, 12),
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        }),
        u9.createElement(u18, {
            ["Mission"] = u20.Mission
        }),
        u9.createElement(u19, {
            ["Mission"] = u20.Mission,
            ["Completed"] = v23
        })
    })
    local v41 = u20.TicketView and (u20.Mission.currProgress ~= u20.Mission.goalProgress and not v23 and true or false)
    if v41 then
        local v42 = u9.createElement
        local v43 = u3
        local v44 = {
            ["Size"] = UDim2.fromScale(0.95, 0.35),
            ["Position"] = UDim2.fromScale(0.025, 0.55)
        }
        local v45
        if u35 then
            v45 = u17.backgroundSuccess
        else
            v45 = u4.hexColor(8487297)
        end
        v44.BackgroundColor3 = v45
        function v44.OnClick() --[[ Line: 135 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u35
                [3] = u15
                [4] = u20
                [5] = u7
                [6] = u16
                [7] = u24
            --]]
            if not u5.isHoarceKat() and (u35 and u15.Client:Get("UseMissionTicket"):CallServer(u20.Mission.id)) then
                u7:playSound(u16.UI_REWARD)
                u24(true)
            end
        end
        local v46 = {}
        local v47 = u9.createElement("TextLabel", {
            ["Text"] = "<b>AUTO-COMPLETE WITH MISSION TICKET</b>",
            ["TextSize"] = 14,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(-0.03, 0),
            ["TextColor3"] = u4.WHITE,
            ["TextTransparency"] = u35 and 0 or 0.2,
            ["Font"] = Enum.Font.Roboto
        })
        local v48 = u9.createElement
        local v49 = "ImageLabel"
        local v50 = {
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.85),
            ["Position"] = UDim2.fromScale(0.24, 0.1)
        }
        local v51
        if u20.Mission.intervalType == u14.DAILY then
            v51 = u13.MISSION_TICKET_DAILY
        else
            v51 = u13.MISSION_TICKET_WEEKLY
        end
        v50.Image = v51
        v50.ImageTransparency = u35 and 0 or 0.2
        __set_list(v46, 1, {v47, v48(v49, v50)})
        v41 = v42(v43, v44, v46)
    end
    if v41 then
        v37[v40 + 3] = v41
    end
    return u9.createFragment({
        ["TaskContainer"] = u9.createElement("Frame", v36, v37)
    })
end)
return {
    ["MissionCard"] = v11.connect(function(p53, p54) --[[ Line: 175 ]]
        local v55 = {}
        for v56, v57 in p54 do
            v55[v56] = v57
        end
        v55.ConsumablesReducer = p53.Consumable
        return v55
    end)(v52)
}