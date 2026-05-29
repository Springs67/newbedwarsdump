local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.DeviceUtil
local u7 = v3.Empty
local u8 = v3.ImageId
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types").ConsumableType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v83 = v12.new(u11)(function(u20, p21) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u16
        [3] = u6
        [4] = u9
        [5] = u18
        [6] = u19
        [7] = u11
        [8] = u17
        [9] = u5
        [10] = u7
        [11] = u4
        [12] = u15
        [13] = u8
        [14] = u2
        [15] = u14
    --]]
    local v22 = p21.useState
    local v23 = p21.useEffect
    local _, u24 = v22(nil)
    local v25 = 0
    local v26 = {}
    for v27, v28 in u10.entries(u20.ConsumablesReducer.inventory) do
        local _ = v27 - 1
        local _ = v28[1]
        if v28[2].consumable == u16.AUTO_COMPLETE_DAILY_MISSION_TICKET == true then
            v25 = v25 + 1
            v26[v25] = v28
        end
    end
    local v29 = #v26
    local v30 = 0
    local v31 = {}
    for v32, v33 in u10.entries(u20.ConsumablesReducer.inventory) do
        local _ = v32 - 1
        local _ = v33[1]
        if v33[2].consumable == u16.AUTO_COMPLETE_WEEKLY_MISSION_TICKET == true then
            v30 = v30 + 1
            v31[v30] = v33
        end
    end
    local v34 = #v31
    v23(function() --[[ Line: 59 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u9
            [3] = u24
            [4] = u18
        --]]
        if not u6.isHoarceKat() then
            u9.Controllers.MissionsController:getMissionData():andThen(function(p35) --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24(p35)
            end)
            local u37 = u18.Client:WaitFor("SetAllMissionData"):expect():Connect(function(p36) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u24
                --]]
                u24(p36.missionData)
            end)
            return function() --[[ Line: 70 ]]
                --[[
                Upvalues:
                    [1] = u37
                --]]
                u37:Disconnect()
            end
        end
    end, {})
    local v38 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = -1,
        ["Size"] = u20.Size,
        ["BackgroundColor3"] = u19.backgroundPrimary
    }
    local v39 = { u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 5),
            ["PaddingLeft"] = UDim.new(0, u6.isSmallScreen() and 0 or 5),
            ["PaddingRight"] = UDim.new(0, u6.isSmallScreen() and 0 or 5)
        }), u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0.15, 0)
        }) }
    local v40 = #v39
    local v41 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(1, 0, 0.5, 0)
    }
    local v42 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.1, 0)
        }) }
    local v43 = #v42
    local v44 = {
        ["Size"] = UDim2.fromScale(1.05, 0.15)
    }
    local v45 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.03, 0)
        }) }
    local v46 = #v45
    local v47 = {
        ["Size"] = UDim2.fromScale(0.2, 1)
    }
    local v48 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.1, 0)
        }) }
    local v49 = #v48
    local v50 = {
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v51 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.2, 0)
        }), u11.createElement("ImageLabel", {
            ["ScaleType"] = "Fit",
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["Image"] = u17.MISSION_TICKET_DAILY
        }) }
    local v52 = #v51
    local v53 = {
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v54 = v29 == nil and 0 or v29
    v53.Text = "<b>" .. tostring(v54) .. "</b>"
    v53.TextColor3 = u5.WHITE
    v53.TextSize = 14
    v53.RichText = true
    v53.Font = Enum.Font.Roboto
    v53.BackgroundTransparency = 1
    v53.LayoutOrder = 2
    v53.TextXAlignment = Enum.TextXAlignment.Left
    v51[v52 + 1] = u11.createElement("TextLabel", v53)
    v48[v49 + 1] = u11.createElement(u7, v50, v51)
    local v55 = {
        ["Size"] = UDim2.fromScale(1, 0.5)
    }
    local v56 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.2, 0)
        }), u11.createElement(u7, {
            ["Size"] = UDim2.fromScale(0.5, 1)
        }, { u11.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 11,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u17.MISSION_TICKET_WEEKLY
            }), u11.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 10,
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = u17.MISSION_TICKET_GLOW
            }) }) }
    local v57 = #v56
    local v58 = {
        ["Size"] = UDim2.fromScale(0.5, 1)
    }
    local v59 = v34 == nil and 0 or v34
    v58.Text = "<b>" .. tostring(v59) .. "</b>"
    v58.TextColor3 = u5.WHITE
    v58.TextSize = 14
    v58.RichText = true
    v58.Font = Enum.Font.Roboto
    v58.BackgroundTransparency = 1
    v58.LayoutOrder = 2
    v58.TextXAlignment = Enum.TextXAlignment.Left
    v56[v57 + 1] = u11.createElement("TextLabel", v58)
    v48[v49 + 2] = u11.createElement(u7, v55, v56)
    v45[v46 + 1] = u11.createElement(u7, v47, v48)
    local v60 = v46 + 2
    local v61 = u11.createElement
    local v62 = u4
    local v63 = {
        ["Text"] = "USE MISSION TICKETS",
        ["TextScaled"] = true,
        ["LayoutOrder"] = 3,
        ["Size"] = UDim2.fromScale(0.7, 1)
    }
    local v64
    if u20.TicketView then
        v64 = u19.backgroundTertiary
    else
        v64 = u19.backgroundPrimary
    end
    v63.BackgroundColor3 = v64
    v63.TextColor3 = u5.WHITE
    function v63.OnClick() --[[ Line: 235 ]]
        --[[
        Upvalues:
            [1] = u20
        --]]
        u20.ChangeTicketView(not u20.TicketView)
    end
    v45[v60] = v61(v62, v63, { u11.createElement("UIPadding", {
            ["PaddingLeft"] = UDim.new(0.1, 0),
            ["PaddingRight"] = UDim.new(0.1, 0),
            ["PaddingTop"] = UDim.new(0.15, 0),
            ["PaddingBottom"] = UDim.new(0.15, 0)
        }) })
    v42[v43 + 1] = u11.createElement(u7, v44, v45)
    v42[v43 + 2] = u11.createElement("ImageLabel", {
        ["ScaleType"] = "Fit",
        ["LayoutOrder"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.5, 0.25),
        ["Image"] = u17.MISSION
    })
    local v65 = v43 + 3
    local v66 = u11.createElement
    local v67 = "TextLabel"
    local v68 = {
        ["Text"] = "Complete <b>daily</b> and <b>weekly</b> missions for Rewards",
        ["RichText"] = true,
        ["TextSize"] = 16,
        ["TextWrapped"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(u6.isSmallScreen() and 0.9 or 0.85, 0, 0.15, 0)
    }
    local v69
    if u6.isSmallScreen() then
        v69 = Enum.AutomaticSize.None
    else
        v69 = Enum.AutomaticSize.Y
    end
    v68.AutomaticSize = v69
    v68.TextColor3 = u5.WHITE
    v68.Font = Enum.Font.Roboto
    v68.TextScaled = u6.isSmallScreen() and true or false
    v42[v65] = v66(v67, v68)
    v42[v43 + 4] = u11.createElement("Frame", {
        ["BackgroundTransparency"] = 0.6,
        ["BorderSizePixel"] = 0,
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.new(u6.isSmallScreen() and 0.9 or 0.85, 0, 0.15, 0),
        ["AutomaticSize"] = Enum.AutomaticSize.Y,
        ["BackgroundColor3"] = u5.BLACK
    }, { u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 8),
            ["PaddingBottom"] = UDim.new(0, 8),
            ["PaddingLeft"] = UDim.new(0, 2),
            ["PaddingRight"] = UDim.new(0, 2)
        }), u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u11.createElement("TextLabel", {
            ["AutomaticSize"] = "Y",
            ["Text"] = "<b>Daily Refresh:</b> 3pm PST\n<b>Weekly Refresh:</b> Fri 3pm PST",
            ["RichText"] = true,
            ["TextSize"] = 14,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0),
            ["TextColor3"] = u5.WHITE,
            ["Font"] = Enum.Font.Roboto
        }) })
    v39.MissionsInfo = u11.createElement("Frame", v41, v42)
    local v70 = u15.isActiveBattlePass()
    if v70 then
        local v71 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 2,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(0, 1),
            ["Size"] = UDim2.new(1, 0, 0.35, 0),
            ["BackgroundColor3"] = u19.backgroundPrimary
        }
        local v72 = {}
        local v73 = u11.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        })
        local v74 = u11.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 6)
        })
        local v75 = u11.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 10),
            ["PaddingBottom"] = UDim.new(0, 10),
            ["PaddingLeft"] = UDim.new(0, 10),
            ["PaddingRight"] = UDim.new(0, 10)
        })
        local v76 = u11.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["Size"] = UDim2.new(0, 60, 0, 60),
            ["BackgroundColor3"] = u19.backgroundTertiary
        }, { u11.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(1, 0)
            }), u11.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(0.7, 0.7),
                ["Image"] = u8.TICKET
            }) })
        local v77 = u11.createElement
        local v78 = "TextLabel"
        local v79 = {
            ["RichText"] = true,
            ["TextSize"] = 16,
            ["TextWrapped"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, u6.isSmallScreen() and 32 or 16)
        }
        local v80
        if u6.isSmallScreen() then
            v80 = Enum.AutomaticSize.None
        else
            v80 = Enum.AutomaticSize.Y
        end
        v79.AutomaticSize = v80
        v79.Text = not u20.BattlePassPaid and "<b>Earn 20% more XP from missions & matches with the Battle Pass</b>" or "<b>20% mission XP bonus <font color=\"" .. u5.richTextColor(u5.hexColor(2600544)) .. "\">ACTIVATED</font></b>"
        v79.TextColor3 = u19.textPrimary
        v79.TextYAlignment = Enum.TextYAlignment.Bottom
        v79.Font = Enum.Font.Roboto
        v79.TextScaled = u6.isSmallScreen() and true or false
        __set_list(v72, 1, {v73, v74, v75, v76, v77(v78, v79)})
        local v81 = #v72
        local v82 = not u20.BattlePassPaid
        if v82 then
            v82 = u11.createElement(u4, {
                ["TextSize"] = 14,
                ["Text"] = "BUY BATTLE PASS",
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.new(1, 0, 0, 32),
                ["BackgroundColor3"] = u19.backgroundSuccess,
                ["OnClick"] = function() --[[ Name: OnClick, Line 365 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    u9.Controllers.BattlePassController:promptBattlePassPurchase()
                end
            })
        end
        if v82 then
            v72[v81 + 1] = v82
        end
        v72[#v72 + 1] = u11.createElement(u4, {
            ["TextSize"] = 14,
            ["Text"] = "VIEW REWARDS",
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["BackgroundColor3"] = u19.backgroundSecondary,
            ["OnClick"] = function() --[[ Name: OnClick, Line 379 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u14
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.BATTLEPASS, {})
            end
        })
        v70 = u11.createFragment({
            ["BattlePassPerkInfo"] = u11.createElement("Frame", v71, v72)
        })
    end
    if v70 then
        v39[v40 + 1] = v70
    end
    return u11.createFragment({
        ["LeftWrapper"] = u11.createElement("Frame", v38, v39)
    })
end)
return {
    ["MissionsSidebar"] = v13.connect(function(p84, p85) --[[ Line: 395 ]]
        local v86 = {}
        for v87, v88 in p85 do
            v86[v87] = v88
        end
        v86.ConsumablesReducer = p84.Consumable
        return v86
    end)(v83)
}