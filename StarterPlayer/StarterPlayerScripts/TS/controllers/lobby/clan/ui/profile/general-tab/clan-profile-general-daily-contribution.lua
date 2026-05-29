local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v2.StringUtil
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "clan", "clan-util").ClanUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme.mcYellow
return {
    ["ClanProfileGeneralDailyContribution"] = v7.new(u6)(function(u11, p12) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u8
            [3] = u5
            [4] = u6
            [5] = u3
            [6] = u10
            [7] = u4
        --]]
        local v13 = p12.useState
        local v14 = p12.useEffect
        local v15, u16 = v13(0)
        local v17, u18 = v13(0)
        local v19, u20 = v13(0)
        v14(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u9
                [3] = u8
                [4] = u16
            --]]
            if u11.DailyMemberContributions then
                local v21 = u11.DailyMemberContributions[u9.getContributionDayId()]
                if v21 ~= nil then
                    local v22 = u8.LocalPlayer.UserId
                    v21 = v21[tostring(v22)]
                end
                if v21 ~= 0 and (v21 == v21 and v21) then
                    u16(v21)
                end
            end
        end, {})
        v14(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u9
                [3] = u18
            --]]
            local v23 = u11.DailyMemberContributions and u11.DailyMemberContributions[u9.getContributionDayId()]
            if v23 then
                local v24 = 0
                local v25 = v24
                for _, v26 in v23 do
                    v24 = v25 + v26
                    v25 = v24
                end
                u18(v25)
            end
        end, { u11.DailyMemberContributions })
        v14(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u9
                [3] = u20
            --]]
            local v27 = u11.DailyClanContribution and u11.DailyClanContribution[u9.getContributionDayId()]
            if v27 then
                u20(v27.gainedCoins)
            end
        end, { u11.DailyClanContribution })
        local v28 = u11.MemberCount
        local v29 = v28 == nil and 1 or v28
        local v30 = u9.calcClanMaxDailyCoins(v29)
        local v31 = u5.formatNumberWithCommas((math.floor(v15)))
        local v32 = u5.formatNumberWithCommas(u9.MAX_DAILY_CONTRIBUTION)
        local v33 = u5.formatNumberWithCommas((math.floor(v17)))
        local v34 = u5.formatNumberWithCommas(v29 * 1000)
        local v35 = u5.formatNumberWithCommas((math.floor(v19)))
        local v36 = u5.formatNumberWithCommas((math.floor(v30)))
        local v37 = {
            ["LayoutOrder"] = 4,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1),
            ["Size"] = UDim2.fromScale(1, 0.175)
        }
        local v38 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["Padding"] = UDim.new(0.03, 0)
            }), u6.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["Text"] = "Play matches to earn coins for your clan.\nYou\'ll earn coins at 10% the rate after reaching your daily contribution limit or the clan\'s daily total limit.",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["TextTransparency"] = 0.3,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["TextColor3"] = u3.WHITE
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) }) }
        local v39 = #v38
        local v40 = {
            ["Size"] = UDim2.fromScale(1, 0.67)
        }
        local v41 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["VerticalAlignment"] = "Bottom",
                ["Padding"] = UDim.new(0.03, 0)
            }), u6.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["TextColor3"] = u3.WHITE,
                ["Text"] = "<b>Your Daily Contribution:</b> <font color=\"" .. u3.richTextColor(u10) .. "\">" .. v31 .. " / " .. v32 .. " (" .. u5.formatPercentage(v15, u9.MAX_DAILY_CONTRIBUTION) .. ")</font>"
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) }) }
        local v42 = #v41
        local v43
        if u11.MemberCount == nil then
            v43 = false
        else
            v43 = u6.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["TextColor3"] = u3.WHITE,
                ["Text"] = "<b>Clan\'s Daily Total Contribution:</b> <font color=\"" .. u3.richTextColor(u10) .. "\">" .. v33 .. " / " .. v34 .. " (" .. u5.formatPercentage(v17, v29 * 1000) .. ")</font>"
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        end
        if v43 then
            v41[v42 + 1] = v43
        end
        local v44 = #v41
        local v45
        if u11.MemberCount == nil then
            v45 = false
        else
            v45 = u6.createElement("TextLabel", {
                ["Font"] = "Roboto",
                ["TextXAlignment"] = "Left",
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3),
                ["TextColor3"] = u3.WHITE,
                ["Text"] = "<b>Clan\'s Daily Total Coins:</b> <font color=\"" .. u3.richTextColor(u10) .. "\">" .. v35 .. " / " .. v36 .. " (" .. u5.formatPercentage(v19, v30) .. ")</font>"
            }, { u6.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 16
                }) })
        end
        if v45 then
            v41[v44 + 1] = v45
        end
        v38[v39 + 1] = u6.createElement(u4, v40, v41)
        return u6.createFragment({
            ["YourContribution"] = u6.createElement(u4, v37, v38)
        })
    end)
}