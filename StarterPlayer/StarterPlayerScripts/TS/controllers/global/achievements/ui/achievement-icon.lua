local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoSizedText
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.TooltipContainer
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-rank").AchievementRank
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "achievement", "achievement-util").AchievementUtil
return {
    ["AchievementIcon"] = v8.new(u7)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u10
            [3] = u9
            [4] = u4
            [5] = u5
            [6] = u3
            [7] = u6
        --]]
        local _ = p12.useState
        if not p11.Id then
            return u7.createFragment()
        end
        local v13 = u10.getMeta(p11.Id)
        if not v13 then
            return u7.createFragment()
        end
        local v14 = u10.getRankMeta(v13.rank or u9.COMMON)
        local v15 = u10.getTierGroup(p11.Id)
        local v16
        if v15 == nil then
            v16 = v15
        else
            v16 = -1
            for v17, v18 in v15 do
                local _ = v17 - 1
                if v18 == p11.Id == true then
                    v16 = v17 - 1
                    break
                end
            end
        end
        if v16 == 0 then
            v14 = u10.getRankMeta(u9.RARE)
        else
            local v19
            if v15 == nil then
                v19 = v15
            else
                v19 = -1
                for v20, v21 in v15 do
                    local _ = v20 - 1
                    if v21 == p11.Id == true then
                        v19 = v20 - 1
                        break
                    end
                end
            end
            if v19 == 1 then
                v14 = u10.getRankMeta(u9.EPIC)
            else
                if v15 ~= nil then
                    v15 = -1
                    for v22, v23 in v15 do
                        local _ = v22 - 1
                        if v23 == p11.Id == true then
                            v15 = v22 - 1
                            break
                        end
                    end
                end
                if v15 == 2 then
                    v14 = u10.getRankMeta(u9.LEGENDARY)
                end
            end
        end
        local v24 = v13.icon
        if v24 ~= nil then
            v24 = v24.image
        end
        if v24 == nil then
            v24 = u10.DEFAULT_ICON
        end
        local v25
        if v13.icon then
            v25 = v13.icon
            if v25 ~= nil then
                v25 = v25.full
            end
        else
            v25 = true
        end
        local v26 = v14.frame
        local v27 = v14.background
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v29 = p11.FrameProps
        if v29 then
            for v30, v31 in v29 do
                v28[v30] = v31
            end
        end
        local v32
        if v25 then
            local v33 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v24,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["ImageColor3"] = u4.BLACK,
                ["Visible"] = p11.Darkened
            }
            local v34 = p11.FrameProps
            if v34 ~= nil then
                v34 = v34.ZIndex
            end
            v33.ZIndex = v34 == nil and 3 or v34
            v32 = u7.createFragment({
                ["AchievementIconDark"] = u7.createElement("ImageLabel", v33)
            })
        else
            v32 = v25
        end
        local v35 = { u7.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 1
            }) }
        local v36 = #v35
        if v32 then
            v35[v36 + 1] = v32
        end
        local v37 = #v35
        local v38
        if v25 then
            local v39 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v24,
                ["ImageTransparency"] = p11.Darkened and 0.5 or 0,
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v40 = p11.FrameProps
            if v40 ~= nil then
                v40 = v40.ZIndex
            end
            v39.ZIndex = (v40 == nil and 0 or v40) + 2
            v38 = u7.createFragment({
                ["AchievementIconImage"] = u7.createElement("ImageLabel", v39)
            })
        else
            v38 = v25
        end
        if v38 then
            v35[v37 + 1] = v38
        end
        local v41 = #v35
        local v42 = not v25
        if v42 then
            local v43 = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5)
            }
            local v44 = {}
            local _ = #v44
            local v45 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v24,
                ["ImageTransparency"] = p11.Darkened and 0.5 or 0,
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v46 = p11.FrameProps
            if v46 ~= nil then
                v46 = v46.ZIndex
            end
            v45.ZIndex = (v46 == nil and 0 or v46) + (p11.Darkened and 4 or 3)
            v44.AchievementIconSymbol = u7.createElement("ImageLabel", v45)
            local v47 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v24,
                ["ImageColor3"] = u4.BLACK,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Visible"] = p11.Darkened
            }
            local v48 = p11.FrameProps
            if v48 ~= nil then
                v48 = v48.ZIndex
            end
            v47.ZIndex = (v48 == nil and 0 or v48) + 3
            v44.AchievementIconSymbolDark = u7.createElement("ImageLabel", v47)
            local v49 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v26,
                ["ImageTransparency"] = p11.Darkened and 0.5 or 0,
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v50 = p11.FrameProps
            if v50 ~= nil then
                v50 = v50.ZIndex
            end
            v49.ZIndex = (v50 == nil and 0 or v50) + (p11.Darkened and 3 or 2)
            v44.AchievementIconFrame = u7.createElement("ImageLabel", v49)
            local v51 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v26,
                ["ImageColor3"] = u4.BLACK,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Visible"] = p11.Darkened
            }
            local v52 = p11.FrameProps
            if v52 ~= nil then
                v52 = v52.ZIndex
            end
            v51.ZIndex = (v52 == nil and 0 or v52) + 2
            v44.AchievementIconFrameDark = u7.createElement("ImageLabel", v51)
            local v53 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v27,
                ["ImageTransparency"] = p11.Darkened and 0.5 or 0,
                ["ScaleType"] = Enum.ScaleType.Fit
            }
            local v54 = p11.FrameProps
            if v54 ~= nil then
                v54 = v54.ZIndex
            end
            v53.ZIndex = (v54 == nil and 0 or v54) + 2
            v44.AchievementIconBackground = u7.createElement("ImageLabel", v53)
            local v55 = {
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["Image"] = v27,
                ["ImageColor3"] = u4.BLACK,
                ["ScaleType"] = Enum.ScaleType.Fit,
                ["Visible"] = p11.Darkened
            }
            local v56 = p11.FrameProps
            if v56 ~= nil then
                v56 = v56.ZIndex
            end
            v55.ZIndex = (v56 == nil and 0 or v56) + 1
            v44.AchievementIconBackgroundDark = u7.createElement("ImageLabel", v55)
            v42 = u7.createElement(u5, v43, v44)
        end
        if v42 then
            v35[v41 + 1] = v42
        end
        local v57 = #v35
        local v58 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5) + UDim2.fromOffset(10, 15)
        }
        if v25 then
            v26 = v24
        end
        v58.Image = v26
        v58.BackgroundTransparency = 1
        v58.ScaleType = Enum.ScaleType.Fit
        v58.ImageColor3 = u4.BLACK
        v58.ImageTransparency = 0.6
        local v59 = p11.FrameProps
        if v59 ~= nil then
            v59 = v59.ZIndex
        end
        v58.ZIndex = (v59 == nil and 0 or v59) + 1
        v58.Visible = not p11.Simple
        v35.AchievementIconShadow = u7.createElement("ImageLabel", v58)
        local v60 = p11.ShowTooltip
        if v60 then
            local v61 = {}
            local v62 = #v61
            local v63 = {}
            local v64
            if v13 == nil then
                v64 = v13
            else
                v64 = v13.title
            end
            v63.Text = v64
            v63.Font = Enum.Font.SourceSansBold
            v63.TextSize = 16
            v63.Limits = Vector2.new(300, 60)
            v61[v62 + 1] = u7.createElement(u3, v63)
            local v65 = {}
            if v13 ~= nil then
                local v66
                if v13 == nil then
                    v66 = v13
                else
                    v66 = v13.goal
                    if v66 ~= nil then
                        v66 = v66.value
                    end
                end
                v13 = v13.description(v66)
            end
            v65.Text = v13
            v65.Font = Enum.Font.SourceSans
            v65.TextColor3 = Color3.fromRGB(191, 191, 191)
            v65.TextSize = 14
            v65.TextXAlignment = Enum.TextXAlignment.Left
            v65.Limits = Vector2.new(300, 60)
            v61[v62 + 2] = u7.createElement(u3, v65)
            v60 = u7.createElement(u6, {}, v61)
        end
        if v60 then
            v35[v57 + 1] = v60
        end
        return u7.createFragment({
            ["AchievementIcon"] = u7.createElement(u5, v28, v35)
        })
    end)
}