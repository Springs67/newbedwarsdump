local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Countdown
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.TopBarCard
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local v61 = v11.new(u10)(function(u15, p16) --[[ Line: 16 ]]
    --[[
    Upvalues:
        [1] = u9
        [2] = u14
        [3] = u5
        [4] = u13
        [5] = u3
        [6] = u8
        [7] = u10
        [8] = u7
        [9] = u6
        [10] = u4
    --]]
    local v17 = p16.useState
    local v18 = p16.useEffect
    local u19, u20 = v17({})
    local u21, _ = v17(u9.new())
    local u22 = nil
    v18(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u15
            [2] = u14
            [3] = u21
            [4] = u22
        --]]
        if u15.MatchStartTime == nil then
            return nil
        end
        if u15.MatchState == u14.POST then
            u21:DoCleaning()
            return nil
        end
        if u15.MatchState ~= u14.RUNNING then
            return nil
        end
        local u23 = true
        task.spawn(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u23
                [2] = u22
            --]]
            while u23 do
                u22()
                task.wait(0.5)
            end
        end)
        u21:GiveTask(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23 = false
        end)
        return function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u23
            --]]
            u23 = false
        end
    end, { u15.MatchState, u15.MatchStartTime, u15.MatchEvents })
    u22 = function() --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
            [3] = u19
            [4] = u15
            [5] = u3
            [6] = u20
        --]]
        if u5.isHoarceKat() then
            return nil
        end
        local u24 = u13:GetServerTimeNow()
        local u25 = {}
        for v26, v27 in u19 do
            u25[v26] = v27
        end
        local v28 = u15.MatchEvents
        local function v32(p29, p30) --[[ Line: 63 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u25
                [3] = u3
                [4] = u20
            --]]
            local v31 = p29.time - u24
            if (p29.isOnTopHud.permanentDisplay or v31 < 60) and v31 >= 0 then
                p29.isOnTopHud.shouldDisplay = true
                u25[p30] = true
                if v31 < 10 then
                    p29.textColor = Color3.fromRGB(255, 0, 0)
                elseif v31 < 30 then
                    p29.textColor = Color3.fromRGB(255, 204, 0)
                else
                    p29.textColor = u3.WHITE
                end
            else
                p29.isOnTopHud.shouldDisplay = false
                u25[p30] = false
            end
            if math.floor(v31) == 9 or math.floor(v31) == 29 then
                u25[p30] = false
                u20(u25)
                u25[p30] = true
            end
        end
        for v33, v34 in v28 do
            v32(v34, v33, v28)
        end
        u20(u25)
    end
    local v35 = not u5.isSmallScreen()
    if v35 then
        v35 = not u5.isHoarceKat()
    end
    if v35 then
        local v36 = u8.values(u15.MatchEvents)
        local function v51(p37) --[[ Line: 95 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u10
                [3] = u7
                [4] = u15
                [5] = u6
                [6] = u4
            --]]
            local v38 = u19[p37.id] and p37.isOnTopHud.shouldDisplay
            if v38 then
                local v39 = u10.createElement
                local v40 = u7
                local v41 = {
                    ["LayoutOrder"] = u15.LayoutOrder,
                    ["Size"] = UDim2.new(0, 100, 0, 32),
                    ["AutomaticSize"] = Enum.AutomaticSize.None
                }
                local v42 = {}
                local v43 = u10.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeYY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(1.2, 1.2),
                    ["Image"] = p37.image
                })
                local v44 = u10.createElement
                local v45 = u6
                local v46 = {
                    ["AutomaticSize"] = "X",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.new(0.5, 0, 1, 0)
                }
                local v47 = {
                    u10.createElement("UIListLayout", {
                        ["FillDirection"] = "Vertical",
                        ["SortOrder"] = "LayoutOrder",
                        ["VerticalAlignment"] = "Center",
                        ["HorizontalAlignment"] = "Left",
                        ["Padding"] = UDim.new(0, 0.15)
                    }),
                    ["Title"] = u10.createElement("TextLabel", {
                        ["AutomaticSize"] = "X",
                        ["Font"] = "GothamBold",
                        ["TextScaled"] = false,
                        ["RichText"] = false,
                        ["TextXAlignment"] = "Left",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 0.3,
                        ["LayoutOrder"] = 2,
                        ["TextSize"] = 9,
                        ["Size"] = UDim2.fromScale(0, 0.5),
                        ["Text"] = p37.name,
                        ["TextColor3"] = Color3.fromRGB(255, 212, 13)
                    })
                }
                local v48 = u10.createElement
                local v49 = u4
                local v50 = {
                    ["EndTime"] = p37.time,
                    ["CountdownConfig"] = {
                        ["days"] = false,
                        ["hours"] = false
                    },
                    ["TextLabel"] = {
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["TextSize"] = 16,
                        ["RichText"] = true,
                        ["LayoutOrder"] = 3,
                        ["TextScaled"] = false,
                        ["Size"] = UDim2.fromScale(0, 1),
                        ["TextTransparency"] = p37.textTransparency,
                        ["AutomaticSize"] = Enum.AutomaticSize.X,
                        ["Font"] = Enum.Font.Roboto,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextColor3"] = p37.textColor
                    }
                }
                __set_list(v47, 2, {v48(v49, v50, { u10.createElement("UIStroke", {
        ["Thickness"] = 2,
        ["Color"] = Color3.fromRGB(0, 0, 0)
    }) })})
                __set_list(v42, 1, {v43, v44(v45, v46, v47)})
                v38 = v39(v40, v41, v42)
            end
            return v38
        end
        local v52 = table.create(#v36)
        for v53, v54 in v36 do
            v52[v53] = v51(v54, v53 - 1, v36)
        end
        local v55 = {}
        local v56 = #v55
        for v57, v58 in v52 do
            v55[v56 + v57] = v58
        end
        v35 = u10.createFragment(v55)
    end
    local v59 = {}
    local v60 = #v59
    if v35 then
        v59[v60 + 1] = v35
    end
    return u10.createFragment(v59)
end)
return {
    ["HudEventTimer"] = v12.connect(function(p62, p63) --[[ Line: 185 ]]
        local v64 = {}
        for v65, v66 in p63 do
            v64[v65] = v66
        end
        v64.MatchEvents = p62.Game.matchEvents
        v64.MatchState = p62.Game.matchState
        v64.MatchStartTime = p62.Game.startTime
        return v64
    end)(v61)
}