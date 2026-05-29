local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = u12.GLOW_PANEL_BLUE
return {
    ["SpiritSummonerDisplay"] = v9.new(u8)(function(_, p14) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u11
            [3] = u12
            [4] = u7
            [5] = u10
            [6] = u8
            [7] = u13
            [8] = u6
            [9] = u3
            [10] = u4
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17 = u5.isSmallScreen() and 1.5 or 1
        local v18, u19 = v15(1)
        local v20, u21 = v15(0)
        local v22, u23 = v15(0)
        local v24, u25 = v15(u11.ATTACK)
        local v26 = Color3.fromRGB(255, 148, 235)
        local v27
        if v18 == 1 then
            v27 = u12.SPIRIT_SUMMONER_TIER_1_LARGE
        elseif v18 == 2 then
            v27 = u12.SPIRIT_SUMMONER_TIER_2_LARGE
        elseif v18 == 3 then
            v27 = u12.SPIRIT_SUMMONER_TIER_3_LARGE
        else
            v27 = u12.SPIRIT_SUMMONER_TIER_1_LARGE
        end
        v16(function() --[[ Line: 45 ]]
            --[[
            Upvalues:
                [1] = u5
                [2] = u7
                [3] = u10
                [4] = u19
                [5] = u21
                [6] = u23
                [7] = u25
            --]]
            if u5.isHoarceKat() then
                return nil
            end
            local u28 = u7.new()
            u28:GiveTask(u10.LocalPlayer:GetAttributeChangedSignal("SpiritSummonerTier"):Connect(function() --[[ Line: 50 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u10
                --]]
                u19(u10.LocalPlayer:GetAttribute("SpiritSummonerTier"))
            end))
            u28:GiveTask(u10.LocalPlayer:GetAttributeChangedSignal("ReadySummonedAttackSpirits"):Connect(function() --[[ Line: 53 ]]
                --[[
                Upvalues:
                    [1] = u21
                    [2] = u10
                --]]
                u21(u10.LocalPlayer:GetAttribute("ReadySummonedAttackSpirits"))
            end))
            u28:GiveTask(u10.LocalPlayer:GetAttributeChangedSignal("ReadySummonedHealSpirits"):Connect(function() --[[ Line: 56 ]]
                --[[
                Upvalues:
                    [1] = u23
                    [2] = u10
                --]]
                u23(u10.LocalPlayer:GetAttribute("ReadySummonedHealSpirits"))
            end))
            u28:GiveTask(u10.LocalPlayer:GetAttributeChangedSignal("SpiritSummonerAffinity"):Connect(function() --[[ Line: 59 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u10
                --]]
                u25(u10.LocalPlayer:GetAttribute("SpiritSummonerAffinity"))
            end))
            return function() --[[ Line: 62 ]]
                --[[
                Upvalues:
                    [1] = u28
                --]]
                u28:DoCleaning()
            end
        end)
        local v29 = u8.createFragment
        local v30 = {}
        local v31 = u8.createElement
        local v32 = {}
        local v33 = u8.createElement
        local v34 = {
            ["Transparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(v17 * 0.13, v17 * 0.24),
            ["Position"] = UDim2.fromScale(0.025, u5.isMobileControls() and 0.25 or 0.3)
        }
        local v35 = {}
        local v36 = u8.createElement
        local v37 = {
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 0.35,
            ["BackgroundTransparency"] = 0,
            ["Image"] = u13,
            ["Size"] = UDim2.fromScale(0.5, 1),
            ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
        }
        local v38 = {
            u8.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.01),
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }),
            u8.createElement("UIStroke", {
                ["Thickness"] = 1,
                ["Transparency"] = 0.5,
                ["Color"] = Color3.fromRGB(0, 247, 255)
            }),
            u8.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }),
            u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 0.4
            }),
            u8.createElement("UIGradient", {
                ["Rotation"] = 90,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 196, 250)), ColorSequenceKeypoint.new(1, Color3.fromRGB(94, 189, 255)) }),
                ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.3), NumberSequenceKeypoint.new(1, 0.3) })
            }),
            ["CurrentSpiritTierWrapper"] = u8.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 0.3)
            }, {
                ["CurrentSpiritTier"] = u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.9, 0.9),
                    ["Image"] = v27,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5)
                }, { u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }), u8.createElement(u6, {}, { u8.createElement(u3, {
                            ["Text"] = "Current Spirit Tier",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            }),
            ["AttackSpirits"] = u8.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.3)
            }, {
                ["AttackSpiritContainer"] = u8.createElement("Frame", {
                    ["Size"] = UDim2.fromScale(0.8, 0.9),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["BackgroundTransparency"] = v24 == u11.ATTACK and 0.5 or 1,
                    ["BackgroundColor3"] = v26
                }, {
                    u8.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Color"] = u4.WHITE,
                        ["Transparency"] = v24 == u11.ATTACK and 0.5 or 1
                    }),
                    u8.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 6)
                    }),
                    u8.createElement("ImageLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["Size"] = UDim2.fromScale(0.45, 1),
                        ["Image"] = u12.ATTACK_SPIRIT_ICON,
                        ["AnchorPoint"] = Vector2.new(0, 0.5),
                        ["Position"] = UDim2.fromScale(0.05, 0.5)
                    }, { u8.createElement(u6, {}, { u8.createElement(u3, {
                                ["Text"] = "Ready Attack Spirits",
                                ["TextSize"] = 16,
                                ["Font"] = Enum.Font.SourceSansBold,
                                ["Limits"] = Vector2.new(300, 60)
                            }) }), u8.createElement("UIAspectRatioConstraint", {
                            ["AspectRatio"] = 1
                        }) }),
                    u8.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Size"] = UDim2.fromScale(0.45, 0.45),
                        ["Text"] = tostring(v20),
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextColor3"] = u4.WHITE,
                        ["AnchorPoint"] = Vector2.new(1, 0.5),
                        ["Position"] = UDim2.fromScale(0.95, 0.5)
                    })
                })
            })
        }
        local v39 = u8.createElement
        local v40 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.3)
        }
        local v41 = {
            ["HealSpiritContainer"] = u8.createElement("Frame", {
                ["Size"] = UDim2.fromScale(0.8, 0.9),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["BackgroundTransparency"] = v24 == u11.HEAL and 0.5 or 1,
                ["BackgroundColor3"] = v26
            }, {
                u8.createElement("UIStroke", {
                    ["Thickness"] = 2,
                    ["Color"] = u4.WHITE,
                    ["Transparency"] = v24 == u11.HEAL and 0.5 or 1
                }),
                u8.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 6)
                }),
                u8.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.45, 1),
                    ["AnchorPoint"] = Vector2.new(0, 0.5),
                    ["Position"] = UDim2.fromScale(0.05, 0.5),
                    ["Image"] = u12.HEAL_SPIRIT_ICON
                }, { u8.createElement(u6, {}, { u8.createElement(u3, {
                            ["Text"] = "Ready Heal Spirits",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["Limits"] = Vector2.new(300, 60)
                        }) }), u8.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) }),
                u8.createElement("TextLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["TextScaled"] = true,
                    ["Size"] = UDim2.fromScale(0.45, 0.45),
                    ["AnchorPoint"] = Vector2.new(1, 0.5),
                    ["Position"] = UDim2.fromScale(0.95, 0.5),
                    ["Text"] = tostring(v22),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                    ["TextColor3"] = u4.WHITE
                })
            })
        }
        v38.HealSpirits = v39("Frame", v40, v41)
        v35.OuterContainer = v36("ImageLabel", v37, v38)
        __set_list(v32, 1, {v33("Frame", v34, v35)})
        v30.SpiritSummonerDisplay = v31("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, v32)
        return v29(v30)
    end)
}