local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Button
local u4 = v2.Countdown
local u5 = v2.DarkBackground
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v2.ScaleComponent
local u10 = v2.SoundManager
local u11 = v2.TimedProgressBar
local u12 = v2.UIUtil
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, script.Parent, "pvp-arena-augment-card").PvPArenaAugmentCard
local v89 = v15.new(u14)(function(u22, p23) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u17
        [2] = u14
        [3] = u12
        [4] = u13
        [5] = u9
        [6] = u6
        [7] = u7
        [8] = u11
        [9] = u4
        [10] = u21
        [11] = u3
        [12] = u19
        [13] = u8
        [14] = u18
        [15] = u10
        [16] = u20
        [17] = u5
    --]]
    local v24 = p23.useState
    local v25 = p23.useEffect
    local v26, u27 = v24(false)
    local v28 = u22.userIdAugmentMap
    if v28 ~= nil then
        local v29 = v28[u17.LocalPlayer.UserId]
        v28 = v29 ~= nil and #v29 or v29
    end
    local u30, _ = v24(v28 == nil and 0 or v28)
    local u31, u32 = v24(false)
    local u33 = u14.createRef()
    local u34 = u14.createRef()
    local u35 = u14.createRef()
    v25(function() --[[ Line: 44 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u17
            [3] = u30
            [4] = u27
            [5] = u34
            [6] = u35
            [7] = u12
            [8] = u33
        --]]
        local v36 = u22.userIdAugmentMap
        if v36 ~= nil then
            local v37 = v36[u17.LocalPlayer.UserId]
            v36 = v37 ~= nil and #v37 or v37
        end
        if (v36 == nil and 0 or v36) <= u30 then
            return nil
        end
        u27(false)
        local v38 = u34:getValue()
        local v39 = u35:getValue()
        if not (v38 and v39) then
            return nil
        end
        u12:setContainerTransparency(v38, 1, {
            ["onSetTweenInfo"] = TweenInfo.new(0.3)
        })
        u12:setContainerTransparency(v39, 1, {
            ["onSetTweenInfo"] = TweenInfo.new(0.3)
        })
        local u40 = u33:getValue()
        task.delay(1, function() --[[ Line: 73 ]]
            --[[
            Upvalues:
                [1] = u40
                [2] = u12
            --]]
            if u40 then
                u12:setContainerTransparency(u40, 1, {
                    ["onSetTweenInfo"] = TweenInfo.new(0.3)
                })
            end
        end)
    end, { u22.userIdAugmentMap })
    v25(function() --[[ Line: 81 ]]
        --[[
        Upvalues:
            [1] = u13
            [2] = u22
            [3] = u32
        --]]
        local u41 = u13.new()
        local u42 = task.delay(#u22.Augments * 0.33, function() --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u32
            --]]
            u32(true)
        end)
        u41:GiveTask(function() --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u42
            --]]
            if u42 then
                task.cancel(u42)
            end
        end)
        return function() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u41
            --]]
            u41:DoCleaning()
        end
    end, {})
    local v43 = {}
    local v44 = #v43
    local v45 = {
        ["ResetOnSpawn"] = false,
        ["Enabled"] = not v26,
        ["DisplayOrder"] = 900,
        [u14.Ref] = u33
    }
    local v46 = {}
    local v47 = #v46
    local v48 = {}
    local _ = #v48
    local v49 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromOffset(914, 915),
        ["Position"] = UDim2.fromScale(0.5, 0.47),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v50 = { u14.createElement(u9, {
            ["MaximumSize"] = Vector2.new(914, 915),
            ["PowerRelationshipPastMaximum"] = u6.isSmallScreen() and 1 or 0.7,
            ["ScreenPadding"] = Vector2.new(403, u6.isSmallScreen() and 50 or 168)
        }) }
    local v51 = #v50
    local v52 = {
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v53 = { u14.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0.05, 0)
        }), u14.createElement(u7, {
            ["Size"] = UDim2.fromScale(1, 0.125)
        }, { u14.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.05, 0)
            }), u14.createElement("TextLabel", {
                ["Text"] = "SELECT YOUR RELIC",
                ["Size"] = UDim2.fromScale(1, 0.7),
                ["TextXAlignment"] = "Center",
                ["TextYAlignment"] = "Center",
                ["TextColor3"] = Color3.fromRGB(240, 240, 240),
                ["Font"] = "SourceSansBold",
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                [u14.Ref] = u35
            }, { u14.createElement("UITextSizeConstraint", {
                    ["MaxTextSize"] = 48
                }) }), u14.createElement(u7, {
                ["Size"] = UDim2.fromScale(1, 0.25),
                ["LayoutOrder"] = 1,
                [u14.Ref] = u34
            }, { u14.createElement(u11, {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.65, 0.7),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["EndTime"] = u22.SelectionEndTime,
                    ["ProgressBarConfig"] = {
                        ["Flip"] = true,
                        ["GradientRotation"] = 180,
                        ["BarGradient"] = ColorSequence.new(Color3.fromHex("33B6FF"), Color3.fromHex("C8EBFF"))
                    }
                }), u14.createElement(u4, {
                    ["EndTime"] = u22.SelectionEndTime,
                    ["TextLabel"] = {
                        ["LayoutOrder"] = 2,
                        ["Size"] = UDim2.fromScale(0.1, 1),
                        ["Position"] = UDim2.fromScale(0.8, 0.5),
                        ["AnchorPoint"] = Vector2.new(0, 0.5)
                    },
                    ["CountdownConfig"] = {
                        ["minutes"] = false,
                        ["hours"] = false,
                        ["days"] = false
                    }
                }) }) }) }
    local _ = #v53
    local v54 = u22.Augments
    local function v60(p55, p56) --[[ Line: 205 ]]
        --[[
        Upvalues:
            [1] = u22
            [2] = u17
            [3] = u30
            [4] = u31
            [5] = u14
            [6] = u21
        --]]
        local v57 = {
            ["Augment"] = p55
        }
        local v58
        if u22.userIdAugmentMap and u22.userIdAugmentMap[u17.LocalPlayer.UserId] then
            local v59 = #u22.userIdAugmentMap[u17.LocalPlayer.UserId]
            if (v59 == nil and 0 or v59) < u30 then
                v58 = false
            else
                v58 = u22.userIdAugmentMap[u17.LocalPlayer.UserId][u30 + 1] == p55
            end
        else
            v58 = false
        end
        v57.Active = v58
        v57.Position = UDim2.fromScale(0.5, 0.33 * p56)
        v57.OnClickEnabled = u31
        v57.CardNumber = p56
        return u14.createElement(u21, v57)
    end
    local v61 = table.create(#v54)
    local v62 = {
        ["AppId"] = "PvPArenaAugmentVotingInterface",
        ["BackgroundTransparency"] = 0.4,
        ["DisableCloseOnClick"] = true,
        ["OnClick"] = function() --[[ Name: OnClick, Line 108 ]]
            return false
        end,
        ["ImageButtonProps"] = {
            ["Modal"] = true
        }
    }
    for v63, v64 in v54 do
        v61[v63] = v60(v64, v63 - 1, v54)
    end
    local v65 = {
        ["LayoutOrder"] = 1,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 0.825)
    }
    local v66 = {}
    local v67 = #v66
    for v68, v69 in v61 do
        v66[v67 + v68] = v69
    end
    v53.PvPArenaAugmentContainer = u14.createElement("Frame", v65, v66)
    v50[v51 + 1] = u14.createElement(u7, v52, v53)
    local v70 = v51 + 2
    local v71 = u14.createElement
    local v72 = u7
    local v73 = {
        ["Size"] = UDim2.fromScale(1, 0.1),
        ["Position"] = UDim2.fromScale(0.5, 1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v74 = {}
    local v75 = u14.createElement("UIListLayout", {
        ["FillDirection"] = Enum.FillDirection.Horizontal,
        ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
        ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
        ["Padding"] = UDim.new(0, 50)
    })
    local v76 = u14.createElement
    local v77 = u3
    local v78 = {
        ["Size"] = UDim2.fromOffset(200, 75),
        ["OnClick"] = function() --[[ Name: OnClick, Line 272 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u19
            --]]
            if not u31 then
                return nil
            end
            u19.Client:Get("PvPArenaAugmentRerollRequest"):SendToServer()
        end
    }
    local v79 = {}
    local v80 = u14.createElement(u8, {
        ["Padding"] = {
            ["Left"] = 10,
            ["Right"] = 10,
            ["Top"] = 10,
            ["Bottom"] = 10
        }
    })
    local v81 = u14.createElement("UIListLayout", {
        ["FillDirection"] = "Horizontal",
        ["HorizontalAlignment"] = "Center",
        ["VerticalAlignment"] = "Center",
        ["Padding"] = UDim.new(0.1, 0)
    })
    local v82 = u14.createElement("ImageLabel", {
        ["BackgroundTransparency"] = 1,
        ["SizeConstraint"] = "RelativeYY",
        ["Size"] = UDim2.fromScale(0.5, 1),
        ["Image"] = u18.ROTATE_RIGHT_SOLID,
        ["ScaleType"] = Enum.ScaleType.Fit,
        ["ImageTransparency"] = u22.Rerolls > 0 and 0 or 0.5
    })
    local v83 = u14.createElement
    local v84 = {
        ["TextXAlignment"] = "Center",
        ["TextYAlignment"] = "Center",
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1
    }
    local v85 = u22.Rerolls
    v84.Text = tostring(v85) .. " Rerolls"
    v84.Size = UDim2.fromScale(0.5, 1)
    v84.TextColor3 = Color3.fromRGB(240, 240, 240)
    v84.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
    v84.TextTransparency = u22.Rerolls > 0 and 0 or 0.5
    __set_list(v79, 1, {v80, v81, v82, v83("TextLabel", v84)})
    __set_list(v74, 1, {v75, v76(v77, v78, v79), u14.createElement(u3, {
    ["Text"] = "<b>Hide Relic Voting</b>",
    ["LayoutOrder"] = 2,
    ["Size"] = UDim2.fromOffset(200, 75),
    ["TextLabel"] = {
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
    },
    ["OnClick"] = function() --[[ Name: OnClick, Line 319 ]]
        --[[
        Upvalues:
            [1] = u27
            [2] = u10
            [3] = u20
        --]]
        u27(true)
        u10:playSound(u20.UI_CLICK_2)
    end
})})
    v50[v70] = v71(v72, v73, v74)
    v48.PvPArenaAugmentVotingInterface = u14.createElement("Frame", v49, v50)
    v46[v47 + 1] = u14.createElement(u5, v62, v48)
    v43[v44 + 1] = u14.createElement("ScreenGui", v45, v46)
    local v86 = {
        ["ResetOnSpawn"] = false,
        ["DisplayOrder"] = 901
    }
    if v26 then
        local v87 = u22.userIdAugmentMap
        if v87 ~= nil then
            local v88 = v87[u17.LocalPlayer.UserId]
            v87 = v88 ~= nil and #v88 or v88
        end
        v26 = (v87 == nil and 0 or v87) <= u30
    end
    v86.Enabled = v26
    v43[v44 + 2] = u14.createElement("ScreenGui", v86, { u14.createElement(u3, {
            ["Text"] = "<b>Show Relic Voting</b>",
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromOffset(200, 50),
            ["Position"] = UDim2.fromScale(0.5, 0.875),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["TextLabel"] = {
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            },
            ["OnClick"] = function() --[[ Name: OnClick, Line 359 ]]
                --[[
                Upvalues:
                    [1] = u27
                    [2] = u10
                    [3] = u20
                --]]
                u27(false)
                u10:playSound(u20.UI_CLICK_2)
            end
        }) })
    return u14.createFragment(v43)
end)
return {
    ["PvPArenaAugmentSelectionInterface"] = v16.connect(function(p90, p91) --[[ Line: 369 ]]
        local v92 = {}
        for v93, v94 in p91 do
            v92[v93] = v94
        end
        local v95 = p90.Bedwars.pvpArena
        if v95 ~= nil then
            v95 = v95.userIdAugmentMap
        end
        v92.userIdAugmentMap = v95
        return v92
    end)(v89)
}