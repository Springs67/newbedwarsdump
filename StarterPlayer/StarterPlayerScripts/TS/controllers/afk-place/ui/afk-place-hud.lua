local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.RandomUtil
local u7 = v2.ScaleComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u14 = v13.MarketplaceService
local u15 = v13.Players
local u16 = v13.RunService
local u17 = v13.TweenService
local u18 = v13.Workspace
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "afk-area", "afk-place", "afk-place-utils").AfkPlaceUtils
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "place", "gamepass").Gamepass
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u23 = v1.import(script, script.Parent, "components", "afk-place-header").AFKHeader
local u24 = v1.import(script, script.Parent, "components", "afk-place-perks-container").AfkPlacePerksContainer
local u25 = v1.import(script, script.Parent, "components", "afk-place-progress-bar").AfkPlaceProgressBar
local u26 = v1.import(script, script.Parent, "components", "afk-place-return-button").AfkPlaceReturnButton
local v122 = v11.new(u10)(function(p27, p28) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u10
        [2] = u17
        [3] = u19
        [4] = u4
        [5] = u22
        [6] = u14
        [7] = u15
        [8] = u21
        [9] = u6
        [10] = u8
        [11] = u20
        [12] = u9
        [13] = u16
        [14] = u18
        [15] = u7
        [16] = u23
        [17] = u5
        [18] = u3
        [19] = u25
        [20] = u24
        [21] = u26
    --]]
    local v29 = p28.useState
    local v30 = p28.useEffect
    local u31, u32 = v29(false)
    local v33, u34 = v29(false)
    local v35, u36 = v29(false)
    local v37, u38 = v29(nil)
    local u39 = u10.createRef()
    local u40 = u10.createRef()
    local u41 = u10.createRef()
    local u42 = u10.createRef()
    local u43 = u10.createRef()
    local u44 = u10.createRef()
    local function u47(p45) --[[ Line: 41 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
        --]]
        if not p45 then
            return nil
        end
        local v46 = u17:Create(p45, TweenInfo.new(u19.Tween.textTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextTransparency"] = 1,
            ["TextStrokeTransparency"] = 1
        })
        v46:Play()
        return v46
    end
    local function u55(p48, p49) --[[ Line: 52 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
        --]]
        if not p48 then
            return nil
        end
        local v50 = u17
        local v51 = TweenInfo.new(u19.Tween.loadingScreenTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
        local v52 = {}
        local v53
        if p49 then
            v53 = UDim2.new(0, 0, -1.4, 0)
        else
            v53 = UDim2.new(0, 0, 0, 0)
        end
        v52.Position = v53
        local v54 = v50:Create(p48, v51, v52)
        v54:Play()
        return v54
    end
    local function u63(p56, p57) --[[ Line: 62 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
        --]]
        if not p56 then
            return nil
        end
        local v58 = u17
        local v59 = TweenInfo.new(u19.Tween.loadingScreenTransitionTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
        local v60 = {}
        local v61
        if p57 then
            v61 = UDim2.new(0, 0, -1.6, 0)
        else
            v61 = UDim2.new(0, 0, -0.2, 0)
        end
        v60.Position = v61
        local v62 = v58:Create(p56, v59, v60)
        v62:Play()
        return v62
    end
    local function u66(p64) --[[ Line: 72 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
        --]]
        if not p64 then
            return nil
        end
        local v65 = u17:Create(p64, TweenInfo.new(u19.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["TextTransparency"] = 0,
            ["TextStrokeTransparency"] = 1
        })
        v65:Play()
        return v65
    end
    local function u69(p67) --[[ Line: 83 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        if not p67 then
            return nil
        end
        local v68 = u17:Create(p67, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
            ["Rotation"] = 360
        })
        v68:Play()
        return v68
    end
    local function u72(p70) --[[ Line: 93 ]]
        --[[
        Upvalues:
            [1] = u17
            [2] = u19
        --]]
        if not p70 then
            return nil
        end
        local v71 = u17:Create(p70, TweenInfo.new(u19.Tween.textFadeInTime, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
            ["ImageTransparency"] = 0
        })
        v71:Play()
        return v71
    end
    v30(function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u41
            [2] = u42
            [3] = u43
            [4] = u40
            [5] = u44
            [6] = u31
            [7] = u69
            [8] = u47
            [9] = u55
            [10] = u63
            [11] = u66
            [12] = u72
        --]]
        local u73 = u41:getValue()
        local u74 = u42:getValue()
        local u75 = u43:getValue()
        local u76 = u40:getValue()
        local v77 = u44:getValue()
        if u31 and (u73 and u76) then
            u69(u75)
            u73.BackgroundTransparency = 0
            u76.BackgroundTransparency = 0
            u47(v77).Completed:Connect(function() --[[ Line: 113 ]]
                --[[
                Upvalues:
                    [1] = u55
                    [2] = u76
                    [3] = u63
                    [4] = u73
                    [5] = u66
                    [6] = u74
                    [7] = u72
                    [8] = u75
                --]]
                task.wait(0.3)
                u55(u76)
                u63(u73).Completed:Connect(function() --[[ Line: 116 ]]
                    --[[
                    Upvalues:
                        [1] = u55
                        [2] = u76
                        [3] = u63
                        [4] = u73
                        [5] = u66
                        [6] = u74
                        [7] = u72
                        [8] = u75
                    --]]
                    task.wait(0.3)
                    u55(u76, true)
                    u63(u73, true).Completed:Connect(function() --[[ Line: 119 ]]
                        --[[
                        Upvalues:
                            [1] = u66
                            [2] = u74
                            [3] = u72
                            [4] = u75
                            [5] = u73
                            [6] = u76
                        --]]
                        u66(u74)
                        u72(u75)
                        u73.BackgroundTransparency = 1
                        u76.BackgroundTransparency = 1
                    end)
                end)
            end)
        end
    end, { u31 })
    v30(function() --[[ Line: 130 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u22
            [3] = u34
            [4] = u14
            [5] = u15
            [6] = u21
            [7] = u36
        --]]
        local v78 = u4.isHoarceKat() and true or u22.Client:Get("IsVip"):CallServer()
        u34(v78)
        local u79
        if v78 then
            u79 = nil
        else
            u79 = u14.PromptGamePassPurchaseFinished:Connect(function(p80, p81, p82) --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u15
                    [2] = u21
                    [3] = u34
                --]]
                if p82 and (p80 == u15.LocalPlayer and p81 == u21.VIP) then
                    u34(true)
                end
            end)
        end
        local v83 = u4.isHoarceKat() and true or u15.LocalPlayer.MembershipType == Enum.MembershipType.Premium
        u36(v83)
        local u84
        if v83 then
            u84 = nil
        else
            u84 = u14.PromptPremiumPurchaseFinished:Connect(function() --[[ Line: 147 ]]
                --[[
                Upvalues:
                    [1] = u36
                    [2] = u15
                --]]
                u36(u15.LocalPlayer.MembershipType == Enum.MembershipType.Premium)
            end)
        end
        return function() --[[ Line: 151 ]]
            --[[
            Upvalues:
                [1] = u79
                [2] = u84
            --]]
            local v85 = u79
            if v85 ~= nil then
                v85:Disconnect()
            end
            local v86 = u84
            if v86 ~= nil then
                v86:Disconnect()
            end
        end
    end, {})
    v30(function() --[[ Line: 163 ]]
        --[[
        Upvalues:
            [1] = u39
            [2] = u6
            [3] = u8
            [4] = u20
            [5] = u38
            [6] = u9
            [7] = u16
            [8] = u17
        --]]
        local u87 = u39:getValue()
        if not u87 then
            return nil
        end
        local v88 = u6
        local v89 = 0
        local v90 = {}
        for v91, v92 in u8.values(u20) do
            local _ = v91 - 1
            local v93 = v92.backgroundImageRender
            if v93 ~= nil then
                v93 = v93[1]
            end
            if v93 ~= nil then
                v89 = v89 + 1
                v90[v89] = v93
            end
        end
        local u94 = v88.shuffleArray(v90)
        u38(u94[1])
        local u95 = u9.new()
        local u96 = u16:IsStudio() and 5 or 60
        u95:GiveTask(task.spawn(function() --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u96
                [2] = u94
                [3] = u87
                [4] = u17
                [5] = u95
                [6] = u38
            --]]
            local v97 = 0
            while true do
                local v98 = task.wait(u96)
                if v98 == 0 or (v98 ~= v98 or not v98) then
                    break
                end
                local v99 = u94
                local v100 = v97 + 1
                local u101 = v99[v97 % #u94 + 1]
                u87.Image = u101
                u87.ImageTransparency = 1
                local u102 = u17:Create(u87, TweenInfo.new(1), {
                    ["ImageTransparency"] = 0.94
                })
                u102:Play()
                u95:GiveTask(u102.Completed:Once(function() --[[ Line: 211 ]]
                    --[[
                    Upvalues:
                        [1] = u38
                        [2] = u101
                        [3] = u102
                    --]]
                    u38(u101)
                    u102:Destroy()
                end))
                u95:GiveTask(function() --[[ Line: 215 ]]
                    --[[
                    Upvalues:
                        [1] = u102
                    --]]
                    u102:Cancel()
                    u102:Destroy()
                end)
                v97 = v100
            end
        end))
        return function() --[[ Line: 221 ]]
            --[[
            Upvalues:
                [1] = u95
            --]]
            u95:Destroy()
        end
    end, {})
    local v103 = u18.CurrentCamera
    if v103 ~= nil then
        v103 = v103.ViewportSize
    end
    local v104
    if v103 == nil then
        v104 = v103
    else
        v104 = v103.X
    end
    local v105 = (v104 == 0 or (v104 ~= v104 or not v104)) and 1280 or v103.X * (u4.isSmallScreen() and 0.75 or 0.65)
    local v106
    if v103 == nil then
        v106 = v103
    else
        v106 = v103.Y
    end
    local v107
    if v106 == 0 or (v106 ~= v106 or not v106) then
        v107 = 750
    else
        local v108 = v103.Y
        u4.isSmallScreen()
        local v109 = 0.9
        v107 = v108 * v109
    end
    local v110 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = true
    }
    local v111 = {
        ["GradientBottomGlow"] = u10.createElement("Frame", {
            ["BackgroundTransparency"] = 0,
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 1,
            ["Size"] = UDim2.fromScale(1, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }, { u10.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(109, 114, 188)) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.8) })
            }) })
    }
    local v112 = #v111
    local v113 = {
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["ScaleType"] = Enum.ScaleType.Crop,
        ["Image"] = v37 == nil and "rbxassetid://140623687111669" or v37,
        ["BackgroundTransparency"] = 0,
        ["BackgroundColor3"] = Color3.fromRGB(8, 8, 8),
        ["BorderSizePixel"] = 0,
        ["ImageTransparency"] = 0.94,
        [u10.Ref] = u39
    }
    v111.ImageBackground = u10.createElement("ImageLabel", v113)
    local v114 = {
        ["Size"] = UDim2.fromOffset(v105, v107),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v115 = {
        u10.createElement(u7, {
            ["MaximumSize"] = Vector2.new(v105, v107)
        }),
        u10.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["VerticalFlex"] = "SpaceEvenly"
        }),
        u10.createElement(u23, {
            ["AppId"] = "AFK Header",
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.2),
            ["AfkStartTime"] = p27.DailyAfkTime,
            ["ReturnButtonPressed"] = u31,
            ["MountedStartTime"] = p27.MountStartTime
        }),
        ["Section"] = u10.createElement(u5, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.08)
        }, { u10.createElement("TextLabel", {
                ["Text"] = "Welcome! Staying AFK will automatically earn you <b>Rewards</b> \240\159\142\129\nThe Afk Area will automatically rejoin you every <b>18 minutes</b> \226\153\187\239\184\143",
                ["TextTransparency"] = 0.2,
                ["TextScaled"] = true,
                ["RichText"] = true,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["FontFace"] = Font.fromName(u19.Theme.font.Name, Enum.FontWeight.Regular),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextColor3"] = u3.WHITE
            }) })
    }
    local _ = #v115
    local v116 = {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.35)
    }
    local v117 = { u10.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 10)
        }), u10.createElement("TextLabel", {
            ["Text"] = "REWARDS",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 14 or 24),
            ["FontFace"] = Font.fromName(u19.Theme.font.Name, Enum.FontWeight.Bold),
            ["Font"] = u19.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u3.WHITE
        }, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 32
            }) }) }
    local v118 = #v117
    local v119 = {
        ["MountStartTime"] = p27.MountStartTime,
        ["BattlePassDto"] = p27.BattlePassDto,
        ["AfkStartTime"] = p27.DailyAfkTime,
        ["AfkCoinStart"] = p27.AfkCoinStart,
        ["BedCoinStart"] = p27.BedCoinStart,
        ["ReturnButtonPressed"] = u31,
        ["isVip"] = v33
    }
    local v120
    if v35 == nil then
        v120 = false
    else
        v120 = v35
    end
    v119.isPremium = v120
    v117[v118 + 1] = u10.createElement(u25, v119)
    v115.Section2 = u10.createElement(u5, v116, v117)
    v115.Section3 = u10.createElement(u5, {
        ["LayoutOrder"] = 2,
        ["Size"] = UDim2.fromScale(1, 0.135)
    }, { u10.createElement("UIListLayout", {
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["Padding"] = UDim.new(0, u4.isSmallScreen() and 4 or 10)
        }), u10.createElement("TextLabel", {
            ["Text"] = "EARN MORE WHILE AFK!",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["TextStrokeTransparency"] = 1,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 14 or 24),
            ["FontFace"] = Font.fromName(u19.Theme.font.Name, Enum.FontWeight.Bold),
            ["Font"] = u19.Theme.font,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u3.WHITE
        }, { u10.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 32
            }) }), u10.createElement(u24, {
            ["LayoutOrder"] = 6,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["isVip"] = v33,
            ["isPremium"] = v35
        }) })
    v111.Content = u10.createElement(u5, v114, v115)
    local v121 = {
        ["Text"] = "Lobby",
        ["OnClick"] = function() --[[ Name: OnClick, Line 400 ]]
            --[[
            Upvalues:
                [1] = u32
                [2] = u22
            --]]
            u32(true)
            u22.Client:Get("TeleportToLobby"):SendToServer()
        end,
        ["ReturnButtonPressed"] = u31
    }
    v111[v112 + 1] = u10.createElement(u26, v121)
    return u10.createFragment({
        ["AFKGui"] = u10.createElement("ScreenGui", v110, v111)
    })
end)
return {
    ["AfkPlaceHud"] = v12.connect(function(_, p123) --[[ Line: 411 ]]
        local v124 = {}
        for v125, v126 in p123 do
            v124[v125] = v126
        end
        return v124
    end)(v122)
}