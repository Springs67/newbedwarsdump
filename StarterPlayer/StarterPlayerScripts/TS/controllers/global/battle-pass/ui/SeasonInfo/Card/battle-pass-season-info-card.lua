local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.CornerFiller
local u5 = v2.Empty
local u6 = v2.StringUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-meta").getBattlePassMetadata
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["BattlePassInfoCard"] = v8.new(u7)(function(u12, p13) --[[ Line: 13 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u7
            [3] = u3
            [4] = u10
            [5] = u11
            [6] = u6
            [7] = u5
            [8] = u4
        --]]
        local _ = p13.useState
        local v14 = u9(u12.battlepass)
        local v15 = v14.endDate
        local v16 = v15 - os.time() <= 86400
        local function v30(p17) --[[ Line: 19 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u3
                [3] = u10
                [4] = u12
                [5] = u11
            --]]
            local v18 = p17.Size
            local v19 = p17.AnchorPoint
            local v20 = p17.Position
            local v21 = u7.createFragment
            local v22 = {}
            local v23 = u7.createElement
            local v24 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0,
                ["LayoutOrder"] = 2,
                ["AnchorPoint"] = v19,
                ["Position"] = v20,
                ["Size"] = v18 or UDim2.new(1, 0, 0.1, 0),
                ["BackgroundColor3"] = u3.hexColor(5921943)
            }
            local v25 = { (u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                })) }
            local v26 = u7.createElement
            local v27 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundTransparency"] = 0
            }
            local v28 = UDim2.new
            local v29 = u10.getCurrExperienceProgression(u12.store.BattlePass.experience, u12.store.BattlePass.level) / u10.getExperienceForLevel(u12.store.BattlePass.level + 1)
            v27.Size = v28(math.min(v29, 1), 0, 1, 0)
            v27.BackgroundColor3 = u11.textPrimary
            v25.ProgressBar = v26("Frame", v27, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(1, 0)
                }) })
            v22.ProgressBarWrapper = v23("Frame", v24, v25)
            return v21(v22)
        end
        local v31 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["AnchorPoint"] = u12.AnchorPoint,
            ["Position"] = u12.Position,
            ["Size"] = u12.Size,
            ["BackgroundColor3"] = u11.backgroundTertiary
        }
        local v32 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Top,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 4)
            }), u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }) }
        local _ = #v32
        local v33 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.45, -2)
        }
        local v34 = {
            u7.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.175, 0),
                ["PaddingBottom"] = UDim.new(0.15, 0),
                ["PaddingLeft"] = UDim.new(0.04, 0),
                ["PaddingRight"] = UDim.new(0.04, 0)
            }),
            u7.createElement("UIListLayout", {
                ["SortOrder"] = "LayoutOrder",
                ["FillDirection"] = Enum.FillDirection.Horizontal,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.05, 0)
            }),
            ["BattlePassIcon"] = u7.createElement("ImageLabel", {
                ["SizeConstraint"] = "RelativeYY",
                ["BackgroundTransparency"] = 1,
                ["ScaleType"] = "Fit",
                ["LayoutOrder"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = u10.BATTLE_PASS_SEASON_ICON
            })
        }
        local _ = #v34
        local v35 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.75, 1)
        }
        local v36 = { u7.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local v37 = #v36
        local v38 = {
            ["BackgroundTransparency"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.5, -0.025)
        }
        local v39 = v14.name
        if v39 == nil then
            local v40 = v14.seasonNumber
            if v40 == 0 or (v40 ~= v40 or not v40) then
                v39 = ""
            else
                local v41 = v14.seasonNumber
                v39 = "Season " .. tostring(v41)
            end
        end
        v38.Text = v39
        v38.TextXAlignment = Enum.TextXAlignment.Left
        v38.TextColor3 = u3.WHITE
        v38.TextScaled = true
        v38.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        v36[v37 + 1] = u7.createElement("TextLabel", v38)
        local v42 = v37 + 2
        local v43 = u7.createElement
        local v44 = {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["TextScaled"] = true,
            ["RichText"] = true,
            ["Size"] = UDim2.new(1, 0, 0.5, -0.025),
            ["Text"] = u6.fromNow(v15, {
                ["hideIfZero"] = true,
                ["long"] = true,
                ["seconds"] = v16 and true or false,
                ["minutes"] = v16 and true or false
            }) .. "remaining",
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextColor3"] = u3.WHITE,
            ["Font"] = Enum.Font.Roboto
        }
        v36[v42] = v43("TextLabel", v44)
        v34.SeasonInfoHeader = u7.createElement(u5, v35, v36)
        v32.CardHeader = u7.createElement("Frame", v33, v34)
        local v45 = u7.createElement
        local v46 = {
            ["BorderSizePixel"] = 0,
            ["BackgroundTransparency"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.new(1, 0, 0.55, -2),
            ["BackgroundColor3"] = u11.backgroundPrimary
        }
        local v47 = { u7.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0, 5)
            }), (u7.createElement(u4, {
                ["TopRight"] = true,
                ["TopLeft"] = true,
                ["ZIndex"] = 2
            })) }
        local v48 = u7.createElement
        local v49 = u5
        local v50 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v51 = {}
        local v52 = u7.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 12),
            ["PaddingBottom"] = UDim.new(0, 12),
            ["PaddingLeft"] = UDim.new(0, 16),
            ["PaddingRight"] = UDim.new(0, 16)
        })
        local v53 = u7.createElement("UIListLayout", {
            ["SortOrder"] = "LayoutOrder",
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v54 = u7.createElement
        local v55 = u5
        local v56 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.new(1, 0, 0.4, 0)
        }
        local v57 = {}
        local v58 = u7.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Horizontal,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        })
        local v59 = u7.createElement
        local v60 = {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["Size"] = UDim2.new(0.5, 0, 1, 0)
        }
        local v61 = u12.store.BattlePass.level
        v60.Text = "Lv. " .. tostring(v61)
        v60.TextXAlignment = Enum.TextXAlignment.Left
        v60.TextYAlignment = Enum.TextYAlignment.Bottom
        v60.TextColor3 = Color3.new(1, 1, 1)
        v60.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        local v62 = v59("TextLabel", v60)
        local v63 = u7.createElement
        local v64 = {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["TextScaled"] = true,
            ["Size"] = UDim2.new(0.5, 0, 1, 0)
        }
        local v65 = u12.store.BattlePass.level + 1
        v64.Text = "Lv. " .. tostring(v65)
        v64.TextXAlignment = Enum.TextXAlignment.Right
        v64.TextYAlignment = Enum.TextYAlignment.Bottom
        v64.TextColor3 = Color3.new(1, 1, 1)
        v64.FontFace = Font.new("Roboto", Enum.FontWeight.Bold)
        __set_list(v57, 1, {v58, v62, v63("TextLabel", v64)})
        local v66 = v54(v55, v56, v57)
        local v67 = u7.createElement(v30, {
            ["Size"] = UDim2.new(1, 0, 0.2, 0)
        })
        local v68 = u7.createElement
        local v69 = {
            ["BackgroundTransparency"] = 1,
            ["TextTransparency"] = 0.3,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.new(1, 0, 0.3, 0)
        }
        local v70 = u10.getCurrExperienceProgression(u12.store.BattlePass.experience, u12.store.BattlePass.level)
        local v71 = math.floor(v70)
        local v72 = tostring(v71)
        local v73 = u10.getExperienceForLevel
        local v74 = u12.store.BattlePass.level + 1
        v69.Text = v72 .. " / " .. tostring(v73(v74))
        v69.TextXAlignment = Enum.TextXAlignment.Right
        v69.TextYAlignment = Enum.TextYAlignment.Bottom
        v69.TextColor3 = Color3.new(1, 1, 1)
        v69.Font = Enum.Font.Roboto
        __set_list(v51, 1, {v52, v53, v66, v67, v68("TextLabel", v69)})
        v47.PersonalSeasonProgressContainer = v48(v49, v50, v51)
        v32.CardContentWrapper = v45("Frame", v46, v47)
        return u7.createFragment({
            ["BattlePassInfoCard"] = u7.createElement("Frame", v31, v32)
        })
    end)
}