local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-config").PvPArenaConfig
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "pvp-arena", "pvp-arena-types").PvPArenaStageType
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u13 = v1.import(script, script.Parent, "pvp-arena-round-icon").PvPArenaRoundIcon
return {
    ["PvPArenaRoundIconContainer"] = v8.new(u7)(function(u14, p15) --[[ Line: 15 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u13
            [4] = u6
            [5] = u3
            [6] = u10
            [7] = u11
            [8] = u12
            [9] = u5
            [10] = u4
        --]]
        local v16 = p15.useState
        local v17 = p15.useEffect
        local v18, u19 = v16("")
        v17(function() --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u9
                [3] = u14
            --]]
            u19(u9.getIconType(u9.getStageType(u14.stageNumber)))
        end, { u14.stageNumber })
        local v20 = {}
        local v21 = u14.FrameProps
        if v21 then
            for v22, v23 in v21 do
                v20[v22] = v23
            end
        end
        local v24 = {}
        local v25 = #v24
        local v26 = {
            ["iconImage"] = v18,
            ["ImageTransparency"] = u14.ImageTransparency,
            ["ImageColor3"] = u14.ImageColor3,
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v27 = u14.FrameProps
        if v27 ~= nil then
            v27 = v27.ZIndex
        end
        v26.ZIndex = v27
        v24[v25 + 1] = u7.createElement(u13, v26)
        local v28 = u9.isIntermissionStage(u14.stageNumber)
        if v28 then
            v28 = u7.createElement(u6, {}, { u7.createElement(u3, {
                    ["RichText"] = true,
                    ["Text"] = u9.getStageType(u14.stageNumber) == u10.INTERMISSON and "<u>Intermission</u>\nPurchase items from the shop with your gold." or "<u>Relic Selection</u>\nSelect your relic to become stronger.\nPurchase items from the shop with your gold.",
                    ["TextXAlignment"] = Enum.TextXAlignment.Left
                }) })
        end
        if v28 then
            v24[v25 + 2] = v28
        end
        local v29 = #v24
        local v30 = not u9.isIntermissionStage(u14.stageNumber)
        if v30 then
            local v31 = {
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Size"] = UDim2.fromScale(1, 1)
            }
            local v32 = u14.FrameProps
            if v32 ~= nil then
                v32 = v32.ZIndex
            end
            v31.ZIndex = v32
            local v33 = u9.isRewardRound(u14.roundNumber)
            if v33 then
                local v34 = {
                    ["Size"] = UDim2.fromScale(0.8, 0.8),
                    ["Position"] = UDim2.fromScale(1, 1),
                    ["AnchorPoint"] = Vector2.new(0.75, 0.75)
                }
                local v35 = u14.FrameProps
                if v35 ~= nil then
                    v35 = v35.ZIndex
                end
                v34.ZIndex = v35
                local v36 = {}
                local v37 = #v36
                local v38 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u11.STAR_SOLID,
                    ["ImageColor3"] = u12.mcGold
                }
                local v39 = u14.FrameProps
                if v39 ~= nil then
                    v39 = v39.ZIndex
                end
                v38.ZIndex = v39
                v36[v37 + 1] = u7.createElement("ImageLabel", v38, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                local v40 = {
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.75, 0.75),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Image"] = u11.STAR_SOLID,
                    ["ImageColor3"] = u12.mcYellow
                }
                local v41 = u14.FrameProps
                if v41 ~= nil then
                    v41 = v41.ZIndex
                end
                v40.ZIndex = v41
                v36[v37 + 2] = u7.createElement("ImageLabel", v40, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
                v33 = u7.createElement(u5, v34, v36)
            end
            local v42 = {}
            local v43 = u7.createElement
            local v44 = u6
            local v45 = {}
            local v46 = {}
            local v47 = u7.createElement
            local v48 = u3
            local v49 = {
                ["RichText"] = true
            }
            local v50 = "<u>Round: "
            local v51 = u14.roundNumber
            local v52 = tostring(v51)
            local v53 = "</u>\n"
            local v54
            if u9.isRewardRound(u14.roundNumber) then
                local v55 = u4.richTextColor(u12.mcGreen)
                local v56 = u9.ROUND_TEAM_HEAL_AMOUNT
                v54 = "<b>Winning Team:</b>\n\t<font color=\"" .. v55 .. "\">+" .. tostring(v56) .. "</font> Team Health\n\t<font color=\"" .. u4.richTextColor(u12.mcGreen) .. "\">+1</font> Reroll\n"
            else
                v54 = ""
            end
            local v57 = u4.richTextColor(u12.mcRed)
            local v58 = u9.getTeamDamage
            local v59 = u14.roundNumber
            v49.Text = v50 .. v52 .. v53 .. v54 .. "<b>Losing Team:</b> <font color=\"" .. v57 .. "\">-" .. tostring(v58(v59)) .. "</font> Team Health"
            v49.TextXAlignment = Enum.TextXAlignment.Left
            __set_list(v46, 1, {v47(v48, v49)})
            __set_list(v42, 1, {v43(v44, v45, v46)})
            local v60 = #v42
            if v33 then
                v42[v60 + 1] = v33
            end
            v30 = u7.createElement(u5, v31, v42)
        end
        if v30 then
            v24[v29 + 1] = v30
        end
        return u7.createElement(u5, v20, v24)
    end)
}