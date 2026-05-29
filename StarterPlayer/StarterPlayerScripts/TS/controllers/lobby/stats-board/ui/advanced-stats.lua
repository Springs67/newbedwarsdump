local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking")
local u10 = v9.CATEGORY_TO_ICON
local u11 = v9.STAT_TO_CATEGORY
local u12 = v9.STAT_TO_DESCRIPTION
local u13 = v9.TYPE_PRIORITY
local u14 = v9.TrackType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stat-tracking", "stat-tracking-util").StatTrackingUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
return {
    ["AdvancedStats"] = v6.new(u5)(function(u17, _) --[[ Line: 18 ]]
        --[[
        Upvalues:
            [1] = u16
            [2] = u8
            [3] = u5
            [4] = u3
            [5] = u15
            [6] = u10
            [7] = u11
            [8] = u12
            [9] = u14
            [10] = u13
            [11] = u7
            [12] = u4
        --]]
        local u18 = 0
        local function u28(p19) --[[ Line: 20 ]]
            --[[
            Upvalues:
                [1] = u18
                [2] = u16
                [3] = u8
                [4] = u5
                [5] = u3
            --]]
            local v20 = p19.layoutOrder
            local v21 = p19.icon
            local v22 = p19.title
            local v23 = p19.value
            u18 = u18 + 1
            local v24 = {
                ["BorderSizePixel"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, 24),
                ["BackgroundTransparency"] = u18 % 2 == 0 and 0.5 or 1,
                ["BackgroundColor3"] = u16.backgroundTertiary,
                ["LayoutOrder"] = v20
            }
            local v25 = {}
            local v26 = #v25
            local v27 = {
                ["Size"] = UDim2.fromScale(0.1, 0.8),
                ["Position"] = UDim2.fromScale(0.01, 0.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5)
            }
            if v21 == nil then
                v21 = u8.STAR_SOLID
            end
            v27.Image = v21
            v27.BackgroundTransparency = 1
            v27.BorderSizePixel = 0
            v27.ScaleType = Enum.ScaleType.Fit
            v25[v26 + 1] = u5.createElement("ImageLabel", v27, { u5.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
            v25.StatTitle = u5.createElement("TextLabel", {
                ["TextSize"] = 14,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.9, 1),
                ["Position"] = UDim2.fromScale(0.1, 0),
                ["Text"] = v22,
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
            v25.StatValue = u5.createElement("TextLabel", {
                ["TextSize"] = 14,
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(0.97, 1),
                ["Text"] = v23,
                ["TextColor3"] = u3.WHITE,
                ["TextXAlignment"] = Enum.TextXAlignment.Right,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold)
            })
            return u5.createElement("Frame", v24, v25)
        end
        local v29 = {
            ["Size"] = UDim2.new(1, 0, 0, 0),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5),
            ["AutomaticSize"] = Enum.AutomaticSize.Y
        }
        for v30, v31 in u17.FrameProps do
            v29[v30] = v31
        end
        local function v50(p32, p33) --[[ Line: 83 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u15
                [3] = u10
                [4] = u11
                [5] = u12
                [6] = u14
                [7] = u28
            --]]
            if not u17.QueueStats then
                return nil
            end
            local v34 = u15.PROFILE_EXCLUDE
            if table.find(v34, p32) ~= nil then
                return nil
            end
            local v35 = u17.Exclude
            if v35 ~= nil then
                v35 = table.find(v35, p32) ~= nil
            end
            if v35 then
                return nil
            end
            local v36 = u10[u11[p32]]
            local v37 = u12[p32]
            local v38 = 0
            local v39 = ""
            if p32 == u14.PLAYTIME then
                local v40 = u17.QueueStats.totalPlayTime / 3600
                local v41 = math.floor(v40)
                local v42 = u17.QueueStats.totalPlayTime / 60 - v41 * 60
                local v43 = math.floor(v42)
                local v44 = u17.QueueStats.totalPlayTime - v43 * 60 - v41 * 3600
                local v45 = math.floor(v44)
                v39 = tostring(v41) .. "h " .. tostring(v43) .. "m " .. tostring(v45) .. "s"
            else
                local v46 = u17.QueueStats[p32]
                local v47 = v46 == nil and 0 or v46
                v38 = math.ceil(v47)
            end
            local v48 = u28
            local v49 = {
                ["layoutOrder"] = p33,
                ["title"] = v37
            }
            if p32 ~= u14.PLAYTIME then
                v39 = tostring(v38)
            end
            v49.value = v39
            v49.icon = v36
            return v48(v49)
        end
        local v51 = 0
        local v52 = {}
        for v53, v54 in u13 do
            local v55 = v50(v54, v53 - 1, u13)
            if v55 ~= nil then
                v51 = v51 + 1
                v52[v51] = v55
            end
        end
        local v56 = { u5.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0, 0)
            }) }
        local v57 = #v56
        for v58, v59 in v52 do
            v56[v57 + v58] = v59
        end
        local v60 = #v56
        local v61 = u17.GameType == u7.SKYWARS and true or u17.Global
        if v61 then
            local v62 = {
                ["layoutOrder"] = 100,
                ["title"] = "Chests Opened" .. (u17.Global and " (Skywars)" or "")
            }
            local v63 = u17.QueueStats.extra
            if v63 ~= nil then
                v63 = v63.skywars
                if v63 ~= nil then
                    v63 = v63.chestsOpened
                end
            end
            local v64 = v63 == nil and 0 or v63
            v62.value = tostring(v64)
            v61 = u28(v62)
        end
        if v61 then
            v56[v60 + 1] = v61
        end
        local v65 = #v56
        local v66 = u17.GameType == u7.PVP_ARENA and true or u17.Global
        if v66 then
            local v67 = {
                ["layoutOrder"] = 100,
                ["title"] = "Gold Earned" .. (u17.Global and " (Arena Duels)" or "")
            }
            local v68 = u17.QueueStats.extra
            if v68 ~= nil then
                v68 = v68.pvpArena
                if v68 ~= nil then
                    v68 = v68.goldEarned
                end
            end
            local v69 = v68 == nil and 0 or v68
            v67.value = tostring(v69)
            v66 = u28(v67)
        end
        if v66 then
            v56[v65 + 1] = v66
        end
        return u5.createFragment({
            ["AdvancedStats"] = u5.createElement(u4, v29, v56)
        })
    end)
}