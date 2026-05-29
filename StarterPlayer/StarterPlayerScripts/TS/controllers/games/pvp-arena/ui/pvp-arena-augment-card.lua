local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v2.UIUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u13 = v12.Players
local u14 = v12.TweenService
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-category-meta").getPvpArenaAugmentCategoryMeta
local v17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "augments", "pvp-arena-augment-meta")
local u18 = v17.getPvPArenaAugmentDescription
local u19 = v17.getPvPArenaAugmentMeta
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u22 = v1.import(script, script.Parent, "pvp-arena-augment-icon").PvPArenaAugmentIcon
return {
    ["PvPArenaAugmentCard"] = v11.new(u10)(function(u23, p24) --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u16
            [3] = u10
            [4] = u9
            [5] = u4
            [6] = u7
            [7] = u6
            [8] = u14
            [9] = u21
            [10] = u15
            [11] = u13
            [12] = u8
            [13] = u22
            [14] = u3
            [15] = u20
            [16] = u18
            [17] = u5
        --]]
        local v25 = p24.useState
        local v26 = p24.useEffect
        local v27 = u19(u23.Augment)
        local v28 = u16(v27.augmentCategory)
        local u29, u30 = v25(false)
        local v31 = string.upper(v27.displayName)
        local v32 = v28.title
        local u33 = u10.createRef()
        local u34 = u10.createRef()
        local u35 = u10.createRef()
        v26(function() --[[ Line: 35 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u35
                [3] = u4
                [4] = u7
                [5] = u23
                [6] = u6
            --]]
            local u36 = u9.new()
            local v37 = u35:getValue()
            if v37 then
                if u4.isGamepadControls() then
                    u7:selectGui(v37)
                end
                local u38 = u7:setContainerTransparency(v37, 1, {
                    ["onCleanUpTweenInfo"] = TweenInfo.new(0.3)
                })
                local u39 = task.delay(u23.CardNumber * 0.33, function() --[[ Line: 46 ]]
                    --[[
                    Upvalues:
                        [1] = u6
                        [2] = u23
                        [3] = u38
                    --]]
                    u6:playSound("rbxassetid://10969529817", {
                        ["playbackSpeedMultiplier"] = 1 + u23.CardNumber * 0.3
                    })
                    u38:DoCleaning()
                end)
                u36:GiveTask(function() --[[ Line: 52 ]]
                    --[[
                    Upvalues:
                        [1] = u39
                    --]]
                    if u39 then
                        task.cancel(u39)
                    end
                end)
            end
            return function() --[[ Line: 58 ]]
                --[[
                Upvalues:
                    [1] = u36
                --]]
                u36:Destroy()
            end
        end, {})
        v26(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u33
                [2] = u34
                [3] = u23
                [4] = u29
                [5] = u14
            --]]
            local v40 = u33:getValue()
            local v41 = u34:getValue()
            if v40 and v41 then
                if u23.Active or u23.SelectedAugment then
                    return nil
                elseif u29 then
                    u14:Create(v41, TweenInfo.new(0.3), {
                        ["Transparency"] = 0
                    }):Play()
                    u14:Create(v40, TweenInfo.new(0.3), {
                        ["Offset"] = Vector2.new(0, 0)
                    }):Play()
                else
                    u14:Create(v41, TweenInfo.new(0.3), {
                        ["Transparency"] = 1
                    }):Play()
                    u14:Create(v40, TweenInfo.new(0.3), {
                        ["Offset"] = Vector2.new(-0.1, 0)
                    }):Play()
                end
            else
                return nil
            end
        end, { u29 })
        local v42 = {
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = u23.Position,
            ["Size"] = UDim2.fromScale(1, 0.30158730158730157),
            ["BackgroundColor3"] = u21.Gray,
            ["BackgroundTransparency"] = 1,
            ["Active"] = true,
            [u10.Event.MouseButton1Click] = function() --[[ Line: 95 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u4
                    [3] = u15
                    [4] = u13
                    [5] = u8
                --]]
                if u23.SelectedAugment then
                    return nil
                elseif u23.OnClickEnabled then
                    if u4.isHoarceKat() then
                        u15:dispatch({
                            ["type"] = "BedwarsSetPvPArenaAugmentSelection",
                            ["userId"] = u13.LocalPlayer.UserId,
                            ["augment"] = u23.Augment
                        })
                    else
                        u8.Controllers.PvpArenaAugmentSelectionController:selectAugment(u23.Augment)
                    end
                else
                    return nil
                end
            end,
            [u10.Ref] = u35
        }
        local v43 = { u10.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.939655172413793
            }), u10.createElement(u22, {
                ["Augment"] = u23.Augment,
                ["FrameProps"] = {
                    ["Size"] = UDim2.fromScale(0.2844638949671772, 1)
                }
            }) }
        local v44 = #v43
        local v45 = {
            ["Size"] = UDim2.fromScale(0.8743169398907104, 0.8836206896551724),
            ["AnchorPoint"] = Vector2.new(1, 0.5),
            ["Position"] = UDim2.fromScale(1, 0.5),
            ["BackgroundColor3"] = u3.WHITE,
            ["BorderSizePixel"] = 0,
            [u10.Event.MouseEnter] = function() --[[ Line: 132 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u20
                    [3] = u30
                --]]
                u6:playSound(u20.UI_HOVER)
                u30(true)
            end,
            [u10.Event.MouseLeave] = function() --[[ Line: 136 ]]
                --[[
                Upvalues:
                    [1] = u30
                --]]
                u30(false)
            end
        }
        local v46 = {}
        local v47 = u10.createElement("UIStroke", {
            ["Transparency"] = u23.Active and 0 or 1,
            ["Thickness"] = 2,
            ["Color"] = u3.WHITE,
            [u10.Ref] = u34
        })
        local v48 = u10.createElement
        local v49 = "UIGradient"
        local v50 = {
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v28.hexagonOutlineGradient.Keypoints[2].Value), ColorSequenceKeypoint.new(0.25, u3.hexColor(0)), ColorSequenceKeypoint.new(1, u3.hexColor(0)) }),
            ["Transparency"] = NumberSequence.new(0.2, 0.4),
            ["Rotation"] = -20
        }
        local v51
        if u23.Active then
            v51 = Vector2.new(0, 0)
        else
            v51 = Vector2.new(-0.1, 0)
        end
        v50.Offset = v51
        v50[u10.Ref] = u33
        __set_list(v46, 1, {v47, v48(v49, v50)})
        local _ = #v46
        local v52 = v32 ~= nil
        if v52 then
            local v53 = {
                ["TextXAlignment"] = "Right",
                ["TextYAlignment"] = "Center",
                ["Size"] = UDim2.fromScale(0.27, 0.18),
                ["Position"] = UDim2.fromScale(0.9744, 0.03902439024390244),
                ["AnchorPoint"] = Vector2.new(1, 0)
            }
            local v54
            if v32 == nil then
                v54 = v32
            else
                v54 = string.upper(v32.displayName)
            end
            v53.Text = "<b>" .. v54 .. "</b>"
            v53.RichText = true
            v53.TextSize = 28
            v53.Font = "SourceSansItalic"
            if v32 ~= nil then
                v32 = v32.color
            end
            if v32 == nil then
                v32 = u3.WHITE
            end
            v53.TextColor3 = v32
            v53.BackgroundTransparency = 1
            v52 = u10.createElement("TextLabel", v53)
        end
        local v55 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.78125, 1),
            ["Position"] = UDim2.fromScale(0.20625, 0.5),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v56 = { u10.createElement("TextLabel", {
                ["TextXAlignment"] = "Left",
                ["TextYAlignment"] = "Center",
                ["RichText"] = true,
                ["TextScaled"] = true,
                ["Font"] = "SourceSansBold",
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.1,
                ["Size"] = UDim2.fromScale(0.7, 0.25),
                ["Position"] = UDim2.fromScale(0, 0.05),
                ["Text"] = "<b>" .. v31 .. "</b>",
                ["TextColor3"] = u3.WHITE
            }) }
        local v57 = #v56
        if v52 then
            v56[v57 + 1] = v52
        end
        v56[#v56 + 1] = u10.createElement("TextLabel", {
            ["TextSize"] = 28,
            ["TextWrapped"] = true,
            ["TextXAlignment"] = "Left",
            ["TextYAlignment"] = "Top",
            ["RichText"] = true,
            ["TextTransparency"] = 0.1,
            ["Font"] = "SourceSans",
            ["LineHeight"] = 0.85,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(0.9, 0.5),
            ["Position"] = UDim2.fromScale(0.0448, 0.4),
            ["Text"] = u18(u23.Augment),
            ["TextColor3"] = Color3.fromRGB(232, 232, 232)
        })
        v56.VerticalDivider = u10.createElement("Frame", {
            ["BackgroundTransparency"] = 0.6,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.008, 0.5),
            ["Position"] = UDim2.fromScale(0, 0.4),
            ["BackgroundColor3"] = u3.BLACK
        })
        v46.InfoFrame = u10.createElement(u5, v55, v56)
        v43[v44 + 1] = u10.createElement("Frame", v45, v46)
        return u10.createFragment({
            ["CardFrame"] = u10.createElement("ImageButton", v42, v43)
        })
    end)
}