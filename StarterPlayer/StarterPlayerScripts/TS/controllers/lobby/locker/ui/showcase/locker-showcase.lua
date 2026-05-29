local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ButtonComponent
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.SoundManager
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "achievements", "ui", "achievement-icon").AchievementIcon
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent, "title", "ui", "lobby-title").LobbyTitle
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-preview-util").LockerPreviewUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u20 = v1.import(script, script.Parent.Parent, "locker-util").LockerUtil
local u21 = v1.import(script, script.Parent.Parent, "preview", "locker-preview-buttons").LockerPreviewButtons
return {
    ["LockerShowcase"] = v10.new(u9)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u18
            [2] = u14
            [3] = u20
            [4] = u17
            [5] = u5
            [6] = u9
            [7] = u15
            [8] = u4
            [9] = u13
            [10] = u6
            [11] = u12
            [12] = u16
            [13] = u11
            [14] = u8
            [15] = u7
            [16] = u19
            [17] = u3
            [18] = u21
        --]]
        local _ = p23.useState
        local _ = p23.useEffect
        local v24 = u22.Tab == u18.CONSUMABLES
        if v24 then
            local v25 = u22.Element
            if v25 ~= nil then
                v25 = v25.itemEnum
            end
            v24 = u14(v25)
            if v24 ~= nil then
                v24 = v24.displayInLocker
                if v24 ~= nil then
                    v24 = v24.usable
                end
            end
        end
        local v26 = u20.isPreviewTab(u22.Tab)
        local u27 = u17.canPreviewLockerElement(u22.Element, u22.Tab)
        local v28 = u17.canReplay(u17.lockerElementToPreviewItem(u22.Element, u22.Tab) or {})
        local v29 = u5.isHoarceKat() and true or u27
        local function v51() --[[ Line: 49 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u9
                [3] = u15
                [4] = u27
                [5] = u4
                [6] = u18
                [7] = u13
                [8] = u6
                [9] = u12
                [10] = u16
                [11] = u11
            --]]
            local v30 = u22.Element
            if v30 ~= nil then
                v30 = v30.none
            end
            if v30 then
                v30 = u9.createElement("ImageLabel", {
                    ["ImageTransparency"] = 0.6,
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u15.CANCEL,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.5, 0.5),
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["Visible"] = not u27
                })
            end
            local v31 = {
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(0.9, 0, 0.49, 0),
                ["BackgroundColor3"] = u4.BLACK,
                ["BackgroundTransparency"] = u27 and 1 or 0.5
            }
            local v32 = {
                u9.createElement("UISizeConstraint", {
                    ["MaxSize"] = Vector2.new((1 / 0), 300)
                }),
                u9.createElement("UIStroke", {
                    ["Transparency"] = 0.8,
                    ["Color"] = Color3.fromRGB(255, 255, 255),
                    ["Thickness"] = u27 and 0 or 1
                }),
                u9.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                })
            }
            local v33 = #v32
            if v30 then
                v32[v33 + 1] = v30
            end
            local v34 = #v32
            local v35
            if u22.Tab == u18.TITLES then
                local v36 = {
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.new(0.9, 0, 0.5, 0)
                }
                local v37 = {}
                local v38 = #v37
                local v39 = {}
                local v40 = u22.Element
                if v40 ~= nil then
                    v40 = v40.itemEnum
                end
                v39.TitleType = v40
                v37[v38 + 1] = u9.createElement(u13, v39)
                v37[v38 + 2] = u9.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0, 4),
                    ["PaddingBottom"] = UDim.new(0, 4),
                    ["PaddingRight"] = UDim.new(0, 6),
                    ["PaddingLeft"] = UDim.new(0, 6)
                })
                v35 = u9.createElement(u6, v36, v37)
            else
                local v41 = u22.Tab == u18.KILL_EFFECTS
                if v41 then
                    v41 = u22.Element
                    if v41 ~= nil then
                        v41 = v41.imageId
                    end
                end
                if v41 == "" or not v41 then
                    if u22.Tab == u18.EMOTES then
                        local v42 = {}
                        local v43 = u22.Element
                        if v43 ~= nil then
                            v43 = v43.itemEnum
                        end
                        v42.Emote = v43
                        v35 = u9.createElement(u12, v42)
                    elseif u22.Tab == u18.BADGES then
                        local v44 = {
                            ["FrameProps"] = {
                                ["Size"] = UDim2.fromScale(0.95, 0.95),
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Position"] = UDim2.fromScale(0.5, 0.5)
                            }
                        }
                        local v45 = u22.Element
                        if v45 ~= nil then
                            v45 = v45.itemEnum
                        end
                        local v46
                        if v45 == u16.NONE then
                            v46 = nil
                        else
                            v46 = u22.Element
                            if v46 ~= nil then
                                v46 = v46.itemEnum
                            end
                        end
                        v44.Id = v46
                        v44.Darkened = false
                        v44.Simple = true
                        v35 = u9.createElement(u11, v44)
                    else
                        local v47 = {}
                        local v48 = u22.Element
                        if v48 ~= nil then
                            v48 = v48.imageId
                        end
                        v47.Image = v48
                        v47.AnchorPoint = Vector2.new(0.5, 0.5)
                        v47.Position = UDim2.fromScale(0.5, 0.5)
                        v47.Size = UDim2.fromScale(0.75, 0.75)
                        v47.ScaleType = "Fit"
                        v47.BackgroundTransparency = 1
                        v47.Visible = not u27
                        v35 = u9.createElement("ImageLabel", v47)
                    end
                else
                    local v49 = {}
                    local v50 = u22.Element
                    if v50 ~= nil then
                        v50 = v50.imageId
                    end
                    v49.Image = v50
                    v49.AnchorPoint = Vector2.new(0.5, 0.5)
                    v49.Position = UDim2.fromScale(0.5, 0.5)
                    v49.Size = UDim2.fromScale(0.75, 0.75)
                    v49.ScaleType = "Fit"
                    v49.BackgroundTransparency = 1
                    v49.Visible = not u27
                    v35 = u9.createElement("ImageLabel", v49)
                end
            end
            v32[v34 + 1] = v35
            return u9.createElement("Frame", v31, v32)
        end
        local v52 = {
            ["BorderSizePixel"] = 0,
            ["Size"] = u22.Size,
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["BackgroundTransparency"] = (u27 or v26) and 1 or 0,
            ["BackgroundColor3"] = u4.WHITE,
            ["LayoutOrder"] = u22.LayoutOrder
        }
        local v53 = { u9.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 0),
                ["PaddingBottom"] = UDim.new(0, 0)
            }), u9.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u4.BLACK), ColorSequenceKeypoint.new(1, u4.BLACK) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0.5) })
            }) }
        local v54 = #v53
        local v55 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v56 = { u9.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.02, 0)
            }), u9.createElement(v51) }
        local _ = #v56
        local v57 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.49, -50)
        }
        local v58 = { u9.createElement("UIPadding", {
                ["PaddingLeft"] = UDim.new(0, 10),
                ["PaddingRight"] = UDim.new(0, 10)
            }), u9.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["Padding"] = UDim.new(0, u5.isSmallScreen() and 12 or 6)
            }) }
        local v59 = #v58
        local v60 = {
            ["AutomaticSize"] = "Y",
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0, 0)
        }
        local v61 = u22.Element
        if v61 ~= nil then
            v61 = v61.name
        end
        v60.Text = "<b>" .. (v61 == nil and "Select an item" or v61) .. "</b>"
        v60.TextColor3 = u4.WHITE
        v60.RichText = true
        v60.Font = Enum.Font.Roboto
        v60.TextScaled = true
        v60.LayoutOrder = 2
        v60.Visible = not u27
        v58.Title = u9.createElement("TextLabel", v60, { u9.createElement("UITextSizeConstraint", {
                ["MinTextSize"] = 18,
                ["MaxTextSize"] = u5.isSmallScreen() and 18 or 22
            }), u9.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Color"] = Color3.fromRGB(0, 0, 0)
            }) })
        local v62 = u22.Element
        if v62 ~= nil then
            v62 = v62.description
        end
        local v63 = v62 ~= nil
        if v63 then
            v63 = u9.createElement("TextLabel", {
                ["AutomaticSize"] = "Y",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["TextYAlignment"] = "Top",
                ["LayoutOrder"] = 3,
                ["Size"] = UDim2.new(1, 0, 0, 0),
                ["Text"] = u22.Element.description,
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.Roboto
            }, { u9.createElement("UITextSizeConstraint", {
                    ["MinTextSize"] = 12,
                    ["MaxTextSize"] = u5.isSmallScreen() and 14 or 16
                }) })
        end
        if v63 then
            v58[v59 + 1] = v63
        end
        v56.InfoContainer = u9.createElement(u6, v57, v58)
        v53[v54 + 1] = u9.createElement(u6, v55, v56)
        if v24 then
            local v64 = {
                ["Size"] = UDim2.new(0.75, 0, 0, 40),
                ["Position"] = UDim2.new(0.5, 0, 1, -10),
                ["AnchorPoint"] = Vector2.new(0.5, 1)
            }
            local v65 = u22.Element
            if v65 ~= nil then
                v65 = v65.itemEnum
            end
            local v66 = u14(v65)
            if v66 ~= nil then
                v66 = v66.displayInLocker
                if v66 ~= nil then
                    v66 = v66.useButtonText
                    if v66 ~= nil then
                        v66 = string.upper(v66)
                    end
                end
            end
            v64.Text = "<b>" .. (v66 == nil and "ACTIVATE" or v66) .. "</b>"
            v64.TextSize = 16
            function v64.OnClick() --[[ Line: 347 ]]
                --[[
                Upvalues:
                    [1] = u22
                    [2] = u5
                    [3] = u14
                    [4] = u8
                    [5] = u7
                    [6] = u19
                --]]
                local v67 = u22.Element
                if v67 ~= nil then
                    v67 = v67.consumableId
                end
                if v67 == nil then
                    return nil
                end
                if u5.isHoarceKat() then
                    return nil
                end
                local v68 = u22.Element.consumableId
                local v69 = u22.Element.itemEnum
                local v70 = u14(v69).displayInLocker
                if v70 ~= nil then
                    v70 = v70.merge
                end
                if v70 then
                    local v71 = u8.Controllers.ConsumableController:getConsumablesOfTypeFromInv(v69)[1]
                    if v71 then
                        v68 = v71[2].id
                    end
                end
                if u8.Controllers.ConsumableController:useConsumableFromLocker(v68) then
                    local v72 = u22.Element
                    if v72 ~= nil then
                        v72 = v72.itemEnum
                    end
                    local v73 = u14(v72)
                    if v73 ~= nil then
                        v73 = v73.displayInLocker
                        if v73 ~= nil then
                            v73 = v73.disableOpenSound
                        end
                    end
                    if not v73 then
                        u7:playSound(u19.PIRATE_SHOVEL_DIG_TREASURE_FOUND)
                    end
                    u22.RebuildElements()
                end
            end
            v64.LayoutOrder = 4
            v24 = u9.createElement(u3, v64)
        end
        if v24 then
            v53[v54 + 2] = v24
        end
        local v74 = #v53
        if v29 then
            v29 = u9.createElement(u21, {
                ["CanReplay"] = v28,
                ["Tab"] = u22.Tab,
                ["Element"] = u22.Element
            })
        end
        if v29 then
            v53[v74 + 1] = v29
        end
        return u9.createFragment({
            ["LockerShowcase"] = u9.createElement("Frame", v52, v53)
        })
    end)
}