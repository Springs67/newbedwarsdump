local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.DividerComponent
local u7 = v2.ImageId
local u8 = v2.SoundManager
local u9 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v12 = u1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar")
local u13 = v12.AutoCompleteSearchbar
local u14 = v12.SearchbarShowImageFunc
local u15 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "gift", "gift-meta").GiftMeta
local v16 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u17 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u19 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "marketplace-util").MarketplaceUtil
local u20 = u1.import(script, script.Parent, "gifting-message-input").GiftingMessageInput
local u21 = v16.Client:GetNamespace("Gift")
return {
    ["GiftingForm"] = v10.new(u9)(function(u22, p23) --[[ Line: 34 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u20
            [3] = u15
            [4] = u21
            [5] = u1
            [6] = u11
            [7] = u8
            [8] = u17
            [9] = u5
            [10] = u19
            [11] = u4
            [12] = u6
            [13] = u18
            [14] = u14
            [15] = u13
            [16] = u3
            [17] = u7
        --]]
        local v24 = p23.useState
        local v25 = p23.useEffect
        local v26 = p23.useMemo
        local v27, u28 = v24("")
        local v29, u30 = v24("")
        local v31, u32 = v24(0)
        local u33, u34 = v24(u22.SelectedUser)
        local u35, u36 = v24("")
        local v37 = v26(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u20
                [3] = u36
            --]]
            return u9.createElement(u20, {
                ["LayoutOrder"] = 4,
                ["Size"] = UDim2.fromScale(1, 0.35),
                ["SetMessage"] = u36
            })
        end, {})
        local u38 = u15[u22.GiftType]
        local function u48(_, p39, p40) --[[ Line: 53 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u34
            --]]
            local v41
            if p40 == nil then
                v41 = p40
            else
                v41 = p40.item
            end
            if v41 then
                v41 = p40.exactMatch
            end
            if not v41 then
                if p39 then
                    local v42 = {}
                    if p39 ~= nil then
                        p39 = p39.Text
                    end
                    v42.name = p39
                    u34(v42)
                end
                return
            end
            local v43 = nil
            for v44, v45 in u22.Players do
                local _ = v44 - 1
                local v46 = v45.name
                local v47 = p40.item
                if v47 ~= nil then
                    v47 = v47.key
                end
                if v46 == v47 == true then
                    v43 = v45
                    break
                end
            end
            u34(v43)
        end
        v25(function() --[[ Line: 133 ]]
            --[[
            Upvalues:
                [1] = u34
                [2] = u22
            --]]
            u34(u22.SelectedUser)
        end, { u22.SelectedUser })
        v25(function() --[[ Line: 136 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u1
                [3] = u11
                [4] = u21
                [5] = u8
                [6] = u17
                [7] = u30
                [8] = u28
                [9] = u19
                [10] = u38
                [11] = u32
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local u54 = u21:WaitFor("GiftSent"):andThen(function(p49) --[[ Line: 146 ]]
                --[[
                Upvalues:
                    [1] = u1
                    [2] = u11
                    [3] = u8
                    [4] = u17
                    [5] = u30
                    [6] = u28
                --]]
                return p49:Connect(function(u50) --[[ Line: 147 ]]
                    --[[
                    Upvalues:
                        [1] = u1
                        [2] = u11
                        [3] = u8
                        [4] = u17
                        [5] = u30
                        [6] = u28
                    --]]
                    local u51 = u50.giftedPlayerUserId
                    u1.Promise.defer(function(p52, _) --[[ Line: 141 ]]
                        --[[
                        Upvalues:
                            [1] = u11
                            [2] = u51
                        --]]
                        p52(u11:GetNameFromUserIdAsync(u51))
                    end):andThen(function(p53) --[[ Line: 149 ]]
                        --[[
                        Upvalues:
                            [1] = u8
                            [2] = u17
                            [3] = u30
                            [4] = u28
                            [5] = u50
                        --]]
                        u8:playSound(u17.BEDWARS_UPGRADE_SUCCESS)
                        u30("")
                        u28("Your gift of the <font color=\"#FFFFFF\"><b>" .. u50.gift.name .. "</b></font> has been sent to <font color=\"#FFFFFF\"><b>" .. p53 .. "</b></font>!")
                    end)
                end)
            end)
            u19.getDevProductInfoAsync(u38.devProductId):andThen(function(p55) --[[ Line: 160 ]]
                --[[
                Upvalues:
                    [1] = u32
                --]]
                local v56
                if p55 == nil then
                    v56 = p55
                else
                    v56 = p55.PriceInRobux
                end
                if v56 == nil then
                    return nil
                end
                u32(p55.PriceInRobux)
            end):catch(function(_) --[[ Line: 170 ]]
                --[[
                Upvalues:
                    [1] = u38
                --]]
                print("[GIFT FORM] Could not retrieve product info for ", u38.name, u38.devProductId)
            end)
            return function() --[[ Line: 173 ]]
                --[[
                Upvalues:
                    [1] = u54
                --]]
                u54:andThen(function(p57) --[[ Line: 174 ]]
                    p57:Disconnect()
                end)
            end
        end, {})
        local v58 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = u22.Size
        }
        local v59 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 14)
            }) }
        local v60 = #v59
        local v61 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.13)
        }
        local v62 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 10)
            }) }
        local v63 = #v62
        local v64
        if u38.imageId == nil then
            v64 = false
        else
            local v65 = u9.createFragment
            local v66 = {
                ["GiftImage"] = u9.createElement("ImageLabel", {
                    ["SizeConstraint"] = "RelativeXY",
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.2, 1),
                    ["Image"] = u38.imageId
                })
            }
            v64 = v65(v66)
        end
        if v64 then
            v62[v63 + 1] = v64
        end
        local v67 = #v62
        local v68 = u22.CustomImage
        if v68 then
            local v69 = u9.createFragment
            local v70 = {
                ["GiftImageCustom"] = u9.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.2, 1)
                }, { u22.CustomImage })
            }
            v68 = v69(v70)
        end
        if v68 then
            v62[v67 + 1] = v68
        end
        v62[#v62 + 1] = u9.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(0.75, 0.9)
        }, { u9.createElement("TextLabel", {
                ["TextSize"] = 24,
                ["BackgroundTransparency"] = 1,
                ["RichText"] = true,
                ["Text"] = "<b>" .. u38.name .. "</b>",
                ["AnchorPoint"] = Vector2.new(0, 0),
                ["Position"] = UDim2.fromScale(0, 0),
                ["Size"] = UDim2.new(0, 0, 0, 19),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto
            }), u9.createElement("TextLabel", {
                ["TextTransparency"] = 0.5,
                ["TextSize"] = 21,
                ["BackgroundTransparency"] = 1,
                ["Text"] = tostring(v31) .. " Robux",
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0, 1),
                ["Size"] = UDim2.new(0, 0, 0, 16),
                ["AutomaticSize"] = Enum.AutomaticSize.X,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Bottom,
                ["TextColor3"] = u4.WHITE,
                ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
            }) })
        v59.GiftingItemHeader = u9.createElement("Frame", v61, v62)
        v59[v60 + 1] = u9.createElement(u6, {
            ["Margin"] = 0,
            ["Thickness"] = 1.5,
            ["LayoutOrder"] = 2
        })
        v59[v60 + 2] = u9.createElement("Frame", {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.15)
        }, { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 12)
            }), u9.createElement("TextLabel", {
                ["Text"] = "Recipient Username",
                ["TextTransparency"] = 0.3,
                ["TextSize"] = 20,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.new(1, 0, 0, 14),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Top,
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto
            }), u9.createElement("Frame", {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.new(1, 0, 1, -26),
                ["BackgroundColor3"] = u18.backgroundTertiary
            }, { u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 5)
                }), v26(function() --[[ Line: 308 ]]
                    --[[
                    Upvalues:
                        [1] = u22
                        [2] = u48
                        [3] = u14
                        [4] = u9
                        [5] = u13
                    --]]
                    local v71 = u22.Players
                    local v72 = table.create(#v71)
                    local v73 = {}
                    for v74, v75 in v71 do
                        local _ = v74 - 1
                        v72[v74] = {
                            ["key"] = v75.name,
                            ["aliases"] = { v75.name }
                        }
                    end
                    v73.Items = v72
                    v73.Size = UDim2.new(1, 0, 1, 0)
                    v73.Position = UDim2.fromScale(0, 0.5)
                    v73.AnchorPoint = Vector2.new(0, 0.5)
                    v73.BackgroundTransparency = 1
                    v73.InputText = not u22.SelectedUser and "" or u22.SelectedUser.name
                    v73.PlaceHolderText = "Username"
                    v73.LayoutOrder = 2
                    v73.AutoLocalize = false
                    function v73.OnTextChange() --[[ Line: 332 ]] end
                    v73.OnFocusLost = u48
                    v73.ShowImage = u14.ROBLOX_AVATAR
                    return u9.createElement(u13, v73)
                end, { u22.SelectedUser }) }) })
        v59[v60 + 3] = v37
        local v76 = #v59
        v59.FormSubmit = u9.createElement(u3, {
            ["TextSize"] = 18,
            ["LayoutOrder"] = 5,
            ["Text"] = "Gift " .. u38.name,
            ["OnClick"] = function() --[[ Name: OnClick, Line 343 ]]
                --[[
                Upvalues:
                    [1] = u33
                    [2] = u21
                    [3] = u1
                    [4] = u11
                    [5] = u8
                    [6] = u17
                    [7] = u28
                    [8] = u30
                    [9] = u35
                    [10] = u22
                    [11] = u38
                --]]
                if u33 then
                    u21:WaitFor("SendGift"):andThen(function(p77) --[[ Line: 99 ]]
                        --[[
                        Upvalues:
                            [1] = u33
                            [2] = u1
                            [3] = u11
                            [4] = u8
                            [5] = u17
                            [6] = u28
                            [7] = u30
                            [8] = u35
                            [9] = u22
                            [10] = u38
                        --]]
                        local v78 = u33.userId
                        if v78 == nil then
                            local u79 = u33.name
                            local v81, v82 = u1.try(function() --[[ Line: 24 ]]
                                --[[
                                Upvalues:
                                    [1] = u1
                                    [2] = u11
                                    [3] = u79
                                --]]
                                return u1.TRY_RETURN, { u11:GetUserIdFromNameAsync(u79) }
                            end, function(p80) --[[ Line: 26 ]]
                                --[[
                                Upvalues:
                                    [1] = u1
                                --]]
                                warn(p80)
                                return u1.TRY_RETURN, { nil }
                            end)
                            if v81 then
                                v78 = unpack(v82)
                            else
                                v78 = nil
                            end
                        end
                        if v78 == nil then
                            u8:playSound(u17.ERROR_NOTIFICATION)
                            u28("")
                            u30("Could not find user ID for <font color=\"#FFFFFF\"><b>" .. u33.name .. "</b></font>. Please confirm the username is correct or try again later.")
                            return nil
                        end
                        local v83 = p77:CallServer({
                            ["username"] = u33.name,
                            ["userId"] = v78,
                            ["message"] = u35,
                            ["giftType"] = u22.GiftType
                        })
                        local v84 = v83.success
                        local v85 = v83.errorMessage
                        if v84 then
                            u30("")
                            u28("Confirm the purchase to gift the <font color=\"#FFFFFF\"><b>" .. u38.name .. "</b></font> to <font color=\"#FFFFFF\"><b>" .. u33.name .. "</b></font>")
                        end
                        if v85 ~= "" and v85 then
                            u8:playSound(u17.ERROR_NOTIFICATION)
                            u28("")
                            u30(v85)
                        end
                    end)
                end
            end,
            ["Size"] = UDim2.new(1, 0, 0, 32)
        })
        local v86
        if v29 == "" then
            v86 = false
        else
            local v87 = u9.createFragment
            local v88 = {}
            local v89 = u9.createElement
            local v90 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 6,
                ["Size"] = UDim2.fromScale(1, 0.15)
            }
            local v91 = {
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 16)
                }),
                ["ErrorIcon"] = u9.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.6, 0.6),
                    ["Image"] = u7.EXCLAMATION_TRIANGLE,
                    ["ImageColor3"] = Color3.fromRGB(255, 153, 0)
                }),
                ["ErrorMsg"] = u9.createElement("TextLabel", {
                    ["TextWrapped"] = true,
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["AutoLocalize"] = false,
                    ["Text"] = v29,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.new(0.8, 0, 0, 40),
                    ["TextColor3"] = Color3.fromRGB(255, 105, 105),
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Font"] = Enum.Font.Roboto
                })
            }
            v88.ErrorMsgWrapper = v89("Frame", v90, v91)
            v86 = v87(v88)
        end
        if v86 then
            v59[v76 + 1] = v86
        end
        local v92 = #v59
        local v93
        if v27 == "" then
            v93 = false
        else
            local v94 = u9.createFragment
            local v95 = {}
            local v96 = u9.createElement
            local v97 = {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 6,
                ["Size"] = UDim2.fromScale(1, 0.15)
            }
            local v98 = {
                u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 16)
                }),
                ["SuccessIcon"] = u9.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["SizeConstraint"] = "RelativeYY",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.6, 0.6),
                    ["Image"] = u7.GIFTS_SOLID,
                    ["ImageColor3"] = Color3.fromRGB(255, 255, 255)
                }),
                ["SuccessMsg"] = u9.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["RichText"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["AutoLocalize"] = false,
                    ["Text"] = v27,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.new(0.8, 0, 0, 40),
                    ["TextColor3"] = u18.backgroundSuccess,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["Font"] = Enum.Font.Roboto
                })
            }
            v95.SuccessMsgWrapper = v96("Frame", v97, v98)
            v93 = v94(v95)
        end
        if v93 then
            v59[v92 + 1] = v93
        end
        return u9.createElement("Frame", v58, v59)
    end)
}