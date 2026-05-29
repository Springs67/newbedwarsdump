local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "kit-shop", "ui", "misc", "player-viewport").PlayerViewport
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "title", "title-meta").TitleMeta
return {
    ["TournamentAppRewardTile"] = v8.new(u7)(function(p15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u12
            [2] = u13
            [3] = u14
            [4] = u4
            [5] = u7
            [6] = u11
            [7] = u9
            [8] = u10
            [9] = u5
            [10] = u6
            [11] = u3
        --]]
        local _ = p16.useState
        local _ = p16.useEffect
        local v17 = false
        local v18 = false
        local v19 = nil
        local v20 = false
        local v21 = ""
        local v22 = Color3.fromRGB(255, 255, 255)
        local v23 = p15.reward.bedCoins
        local v24, v25
        if v23 == 0 or (v23 ~= v23 or not v23) then
            v24 = ""
            v25 = nil
        else
            v25 = u12.BED_COIN_ICON
            local v26 = p15.reward.bedCoins
            v24 = tostring(v26) .. " Bed Coins"
        end
        if p15.reward.emote then
            v25 = u13[p15.reward.emote].image
            v19 = u13[p15.reward.emote]
            v17 = u13[p15.reward.emote].animation and true or v17
            v18 = u13[p15.reward.emote].limited and true or v18
            v24 = u13[p15.reward.emote].name .. " Emote"
        end
        if p15.reward.title then
            v21 = u14[p15.reward.title].text
            v22 = u14[p15.reward.title].color
            v18 = u14[p15.reward.title].limited and true or v18
            v20 = true
            v24 = "Tournament Title"
        end
        local v27 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 3
        }
        local v28
        if p15.rewardTier == 3 then
            v28 = UDim2.fromScale(0.325, 0.65)
        else
            v28 = UDim2.fromScale(0.35, 0.7)
        end
        v27.Size = v28
        v27.BackgroundColor3 = u4.WHITE
        v27.LayoutOrder = p15.LayoutOrder
        v27.BackgroundTransparency = p15.unWinnable and 0.7 or 0
        local v29 = { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }) }
        local v30 = #v29
        local v31 = {
            ["Rotation"] = 90
        }
        local v32
        if v20 then
            v32 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#4075ff")), ColorSequenceKeypoint.new(1, Color3.fromHex("#5ec5ff")) })
        else
            local v33 = p15.reward.bedCoins
            if v33 == 0 or (v33 ~= v33 or not v33) then
                v32 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#ffa438")), ColorSequenceKeypoint.new(1, Color3.fromHex("#ffe600")) })
            else
                v32 = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#d55eff")), ColorSequenceKeypoint.new(1, Color3.fromHex("#a259ff")) })
            end
        end
        v31.Color = v32
        v29[v30 + 1] = u7.createElement("UIGradient", v31)
        local v34 = not (v17 or v20)
        if v34 then
            v34 = u7.createFragment({
                ["RewardImage"] = u7.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["ZIndex"] = 5,
                    ["LayoutOrder"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.8, 0.6),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = v25,
                    ["ImageTransparency"] = p15.unWinnable and 0.7 or 0
                })
            })
        end
        if v34 then
            v29[v30 + 2] = v34
        end
        local v35 = #v29
        local v36
        if v20 then
            v36 = u7.createFragment({
                ["RewardImage"] = u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 5,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(0.8, 0.6),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Text"] = "<b>" .. v21 .. "</b>",
                    ["TextColor3"] = v22,
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextTransparency"] = p15.unWinnable and 0.7 or 0
                })
            })
        else
            v36 = v20
        end
        if v36 then
            v29[v35 + 1] = v36
        end
        local v37 = #v29
        if v17 then
            if v19 then
                v17 = v19.animation
            else
                v17 = v19
            end
        end
        if v17 then
            local v38 = {
                ["LayoutOrder"] = 2,
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Animation"] = u11:getAssetId(v19.animation.type),
                ["Size"] = UDim2.fromScale(0.8, 0.6),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["PreviewItemTypes"] = v19.animation.previewItems
            }
            local v39 = v19.animation.previewReplicatedStorageAssets
            local v40
            if v39 == nil then
                v40 = v39
            else
                local function v48(p41) --[[ Line: 133 ]]
                    --[[
                    Upvalues:
                        [1] = u9
                    --]]
                    local v42 = string.split(p41, "/")
                    local v43 = u9.Assets
                    local v44 = v43
                    for v45, v46 in v42 do
                        local _ = v45 - 1
                        if v44 ~= nil then
                            local v47 = v44:FindFirstChild(v46)
                        end
                        if v47 then
                            v43 = v47
                            v44 = v43
                        end
                    end
                    return v44
                end
                local v49 = 0
                v40 = {}
                for v50, v51 in v39 do
                    local v52 = v48(v51, v50 - 1, v39)
                    if v52 ~= nil then
                        v49 = v49 + 1
                        v40[v49] = v52
                    end
                end
            end
            v38.PreviewAccessories = v40
            v38.ImageTransparency = 0
            v38.ZIndex = 5
            v17 = u7.createFragment({
                ["RewardEmote"] = u7.createElement(u10, v38)
            })
        end
        if v17 then
            v29[v37 + 1] = v17
        end
        local v53 = #v29
        local v54
        if v18 then
            v54 = u7.createFragment({
                ["RewardAmountTitle"] = u7.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["Text"] = "<b>LIMITED</b>",
                    ["Font"] = "Roboto",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["ZIndex"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.2),
                    ["Position"] = UDim2.fromScale(0, -0.2),
                    ["TextColor3"] = Color3.fromHex("#FFF48E"),
                    ["TextXAlignment"] = Enum.TextXAlignment.Center,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center,
                    ["TextTransparency"] = p15.unWinnable and 0.7 or 0
                })
            })
        else
            v54 = v18
        end
        if v54 then
            v29[v53 + 1] = v54
        end
        local v55 = #v29
        local v56 = not v20
        if v56 then
            if v18 then
                v56 = u7.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u7.createElement(u6, {}, { u7.createElement(u3, {
                            ["Text"] = "Exclusive Emote",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = Color3.fromHex("#ffe600"),
                            ["Limits"] = Vector2.new(300, 60)
                        }), u7.createElement(u3, {
                            ["Text"] = "This emote expires two weeks after the tournament ends.",
                            ["TextSize"] = 14,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            else
                v56 = v18
            end
        end
        if v56 then
            v29[v55 + 1] = v56
        end
        local v57 = #v29
        if v20 then
            if v18 then
                v18 = u7.createElement(u5, {
                    ["Size"] = UDim2.fromScale(1, 1)
                }, { u7.createElement(u6, {}, { u7.createElement(u3, {
                            ["Text"] = "Exclusive Title",
                            ["TextSize"] = 16,
                            ["Font"] = Enum.Font.SourceSansBold,
                            ["TextColor3"] = Color3.fromHex("#5ec5ff"),
                            ["Limits"] = Vector2.new(300, 60)
                        }), u7.createElement(u3, {
                            ["Text"] = "This Title expires two weeks after the tournament ends.",
                            ["TextSize"] = 14,
                            ["Font"] = Enum.Font.SourceSans,
                            ["TextColor3"] = Color3.fromRGB(191, 191, 191),
                            ["Limits"] = Vector2.new(300, 60)
                        }) }) })
            end
        else
            v18 = v20
        end
        if v18 then
            v29[v57 + 1] = v18
        end
        local _ = #v29
        v29.RewardNameContainer = u7.createElement("Frame", {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = 4,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Position"] = UDim2.fromScale(0.5, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 1),
            ["BackgroundColor3"] = u4.WHITE,
            ["BackgroundTransparency"] = p15.unWinnable and 0.7 or 0
        }, { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 6)
            }), u7.createElement("TextLabel", {
                ["TextScaled"] = true,
                ["BackgroundTransparency"] = 1,
                ["ZIndex"] = 4,
                ["Size"] = UDim2.fromScale(0.95, 0.9),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Text"] = v24,
                ["TextColor3"] = Color3.fromRGB(39, 39, 39),
                ["Font"] = Enum.Font.GothamBold,
                ["TextTransparency"] = p15.unWinnable and 0.7 or 0
            }) })
        return u7.createFragment({
            ["RewardFrame"] = u7.createElement("Frame", v27, v29)
        })
    end)
}