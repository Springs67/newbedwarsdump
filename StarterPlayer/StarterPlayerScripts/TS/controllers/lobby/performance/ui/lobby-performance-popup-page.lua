local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").QueueMeta
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["LobbyPerformancePopupPage"] = v4.new(u3)(function(p11, p12) --[[ Line: 12 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u8
            [3] = u10
            [4] = u3
            [5] = u2
            [6] = u6
            [7] = u9
            [8] = u5
        --]]
        local _ = p12.useState
        local _ = p12.useEffect
        local v13 = p11.MatchInfo.Kit == u7.NONE and "" or " while playing as " .. u8[p11.MatchInfo.Kit].name
        local function v26(p14, p15, p16, p17) --[[ Line: 16 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u3
            --]]
            local v18 = p17 % 2
            local v19
            if v18 == 0 or (v18 ~= v18 or not v18) then
                v19 = u10.backgroundTertiary
            else
                v19 = u10.backgroundSecondary
            end
            local v20 = u3.createFragment
            local v21 = {}
            local v22 = p15 .. "_Row"
            local v23 = u3.createElement
            local v24 = {
                ["BackgroundTransparency"] = 0,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.19),
                ["BackgroundColor3"] = v19,
                ["LayoutOrder"] = p17
            }
            local v25 = {
                u3.createElement("UIListLayout", {
                    ["FillDirection"] = "Horizontal",
                    ["SortOrder"] = "LayoutOrder",
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["Padding"] = UDim.new(0.05, 0.05)
                }),
                [p15 .. "_Icon"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 0,
                    ["Size"] = UDim2.fromScale(0.95, 0.95),
                    ["SizeConstraint"] = Enum.SizeConstraint.RelativeYY,
                    ["Image"] = p14,
                    ["ScaleType"] = Enum.ScaleType.Fit
                }),
                [p15 .. "_Label"] = u3.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.5, 0.6),
                    ["Text"] = p15,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.ArialBold,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                }),
                [p15 .. "_Earned"] = u3.createElement("TextLabel", {
                    ["RichText"] = true,
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(0.25, 0.6),
                    ["Text"] = p16,
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["Font"] = Enum.Font.Arial,
                    ["TextXAlignment"] = Enum.TextXAlignment.Left,
                    ["TextYAlignment"] = Enum.TextYAlignment.Center
                })
            }
            v21[v22] = v23("Frame", v24, v25)
            return v20(v21)
        end
        local v27 = u3.createElement
        local v28 = u2
        local v29 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.9)
        }
        local v30 = {
            u3.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.015, 0),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
            }),
            ["ImageWrapper"] = u3.createElement("Frame", {
                ["LayoutOrder"] = 1,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.fromScale(0.38, 0.3)
            }, {
                ["Image"] = u3.createElement("ImageLabel", {
                    ["BackgroundTransparency"] = 1,
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                    ["Size"] = UDim2.fromScale(1, 1),
                    ["Image"] = u8[p11.MatchInfo.Kit].renderImage,
                    ["ScaleType"] = Enum.ScaleType.Fit
                })
            })
        }
        local v31 = u3.createElement
        local v32 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.95, 0.65),
            ["BackgroundColor3"] = u10.backgroundPrimary
        }
        local v33 = { (u3.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            })) }
        local v34 = u3.createElement
        local v35 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(0.9, 0.9),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        }
        local v36 = {}
        local v37 = u3.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        })
        local v38 = u3.createElement("TextLabel", {
            ["RichText"] = true,
            ["LineHeight"] = 1.05,
            ["TextScaled"] = true,
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.15),
            ["Text"] = "Your performance was finalized from a " .. u6[p11.MatchInfo.QueueType].title .. " match you left" .. v13 .. ".",
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["Font"] = Enum.Font.Arial,
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        local v39 = u3.createElement(u2, {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(0.9, 0.05)
        })
        local v40 = u3.createElement
        local v41 = u2
        local v42 = {
            ["LayoutOrder"] = 3,
            ["Size"] = UDim2.fromScale(1, 0.8)
        }
        local v43 = {}
        local v44 = u3.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center
        })
        local v45 = u9.BED_COIN_ICON
        local v46 = p11.Earned.BedCoins
        local v47 = v26(v45, "BedCoins", tostring(v46), 1)
        local v48 = u5.BATTLE_PASS_SEASON_ICON
        local v49 = p11.Earned.BattlepassXp
        local v50 = v26(v48, "Battlepass XP", tostring(v49), 2)
        local v51 = u9.STAR_SOLID
        local v52 = p11.Earned.PlayerLevelXp
        local v53 = v26(v51, "Player Level XP", tostring(v52), 3)
        local v54 = u9.CLAN_CP_COIN
        local v55 = p11.Earned.ClanContribution
        local v56 = v26(v54, "Clan Contribution", tostring(v55), 4)
        local v57 = u9.STAR_SOLID
        local v58 = p11.Earned.ArmorTrimXp
        __set_list(v43, 1, {v44, v47, v50, v53, v56, v26(v57, "Armor Trim XP", tostring(v58), 5)})
        __set_list(v36, 1, {v37, v38, v39, v40(v41, v42, v43)})
        v33.TextWrapper = v34("Frame", v35, v36)
        v30.Textbox = v31("Frame", v32, v33)
        return v27(v28, v29, v30)
    end)
}