local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.OfflinePlayerUtil
local u7 = v2.Padding
local u8 = v2.SoundManager
local u9 = v2.UIUtil
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "flipper", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-flipper", "src").useSpring
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u15 = v14.Players
local u16 = v14.TweenService
local u17 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking").STAT_TO_DESCRIPTION
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent, "match-end-screen-meta").MatchEndScreensMeta
return {
    ["StatCardComponent"] = v13.new(u11)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u11
            [2] = u17
            [3] = u4
            [4] = u6
            [5] = u12
            [6] = u15
            [7] = u9
            [8] = u8
            [9] = u18
            [10] = u10
            [11] = u21
            [12] = u16
            [13] = u3
            [14] = u7
            [15] = u5
            [16] = u20
            [17] = u19
        --]]
        local u24 = u11.createRef()
        local u25 = u11.createRef()
        local v26 = nil
        for _, v27 in u17:getState().Game.teams do
            if v27.members[u22.card.player.userId] ~= nil then
                v26 = v27
                break
            end
        end
        local v28 = u4.isHoarceKat() and {
            ["id"] = "4",
            ["name"] = "Orange",
            ["members"] = {
                [u6.Dummy.Bryan3838.userId] = u6.Dummy.Bryan3838,
                [u6.Dummy.oiogy.userId] = u6.Dummy.oiogy,
                [u6.Dummy.Rascal.userId] = u6.Dummy.Rascal
            },
            ["color"] = Color3.fromRGB(255, 166, 71)
        } or v26
        local u29 = p23.useValue(4)
        local _, u30 = u12(p23, 0.8)
        local u31, u32 = p23.useState(0.8)
        p23.useEffect(function() --[[ Line: 52 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u15
                [3] = u22
                [4] = u30
                [5] = u31
                [6] = u32
                [7] = u24
                [8] = u9
                [9] = u8
                [10] = u18
                [11] = u10
                [12] = u29
                [13] = u21
                [14] = u16
            --]]
            local v33 = u25:getValue()
            if v33 then
                v33.Image = u15:GetUserThumbnailAsync(u22.card.player.userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352)
            end
            local u34 = nil
            u34 = u30:onStep(function(p35) --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u34
                    [3] = u32
                --]]
                if p35 == u31 then
                    u34:disconnect()
                end
                u32(p35)
            end)
            local u36 = u30:onComplete(function() --[[ Line: 65 ]]
                --[[
                Upvalues:
                    [1] = u34
                --]]
                u34:disconnect()
            end)
            local u37 = u24:getValue()
            if u37 then
                if u22.DisableAnimation then
                    return nil
                end
                local u38 = u9:setContainerTransparency(u37, 1, {
                    ["onCleanUpTweenInfo"] = TweenInfo.new(0.2)
                })
                task.delay(u22.index * 0.5, function() --[[ Line: 77 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u18
                        [3] = u38
                        [4] = u30
                        [5] = u10
                        [6] = u29
                    --]]
                    u8:playSound(u18.EMOTE_OPEN)
                    u38:DoCleaning()
                    u30:setGoal(u10.Spring.new(1, {
                        ["dampingRatio"] = 0.7,
                        ["frequency"] = u29.value
                    }))
                end)
                local v39 = u21[2].displaySecs
                local v40 = (v39 == nil and 1 or v39) - 0.5
                task.delay(v40, function() --[[ Line: 92 ]]
                    --[[
                    Upvalues:
                        [1] = u16
                        [2] = u37
                    --]]
                    u16:Create(u37, TweenInfo.new(0.5, Enum.EasingStyle.Cubic), {
                        ["Position"] = UDim2.fromScale(0.5, 2)
                    }):Play()
                end)
            end
            return function() --[[ Line: 98 ]]
                --[[
                Upvalues:
                    [1] = u34
                    [2] = u36
                --]]
                u34:disconnect()
                u36:disconnect()
            end
        end, {})
        local v41 = {
            ["Size"] = UDim2.fromScale(0.2, 0.5)
        }
        local v42 = {}
        local _ = #v42
        local v43 = {
            ["Size"] = UDim2.fromScale(u31, u31),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            [u11.Ref] = u24,
            ["BackgroundColor3"] = u3.WHITE,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = u22.index
        }
        local v44 = {
            u11.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.7113543091655267
            }),
            u11.createElement("UICorner"),
            u11.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("4E5082")), ColorSequenceKeypoint.new(1, Color3.fromHex("2E2F4E")) })
            }),
            u11.createElement("UIListLayout", {
                ["Padding"] = UDim.new(0),
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            })
        }
        local _ = #v44
        local v45 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.6)
        }
        local v46 = {
            u11.createElement("UICorner"),
            u11.createElement(u7, {
                ["Padding"] = UDim.new(0.1, 0)
            }),
            u11.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05),
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }),
            ["AvatarWrapper"] = u11.createElement(u5, {
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.6)
            }, { u11.createElement("ImageLabel", {
                    [u11.Ref] = u25,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BackgroundColor3"] = u3.BLACK,
                    ["BackgroundTransparency"] = 0.7,
                    ["ScaleType"] = Enum.ScaleType.Crop
                }, { u11.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u11.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(1, 0)
                    }) }) })
        }
        local _ = #v46
        local v47 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.35)
        }
        local v48 = {
            u11.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05),
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center
            }),
            ["DisplayName"] = u11.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["TextYAlignment"] = "Bottom",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 1,
                ["AutoLocalize"] = false,
                ["Size"] = UDim2.fromScale(1, 0.5),
                ["Text"] = u22.card.player.displayName,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = Color3.new(1, 1, 1)
            })
        }
        local v49 = #v48
        local v50
        if v28 == nil then
            v50 = false
        else
            v50 = u11.createFragment({
                ["TeamName"] = u11.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextYAlignment"] = "Bottom",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.4),
                    ["Text"] = string.upper(v28.name),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = v28.color
                })
            })
        end
        if v50 then
            v48[v49 + 1] = v50
        end
        v46.PlayerInfoContainer = u11.createElement(u5, v47, v48)
        v44.TopSection = u11.createElement(u5, v45, v46)
        local v51 = u11.createElement
        local v52 = {
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.4),
            ["BackgroundColor3"] = u20.backgroundPrimary
        }
        local v53 = {
            u11.createElement("UICorner"),
            ["FlatTopBorder"] = u11.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["BackgroundColor3"] = u20.backgroundPrimary
            })
        }
        local v54 = u11.createElement
        local v55 = u5
        local v56 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v57 = {}
        local v58 = u11.createElement("UIListLayout", {
            ["Padding"] = UDim.new(0.01),
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        })
        local v59 = u11.createElement
        local v60 = {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.45)
        }
        local v61 = u22.card.amount
        local v62 = math.round(v61)
        v60.Text = tostring(v62)
        v60.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v60.TextColor3 = u3.WHITE
        __set_list(v57, 1, {v58, v59("TextLabel", v60), u11.createElement("TextLabel", {
    ["TextScaled"] = true,
    ["RichText"] = true,
    ["BackgroundTransparency"] = 1,
    ["Size"] = UDim2.fromScale(0.8, 0.3),
    ["Text"] = string.upper(u19[u22.card.trackType]),
    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
    ["TextColor3"] = u20.textPrimary
})})
        __set_list(v53, 2, {v54(v55, v56, v57)})
        v44.BottomSection = v51("Frame", v52, v53)
        v42.StatCard = u11.createElement("Frame", v43, v44)
        return u11.createFragment({
            ["StatCardWrapper"] = u11.createElement(u5, v41, v42)
        })
    end)
}