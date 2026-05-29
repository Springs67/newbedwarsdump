local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u7 = v6.Players
local u8 = v6.RunService
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u10 = u1.import(script, script.Parent, "emote-popup", "tournament-app-emote-popup").TournamentAppEmotePopup
local u11 = u1.import(script, script.Parent, "tournament-team-header").TournamentTeamHeader
local u12 = u1.import(script, script.Parent, "tournament-team-members").TournamentTeamMembers
local u13 = u1.import(script, script.Parent, "tournament-team-schedule").TournamentTeamSchedule
return {
    ["TournamentAppTeamPage"] = v5.new(u4)(function(p14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u1
            [2] = u3
            [3] = u4
            [4] = u10
            [5] = u2
            [6] = u13
            [7] = u9
            [8] = u11
            [9] = u8
            [10] = u7
            [11] = u12
        --]]
        local v16, u17 = p15.useState(false)
        local v19 = u1.async(function(p18) --[[ Line: 18 ]]
            --[[
            Upvalues:
                [1] = u3
            --]]
            u3.Controllers.TournamentTeamController:updateTournamentTeamIcon(p18)
        end)
        local v20 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.9)
        }
        local v21 = {}
        local v22 = #v21
        if v16 then
            v16 = u4.createElement(u10, {
                ["onClose"] = function() --[[ Name: onClose, Line 28 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    return u17(false)
                end,
                ["onSetIcon"] = v19
            })
        end
        if v16 then
            v21[v22 + 1] = v16
        end
        local _ = #v21
        local v23 = u4.createElement
        local v24 = u2
        local v25 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v26 = { u4.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }), (u4.createElement(u13, {
                ["region"] = p14.Region
            })) }
        local v27 = u4.createElement
        local v28 = {
            ["LayoutOrder"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.6, 1),
            ["BackgroundColor3"] = Color3.fromHex("403E74")
        }
        local v29 = {
            ["Gradient"] = u4.createElement("UIGradient", {
                ["Rotation"] = 60,
                ["Transparency"] = NumberSequence.new(0.6, 1),
                ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromHex("585497"))
            }),
            ["TeamIconBackground"] = u4.createElement("ImageLabel", {
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["ImageTransparency"] = 0.96,
                ["ZIndex"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u9[p14.TeamIcon].image,
                ["ScaleType"] = Enum.ScaleType.Fit
            })
        }
        local v30 = u4.createElement
        local v31 = u2
        local v32 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v33 = {
            u4.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.01, 0)
            }),
            u4.createElement(u11, {
                ["TeamId"] = p14.TeamId,
                ["TeamName"] = p14.TeamName,
                ["TeamIcon"] = p14.TeamIcon,
                ["Region"] = p14.Region,
                ["Division"] = p14.Division,
                ["IsLocalLeader"] = u8:IsStudio() and true or u7.LocalPlayer.UserId == p14.TeamLeader,
                ["Emotes"] = p14.Emotes,
                ["SetOpenEmoteSelectionScreen"] = function() --[[ Name: SetOpenEmoteSelectionScreen, Line 86 ]]
                    --[[
                    Upvalues:
                        [1] = u17
                    --]]
                    u17(true)
                end
            }),
            ["Line"] = u4.createElement("Frame", {
                ["BackgroundTransparency"] = 0.75,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 3,
                ["ZIndex"] = 3,
                ["Size"] = UDim2.fromScale(0.95, 0.003),
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            }),
            u4.createElement(u12, {
                ["TeamId"] = p14.TeamId,
                ["TeamLeader"] = p14.TeamLeader,
                ["TeamMembers"] = p14.TeamMembers
            })
        }
        __set_list(v29, 1, {v30(v31, v32, v33)})
        v26["Left Side - Team Info"] = v27("Frame", v28, v29)
        v21.TeamContentHolder = v23(v24, v25, v26)
        return u4.createFragment({
            ["App Content - Team"] = u4.createElement(u2, v20, v21)
        })
    end)
}