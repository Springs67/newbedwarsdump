local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.StringUtil
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "util", "color-util").ColorUtil
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimPackTypeMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u21 = v1.import(script, script.Parent, "armor-trim-player-viewport").ArmorTrimPlayerViewport
return {
    ["ArmorTrimPreview"] = v11.new(u10)(function(p22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u9
            [3] = u15
            [4] = u13
            [5] = u17
            [6] = u16
            [7] = u12
            [8] = u8
            [9] = u4
            [10] = u5
            [11] = u6
            [12] = u21
            [13] = u18
            [14] = u14
            [15] = u20
            [16] = u7
            [17] = u3
            [18] = u19
        --]]
        local v24 = p23.useState
        local v25 = p23.useEffect
        local u26, u27 = v24(false)
        local u28 = u10.createRef()
        local v29 = u9.values(u15)
        local v30 = table.create(#v29)
        for v31, v32 in v29 do
            local _ = v31 - 1
            v30[v31] = {
                ["pack"] = v32,
                ["packDisplayName"] = u13[v32].displayName,
                ["rate"] = u17.getArmorTrimRate(p22.ArmorTrimType, p22.ArmorTrimProgressData, v32)
            }
        end
        local v33 = u16[p22.ArmorTrimType]
        local v34
        if v33 == nil then
            v34 = v33
        else
            v34 = v33.limited
            if v34 ~= nil then
                v34 = v34.endTime
            end
        end
        local v35 = v34 ~= nil
        local v36
        if v35 and p22.ArmorTrimType then
            v36 = v33.limited.endTime < os.time()
        else
            v36 = false
        end
        local v37, v38, v39
        if v35 then
            v37 = v33.limited.endTime
            local v40 = v37 - os.time()
            v38 = v40 <= 86400
            if v40 <= 604800 then
                v39 = true
            else
                v39 = false
            end
        else
            v37 = 0
            v39 = false
            v38 = false
        end
        v25(function() --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u28
                [2] = u12
                [3] = u26
            --]]
            local v41 = u28:getValue()
            if not v41 then
                return nil
            end
            local v42 = {
                ["Rotation"] = u26 and 10 or 0
            }
            u12:Create(v41, TweenInfo.new(1), v42):Play()
        end, { u26 })
        local v43 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Size"] = p22.Size
        }
        local v44 = {}
        local v45 = #v44
        local v46 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v47 = {
            u10.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            ["ArmorTrimPreviewName"] = u10.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 0,
                ["TextScaled"] = true,
                ["Size"] = UDim2.fromScale(1, 0.1),
                ["Text"] = p22.Name,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextColor3"] = u8.WHITE
            })
        }
        local v48 = #v47
        local v49 = {
            ["LayoutOrder"] = 1,
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9)
        }
        local v50 = {}
        local v51 = #v50
        if v36 then
            v35 = u10.createElement(u4, {
                ["Position"] = UDim2.fromScale(1, 0),
                ["AnchorPoint"] = Vector2.new(1, 0),
                ["Size"] = UDim2.fromScale(0.5, 0.1)
            }, { u10.createElement(u5, {
                    ["Padding"] = {
                        ["Top"] = 5,
                        ["Right"] = 5
                    }
                }), u10.createElement("Frame", {
                    ["ZIndex"] = 4,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = Color3.fromRGB(110, 110, 110)
                }, { u10.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0.1, 0)
                    }), u10.createElement("UIStroke", {
                        ["Thickness"] = 1,
                        ["Color"] = u8.WHITE
                    }), u10.createElement("TextLabel", {
                        ["Text"] = "Unobtainable",
                        ["TextScaled"] = true,
                        ["BackgroundTransparency"] = 1,
                        ["ZIndex"] = 4,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["TextColor3"] = u8.WHITE,
                        ["Size"] = UDim2.fromScale(0.9, 0.9)
                    }) }) })
        elseif v35 then
            v35 = u10.createElement(u4, {
                ["Size"] = UDim2.fromScale(1, 0.2)
            }, { u10.createElement(u5, {
                    ["Padding"] = {
                        ["Top"] = 5,
                        ["Left"] = 5
                    }
                }), u10.createElement("TextLabel", {
                    ["TextTransparency"] = 0.05,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 4,
                    ["Position"] = UDim2.fromScale(1, 0.5),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Size"] = UDim2.fromScale(0.5, 0.5),
                    ["Text"] = u6.fromNow(v37, {
                        ["hideIfZero"] = true,
                        ["seconds"] = v38,
                        ["minutes"] = v38,
                        ["hours"] = v38,
                        ["days"] = v39,
                        ["long"] = not v38
                    }) .. "left",
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u8.WHITE,
                    ["TextXAlignment"] = Enum.TextXAlignment.Right
                }), u10.createElement(u4, {
                    ["Position"] = UDim2.fromScale(1, 0),
                    ["AnchorPoint"] = Vector2.new(1, 0),
                    ["Size"] = UDim2.fromScale(0.35, 0.5)
                }, { u10.createElement(u5, {
                        ["Padding"] = {
                            ["Top"] = 5,
                            ["Right"] = 5
                        }
                    }), u10.createElement("Frame", {
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["BackgroundColor3"] = Color3.fromRGB(255, 100, 100),
                        ["ZIndex"] = 4,
                        [u10.Ref] = u28
                    }, { u10.createElement("UICorner", {
                            ["CornerRadius"] = UDim.new(0.1, 0)
                        }), u10.createElement("UIStroke", {
                            ["Thickness"] = 1,
                            ["Color"] = u8.WHITE
                        }), u10.createElement("TextLabel", {
                            ["Text"] = "LIMITED",
                            ["TextScaled"] = true,
                            ["BackgroundTransparency"] = 1,
                            ["ZIndex"] = 4,
                            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                            ["Position"] = UDim2.fromScale(0.5, 0.5),
                            ["TextColor3"] = u8.WHITE,
                            ["Size"] = UDim2.fromScale(0.9, 0.9)
                        }) }) }) })
        end
        if v35 then
            v50[v51 + 1] = v35
        end
        local v52 = #v50
        v50[v52 + 1] = u10.createElement(u4, {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            [u10.Event.MouseEnter] = function() --[[ Line: 217 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27(true)
            end,
            [u10.Event.MouseLeave] = function() --[[ Line: 220 ]]
                --[[
                Upvalues:
                    [1] = u27
                --]]
                u27(false)
            end
        }, { u10.createElement(u21, {
                ["ButtonMode"] = "NONE",
                ["SelectedKit"] = u18.NONE,
                ["ArmorTrimType"] = p22.ArmorTrimType,
                ["ArmorTrimEffectRank"] = u14.T7,
                ["ViewportProps"] = {
                    ["BackgroundTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["BackgroundColor3"] = u20.backgroundPrimary
                },
                ["StartingSelection"] = {
                    ["armorSet"] = "IRON",
                    ["armorTrimColor"] = u8.WHITE
                }
            }) })
        local v53
        if p22.State == "LOCKED" then
            v53 = u10.createElement("Frame", {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 1),
                ["BackgroundColor3"] = u8.WHITE
            }, { u10.createElement("UIGradient", {
                    ["Rotation"] = 90,
                    ["Color"] = ColorSequence.new(Color3.fromRGB(0, 0, 0), Color3.fromRGB(0, 0, 0)),
                    ["Transparency"] = NumberSequence.new(1, 0)
                }) })
        else
            v53 = false
        end
        if v53 then
            v50[v52 + 2] = v53
        end
        v47[v48 + 1] = u10.createElement("Frame", v49, v50)
        v44[v45 + 1] = u10.createElement("Frame", v46, v47)
        local v54 = p22.State == "LOCKED"
        if v54 then
            local function v65(p55) --[[ Line: 258 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u8
                --]]
                if p55.rate <= 0 then
                    return nil
                end
                local v56 = u10.createFragment
                local v57 = {}
                local v58 = u10.createElement
                local v59 = {
                    ["BackgroundTransparency"] = 0.8,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.7, 0.3),
                    ["AnchorPoint"] = Vector2.new(0, 1),
                    ["BackgroundColor3"] = u8.WHITE,
                    ["LayoutOrder"] = p55.pack
                }
                local v60 = {}
                local v61 = u10.createElement
                local v62 = {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }
                local v63 = p55.packDisplayName
                local v64 = p55.rate
                v62.Text = v63 .. ": " .. tostring(v64) .. "%"
                v62.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
                v62.TextColor3 = u8.WHITE
                __set_list(v60, 1, {v61("TextLabel", v62), u10.createElement("UIAspectRatioConstraint", {
    ["AspectRatio"] = 1
}), u10.createElement("UICorner", {
    ["CornerRadius"] = UDim.new(1, 0)
})})
                v57.ArmorTrimProbability = v58("Frame", v59, v60)
                return v56(v57)
            end
            local v66 = 0
            local v67 = {}
            for v68, v69 in v30 do
                local v70 = v65(v69, v68 - 1, v30)
                if v70 ~= nil then
                    v66 = v66 + 1
                    v67[v66] = v70
                end
            end
            local v71 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.3, 1),
                ["AnchorPoint"] = Vector2.new(0, 1),
                ["Position"] = UDim2.fromScale(0.05, 0.97),
                ["BackgroundColor3"] = u8.WHITE
            }
            local v72 = { u10.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 10)
                }), u10.createElement(u7, {}, { u10.createElement(u3, {
                        ["Text"] = "Unlock Probability",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }) }) }
            local v73 = #v72
            for v74, v75 in v67 do
                v72[v73 + v74] = v75
            end
            v54 = u10.createFragment({
                ["ArmorTrimProbabilities"] = u10.createElement("Frame", v71, v72)
            })
        end
        if v54 then
            v44[v45 + 2] = v54
        end
        local v76 = #v44
        local v77
        if p22.State == "LOCKED" then
            v77 = u10.createFragment({
                ["ArmorTrimLocked"] = u10.createElement("Frame", {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["Size"] = UDim2.fromScale(0.2, 0.2),
                    ["AnchorPoint"] = Vector2.new(1, 1),
                    ["Position"] = UDim2.fromScale(0.95, 0.95)
                }, { u10.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Image"] = u19.LOCK_SOLID,
                        ["ImageColor3"] = u8.WHITE,
                        ["ScaleType"] = Enum.ScaleType.Fit
                    }), u10.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        else
            v77 = false
        end
        if v77 then
            v44[v76 + 1] = v77
        end
        return u10.createElement("Frame", v43, v44)
    end)
}