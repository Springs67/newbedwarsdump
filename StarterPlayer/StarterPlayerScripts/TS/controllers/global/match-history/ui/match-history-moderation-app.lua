local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.CircularSpinner
local u5 = v3.DarkBackground
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.ScaleComponent
local u9 = v3.SlideIn
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Workspace
local u16 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "player-profile", "ui", "player-profile-empty").PlayerProfileEmpty
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent.Parent.Parent, "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u19 = v1.import(script, script.Parent, "match-history-core").MatchHistoryCore
local v50 = v13.new(u12)(function(u20, p21) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u12
        [3] = u5
        [4] = u15
        [5] = u8
        [6] = u10
        [7] = u2
        [8] = u7
        [9] = u17
        [10] = u18
        [11] = u11
        [12] = u4
        [13] = u16
        [14] = u19
        [15] = u9
    --]]
    local v22 = p21.useState
    local v23, u24 = v22(u20.player.displayName)
    local v25, u26 = v22({
        ["player"] = u20.player,
        ["matchHistory"] = u20.matchHistory
    })
    local v27, u28 = v22(false)
    local v29 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u6.isSmallScreen()
    }
    local v30 = { u12.createElement(u5, {
            ["BackgroundTransparency"] = 0.4,
            ["AppId"] = u20.AppId
        }) }
    local v31 = #v30
    local v32 = {}
    local v33 = #v32
    local v34 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(800, 600)
    }
    local v35 = {}
    local v36 = #v35
    local v37 = {
        ["MaximumSize"] = Vector2.new(1040, 780),
        ["ScreenPadding"] = u15.CurrentCamera.ViewportSize * Vector2.new(0.03, 0.045)
    }
    v35[v36 + 1] = u12.createElement(u8, v37)
    local v38 = v36 + 2
    local v39 = u12.createElement
    local v40 = u10
    local v41 = {
        ["AppId"] = u20.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["Title"] = v25.player.displayName .. "\'s Match History",
        ["OnClose"] = function() --[[ Name: OnClose, Line 66 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u20
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u20.AppId)
        end
    }
    local v42 = { (u12.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.05, 0)
        })) }
    local v43 = u12.createElement
    local v44 = u7
    local v45 = {
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(1, 0, 0.05, 0)
    }
    local v48 = {
        u12.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 4)
        }),
        u12.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["Text"] = "UserID/Username:",
            ["TextSize"] = 14,
            ["Size"] = UDim2.fromScale(0, 1),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextColor3"] = u17.textPrimary,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        }),
        ["CopyUserId"] = u12.createElement(u18, {
            ["TextEditable"] = true,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 2,
            ["TextSize"] = 14,
            ["LeftPadding"] = 0.05,
            ["Size"] = UDim2.new(0.3, 0, 1, 0),
            ["Text"] = tostring(v23),
            ["Font"] = Enum.Font.SourceSans,
            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["OnFocusLost"] = function(u46) --[[ Name: OnFocusLost, Line 103 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u11
                    [3] = u26
                    [4] = u24
                --]]
                u28(true)
                u11.Controllers.MatchHistoryController:requestMatchHistory(u46):andThen(function(p47) --[[ Line: 106 ]]
                    --[[
                    Upvalues:
                        [1] = u26
                        [2] = u24
                        [3] = u46
                        [4] = u28
                    --]]
                    if p47 then
                        u26({
                            ["player"] = p47.player,
                            ["matchHistory"] = p47.matchHistory
                        })
                        u24(u46)
                    end
                    u28(false)
                end)
            end
        })
    }
    v42.Searchbar = v43(v44, v45, v48)
    local v49
    if v27 then
        v49 = u12.createElement(u4, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.3)
        }, { u12.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
    elseif #v25.matchHistory == 0 then
        v49 = u12.createElement(u16, {
            ["Text"] = "No match history available.",
            ["Size"] = UDim2.fromScale(1, 0.9)
        })
    else
        v49 = u12.createElement(u19, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["userId"] = v25.player.userId,
            ["matchHistory"] = v25.matchHistory
        })
    end
    __set_list(v42, 2, {v49})
    v35[v38] = v39(v40, v41, v42)
    v32[v33 + 1] = u12.createElement("Frame", v34, v35)
    v30[v31 + 1] = u12.createElement(u9, {}, v32)
    return u12.createElement("ScreenGui", v29, v30)
end)
return {
    ["MatchHistoryModerationApp"] = v14.connect(function(_, p51) --[[ Line: 145 ]]
        local v52 = {}
        for v53, v54 in p51 do
            v52[v53] = v54
        end
        return v52
    end)(v50)
}