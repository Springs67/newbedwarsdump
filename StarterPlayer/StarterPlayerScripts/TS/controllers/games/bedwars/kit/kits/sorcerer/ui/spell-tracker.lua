local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "sorcerer-balance")
local u10 = v9.SorcererBalance
local u11 = v9.SorcererTier
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
return {
    ["SorcererKit"] = v7.new(u6)(function(u13, p14) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u10
            [2] = u11
            [3] = u8
            [4] = u4
            [5] = u6
            [6] = u3
            [7] = u5
            [8] = u12
        --]]
        local v15 = p14.useState
        local v16 = p14.useEffect
        local v17, u18 = v15(0)
        local u19, u20 = v15(0)
        local u21, u22 = v15(u10.getSorcererTierData(u11.TIER_2).numTotalCrystalsReq)
        local u23, u24 = v15(u10.getSorcererTier(u8.LocalPlayer))
        local u25 = u10.getSorcererTierData(u23)
        local v26
        if u25.nextTier then
            v26 = u10.getSorcererTierData(u25.nextTier)
        else
            v26 = nil
        end
        v16(function() --[[ Line: 29 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u8
                [3] = u10
                [4] = u23
                [5] = u22
                [6] = u24
                [7] = u18
                [8] = u20
            --]]
            local u27, u28
            if u4.isHoarceKat() then
                u27 = nil
                u28 = nil
            else
                u27 = u8.LocalPlayer:GetAttributeChangedSignal("CrystalsCollected"):Connect(function() --[[ Line: 34 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u10
                        [3] = u23
                        [4] = u22
                        [5] = u24
                        [6] = u18
                    --]]
                    local v29 = u8.LocalPlayer:GetAttribute("CrystalsCollected")
                    local v30 = (v29 == 0 or (v29 ~= v29 or not v29)) and 0 or v29
                    local v31 = u10.getSorcererTier(u8.LocalPlayer)
                    local v32 = u10.getSorcererTierData(v31)
                    local v33 = v32.nextTier
                    if u23 ~= v31 then
                        if v33 then
                            u22(u10.getSorcererTierData(v33).numTotalCrystalsReq - v32.numTotalCrystalsReq)
                        else
                            u22(0)
                        end
                        u24(v31)
                    end
                    if v33 then
                        local v34 = u10.getSorcererTierData(v33).numTotalCrystalsReq - v32.numTotalCrystalsReq
                        local v35 = u18
                        local v36 = (v30 - v32.numTotalCrystalsReq) / v34
                        v35((math.min(v36, 1)))
                    else
                        u18(1)
                    end
                end)
                u28 = u8.LocalPlayer:GetAttributeChangedSignal("SpellCharges"):Connect(function() --[[ Line: 59 ]]
                    --[[
                    Upvalues:
                        [1] = u8
                        [2] = u20
                    --]]
                    local v37 = u8.LocalPlayer:GetAttribute("SpellCharges")
                    u20((v37 == 0 or (v37 ~= v37 or not v37)) and 0 or v37)
                end)
            end
            return function() --[[ Line: 69 ]]
                --[[
                Upvalues:
                    [1] = u4
                    [2] = u27
                    [3] = u28
                --]]
                if not u4.isHoarceKat() then
                    u27:Disconnect()
                    u28:Disconnect()
                end
            end
        end, {})
        local v38 = {
            ["ResetOnSpawn"] = false
        }
        local v39 = {}
        local v40 = #v39
        local v41 = {
            ["Transparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.25, 0.4),
            ["Position"] = UDim2.fromScale(0.025, u4.isMobileControls() and 0.25 or 0.3)
        }
        local v42 = {}
        local v43 = #v42
        local v44 = {
            ["BorderSizePixel"] = 0,
            ["ImageTransparency"] = 0.7,
            ["BackgroundTransparency"] = 0.7,
            ["BackgroundColor3"] = Color3.fromRGB(222, 171, 38),
            ["Size"] = UDim2.fromScale(0.5, 1)
        }
        local v45 = {}
        local v46 = #v45
        if v26 then
            local v47 = u6.createFragment
            local v48 = {
                ["nextMagicCircleIcon"] = u6.createFragment({
                    ["nextMagicCircleIcon"] = u6.createElement("ImageLabel", {
                        ["BorderSizePixel"] = 0,
                        ["BackgroundTransparency"] = 1,
                        ["Image"] = v26.abilityIcon,
                        ["Size"] = UDim2.fromScale(0.34, 0.11),
                        ["Position"] = UDim2.fromScale(0.035, 0.05)
                    })
                })
            }
            local v49 = u6.createElement
            local v50 = {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 0,
                ["ZIndex"] = 2
            }
            local v51 = u25.nextTier
            v50.Text = tostring(v51)
            v50.TextColor3 = u3.BLACK
            v50.TextXAlignment = Enum.TextXAlignment.Center
            v50.TextYAlignment = Enum.TextYAlignment.Center
            v50.Size = UDim2.fromScale(0.2, 0.06)
            v50.Position = UDim2.fromScale(0.11, 0.075)
            v50.FontFace = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
            v50.BackgroundColor3 = Color3.fromRGB(250, 20, 255)
            __set_list(v48, 1, {v49("TextLabel", v50, { u6.createElement("UICorner", {
        ["CornerRadius"] = UDim.new(90, 90)
    }) })})
            v26 = v47(v48)
        end
        if v26 then
            v45[v46 + 1] = v26
        end
        local v52 = #v45
        local v53 = {
            ["Transparency"] = 0.2,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.175, 0.65),
            ["Position"] = UDim2.fromScale(0.2, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33)
        }
        local v54 = {}
        local v55 = #v54
        local v56 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0),
            ["Position"] = UDim2.fromScale(0.5, 0)
        }
        local v57 = {}
        local v58 = #v57
        for v63, v64 in (function() --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u21
                [2] = u6
            --]]
            local v59 = false
            local v60 = 0
            local v61 = {}
            while true do
                if v59 then
                    v60 = v60 + 1
                else
                    v59 = true
                end
                if v60 >= u21 - 1 then
                    return v61
                end
                local v62 = u6.createFragment({
                    ["Divider"] = u6.createElement("Frame", {
                        ["BackgroundTransparency"] = 0.2,
                        ["BorderSizePixel"] = 0,
                        ["ZIndex"] = 2,
                        ["Size"] = UDim2.fromScale(1, 0.01),
                        ["AnchorPoint"] = Vector2.new(0.5, 0),
                        ["Position"] = UDim2.fromScale(0.5, (v60 + 1) / u21),
                        ["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
                    })
                })
                table.insert(v61, v62)
            end
        end)() do
            v57[v58 + v63] = v64
        end
        v54.PillDividersWrapper = u6.createElement(u5, v56, v57)
        local v65 = {}
        local v66 = UDim2
        local v67 = u13.progress
        if v67 == nil then
            v67 = 1 * v17
        end
        v65.Size = v66.fromScale(1, v67)
        v65.Position = UDim2.fromScale(0, 1)
        v65.AnchorPoint = Vector2.new(0, 1)
        v65.BackgroundColor3 = Color3.fromRGB(255, 0, 230)
        v65.Transparency = 0.1
        v65.BorderSizePixel = 0
        v54.InnerProgressBar = u6.createElement("Frame", v65, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 4)
            }) })
        v54[v55 + 1] = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        })
        v45.OuterProgressBar = u6.createElement("Frame", v53, v54)
        v45.currentMagicCircleIcon = u6.createElement("ImageLabel", {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 1,
            ["Image"] = u25.abilityIcon,
            ["Size"] = UDim2.fromScale(0.34, 0.11),
            ["Position"] = UDim2.fromScale(0.035, 0.85)
        })
        v45[v52 + 1] = u6.createElement("TextLabel", {
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 0,
            ["ZIndex"] = 2,
            ["Text"] = tostring(u23),
            ["TextColor3"] = u3.BLACK,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Center,
            ["Size"] = UDim2.fromScale(0.2, 0.06),
            ["Position"] = UDim2.fromScale(0.11, 0.875),
            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            ["BackgroundColor3"] = Color3.fromRGB(250, 20, 255)
        }, { u6.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(90, 90)
            }) })
        local v68 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["ClipsDescendants"] = true,
            ["Size"] = UDim2.fromScale(0.6, 0.86),
            ["Position"] = UDim2.fromScale(0.6, 0.5),
            ["AnchorPoint"] = Vector2.new(0.4, 0.5)
        }
        local v69 = {}
        local v70 = #v69
        for v89, v90 in (function() --[[ Line: 235 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u25
                [3] = u12
                [4] = u13
                [5] = u19
                [6] = u6
            --]]
            local v71 = u10.HIGHEST_TIER
            local v72 = u10.getSorcererTierData(v71)
            local v73 = false
            local v74 = 1
            local v75 = {}
            while true do
                if v73 then
                    v74 = v74 + 1
                else
                    v73 = true
                end
                if v74 > v72.maxSpellCharges then
                    return v75
                end
                local v76 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.17),
                    ["BackgroundColor3"] = Color3.fromRGB(33, 33, 33),
                    ["Visible"] = v74 <= u25.maxSpellCharges,
                    ["LayoutOrder"] = v72.maxSpellCharges - v74
                }
                local v77 = {}
                local _ = #v77
                local v78 = {
                    ["BorderSizePixel"] = 100,
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u12.ALCHEMY_CRYSTAL_EMPTY_SLOT,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Visible"] = v74 <= u25.maxSpellCharges,
                    ["BorderColor3"] = Color3.fromRGB(33, 33, 33)
                }
                local v79 = {}
                local _ = #v79
                local v80 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.49, 0.52),
                    ["Size"] = UDim2.fromScale(0.98, 0.96)
                }
                local v81 = {}
                local _ = #v81
                local v82 = {
                    ["BorderSizePixel"] = 0,
                    ["BackgroundTransparency"] = 1,
                    ["Image"] = u12.ALCHEMY_CRYSTAL,
                    ["ScaleType"] = Enum.ScaleType.Fit,
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1)
                }
                local v83 = u13.spellCharges
                if v83 == nil then
                    v83 = u19
                end
                v82.Visible = v74 <= v83
                v81.CrystalBackground = u6.createElement("ImageLabel", v82)
                local v84 = u25.maxSpellCharges - v74
                v79["ActiveCrystalSlot" .. tostring(v84)] = u6.createElement("Frame", v80, v81)
                v77.CrystalBackground = u6.createElement("ImageLabel", v78, v79)
                local v85 = u6.createFragment
                local v86 = {}
                local v87 = v72.maxSpellCharges - v74
                v86["InactiveCrystalSlot" .. tostring(v87)] = u6.createElement("Frame", v76, v77)
                local v88 = v85(v86)
                table.insert(v75, v88)
            end
        end)() do
            v69[v70 + v89] = v90
        end
        local v91 = #v69
        v69[v91 + 1] = u6.createElement("TextLabel", {
            ["Text"] = "Charges",
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["TextColor3"] = u3.BLACK,
            ["AutomaticSize"] = Enum.AutomaticSize.XY,
            ["TextXAlignment"] = Enum.TextXAlignment.Center,
            ["TextYAlignment"] = Enum.TextYAlignment.Bottom,
            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            ["Size"] = UDim2.fromScale(0.8, 0.05),
            ["LayoutOrder"] = u10.getSorcererTierData(u10.HIGHEST_TIER).maxSpellCharges + 1
        })
        v69[v91 + 2] = u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["Padding"] = UDim.new(0.01),
            ["VerticalAlignment"] = Enum.VerticalAlignment.Bottom,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder
        })
        v45.CrystalContainer = u6.createElement("Frame", v68, v69)
        v45[v52 + 2] = u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 0.3333333333333333
        })
        v45[v52 + 3] = u6.createElement("UIStroke", {
            ["Thickness"] = 1,
            ["Transparency"] = 0.5,
            ["Color"] = Color3.fromRGB(255, 255, 0)
        })
        v45[v52 + 4] = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 4)
        })
        v42.OuterContainer = u6.createElement("ImageLabel", v44, v45)
        v42[v43 + 1] = u6.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 0.75
        })
        v39[v40 + 1] = u6.createElement("Frame", v41, v42)
        return u6.createFragment({
            ["SpellScreenGUI"] = u6.createElement("ScreenGui", v38, v39)
        })
    end)
}