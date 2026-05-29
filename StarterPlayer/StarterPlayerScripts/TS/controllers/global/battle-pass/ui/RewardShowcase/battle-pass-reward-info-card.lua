local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.AutoSizedText
local u5 = v3.ButtonComponent
local u6 = v3.ColorUtil
local u7 = v3.Empty
local u8 = v3.IconButton
local u9 = v3.TooltipContainer
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-reward", "battle-pass-reward-display-meta").BPRewardDisplayMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").getBedwarsKitMeta
local u18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-display-type").RewardDisplayType
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward", "reward-utils").RewardUtils
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BattlePassRewardInfoCard"] = v13.new(u12)(function(u22, _) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u20
            [3] = u11
            [4] = u19
            [5] = u15
            [6] = u6
            [7] = u12
            [8] = u21
            [9] = u7
            [10] = u5
            [11] = u10
            [12] = u8
            [13] = u2
            [14] = u14
            [15] = u18
            [16] = u9
            [17] = u4
            [18] = u17
        --]]
        local v23 = u22.Reward.level <= u22.BattlePass.level
        local v24 = u22.Reward.level > u16.MAX_LEVEL
        local function v29() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u22
                [2] = u11
                [3] = u19
                [4] = u15
                [5] = u20
            --]]
            local v25 = u22.Reward.comingSoon
            if v25 then
                local v26 = nil
                for v27, v28 in u11.values(u19) do
                    local _ = v27 - 1
                    if v25.rewardDisplayType == v28 == true then
                        v26 = v28
                        break
                    end
                end
                if v26 then
                    return u15[v26].name
                end
            end
            return u20.getRewardType(u22.Reward)
        end
        local v30 = {}
        for v31, v32 in u22 do
            v30[v31] = v32
        end
        v30.BattlePass = nil
        v30.Reward = nil
        local v33 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0.4,
            ["ZIndex"] = 100,
            ["BackgroundColor3"] = u6.BLACK
        }
        for v34, v35 in v30 do
            v33[v34] = v35
        end
        local v36 = { u12.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 16),
                ["PaddingBottom"] = UDim.new(0, 16),
                ["PaddingLeft"] = UDim.new(0, 16),
                ["PaddingRight"] = UDim.new(0, 16)
            }), u12.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 10)
            }) }
        local _ = #v36
        local v37 = {
            ["Size"] = UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v38 = {}
        local v39 = u12.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0, 4)
        })
        local v40 = u12.createElement
        local v41 = {
            ["BackgroundTransparency"] = 1,
            ["TextSize"] = 18,
            ["LayoutOrder"] = 1,
            ["ZIndex"] = 100,
            ["Size"] = UDim2.new(1, 0, 0, 18),
            ["AutomaticSize"] = Enum.AutomaticSize.X
        }
        local v42 = v29()
        v41.Text = tostring(v42)
        v41.TextXAlignment = Enum.TextXAlignment.Left
        v41.TextColor3 = u21.textPrimary
        v41.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        __set_list(v38, 1, {v39, v40("TextLabel", v41), u12.createElement("TextLabel", {
    ["BackgroundTransparency"] = 1,
    ["TextSize"] = 22,
    ["LayoutOrder"] = 2,
    ["ZIndex"] = 100,
    ["Size"] = UDim2.new(1, 0, 0, 18),
    ["AutomaticSize"] = Enum.AutomaticSize.X,
    ["Text"] = u22.Reward.comingSoon and "Coming Soon" or u20.getRewardName(u22.Reward),
    ["TextXAlignment"] = Enum.TextXAlignment.Left,
    ["TextColor3"] = u6.WHITE,
    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold)
})})
        local v43 = #v38
        local v44 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0, 18),
            ["AutomaticSize"] = Enum.AutomaticSize.XY
        }
        local v45 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v46 = #v45
        local v47 = not v23
        if v47 then
            local v48 = u12.createFragment
            local v49 = {}
            local v50 = u12.createElement
            local v51 = {
                ["BackgroundTransparency"] = 1,
                ["TextTransparency"] = 0.3,
                ["TextSize"] = 16,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 100,
                ["Size"] = UDim2.new(1, 0, 0, 16),
                ["AutomaticSize"] = Enum.AutomaticSize.X
            }
            local v52 = u22.Reward.level
            v51.Text = "Requires Level " .. tostring(v52)
            v51.TextXAlignment = Enum.TextXAlignment.Left
            v51.TextColor3 = u6.WHITE
            v51.Font = Enum.Font.Roboto
            v49.RequiresLevelText = v50("TextLabel", v51)
            v47 = v48(v49)
        end
        if v47 then
            v45[v46 + 1] = v47
        end
        v45[#v45 + 1] = u12.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["TextSize"] = 16,
            ["LayoutOrder"] = 2,
            ["ZIndex"] = 100,
            ["Size"] = UDim2.new(1, 0, 0, 16),
            ["AutomaticSize"] = Enum.AutomaticSize.X,
            ["Text"] = (u22.BattlePass.paid or not u22.Reward.paid) and (v23 and "Claimed" or "") or "Requires Battle Pass",
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u6.WHITE,
            ["Font"] = Enum.Font.Roboto
        })
        v38[v43 + 1] = u12.createElement("Frame", v44, v45)
        v36.CardInfo = u12.createElement(u7, v37, v38)
        local v53 = {
            ["ZIndex"] = 120,
            ["AnchorPoint"] = Vector2.new(0, 1),
            ["Position"] = UDim2.new(0, 0, 1, 0),
            ["Size"] = UDim2.new(1, 0, 0, 32),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        local v54 = { u12.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v55 = #v54
        local v56 = u22.BattlePass.paid and not (v23 or v24)
        if v56 then
            local v57 = u12.createElement
            local v58 = u5
            local v59 = {
                ["TextSize"] = 14,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 120,
                ["Selectable"] = true
            }
            local v60 = u22.Reward.level - u22.BattlePass.level
            v59.Text = "PURCHASE " .. tostring(v60) .. " LEVELS"
            v59.Size = UDim2.new(0.85, 0, 0, 32)
            function v59.OnClick() --[[ Line: 191 ]]
                --[[
                Upvalues:
                    [1] = u10
                    [2] = u22
                --]]
                u10.Controllers.BattlePassController:promptPurchaseToLevel(u22.Reward.level)
            end
            v59.CornerRadius = UDim.new(0, 5)
            v59.BackgroundColor3 = u21.backgroundSuccess
            v56 = v57(v58, v59)
        end
        if v56 then
            v54[v55 + 1] = v56
        end
        local v61 = #v54
        local v62 = not u22.BattlePass.paid and u22.Reward.paid
        if v62 then
            v62 = u12.createElement(u5, {
                ["Text"] = "PURCHASE BATTLE PASS",
                ["TextSize"] = 14,
                ["LayoutOrder"] = 1,
                ["ZIndex"] = 120,
                ["Selectable"] = true,
                ["Size"] = UDim2.new(0.85, 0, 0, 32),
                ["OnClick"] = function() --[[ Name: OnClick, Line 208 ]]
                    --[[
                    Upvalues:
                        [1] = u10
                    --]]
                    u10.Controllers.BattlePassController:promptBattlePassPurchase()
                end,
                ["CornerRadius"] = UDim.new(0, 5),
                ["BackgroundColor3"] = u21.backgroundSuccess
            })
        end
        if v62 then
            v54[v61 + 1] = v62
        end
        local v63 = #v54
        local v64 = u22.Reward.kit
        if v64 then
            v64 = u12.createElement(u8, {
                ["ZIndex"] = 120,
                ["LayoutOrder"] = 2,
                ["Selectable"] = true,
                ["Size"] = UDim2.new(0.1, 0, 0, 32),
                ["OnClick"] = function() --[[ Name: OnClick, Line 224 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u14
                        [3] = u22
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u14.KIT_DETAILS_APP, {
                        ["SelectedKit"] = u22.Reward.kit
                    })
                end,
                ["Image"] = u18.EYE_REGULAR,
                ["IconProps"] = {
                    ["ScaleType"] = "Fit"
                }
            }, { u12.createElement(u9, {}, { u12.createElement(u4, {
                        ["Text"] = "Open Kit Shop",
                        ["TextSize"] = 16,
                        ["Font"] = Enum.Font.SourceSansBold,
                        ["Limits"] = Vector2.new(300, 60)
                    }), u12.createElement(u4, {
                        ["TextSize"] = 14,
                        ["Text"] = u17(u22.Reward.kit).name,
                        ["Font"] = Enum.Font.SourceSansSemibold,
                        ["Limits"] = Vector2.new(300, 500)
                    }) }) })
        end
        if v64 then
            v54[v63 + 1] = v64
        end
        v36.CardButtons = u12.createElement(u7, v53, v54)
        return u12.createFragment({
            ["RewardInfoCard"] = u12.createElement("Frame", v33, v36)
        })
    end)
}