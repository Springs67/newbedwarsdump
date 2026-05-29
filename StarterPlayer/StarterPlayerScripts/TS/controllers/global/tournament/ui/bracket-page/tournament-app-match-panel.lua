local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ColorUtil
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u6 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "tournament", "tournament-team-util").TournamentTeamUtil
return {
    ["TournamentAppMatchPanel"] = v5.new(u4)(function(u9, p10) --[[ Line: 10 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u1
            [3] = u3
            [4] = u8
            [5] = u2
            [6] = u4
            [7] = u6
        --]]
        local v11 = p10.useState
        local v12 = p10.useEffect
        local v13, u14 = v11(u7.AGNI_ANGRY)
        local v15, u16 = v11("")
        v12(function() --[[ Line: 15 ]]
            --[[
            Upvalues:
                [1] = u1
                [2] = u9
                [3] = u3
                [4] = u14
                [5] = u16
                [6] = u8
            --]]
            u1.async(function() --[[ Line: 16 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u3
                    [3] = u14
                    [4] = u16
                    [5] = u8
                --]]
                local v17 = u9.tournamentMatch.opponentTeamIds[1]
                if v17 == "" or not v17 then
                    return nil
                end
                local v18 = { u3.Controllers.TournamentTeamController:requestTournamentTeamData(v17):await() }
                if v18[1] and v18[2] then
                    u14(v18[2].icon)
                    u16(u8.convertNameToTag(v18[2].name))
                end
            end)()
        end, {})
        local v19 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.3),
            ["LayoutOrder"] = u9.LayoutOrder,
            ["BackgroundColor3"] = u2.WHITE
        }
        local v20 = { u4.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 2)
            }) }
        local v21 = #v20
        local v22 = u9.WonMatch
        if v22 then
            v22 = u4.createElement("UIGradient", {
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0.2) }),
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#59B98B")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#5BA79C")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5E95AD")) })
            })
        end
        if v22 then
            v20[v21 + 1] = v22
        end
        local v23 = #v20
        local v24 = not u9.WonMatch
        if v24 then
            v24 = u4.createElement("UIGradient", {
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.2), NumberSequenceKeypoint.new(1, 0.2) }),
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#A54F63")), ColorSequenceKeypoint.new(0.5, Color3.fromHex("#8B6282")), ColorSequenceKeypoint.new(1, Color3.fromHex("#7175A1")) })
            })
        end
        if v24 then
            v20[v23 + 1] = v24
        end
        local _ = #v20
        local v25 = u4.createElement
        local v26 = "Frame"
        local v27 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(0, 0)
        }
        local v28 = {
            ["Team1Icon"] = u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 1,
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.1, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.7),
                ["Image"] = u6[u9.team1Icon].image
            })
        }
        local v29 = u4.createElement
        local v30 = "TextLabel"
        local v31 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 0.5),
            ["Position"] = UDim2.fromScale(0.4, 0.5),
            ["Size"] = UDim2.fromScale(0.25, 0.25),
            ["Text"] = "<b>" .. u9.team1Tag .. "</b>"
        }
        local v32
        if u9.WonMatch then
            v32 = Color3.fromHex("#FFF48E")
        else
            v32 = Color3.fromRGB(255, 255, 255)
        end
        v31.TextColor3 = v32
        v28.Team1Tag = v29(v30, v31)
        v20.Team1 = v25(v26, v27, v28)
        local v33 = u4.createElement
        local v34 = "Frame"
        local v35 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Position"] = UDim2.fromScale(0.5, 0)
        }
        local v36 = {
            ["Team2Icon"] = u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ZIndex"] = 1,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(0.9, 0.5),
                ["Size"] = UDim2.fromScale(0.3, 0.7),
                ["Image"] = u6[v13].image
            })
        }
        local v37 = u4.createElement
        local v38 = "TextLabel"
        local v39 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(0.6, 0.5),
            ["Size"] = UDim2.fromScale(0.25, 0.25),
            ["Text"] = "<b>" .. v15 .. "</b>"
        }
        local v40
        if u9.WonMatch then
            v40 = Color3.fromRGB(255, 255, 255)
        else
            v40 = Color3.fromHex("#FFF48E")
        end
        v39.TextColor3 = v40
        v36.Team2Tag = v37(v38, v39)
        v20.Team2 = v33(v34, v35, v36)
        local v41 = u4.createElement
        local v42 = "TextLabel"
        local v43 = {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.2),
            ["Size"] = UDim2.fromScale(0.25, 0.25),
            ["Text"] = u9.WonMatch and "<b>VICTORY</b>" or "<b>DEFEAT</b>"
        }
        local v44
        if u9.WonMatch then
            v44 = Color3.fromHex("#3ADF7C")
        else
            v44 = Color3.fromHex("#E26583")
        end
        v43.TextColor3 = v44
        v20.Outcome = v41(v42, v43)
        v20.VSTag = u4.createElement("TextLabel", {
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Text"] = "<b>vs</b>",
            ["Font"] = "Roboto",
            ["TextTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.fromScale(0.1, 0.15),
            ["TextColor3"] = u2.WHITE
        })
        return u4.createFragment({
            ["MatchPanel"] = u4.createElement("Frame", v19, v20)
        })
    end)
}