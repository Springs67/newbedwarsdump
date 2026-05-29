local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "enchant-table", "ui", "enchant-table-ui-util").EnchantTableUIUtil
local u10 = v1.import(script, script.Parent, "kill-feed-card-entity").KillFeedCardEntity
local u11 = v1.import(script, script.Parent, "kill-feed-payout").KillFeedPayout
local u12 = u4.isSmallScreen() and 12 or 30
local u13 = u4.isSmallScreen() and 7 or 16
return {
    ["KillFeedCard"] = v7.new(u6)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u12
            [3] = u13
            [4] = u8
            [5] = u4
            [6] = u10
            [7] = u5
            [8] = u11
            [9] = u9
            [10] = u3
        --]]
        local _ = p15.useState
        local v16 = p15.useEffect
        local u17 = u6.createRef()
        local u18 = u6.createRef()
        local v19 = u12 + ((not u14.KillFeedData.killPayout or next(u14.KillFeedData.killPayout) == nil) and 0 or u13)
        v16(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u18
                [3] = u14
                [4] = u8
            --]]
            local u20 = u17:getValue()
            local u21 = u18:getValue()
            local function v32() --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u21
                    [3] = u8
                --]]
                local v22 = u14.uiConfig
                if v22 ~= nil then
                    v22 = v22.onEnterTween
                end
                if u21 then
                    local u23
                    if v22 == nil then
                        u23 = v22
                    else
                        u23 = v22.tweenInfo
                    end
                    if u23 == nil then
                        u23 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
                    end
                    local v24
                    if v22 == nil then
                        v24 = v22
                    else
                        v24 = v22.position
                    end
                    if v24 == nil then
                        v24 = UDim2.fromScale(0, 0)
                    end
                    if v22 ~= nil then
                        v22 = v22.transparency
                    end
                    local u25 = v22 == nil and 0 or v22
                    local v26 = u8:Create(u21, u23, {
                        ["Position"] = v24
                    })
                    local v27 = u21:GetDescendants()
                    local function v29(p28) --[[ Line: 62 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u23
                            [3] = u25
                        --]]
                        if p28:IsA("TextLabel") then
                            u8:Create(p28, u23, {
                                ["TextTransparency"] = u25
                            }):Play()
                            return
                        elseif p28:IsA("ImageLabel") then
                            u8:Create(p28, u23, {
                                ["ImageTransparency"] = u25
                            }):Play()
                        elseif p28:IsA("UIStroke") then
                            u8:Create(p28, u23, {
                                ["Transparency"] = u25
                            }):Play()
                        end
                    end
                    for v30, v31 in v27 do
                        v29(v31, v30 - 1, v27)
                    end
                    return v26
                end
            end
            local function u43() --[[ Line: 83 ]]
                --[[
                Upvalues:
                    [1] = u14
                    [2] = u21
                    [3] = u8
                --]]
                local v33 = u14.uiConfig
                if v33 ~= nil then
                    v33 = v33.onExitTween
                end
                if u21 then
                    local u34
                    if v33 == nil then
                        u34 = v33
                    else
                        u34 = v33.tweenInfo
                    end
                    if u34 == nil then
                        u34 = TweenInfo.new(0.3, Enum.EasingStyle.Exponential)
                    end
                    local v35
                    if v33 == nil then
                        v35 = v33
                    else
                        v35 = v33.position
                    end
                    if v35 == nil then
                        v35 = UDim2.fromScale(0, -0.25)
                    end
                    if v33 ~= nil then
                        v33 = v33.transparency
                    end
                    local u36 = v33 == nil and 1 or v33
                    local v37 = u8:Create(u21, u34, {
                        ["Position"] = v35,
                        ["BackgroundTransparency"] = u36
                    })
                    local v38 = u21:GetDescendants()
                    local function v40(p39) --[[ Line: 122 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u34
                            [3] = u36
                        --]]
                        if p39:IsA("TextLabel") then
                            u8:Create(p39, u34, {
                                ["TextTransparency"] = u36
                            }):Play()
                            return
                        elseif p39:IsA("ImageLabel") then
                            u8:Create(p39, u34, {
                                ["ImageTransparency"] = u36
                            }):Play()
                        elseif p39:IsA("UIStroke") or p39:IsA("Frame") then
                            u8:Create(p39, u34, {
                                ["Transparency"] = u36
                            }):Play()
                        end
                    end
                    for v41, v42 in v38 do
                        v40(v42, v41 - 1, v38)
                    end
                    return v37
                end
            end
            if u21 then
                local v44 = v32()
                if v44 ~= nil then
                    v44:Play()
                end
            end
            task.spawn(function() --[[ Line: 149 ]]
                --[[
                Upvalues:
                    [1] = u43
                    [2] = u20
                --]]
                task.delay(5, function() --[[ Line: 150 ]]
                    --[[
                    Upvalues:
                        [1] = u43
                        [2] = u20
                    --]]
                    local v45 = u43()
                    if v45 ~= nil then
                        v45:Play()
                    end
                    if v45 ~= nil then
                        v45.Completed:Wait()
                    end
                    local v46 = u20
                    if v46 ~= nil then
                        v46:Destroy()
                    end
                end)
            end)
            return function() --[[ Line: 166 ]] end
        end, {})
        local v47 = {
            ["Size"] = UDim2.new(0, 0, 0, v19),
            ["AutomaticSize"] = "X",
            ["BorderSizePixel"] = 0,
            [u6.Ref] = u17
        }
        local v48 = {}
        local _ = #v48
        local v49 = {
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["AutomaticSize"] = "X",
            ["Position"] = UDim2.fromScale(-1, 0),
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            [u6.Ref] = u18
        }
        local v50 = {}
        local v51 = #v50
        local v52 = {
            ["AutomaticSize"] = "X",
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 1, 0)
        }
        local v53 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v54 = #v53
        local v55 = u14.KillFeedData.killIcons
        if v55 then
            local v56 = u14.KillFeedData.killIcons
            local function v61(p57, p58) --[[ Line: 205 ]]
                --[[
                Upvalues:
                    [1] = u6
                --]]
                local v59 = u6.createFragment
                local v60 = {
                    ["KillFeedIcon"] = u6.createElement("ImageLabel", {
                        ["ScaleType"] = "Fit",
                        ["SizeConstraint"] = "RelativeYY",
                        ["BackgroundTransparency"] = 1,
                        ["BorderSizePixel"] = 0,
                        ["ImageTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Image"] = p57,
                        ["LayoutOrder"] = p58
                    })
                }
                return v59(v60)
            end
            local v62 = table.create(#v56)
            for v63, v64 in v56 do
                v62[v63] = v61(v64, v63 - 1, v56)
            end
            local v65 = {
                ["AutomaticSize"] = "X",
                ["BackgroundTransparency"] = 0.3,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0, 1),
                ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
            }
            local v66 = { u6.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, u4.isSmallScreen() and 2 or 6),
                    ["PaddingBottom"] = UDim.new(0, u4.isSmallScreen() and 2 or 6),
                    ["PaddingLeft"] = UDim.new(0, u4.isSmallScreen() and 4 or 6),
                    ["PaddingRight"] = UDim.new(0, u4.isSmallScreen() and 4 or 6)
                }), u6.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["Padding"] = UDim.new(0, u4.isSmallScreen() and 3 or 6)
                }) }
            local v67 = #v66
            for v68, v69 in v62 do
                v66[v67 + v68] = v69
            end
            v55 = u6.createFragment({
                ["KillFeedIconsWrapper"] = u6.createElement("Frame", v65, v66)
            })
        end
        local v70 = {
            ["Size"] = UDim2.new(1, 0, 0, u12)
        }
        local v71 = {
            u6.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["SortOrder"] = "LayoutOrder",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0, 0)
            }),
            u6.createElement(u10, {
                ["Position"] = "left",
                ["Entity"] = u14.KillFeedData.killer
            }),
            [#v71 + 1] = v55,
            [#v71 + 1] = u6.createElement(u10, {
                ["Position"] = "right",
                ["Entity"] = u14.KillFeedData.victim
            })
        }
        v53[v54 + 1] = u6.createElement(u5, v70, v71)
        local v72 = u14.KillFeedData.killPayout
        if v72 then
            v72 = u6.createElement(u11, {
                ["Size"] = UDim2.new(1, 0, 0, u13),
                ["killPayout"] = u14.KillFeedData.killPayout
            })
        end
        if v72 then
            v53[v54 + 2] = v72
        end
        v50.KillFeedCardInner = u6.createElement(u5, v52, v53)
        local v73
        if u14.KillFeedData.multiKillCount == nil or u14.KillFeedData.multiKillCount <= 1 then
            v73 = false
        else
            local v74 = u6.createFragment
            local v75 = {
                ["MultiKillCountBox"] = u6.createElement("Frame", {
                    ["AutomaticSize"] = "X",
                    ["BackgroundTransparency"] = 0.3,
                    ["BorderSizePixel"] = 0,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.new(0, 0, 0, u12),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Position"] = UDim2.fromScale(0, 0),
                    ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                }, {
                    u6.createElement("UIPadding", {
                        ["PaddingLeft"] = UDim.new(0, u4.isSmallScreen() and 3 or 6),
                        ["PaddingRight"] = UDim.new(0, u4.isSmallScreen() and 3 or 6)
                    }),
                    ["MultiKillText"] = u6.createElement("TextLabel", {
                        ["AutomaticSize"] = "X",
                        ["AutoLocalize"] = false,
                        ["SizeConstraint"] = "RelativeYY",
                        ["TextYAlignment"] = "Center",
                        ["BackgroundTransparency"] = 1,
                        ["TextTransparency"] = 1,
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Size"] = UDim2.fromScale(0, 0.5),
                        ["Text"] = u9.convertToRoman(u14.KillFeedData.multiKillCount),
                        ["TextColor3"] = u3.WHITE,
                        ["Font"] = Enum.Font.GothamBold,
                        ["TextSize"] = u4.isSmallScreen() and 8 or 14
                    })
                })
            }
            v73 = v74(v75)
        end
        if v73 then
            v50[v51 + 1] = v73
        end
        v48.KillFeedCard = u6.createElement(u5, v49, v50)
        return u6.createFragment({
            ["KillFeedCardWrapper"] = u6.createElement(u5, v47, v48)
        })
    end)
}