local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ColorUtil
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v3.IconButton
local u8 = v3.Padding
local u9 = v3.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "event", "event-meta").EventMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-types").GlobalTeamKey
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "global-teams", "global-teams-util").GlobalTeamsUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "event-app-currency-pill").EventAppCurrencyPill
local u23 = v1.import(script, script.Parent, "event-app-navlink").EventAppNavlink
return {
    ["EventAppNavbar"] = v11.new(u10)(function(u24, p25) --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u14
            [2] = u16
            [3] = u12
            [4] = u5
            [5] = u15
            [6] = u9
            [7] = u20
            [8] = u21
            [9] = u10
            [10] = u4
            [11] = u6
            [12] = u8
            [13] = u23
            [14] = u17
            [15] = u18
            [16] = u19
            [17] = u22
            [18] = u7
            [19] = u2
            [20] = u13
        --]]
        local _ = p25.useState
        local _ = p25.useEffect
        local v26 = u14[u24.EventType]
        local v27 = os.time() > v26.endDate
        local v28 = #v26.shops ~= 0
        local v29 = v26.globalTeamEventKey
        local v30 = u16.getGlobalTeamEventMetaFromEventType(u24.EventType)
        local v31
        if v29 then
            v31 = u12:getState().Event.profileData.events[u24.EventType]
            if v31 ~= nil then
                v31 = v31.globalTeamKey
            end
        else
            v31 = nil
        end
        if u5.isHoarceKat() then
            v31 = u15.SUMMER_2025_TEAM
        end
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 0.1)
        }
        local v33 = v26.navbarImage
        v32.Image = v33 == nil and "rbxassetid://10716080072" or v33
        v32.ScaleType = Enum.ScaleType.Crop
        v32.BackgroundColor3 = u21.backgroundTertiary
        v32.BorderSizePixel = 0
        v32.LayoutOrder = 1
        local v34 = { u10.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 8)
            }) }
        local _ = #v34
        local v35 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = u4.WHITE
        }
        local v36 = {
            u10.createElement("UIGradient", {
                ["Rotation"] = 45,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#5659A4")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5659A4")) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.1), NumberSequenceKeypoint.new(1, 0.4) })
            }),
            u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 0)
            }),
            ["TitleContainer"] = u10.createElement(u6, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(0.33, 1)
            }, {
                u10.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0, 2)
                }),
                u10.createElement(u8, {
                    ["Padding"] = {
                        ["Left"] = 14,
                        ["Top"] = 8,
                        ["Bottom"] = 8
                    }
                }),
                ["Title"] = u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "GothamBlack",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.65),
                    ["Text"] = "<b>" .. v26.name .. "</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                }),
                ["SubTitle"] = u10.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["TextXAlignment"] = "Left",
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.35),
                    ["Text"] = "<font transparency=\".3\">Event Period:</font> <b>" .. os.date("%B %d", v26.startDate) .. " - " .. os.date("%B %d", v26.endDate) .. "</b>",
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255)
                })
            })
        }
        local _ = #v36
        local v37 = v26.customPagesConfig
        if v37 ~= nil then
            v37 = v37.setTeamPage
        end
        if v37 then
            v37 = not v27
            if v37 then
                v37 = u10.createElement(u23, {
                    ["Text"] = "Team",
                    ["Page"] = "team",
                    ["Icon"] = u17.PEOPLE_GROUP_ICON,
                    ["ActivePage"] = u24.Page,
                    ["OnClick"] = function() --[[ Name: OnClick, Line 142 ]]
                        --[[
                        Upvalues:
                            [1] = u9
                            [2] = u20
                            [3] = u24
                        --]]
                        u9:playSound(u20.UI_CLICK)
                        if u24.Page ~= "team" then
                            u24.SetPage("team")
                        end
                    end
                })
            end
        end
        local v38 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v39 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Center",
                ["VerticalAlignment"] = "Bottom"
            }) }
        local v40 = #v39
        if v37 then
            v39[v40 + 1] = v37
        end
        local v41 = #v39
        local v42 = v26.customPagesConfig
        if v42 ~= nil then
            v42 = v42.infoPage
        end
        if v42 then
            v42 = u10.createElement(u23, {
                ["Text"] = "Info",
                ["Page"] = "info",
                ["Icon"] = u17.HELP_ICON_SOLID,
                ["ActivePage"] = u24.Page,
                ["OnClick"] = function() --[[ Name: OnClick, Line 174 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u24
                    --]]
                    u9:playSound(u20.UI_CLICK)
                    if u24.Page ~= "info" then
                        u24.SetPage("info")
                    end
                end
            })
        end
        if v42 then
            v39[v41 + 1] = v42
        end
        local v43 = #v39
        local v44 = not v27 and #v26.missionGenerators ~= 0
        if v44 then
            v44 = u10.createElement(u23, {
                ["Text"] = "Missions",
                ["Page"] = "missions",
                ["Icon"] = u17.CLIPBOARD_SOLID,
                ["ActivePage"] = u24.Page,
                ["OnClick"] = function() --[[ Name: OnClick, Line 188 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u24
                    --]]
                    u9:playSound(u20.UI_CLICK)
                    if u24.Page ~= "missions" then
                        u24.SetPage("missions")
                    end
                end
            })
        end
        if v44 then
            v39[v43 + 1] = v44
        end
        local v45 = #v39
        local v46 = v26.checkInSystem
        if v46 then
            local v47 = {}
            local v48 = u18[u19.LUCKY_GIFT].image
            v47.Icon = v48 == nil and "" or v48
            v47.Text = "CheckIn"
            v47.Page = "checkin"
            v47.ActivePage = u24.Page
            function v47.OnClick() --[[ Line: 207 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u20
                    [3] = u24
                --]]
                u9:playSound(u20.UI_CLICK)
                if u24.Page ~= "checkin" then
                    u24.SetPage("checkin")
                end
            end
            v46 = u10.createElement(u23, v47)
        end
        if v46 then
            v39[v45 + 1] = v46
        end
        local v49 = #v39
        local v50
        if v30 == nil or (v30.sharedTeamRewards == nil or #v30.sharedTeamRewards <= 0) then
            v50 = false
        else
            v50 = u10.createElement(u23, {
                ["Text"] = "Global Team Milestones",
                ["Page"] = "global-team-milestones",
                ["Icon"] = u17.THUMB_TACK_SOLID,
                ["ActivePage"] = u24.Page,
                ["OnClick"] = function() --[[ Name: OnClick, Line 221 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u24
                    --]]
                    u9:playSound(u20.UI_CLICK)
                    if u24.Page ~= "global-team-milestones" then
                        u24.SetPage("global-team-milestones")
                    end
                end
            })
        end
        if v50 then
            v39[v49 + 1] = v50
        end
        local v51 = #v39
        local v52
        if v31 then
            if v30 then
                v52 = v30.timedGoals
            else
                v52 = v30
            end
        else
            v52 = v31
        end
        if v52 then
            local v53 = 0
            for _ in v30.timedGoals do
                v53 = v53 + 1
            end
            v52 = v53 > 0
            if v52 then
                v52 = v30.timedGoals[v31]
                if v52 then
                    v52 = u10.createElement(u23, {
                        ["Text"] = "Timed Goals",
                        ["Page"] = "global-team-timed-goals",
                        ["Icon"] = u17.HUD_TIMER_ICON,
                        ["ActivePage"] = u24.Page,
                        ["OnClick"] = function() --[[ Name: OnClick, Line 248 ]]
                            --[[
                            Upvalues:
                                [1] = u9
                                [2] = u20
                                [3] = u24
                            --]]
                            u9:playSound(u20.UI_CLICK)
                            if u24.Page ~= "global-team-timed-goals" then
                                u24.SetPage("global-team-timed-goals")
                            end
                        end
                    })
                end
            end
        end
        if v52 then
            v39[v51 + 1] = v52
        end
        local v54 = #v39
        if v28 then
            v28 = u10.createElement(u23, {
                ["Text"] = "Shop",
                ["Page"] = "shop",
                ["Icon"] = u17.SHOPPING_CART_SOLID,
                ["ActivePage"] = u24.Page,
                ["OnClick"] = function() --[[ Name: OnClick, Line 264 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                        [2] = u20
                        [3] = u24
                    --]]
                    u9:playSound(u20.UI_CLICK)
                    if u24.Page ~= "shop" then
                        u24.SetPage("shop")
                    end
                end,
                ["ThemeColor"] = Color3.fromRGB(255, 214, 36)
            })
        end
        if v28 then
            v39[v54 + 1] = v28
        end
        v36.NavLinks = u10.createElement(u6, v38, v39)
        local v55 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.33, 1)
        }
        local v56 = { u10.createElement(u8, {
                ["Padding"] = {
                    ["Right"] = 14,
                    ["Top"] = 10,
                    ["Bottom"] = 10
                }
            }), u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 6)
            }) }
        local _ = #v56
        local v57 = {}
        local v58 = 0
        for v59, v60 in v26.currencies do
            local _ = v59 - 1
            local v61 = u24.EventDataProfile.currencies[v60]
            local v62 = {
                ["Currency"] = v60
            }
            if v61 ~= nil then
                v61 = v61.currAmount
            end
            v62.CurrAmount = v61 == nil and 0 or v61
            local v63 = u10.createElement(u22, v62)
            if v63 ~= nil then
                v58 = v58 + 1
                v57[v58] = v63
            end
        end
        local v64 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(0.85, -6, 0.9, 0)
        }
        local v65 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["Padding"] = UDim.new(0.03, 0)
            }) }
        local v66 = #v65
        for v67, v68 in v57 do
            v65[v66 + v67] = v68
        end
        v56.CurrencyList = u10.createElement(u6, v64, v65)
        v56.CloseAppButton = u10.createElement(u7, {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(0.15, 1),
            ["Image"] = u17.X,
            ["OnClick"] = function() --[[ Name: OnClick, Line 341 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u13
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u13.EVENT_APP)
            end
        }, { u10.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) })
        v36.HeaderRightSide = u10.createElement(u6, v55, v56)
        v34.Wrapper = u10.createElement("Frame", v35, v36)
        return u10.createFragment({
            ["NavBar"] = u10.createElement("ImageLabel", v32, v34)
        })
    end)
}