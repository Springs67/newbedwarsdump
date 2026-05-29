local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murder-game-roles").MurderGameRole
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "murderer", "murderer-costants").MurderGameConstants
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u11 = v1.import(script, script.Parent, "murderer-elimination-highlight").MurdererEliminationHighlight
local u12 = v1.import(script, script.Parent, "murderer-player-box").MurdererPlayerBox
return {
    ["MurdererMatchEndScreen"] = v6.new(u5)(function(u13, p14) --[[ Line: 14 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u12
            [3] = u7
            [4] = u4
            [5] = u8
            [6] = u3
            [7] = u11
            [8] = u9
            [9] = u10
        --]]
        local _ = p14.useState
        local v15 = {}
        local v16 = #v15
        local v17 = {
            ["Size"] = UDim2.fromScale(0.5, 0.45),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        }
        local v18 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.05, 0)
            }) }
        local _ = #v18
        local v19 = u13.Roles.civilian
        local function v30(p20) --[[ Line: 36 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
                [3] = u12
                [4] = u7
            --]]
            local v21 = nil
            for v22, v23 in u13.Eliminations do
                local _ = v22 - 1
                if v23.victim.offlinePlayer.userId == p20.userId == true then
                    v21 = v23
                    break
                end
            end
            local v24 = v21 ~= nil
            local v25 = 0
            local v26 = {}
            for v27, v28 in u13.Eliminations do
                local _ = v27 - 1
                if v28.killer.offlinePlayer.userId == p20.userId == true then
                    v25 = v25 + 1
                    v26[v25] = v28
                end
            end
            local v29 = #v26
            return u5.createElement(u12, {
                ["UserId"] = p20.userId,
                ["Role"] = u7.CIVILIAN,
                ["IsDead"] = v24,
                ["NumElims"] = v29
            })
        end
        local v31 = table.create(#v19)
        local v32 = {
            ["ResetOnSpawn"] = false,
            ["DisplayOrder"] = 11
        }
        for v33, v34 in v19 do
            v31[v33] = v30(v34, v33 - 1, v19)
        end
        local v35 = {
            ["LayoutOrder"] = 1,
            ["Size"] = UDim2.fromScale(1, 0.45)
        }
        local v36 = { u5.createElement("UIGridLayout", {
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 6,
                ["CellSize"] = UDim2.fromScale(0.1, 0.47),
                ["CellPadding"] = UDim2.fromScale(0.01, 0.035)
            }) }
        local v37 = #v36
        for v38, v39 in v31 do
            v36[v37 + v38] = v39
        end
        local v40 = #v36
        local v41 = u13.Roles.sheriff
        local function v52(p42) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
                [3] = u12
                [4] = u7
            --]]
            local v43 = nil
            for v44, v45 in u13.Eliminations do
                local _ = v44 - 1
                if v45.victim.offlinePlayer.userId == p42.userId == true then
                    v43 = v45
                    break
                end
            end
            local v46 = v43 ~= nil
            local v47 = 0
            local v48 = {}
            for v49, v50 in u13.Eliminations do
                local _ = v49 - 1
                if v50.killer.offlinePlayer.userId == p42.userId == true then
                    v47 = v47 + 1
                    v48[v47] = v50
                end
            end
            local v51 = #v48
            return u5.createElement(u12, {
                ["UserId"] = p42.userId,
                ["Role"] = u7.SHERIFF,
                ["IsDead"] = v46,
                ["NumElims"] = v51
            })
        end
        local v53 = table.create(#v41)
        for v54, v55 in v41 do
            v53[v54] = v52(v55, v54 - 1, v41)
        end
        for v56, v57 in v53 do
            v36[v40 + v56] = v57
        end
        local v58 = #v36
        local v59 = u13.Roles.murderer
        local function v70(p60) --[[ Line: 147 ]]
            --[[
            Upvalues:
                [1] = u13
                [2] = u5
                [3] = u12
                [4] = u7
            --]]
            local v61 = nil
            for v62, v63 in u13.Eliminations do
                local _ = v62 - 1
                if v63.victim.offlinePlayer.userId == p60.userId == true then
                    v61 = v63
                    break
                end
            end
            local v64 = v61 ~= nil
            local v65 = 0
            local v66 = {}
            for v67, v68 in u13.Eliminations do
                local _ = v67 - 1
                if v68.killer.offlinePlayer.userId == p60.userId == true then
                    v65 = v65 + 1
                    v66[v65] = v68
                end
            end
            local v69 = #v66
            return u5.createElement(u12, {
                ["UserId"] = p60.userId,
                ["Role"] = u7.MURDERER,
                ["IsDead"] = v64,
                ["NumElims"] = v69
            })
        end
        local v71 = table.create(#v59)
        for v72, v73 in v59 do
            v71[v72] = v70(v73, v72 - 1, v59)
        end
        for v74, v75 in v71 do
            v36[v58 + v74] = v75
        end
        v18.PlayersContainer = u5.createElement(u4, v35, v36)
        local v76 = u13.Eliminations
        local function v93(p77) --[[ Line: 195 ]]
            --[[
            Upvalues:
                [1] = u7
                [2] = u5
                [3] = u8
                [4] = u3
                [5] = u11
                [6] = u9
                [7] = u10
            --]]
            if p77.victim.role == u7.CIVILIAN then
                return nil
            end
            local v78 = u5.createElement
            local v79 = {
                ["BorderSizePixel"] = 0,
                ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
            }
            local v80 = {}
            local v81 = u5.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.5
            })
            local v82 = u5.createElement("UICorner", {
                ["CornerRadius"] = UDim.new(0.1, 0)
            })
            local v83 = u5.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0.05, 0),
                ["PaddingBottom"] = UDim.new(0.05, 0)
            })
            local v84 = u5.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0.025, 0)
            })
            local v85 = u5.createElement("UIGradient", {
                ["Rotation"] = 0,
                ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, u8:getRoleColor(p77.killer.role)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(51, 51, 51)), ColorSequenceKeypoint.new(1, Color3.fromRGB(51, 51, 51)) })
            })
            local v86 = u5.createElement("UIStroke", {
                ["Thickness"] = 2,
                ["Color"] = u3.WHITE
            })
            local v87 = u5.createElement
            local v88 = u11
            local v89 = {
                ["UserId"] = p77.killer.offlinePlayer.userId,
                ["DisplayName"] = p77.killer.offlinePlayer.displayName,
                ["Role"] = p77.killer.role,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(0.375, 1)
                }
            }
            __set_list(v80, 1, {v81, v82, v83, v84, v85, v86, (v87(v88, v89))})
            v80.KillIcon = u5.createElement("Frame", {
                ["BackgroundTransparency"] = 1,
                ["LayoutOrder"] = 2,
                ["Size"] = UDim2.fromScale(0.2, 0.8)
            }, {
                u5.createElement("UIListLayout", {
                    ["FillDirection"] = "Vertical",
                    ["VerticalAlignment"] = "Center",
                    ["HorizontalAlignment"] = "Center",
                    ["SortOrder"] = "LayoutOrder",
                    ["Padding"] = UDim.new(0.1, 0)
                }),
                u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }),
                u5.createElement("ImageLabel", {
                    ["ScaleType"] = "Fit",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 1,
                    ["Size"] = UDim2.fromScale(1, 0.5),
                    ["Image"] = u9.KILL_ABILITY_ICON
                }),
                u5.createElement("TextLabel", {
                    ["Text"] = "KILLED",
                    ["TextScaled"] = true,
                    ["Font"] = "GothamBlack",
                    ["BackgroundTransparency"] = 1,
                    ["LayoutOrder"] = 2,
                    ["Size"] = UDim2.fromScale(1, 0.25),
                    ["TextColor3"] = u10.mcRed
                })
            })
            local v90 = u5.createElement
            local v91 = u11
            local v92 = {
                ["IsVictim"] = true,
                ["UserId"] = p77.victim.offlinePlayer.userId,
                ["DisplayName"] = p77.victim.offlinePlayer.displayName,
                ["Role"] = p77.victim.role,
                ["FrameProps"] = {
                    ["LayoutOrder"] = 3,
                    ["Size"] = UDim2.fromScale(0.375, 1)
                }
            }
            __set_list(v80, 8, {v90(v91, v92)})
            return v78("Frame", v79, v80)
        end
        local v94 = 0
        local v95 = {}
        for v96, v97 in v76 do
            local v98 = v93(v97, v96 - 1, v76)
            if v98 ~= nil then
                v94 = v94 + 1
                v95[v94] = v98
            end
        end
        local v99 = {
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.5)
        }
        local v100 = { u5.createElement("UIGridLayout", {
                ["VerticalAlignment"] = "Center",
                ["HorizontalAlignment"] = "Center",
                ["FillDirection"] = "Horizontal",
                ["FillDirectionMaxCells"] = 2,
                ["CellSize"] = UDim2.fromScale(0.45, 0.4),
                ["CellPadding"] = UDim2.fromScale(0.01, 0.05)
            }) }
        local v101 = #v100
        for v102, v103 in v95 do
            v100[v101 + v102] = v103
        end
        v18.EliminationsContainer = u5.createElement(u4, v99, v100)
        v15[v16 + 1] = u5.createElement(u4, v17, v18)
        return u5.createFragment({
            ["MurderEndGameScreen"] = u5.createElement("ScreenGui", v32, v15)
        })
    end)
}