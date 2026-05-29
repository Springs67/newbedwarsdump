local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.TopBarCard
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "timer-util").TimerUtil
local v23 = v7.new(u6)(function(u13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u11
        [3] = u9
        [4] = u12
        [5] = u6
        [6] = u4
        [7] = u10
        [8] = u3
    --]]
    local v15 = p14.useState
    local v16 = p14.useEffect
    local v17, u18 = v15("00:00")
    local u19, _ = v15(u5.new())
    v16(function() --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u11
            [3] = u19
            [4] = u9
            [5] = u18
            [6] = u12
        --]]
        if u13.MatchStartTime == nil then
            return nil
        end
        if u13.MatchState == u11.POST then
            u19:DoCleaning()
            return nil
        end
        if u13.MatchState ~= u11.RUNNING then
            return nil
        end
        local u20 = true
        local function u22() --[[ Line: 33 ]]
            --[[
            Upvalues:
                [1] = u20
                [2] = u9
                [3] = u13
                [4] = u18
                [5] = u12
                [6] = u22
            --]]
            task.delay(1, function() --[[ Line: 34 ]]
                --[[
                Upvalues:
                    [1] = u20
                    [2] = u9
                    [3] = u13
                    [4] = u18
                    [5] = u12
                    [6] = u22
                --]]
                if not u20 then
                    return nil
                end
                local v21 = u9:GetServerTimeNow() - u13.MatchStartTime
                u18(u12.getTimeString(v21))
                u22()
            end)
        end
        u22()
        u19:GiveTask(function() --[[ Line: 44 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20 = false
        end)
        return function() --[[ Line: 47 ]]
            --[[
            Upvalues:
                [1] = u20
            --]]
            u20 = false
        end
    end, { u13.MatchState, u13.MatchStartTime })
    return u6.createElement(u4, {
        ["LayoutOrder"] = u13.LayoutOrder
    }, { u6.createElement("ImageLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Image"] = u10.HUD_TIMER_ICON,
            ["Size"] = UDim2.new(0, 16, 0, 16),
            ["ImageColor3"] = Color3.fromRGB(0, 209, 255)
        }), u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextSize"] = 16,
            ["Text"] = v17,
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u3.WHITE
        }) })
end)
return {
    ["HudMatchTimer"] = v8.connect(function(p24, p25) --[[ Line: 74 ]]
        local v26 = {}
        for v27, v28 in p25 do
            v26[v27] = v28
        end
        v26.MatchState = p24.Game.matchState
        v26.MatchStartTime = p24.Game.startTime
        return v26
    end)(v23)
}