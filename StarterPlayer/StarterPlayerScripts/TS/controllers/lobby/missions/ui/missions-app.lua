local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.ScaleComponent
local u7 = v3.SlideIn
local u8 = v3.SoundManager
local u9 = v3.WidgetComponent
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u15 = v1.import(script, script.Parent, "mission-app-consts").MissionAppTab
local u16 = v1.import(script, script.Parent, "missions-list-container").MissionsListContainer
local u17 = v1.import(script, script.Parent, "missions-sidebar").MissionsSidebar
local u18 = {
    {
        ["text"] = "Daily Missions",
        ["layoutOrder"] = 1,
        ["value"] = u15.DAILY
    },
    {
        ["text"] = "Weekly Missions",
        ["layoutOrder"] = 2,
        ["value"] = u15.WEEKLY
    }
}
local v40 = v11.new(u10)(function(u19, p20) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u15
        [2] = u2
        [3] = u5
        [4] = u10
        [5] = u4
        [6] = u14
        [7] = u6
        [8] = u18
        [9] = u8
        [10] = u13
        [11] = u17
        [12] = u16
        [13] = u9
        [14] = u7
    --]]
    local v21 = p20.useState
    local v22, u23 = v21(u15.DAILY)
    local v24, v25 = v21(false)
    local function u26() --[[ Line: 32 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u19
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u19.AppId)
    end
    local v27 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = not u5.isSmallScreen()
    }
    local v28 = { u10.createElement(u4, {
            ["AppId"] = u19.AppId
        }) }
    local v29 = #v28
    local v30 = {}
    local v31 = #v30
    local v32 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = u14.widgetSize
    }
    local v33 = { u10.createElement(u6, {
            ["MaximumSize"] = u14.widgetScaleComponentMaxSize,
            ["ScreenPadding"] = u14.widgetScaleComponentScreenPadding
        }) }
    local v34 = #v33
    local v36 = {
        ["Title"] = "Missions",
        ["AppId"] = u19.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 67 ]]
            --[[
            Upvalues:
                [1] = u26
            --]]
            return u26()
        end,
        ["Navbar"] = {
            ["Value"] = v22,
            ["Tabs"] = u18,
            ["UIListLayout"] = {
                ["Padding"] = UDim.new(0.09, 0)
            },
            ["OnChange"] = function(p35) --[[ Name: OnChange, Line 76 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u8
                    [3] = u13
                --]]
                u23(p35.value)
                u8:playSound(u13.UI_CLICK)
            end
        }
    }
    local v37 = { u10.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.04, 0)
        }) }
    local v38 = #v37
    local v39 = not u19.HideSidebar
    if v39 then
        v39 = u10.createElement(u17, {
            ["AppId"] = "MissionsSidebar",
            ["BattlePassPaid"] = u19.BattlePassPaid,
            ["Size"] = UDim2.new(0.26, 0, 1, 0),
            ["OnClose"] = function() --[[ Name: OnClose, Line 96 ]]
                --[[
                Upvalues:
                    [1] = u26
                --]]
                return u26()
            end,
            ["ChangeTicketView"] = v25,
            ["TicketView"] = v24
        })
    end
    if v39 then
        v37[v38 + 1] = v39
    end
    v37[#v37 + 1] = u10.createElement(u16, {
        ["Size"] = UDim2.new(u19.HideSidebar and 1 or 0.7, 0, 1, 0),
        ["TicketView"] = v24,
        ["Tab"] = v22,
        ["PlayerLevel"] = u19.PlayerLevel
    })
    v33[v34 + 1] = u10.createElement(u9, v36, v37)
    v30[v31 + 1] = u10.createElement("Frame", v32, v33)
    v28[v29 + 1] = u10.createElement(u7, {}, v30)
    return u10.createElement("ScreenGui", v27, v28)
end)
return {
    ["MissionsApp"] = v12.connect(function(p41, p42) --[[ Line: 118 ]]
        local v43 = {}
        for v44, v45 in p42 do
            v43[v44] = v45
        end
        v43.BattlePassPaid = p41.BattlePass.paid
        v43.PlayerLevel = p41.Bedwars.playerLevel
        return v43
    end)(v40)
}