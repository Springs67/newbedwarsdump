local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DeviceUtil
local u5 = v3.Empty
local u6 = v3.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u12 = v1.import(script, script.Parent, "tournament-app-types").TournamentAppTab
return {
    ["TournamentAppHeader"] = v8.new(u7)(function(u13, _) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u12
            [3] = u4
            [4] = u10
            [5] = u9
            [6] = u5
            [7] = u2
            [8] = u6
            [9] = u11
        --]]
        local v14 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.1),
            ["BackgroundColor3"] = Color3.fromHex("403E74")
        }
        local v15 = {}
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(0.95, 1),
            ["Position"] = UDim2.fromScale(0.025, 0)
        }
        local v18 = {
            u7.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.03, 0)
            }),
            ["Header Title"] = u7.createElement("TextLabel", {
                ["Text"] = "<b>TOURNAMENTS</b>",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(0.25, 1),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
        }
        local v19 = u7.createElement
        local v20 = "TextButton"
        local v21 = {
            ["Text"] = "<b>INFO</b>",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.1, 0.5)
        }
        local v22
        if u12.INFO == u13.SelectedTab then
            v22 = Color3.fromHex("7975CF")
        else
            v22 = Color3.fromHex("000000")
        end
        v21.BackgroundColor3 = v22
        v21.BackgroundTransparency = u12.INFO == u13.SelectedTab and 0 or 0.6
        v21.BorderSizePixel = 0
        v21.LayoutOrder = 1
        v21.RichText = true
        v21[u7.Event.Activated] = function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            u13.SelectTabButton(u12.INFO)
        end
        v18.TournamentInfoPage = v19(v20, v21, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) })
        local v23 = u7.createElement
        local v24 = "TextButton"
        local v25 = {
            ["Text"] = "<b>TEAM</b>",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.1, 0.5)
        }
        local v26
        if u12.TEAM == u13.SelectedTab then
            v26 = Color3.fromHex("7975CF")
        else
            v26 = Color3.fromHex("000000")
        end
        v25.BackgroundColor3 = v26
        v25.BackgroundTransparency = u12.TEAM == u13.SelectedTab and 0 or 0.6
        v25.BorderSizePixel = 0
        v25.LayoutOrder = 2
        v25.RichText = true
        v25[u7.Event.Activated] = function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            u13.SelectTabButton(u12.TEAM)
        end
        v18.TournamentTeamButton = v23(v24, v25, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) })
        local v27 = u7.createElement
        local v28 = "TextButton"
        local v29 = {
            ["Text"] = "<b>MATCHES</b>",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.1, 0.5)
        }
        local v30
        if u12.BRACKET == u13.SelectedTab then
            v30 = Color3.fromHex("7975CF")
        else
            v30 = Color3.fromHex("000000")
        end
        v29.BackgroundColor3 = v30
        v29.BackgroundTransparency = u12.BRACKET == u13.SelectedTab and 0 or 0.6
        v29.BorderSizePixel = 0
        v29.LayoutOrder = 3
        v29.RichText = true
        v29[u7.Event.Activated] = function() --[[ Line: 90 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            u13.SelectTabButton(u12.BRACKET)
        end
        v18.TournamentBracketButton = v27(v28, v29, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) })
        local v31 = u7.createElement
        local v32 = "TextButton"
        local v33 = {
            ["Text"] = "<b>INVITES</b>",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.1, 0.5)
        }
        local v34
        if u12.INVITES == u13.SelectedTab then
            v34 = Color3.fromHex("7975CF")
        else
            v34 = Color3.fromHex("000000")
        end
        v33.BackgroundColor3 = v34
        v33.BackgroundTransparency = u12.INVITES == u13.SelectedTab and 0 or 0.6
        v33.BorderSizePixel = 0
        v33.LayoutOrder = 4
        v33.RichText = true
        v33[u7.Event.Activated] = function() --[[ Line: 107 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u12
            --]]
            u13.SelectTabButton(u12.INVITES)
        end
        v18.TournamentInvitesButton = v31(v32, v33, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.5, 0)
            }) })
        local v35 = #v18
        local v36
        if u4.isHoarceKat() then
            v36 = true
        elseif u10:getState().Tournament.myTeamLeader == u9.LocalPlayer.UserId then
            local v37 = u7.createFragment
            local v38 = {}
            local v39 = u7.createElement
            local v40 = "TextButton"
            local v41 = {
                ["Text"] = "<b>SEND</b>",
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["Size"] = UDim2.fromScale(0.1, 0.5)
            }
            local v42
            if u12.OUTBOUND_INVITES == u13.SelectedTab then
                v42 = Color3.fromHex("7975CF")
            else
                v42 = Color3.fromHex("000000")
            end
            v41.BackgroundColor3 = v42
            v41.BackgroundTransparency = u12.OUTBOUND_INVITES == u13.SelectedTab and 0 or 0.6
            v41.BorderSizePixel = 0
            v41.LayoutOrder = 5
            v41.RichText = true
            v41[u7.Event.Activated] = function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u13
                    [2] = u12
                --]]
                u13.SelectTabButton(u12.OUTBOUND_INVITES)
            end
            v38.TournamentOutboundInvitesButton = v39(v40, v41, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0.5, 0)
                }) })
            v36 = v37(v38)
        else
            v36 = false
        end
        if type(v36) == "table" then
            v18[v35 + 1] = v36
        end
        v18[#v18 + 1] = u7.createElement(u5, {
            ["LayoutOrder"] = 5,
            ["Size"] = UDim2.fromScale(0.11, 1)
        })
        v18.CloseButton = u7.createElement("TextButton", {
            ["Text"] = "<b>X</b>",
            ["Font"] = "Arial",
            ["RichText"] = true,
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Size"] = UDim2.fromScale(0.1, 0.5),
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 6,
            [u7.Event.Activated] = function() --[[ Line: 154 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u13
                    [3] = u6
                    [4] = u11
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u13.AppId)
                u6:playSound(u11.UI_CLOSE_2)
            end
        })
        v15[v16 + 1] = u7.createElement(u5, v17, v18)
        return u7.createFragment({
            ["Tournament App Header"] = u7.createElement("Frame", v14, v15)
        })
    end)
}