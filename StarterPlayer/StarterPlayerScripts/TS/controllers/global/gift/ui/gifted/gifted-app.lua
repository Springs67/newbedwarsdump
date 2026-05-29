local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.ButtonComponent
local u5 = v3.ColorUtil
local u6 = v3.ConfettiGroup
local u7 = v3.DarkBackground
local u8 = v3.DeviceUtil
local u9 = v3.DividerComponent
local u10 = v3.ImageId
local u11 = v3.PlayerRender
local u12 = v3.ScaleComponent
local u13 = v3.ShineEffect
local u14 = v3.ShineEffectVariation
local u15 = v3.SlideIn
local u16 = v3.SoundManager
local u17 = v3.WidgetComponent
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v19 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local v22 = u18.PureComponent:extend("GiftedAppBase")
function v22.init(_) --[[ Line: 26 ]] end
function v22.onClose(p23) --[[ Line: 28 ]]
    --[[
    Upvalues:
        [1] = u2
    --]]
    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(p23.props.AppId)
end
function v22.didMount(_) --[[ Line: 31 ]]
    --[[
    Upvalues:
        [1] = u16
        [2] = u20
    --]]
    u16:playSound(u20.END_GAME)
end
function v22.render(u24) --[[ Line: 34 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u18
        [3] = u7
        [4] = u6
        [5] = u12
        [6] = u10
        [7] = u11
        [8] = u5
        [9] = u21
        [10] = u13
        [11] = u14
        [12] = u9
        [13] = u4
        [14] = u17
        [15] = u15
    --]]
    local v25 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u8.isSmallScreen()
    }
    local v26 = { u18.createElement(u7, {
            ["AppId"] = u24.props.AppId
        }), u18.createElement(u6, {
            ["Lifetime"] = 10
        }) }
    local v27 = #v26
    local v28 = {}
    local v29 = #v28
    local v30 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromOffset(372, 440)
    }
    local v31 = { u18.createElement(u12, {
            ["MaximumSize"] = Vector2.new(465, 545),
            ["ScreenPadding"] = Vector2.new(24, 24)
        }) }
    local v32 = #v31
    local v33 = {
        ["ClipsDescendents"] = true,
        ["Title"] = "Congratulations!",
        ["AppId"] = u24.props.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["TitleIcon"] = u10.GIFTS_SOLID,
        ["OnClose"] = function() --[[ Name: OnClose, Line 71 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            return u24:onClose()
        end
    }
    local v34 = { u18.createElement("ImageLabel", {
            ["SizeConstraint"] = "RelativeYY",
            ["ImageTransparency"] = 0.9,
            ["BackgroundTransparency"] = 1,
            ["Image"] = u10.GIFTS_SOLID,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.fromScale(-0.03, 1.05),
            ["Size"] = UDim2.fromScale(0.25, 0.25)
        }) }
    local v35 = #v34
    local v36 = {
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v37 = { (u18.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        })) }
    local v38 = u18.createElement
    local v39 = {
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 1,
        ["Size"] = UDim2.new(1, 0, 0.15, -10)
    }
    local v40 = {
        u18.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 10)
        }),
        u18.createElement(u11, {
            ["SizeConstraint"] = "RelativeYY",
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 1, 0),
            ["PlayerUserId"] = u24.props.fromPlayer.userId
        }, { u18.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }) }),
        ["IntroText"] = u18.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["AutoLocalize"] = false,
            ["LayoutOrder"] = 2,
            ["Text"] = "<b>" .. u24.props.fromPlayer.name .. "</b> has sent you a \240\159\142\129 gift!",
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["Size"] = UDim2.new(0.84, 0, 1, 0),
            ["TextColor3"] = u5.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["Font"] = Enum.Font.Roboto
        }, { u18.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 24
            }) })
    }
    v37.GiftSentIntro = v38("Frame", v39, v40)
    local v41 = #v37
    local v42 = {
        ["Size"] = UDim2.new(1, 0, 0.225, -10),
        ["BackgroundColor3"] = u21.backgroundTertiary,
        ["LayoutOrder"] = 2,
        ["ClipsDescendants"] = true,
        [u18.Event.Activated] = function() --[[ Line: 148 ]]
            --[[
            Upvalues:
                [1] = u24
            --]]
            if u24.props.onGiftClick then
                u24.props.onGiftClick()
            end
        end
    }
    local v43 = { u18.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }), u18.createElement("UIStroke", {
            ["Thickness"] = 2,
            ["Color"] = u21.textPrimary
        }), u18.createElement(u13, {
            ["DelayTime"] = 6,
            ["Variation"] = u14.solid
        }) }
    local v44 = #v43
    local v45
    if u24.props.giftImageId == nil then
        v45 = false
    else
        local v46 = u18.createFragment
        local v47 = {
            ["BackgroundImage"] = u18.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ImageTransparency"] = 0.6,
                ["BackgroundTransparency"] = 1,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.75, 0.5),
                ["Size"] = UDim2.new(1.3, 0, 1.3, 0),
                ["Image"] = u24.props.giftImageId
            })
        }
        v45 = v46(v47)
    end
    if v45 then
        v43[v44 + 1] = v45
    end
    local _ = #v43
    v43.GiftRibbon = u18.createElement("ImageLabel", {
        ["SizeConstraint"] = "RelativeYY",
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 4,
        ["AnchorPoint"] = Vector2.new(1, 0),
        ["Position"] = UDim2.fromScale(1, 0),
        ["Size"] = UDim2.new(0.5, 0, 0.5, 0),
        ["Image"] = u10.GIFT_RIBBON_DIAGONAL
    })
    local v48 = {
        ["BackgroundTransparency"] = 1,
        ["ZIndex"] = 3,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }
    local v49 = {
        u18.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }),
        u18.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 4),
            ["PaddingBottom"] = UDim.new(0, 4),
            ["PaddingLeft"] = UDim.new(0, 12),
            ["PaddingRight"] = UDim.new(0, 12)
        }),
        ["LockImage"] = u18.createElement("ImageLabel", {
            ["ImageTransparency"] = 0.6,
            ["SizeConstraint"] = "RelativeYY",
            ["ScaleType"] = "Fit",
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 3,
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["Size"] = UDim2.new(0.4, 0, 1, 0),
            ["Image"] = u10.UNLOCK_SOLID
        })
    }
    local v50 = #v49
    local v51
    if u24.props.giftImageId == nil then
        v51 = false
    else
        local v52 = u18.createFragment
        local v53 = {
            ["GiftImage"] = u18.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["ZIndex"] = 3,
                ["AnchorPoint"] = Vector2.new(1, 0.5),
                ["Position"] = UDim2.fromScale(1, 0.5),
                ["Size"] = UDim2.new(0.7, 0, 1, 0),
                ["Image"] = u24.props.giftImageId
            })
        }
        v51 = v52(v53)
    end
    if v51 then
        v49[v50 + 1] = v51
    end
    local v54 = #v49
    local v55 = u24.props.giftCustomImage
    if v55 then
        local v56 = u18.createFragment
        local v57 = {
            ["GiftImageCustom"] = u18.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.2, 1)
            }, { u24.props.giftCustomImage })
        }
        v55 = v56(v57)
    end
    if v55 then
        v49[v54 + 1] = v55
    end
    local _ = #v49
    v49.GiftName = u18.createElement("TextLabel", {
        ["TextScaled"] = true,
        ["BackgroundTransparency"] = 1,
        ["LayoutOrder"] = 3,
        ["ZIndex"] = 3,
        ["Size"] = UDim2.new(0.6, 0, 1, 0),
        ["Text"] = u24.props.giftName,
        ["TextColor3"] = u21.textPrimary,
        ["TextXAlignment"] = Enum.TextXAlignment.Left,
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
    }, { u18.createElement("UITextSizeConstraint", {
            ["MinTextSize"] = 20,
            ["MaxTextSize"] = 28
        }) })
    v43.ButtonContent = u18.createElement("Frame", v48, v49)
    v37.GiftButtonWrapper = u18.createElement("ImageButton", v42, v43)
    v37[v41 + 1] = u18.createElement(u9, {
        ["Margin"] = 0,
        ["LayoutOrder"] = 3
    })
    local v58 = u18.createElement
    local v59 = {
        ["LayoutOrder"] = 4,
        ["BackgroundTransparency"] = 0.6,
        ["BorderSizePixel"] = 0,
        ["Size"] = UDim2.new(1, 0, 0.525, -10),
        ["BackgroundColor3"] = u21.backgroundTertiary
    }
    local v60 = {
        u18.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 5)
        }),
        u18.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 8)
        }),
        ["MessageTitle"] = u18.createElement("TextLabel", {
            ["Text"] = "<b>Message</b>",
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.2, -4),
            ["TextColor3"] = u5.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        }, { u18.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }), u18.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 8),
                ["PaddingLeft"] = UDim.new(0, 12),
                ["PaddingRight"] = UDim.new(0, 12)
            }) }),
        ["Message"] = u18.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["LayoutOrder"] = 2,
            ["AutoLocalize"] = false,
            ["Size"] = UDim2.new(1, 0, 0.8, -4),
            ["Text"] = "\"" .. u24.props.message .. "\" \n\n<font color=\"" .. u5.richTextColor(u21.textPrimary) .. "\">-" .. u24.props.fromPlayer.name .. "</font>",
            ["TextColor3"] = u5.WHITE,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        }, { u18.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = 16
            }), u18.createElement("UIPadding", {
                ["PaddingBottom"] = UDim.new(0, 8),
                ["PaddingLeft"] = UDim.new(0, 12),
                ["PaddingRight"] = UDim.new(0, 12)
            }) })
    }
    v37.GiftMessageBox = v58("Frame", v59, v60)
    local v61 = u24.props.onGiftClick
    if v61 then
        local v62 = u18.createFragment
        local v63 = {
            ["GiftConfirmButton"] = u18.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 5,
                ["Size"] = UDim2.new(1, 0, 0.1, -10)
            }, { u18.createElement(u4, {
                    ["Text"] = "Awesome!",
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["Size"] = UDim2.fromOffset(160, 28),
                    ["OnClick"] = function() --[[ Name: OnClick, Line 347 ]]
                        --[[
                        Upvalues:
                            [1] = u24
                        --]]
                        return u24.props.onGiftClick()
                    end
                }) })
        }
        v61 = v62(v63)
    end
    if v61 then
        v37[v41 + 2] = v61
    end
    v34[v35 + 1] = u18.createElement("Frame", v36, v37)
    v31[v32 + 1] = u18.createElement(u17, v33, v34)
    v28[v29 + 1] = u18.createElement("Frame", v30, v31)
    v26[v27 + 1] = u18.createElement(u15, {}, v28)
    return u18.createElement("ScreenGui", v25, v26)
end
return {
    ["GiftedApp"] = v19.connect(function(_, p64) --[[ Line: 363 ]]
        return p64
    end)(v22)
}