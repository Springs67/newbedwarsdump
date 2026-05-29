local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.Empty
local u7 = v2.TooltipContainer
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "collection", "item-skins", "item-skin-viewport").ItemSkinViewport
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent, "lobby", "title", "ui", "lobby-title").LobbyTitle
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u14 = v1.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "bed-coin-showcase").BedCoinShowcase
local u15 = v1.import(script, script.Parent.Parent.Parent, "clan", "RewardShowcase", "clan-tag-chat-color-showcase").ClanTagChatColorShowcase
local u16 = v1.import(script, script.Parent.Parent.Parent, "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u17 = v1.import(script, script.Parent.Parent.Parent, "kit-shop", "ui", "misc", "kit-viewport").KitViewport
return {
    ["RewardShowcase"] = v9.new(u8)(function(p18, p19) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u13
            [3] = u3
            [4] = u7
            [5] = u11
            [6] = u17
            [7] = u12
            [8] = u16
            [9] = u5
            [10] = u10
            [11] = u14
            [12] = u4
            [13] = u15
            [14] = u6
        --]]
        local _ = p19.useState
        local _ = p19.useEffect
        local v20 = {}
        for v21, v22 in p18 do
            v20[v21] = v22
        end
        v20.Reward = nil
        v20.GroupTransparency = nil
        v20.DisableTooltip = nil
        v20[u8.Children] = nil
        local v23 = -1
        local v24 = p18.Reward.clanShopContribution
        if v24 == 0 or (v24 ~= v24 or not v24) then
            local v25 = p18.Reward.consumable
            if v25 ~= nil then
                v25 = v25.amount
            end
            if v25 == 0 or (v25 ~= v25 or not v25) then
                local v26 = p18.Reward.eventCurrency
                if v26 ~= nil then
                    v26 = v26.amount
                end
                if v26 == 0 or (v26 ~= v26 or not v26) then
                    local v27 = p18.Reward.battlepassXP
                    if v27 ~= nil then
                        v27 = v27.amount
                    end
                    if v27 ~= 0 and (v27 == v27 and v27) then
                        v23 = p18.Reward.battlepassXP
                        if v23 ~= nil then
                            v23 = v23.amount
                        end
                    end
                else
                    v23 = p18.Reward.eventCurrency
                    if v23 ~= nil then
                        v23 = v23.amount
                    end
                end
            else
                v23 = p18.Reward.consumable
                if v23 ~= nil then
                    v23 = v23.amount
                end
            end
        else
            v23 = p18.Reward.clanShopContribution
        end
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        for v29, v30 in v20 do
            v28[v29] = v30
        end
        local v31 = not p18.DisableTooltip
        if v31 then
            local v32 = {}
            local v33 = #v32
            local v34 = {}
            local v35 = p18.Reward.comingSoonReward
            if v35 ~= nil then
                v35 = v35.text
            end
            if v35 == nil then
                local v36 = u13.getRewardName(p18.Reward)
                v35 = v36 == nil and "" or v36
            end
            v34.Text = v35
            v34.Font = Enum.Font.SourceSansBold
            v34.TextSize = 16
            v34.Limits = Vector2.new(300, 60)
            v32[v33 + 1] = u8.createElement(u3, v34)
            local v37 = u13.getRewardType(p18.Reward) ~= ""
            if v37 then
                local v38 = {}
                local v39 = u13.getRewardType(p18.Reward)
                v38.Text = v39 == nil and "" or v39
                v38.Font = Enum.Font.SourceSans
                v38.TextColor3 = Color3.fromRGB(191, 191, 191)
                v38.TextSize = 14
                v38.Limits = Vector2.new(300, 60)
                v37 = u8.createElement(u3, v38)
            end
            if v37 then
                v32[v33 + 2] = v37
            end
            v31 = u8.createElement(u7, {}, v32)
        end
        local v40 = {}
        local v41 = #v40
        if v31 then
            v40[v41 + 1] = v31
        end
        local v42 = #v40
        local v43
        if p18.Reward.title then
            local v44 = {
                ["TitleType"] = p18.Reward.title
            }
            local v45 = {}
            local v46 = p18.GroupTransparency
            v45.TextTransparency = v46 == nil and 0 or v46
            v45.ZIndex = p18.ZIndex
            v44.TextLabelProps = v45
            v43 = u8.createElement(u11, v44)
        elseif p18.Reward.kit then
            v43 = u8.createElement(u17, {
                ["Kit"] = p18.Reward.kit,
                ["ImageTransparency"] = p18.GroupTransparency,
                ["ZIndex"] = p18.ZIndex
            })
        elseif p18.Reward.kitSkin then
            v43 = u8.createElement(u17, {
                ["Kit"] = u12[p18.Reward.kitSkin].kit,
                ["Skin"] = p18.Reward.kitSkin,
                ["ImageTransparency"] = p18.GroupTransparency,
                ["ZIndex"] = p18.ZIndex
            })
        elseif p18.Reward.emote then
            v43 = u8.createElement(u16, {
                ["PlaySound"] = true,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Emote"] = p18.Reward.emote,
                ["Transparency"] = p18.GroupTransparency,
                ["ZIndex"] = p18.ZIndex
            })
        elseif p18.Reward.itemSkin and not u5.isHoarceKat() then
            v43 = u8.createElement(u10, {
                ["ItemSkin"] = p18.Reward.itemSkin,
                ["ViewportTransparency"] = p18.GroupTransparency
            })
        else
            local v47 = p18.Reward.bedCoins
            if v47 == 0 or (v47 ~= v47 or not v47) then
                if p18.Reward.comingSoonReward then
                    v43 = u8.createFragment({
                        ["ComingSoon"] = u8.createElement("TextLabel", {
                            ["BackgroundTransparency"] = 1,
                            ["TextScaled"] = true,
                            ["BorderSizePixel"] = 0,
                            ["AutoLocalize"] = true,
                            ["Text"] = p18.Reward.comingSoonReward.text,
                            ["Size"] = UDim2.fromScale(1, 1),
                            ["TextColor3"] = u4.WHITE,
                            ["FontFace"] = Font.new(Font.fromEnum(Enum.Font.Roboto).Family, Enum.FontWeight.Regular),
                            ["ZIndex"] = p18.ZIndex
                        })
                    })
                elseif p18.Reward.clanTagChatColor == nil then
                    local v48 = u13.getRewardImageId(p18.Reward)
                    if v48 == "" or not v48 then
                        v43 = u8.createFragment({
                            ["RewardText"] = u8.createElement("TextLabel", {
                                ["RichText"] = true,
                                ["TextScaled"] = true,
                                ["BackgroundTransparency"] = 1,
                                ["Size"] = UDim2.fromScale(0.8, 0.4),
                                ["Position"] = UDim2.fromScale(0.5, 0.5),
                                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                                ["Text"] = "<b>" .. u13.getRewardName(p18.Reward) .. "</b>",
                                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                                ["TextTransparency"] = p18.GroupTransparency,
                                ["ZIndex"] = p18.ZIndex
                            })
                        })
                    else
                        v43 = u8.createFragment({
                            ["RewardShowcase"] = u8.createElement("ImageLabel", {
                                ["BackgroundTransparency"] = 1,
                                ["Image"] = u13.getRewardImageId(p18.Reward),
                                ["Size"] = UDim2.fromScale(1, 1),
                                ["ScaleType"] = Enum.ScaleType.Fit,
                                ["ImageTransparency"] = p18.GroupTransparency,
                                ["ZIndex"] = p18.ZIndex
                            }, { u8.createElement("UIListLayout", {
                                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center
                                }) })
                        })
                    end
                else
                    v43 = u8.createElement(u15, {
                        ["ClanTagChatColor"] = p18.Reward.clanTagChatColor,
                        ["Transparency"] = p18.GroupTransparency,
                        ["ZIndex"] = p18.ZIndex
                    })
                end
            else
                v43 = u8.createElement(u14, {
                    ["showText"] = true,
                    ["amount"] = p18.Reward.bedCoins,
                    ["Transparency"] = p18.GroupTransparency,
                    ["ZIndex"] = p18.ZIndex
                })
            end
        end
        v40[v42 + 1] = v43
        local v49 = #v40
        local v50
        if v23 > 0 then
            v50 = u8.createFragment({
                ["RewardText"] = u8.createElement("TextLabel", {
                    ["TextScaled"] = true,
                    ["TextXAlignment"] = "Right",
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.275),
                    ["Position"] = UDim2.fromScale(1, 1),
                    ["AnchorPoint"] = Vector2.new(1, 1),
                    ["Text"] = "x" .. tostring(v23),
                    ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.ExtraBold),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["ZIndex"] = p18.ZIndex
                }, { u8.createElement("UIStroke", {
                        ["Thickness"] = 2,
                        ["Transparency"] = 0.4,
                        ["Color"] = Color3.fromRGB(0, 0, 0)
                    }) })
            })
        else
            v50 = false
        end
        if v50 then
            v40[v49 + 1] = v50
        end
        local v51 = #v40
        local v52 = p18[u8.Children]
        if v52 then
            for v53, v54 in v52 do
                if type(v53) == "number" then
                    v40[v51 + v53] = v54
                else
                    v40[v53] = v54
                end
            end
        end
        return u8.createFragment({
            ["RewardShowcase"] = u8.createElement(u6, v28, v40)
        })
    end)
}