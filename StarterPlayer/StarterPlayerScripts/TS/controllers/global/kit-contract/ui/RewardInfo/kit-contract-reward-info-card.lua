local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.SoundManager
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "buttons", "purchase-button").PurchaseButton
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "bed-coin", "bed-coin-product-list").BedCoinProductList
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
return {
    ["KitContractRewardInfoCard"] = v10.new(u9)(function(u17, p18) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u4
            [2] = u14
            [3] = u7
            [4] = u9
            [5] = u3
            [6] = u8
            [7] = u13
            [8] = u5
            [9] = u15
            [10] = u11
            [11] = u6
            [12] = u16
            [13] = u12
        --]]
        p18.useEffect(function() --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u4
                [2] = u14
                [3] = u7
            --]]
            if u4.isHoarceKat() then
                return nil
            end
            local u20 = u14.Client:Get("KitContractPurchaseSuccess"):Connect(function(p19) --[[ Line: 24 ]]
                --[[
                Upvalues:
                    [1] = u7
                --]]
                u7.Controllers.KitContractController:getKitContractProfile(p19.kit, true)
            end)
            return function() --[[ Line: 27 ]]
                --[[
                Upvalues:
                    [1] = u20
                --]]
                if not u20.Connected then
                    return nil
                end
                u20:Disconnect()
            end
        end, {})
        local function v26(p21, p22, p23) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u3
            --]]
            local v24 = u9.createFragment
            local v25 = {
                ["KitContractInfoPill" .. p22] = u9.createElement("Frame", {
                    ["LayoutOrder"] = 0,
                    ["BackgroundTransparency"] = 0.5,
                    ["Size"] = UDim2.fromScale(0.375, 1),
                    ["BackgroundColor3"] = p23 or Color3.fromRGB(103, 103, 103)
                }, { u9.createElement("UICorner", {
                        ["CornerRadius"] = UDim.new(0, 3)
                    }), u9.createElement("TextLabel", {
                        ["BackgroundTransparency"] = 1,
                        ["TextScaled"] = true,
                        ["Size"] = UDim2.fromScale(0.8, 0.75),
                        ["Position"] = UDim2.fromScale(0.5, 0.5),
                        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                        ["Text"] = p21,
                        ["TextColor3"] = u3.WHITE,
                        ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                        ["TextXAlignment"] = Enum.TextXAlignment.Center,
                        ["TextYAlignment"] = Enum.TextYAlignment.Center
                    }) })
            }
            return v24(v25)
        end
        local u27 = "<font transparency=\".3\">Unlocks at </font>"
        local function u48(u28) --[[ Line: 62 ]]
            --[[
            Upvalues:
                [1] = u8
                [2] = u48
                [3] = u27
                [4] = u17
                [5] = u3
            --]]
            if type(u28) ~= "table" then
                return nil
            end
            local v29 = u8.entries(u28)
            local function v45(p30, p31) --[[ Line: 67 ]]
                --[[
                Upvalues:
                    [1] = u48
                    [2] = u8
                    [3] = u28
                    [4] = u27
                    [5] = u17
                    [6] = u3
                --]]
                local v32 = p30[1]
                local v33 = p30[2]
                local v34 = tostring(v32)
                if type(v33) == "table" then
                    u48(v33)
                    return nil
                end
                local v35 = #v34
                local v36 = #v34
                local v37
                if string.sub(v34, v35, v36) == "s" and v33 == 1 then
                    local v38 = #v34 - 1
                    v37 = string.sub(v34, 0, v38)
                else
                    v37 = v34
                end
                if p31 + 1 <= #u8.keys(u28) and p31 ~= 0 then
                    u27 = u27 .. "<font transparency=\".3\">& </font>"
                end
                local v39 = u17.KitStats[v34]
                local v40 = v33 <= (v39 == nil and 0 or v39)
                local v41 = u27
                local v42 = "<font color=\""
                local v43 = u3.richTextColor
                local v44
                if v40 then
                    v44 = Color3.fromRGB(237, 199, 89)
                else
                    v44 = Color3.fromRGB(103, 103, 103)
                end
                u27 = v41 .. v42 .. v43(v44) .. "\"><b>" .. tostring(v33) .. " " .. v37 .. "</b></font> "
            end
            for v46, v47 in v29 do
                v45(v47, v46 - 1, v29)
            end
        end
        u48(u17.Reward.task)
        local v49 = u17.KitContractProfile.purchasedUnlock
        local v50 = u27
        local v51 = {}
        for v52, v53 in u17 do
            v51[v52] = v53
        end
        v51.Reward = nil
        v51.SelectedKit = nil
        v51.KitContractProfile = nil
        v51.KitStats = nil
        local v54 = {}
        for v55, v56 in v51 do
            v54[v55] = v56
        end
        local v57 = {}
        local v58 = #v57
        local v59 = {
            ["Size"] = UDim2.fromScale(0.85, 0.85),
            ["Position"] = UDim2.fromScale(0, 0.48),
            ["AnchorPoint"] = Vector2.new(0, 0.5)
        }
        local v60 = { u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder
            }) }
        local v61 = #v60
        local v62 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.07)
        }
        local v63 = {}
        local v64 = #v63
        local v65 = u17.Reward.requiresPurchaseUnlock
        if v65 then
            v65 = u9.createElement("TextLabel", {
                ["BackgroundTransparency"] = 0.7,
                ["TextScaled"] = true,
                ["Text"] = "REQUIRES PASS",
                ["Size"] = UDim2.fromScale(0.775, 1),
                ["Position"] = UDim2.fromScale(0, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["BackgroundColor3"] = u13.ProgressColor,
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }, { u9.createElement("UIPadding", {
                    ["PaddingTop"] = UDim.new(0.15, 0),
                    ["PaddingBottom"] = UDim.new(0.15, 0)
                }), u9.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 3)
                }) })
        end
        if v65 then
            v63[v64 + 1] = v65
        end
        v60.KitContractInfoTopPill = u9.createElement(u5, v62, v63)
        v60[v61 + 1] = u9.createElement(u5, {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.015)
        })
        local v66 = u15.getRewardType(u17.Reward)
        if v66 ~= nil then
            v66 = string.upper(v66)
        end
        local v67 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.07)
        }
        local v68 = {
            u9.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.025, 0)
            }),
            [#v68 + 1] = v26(tostring(v66), "RewardType")
        }
        local v69 = #v68 + 1
        local v70 = u17.Reward.tier
        local v71 = "TIER " .. tostring(v70)
        local v72 = "RewardTier"
        local v73
        if u13.isTierUnlocked(u17.Reward.tier, u17.SelectedKit, u17.KitStats) then
            v73 = Color3.fromRGB(237, 199, 89)
        else
            v73 = nil
        end
        v68[v69] = v26(v71, v72, v73)
        v60.KitContractInfoPills = u9.createElement(u5, v67, v68)
        v60[v61 + 2] = u9.createElement(u5, {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.015)
        })
        local v74 = {
            ["LayoutOrder"] = 4,
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(1, 0.2)
        }
        local v75 = u15.getRewardName(u17.Reward)
        if v75 ~= nil then
            v75 = string.upper(v75)
        end
        v74.Text = v75
        v74.TextColor3 = u3.WHITE
        v74.FontFace = Font.fromName("Roboto", Enum.FontWeight.Bold)
        v74.TextXAlignment = Enum.TextXAlignment.Left
        v74.TextYAlignment = Enum.TextYAlignment.Center
        v60.KitContractInfoRewardTitle = u9.createElement("TextLabel", v74, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u4.isSmallScreen() and 42 or 58
            }) })
        v60.KitContractInfoRewardRequirements = u9.createElement("TextLabel", {
            ["LayoutOrder"] = 5,
            ["BackgroundTransparency"] = 1,
            ["RichText"] = true,
            ["TextScaled"] = true,
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["Text"] = v50,
            ["TextColor3"] = u3.WHITE,
            ["FontFace"] = Font.fromName("Roboto"),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Top
        }, { u9.createElement("UITextSizeConstraint", {
                ["MaxTextSize"] = u4.isSmallScreen() and 24 or 34,
                ["MinTextSize"] = u4.isSmallScreen() and 12 or 18
            }) })
        v57.KitContractInfoCard = u9.createElement(u5, v59, v60)
        local v76 = not v49
        if v76 then
            v76 = u9.createFragment({
                ["KitContractPurchaseButtons"] = u9.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 0.125),
                    ["Position"] = UDim2.fromScale(0, 0.96),
                    ["AnchorPoint"] = Vector2.new(0, 1)
                }, { u9.createElement(u11, {
                        ["LayoutOrder"] = 0,
                        ["Title"] = "PURCHASE PASS",
                        ["Selectable"] = true,
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Position"] = UDim2.fromScale(0, 0),
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["Cost"] = {
                            {
                                ["robux"] = 149
                            }
                        },
                        ["OnClick"] = function() --[[ Name: OnClick, Line 246 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                                [2] = u16
                                [3] = u7
                                [4] = u17
                            --]]
                            u6:playSound(u16.UI_CLICK)
                            u7.Controllers.KitContractController:promptPurchaseToContract(u17.SelectedKit)
                        end
                    }), u9.createElement(u11, {
                        ["LayoutOrder"] = 1,
                        ["Title"] = "PURCHASE PASS",
                        ["Selectable"] = true,
                        ["AnchorPoint"] = Vector2.new(0, 0),
                        ["Position"] = UDim2.fromScale(0.55, 0),
                        ["Size"] = UDim2.fromScale(0.5, 1),
                        ["Cost"] = {
                            {
                                ["bedcoin"] = u12.getProductInfo(58).cost
                            }
                        },
                        ["BackgroundColor3"] = Color3.fromRGB(255, 224, 107),
                        ["OnClick"] = function() --[[ Name: OnClick, Line 262 ]]
                            --[[
                            Upvalues:
                                [1] = u6
                                [2] = u16
                                [3] = u7
                                [4] = u17
                            --]]
                            u6:playSound(u16.UI_CLICK)
                            u7.Controllers.BedCoinProductPurchaseController:purchase({
                                ["productId"] = 58,
                                ["selectedKit"] = u17.SelectedKit
                            }, function() --[[ Line: 269 ]]
                                --[[
                                Upvalues:
                                    [1] = u7
                                    [2] = u17
                                --]]
                                u7.Controllers.KitContractController:getKitContractProfile(u17.SelectedKit, true)
                            end)
                        end
                    }) })
            })
        end
        if v76 then
            v57[v58 + 1] = v76
        end
        return u9.createFragment({
            ["KitContractRewardInfoCard"] = u9.createElement(u5, v54, v57)
        })
    end)
}