local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.ColorUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit-meta").BedwarsKitMeta
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-rewards").KitContractRewards
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "math-util").MathUtil
local u13 = v1.import(script, script.Parent, "kit-contract-kit-stats-card-row").KitContractKitStatsCardRow
local u14 = {
    ["wins"] = v9.TROPHY_SOLID,
    ["kills"] = v9.SKULL_SOLID
}
return {
    ["KitContractKitStatsCard"] = v7.new(u6)(function(p15, p16) --[[ Line: 19 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u10
            [3] = u6
            [4] = u4
            [5] = u8
            [6] = u3
            [7] = u13
            [8] = u11
            [9] = u14
            [10] = u12
        --]]
        local _ = p16.useState
        local v17 = {}
        for v18, v19 in p15 do
            v17[v18] = v19
        end
        v17.SelectedKit = nil
        v17.UserKitStatProfile = nil
        v17.HighestUnlockedTier = nil
        local v20 = u5.entries(p15.UserKitStatProfile)
        local u21 = table.create(#v20)
        for v22, v23 in v20 do
            local _ = v22 - 1
            u21[v22] = {
                ["key"] = v23[1],
                ["value"] = v23[2]
            }
        end
        local v24 = {}
        local v25 = u10[p15.SelectedKit]
        if v25 ~= nil then
            v25 = v25.kitStats
        end
        if v25 then
            local v26 = u5.entries(v25)
            v24 = table.create(#v26)
            for v27, v28 in v26 do
                local _ = v27 - 1
                local _ = v28[1]
                v24[v27] = {
                    ["value"] = 0,
                    ["key"] = v28[2]
                }
            end
        end
        local function v34(p29) --[[ Line: 70 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            local v30 = p29.key
            local _ = p29.value
            local v31 = false
            for v32, v33 in u21 do
                local _ = v32 - 1
                if v33.key == v30 then
                    v31 = true
                    break
                end
            end
            return not v31
        end
        local v35 = 0
        local v36 = {}
        for v37, v38 in v24 do
            if v34(v38, v37 - 1, v24) == true then
                v35 = v35 + 1
                v36[v35] = v38
            end
        end
        for v39, v40 in v36 do
            local _ = v39 - 1
            table.insert(u21, v40)
        end
        local v41 = {}
        for v42, v43 in v17 do
            v41[v42] = v43
        end
        local v44 = {}
        local v45 = u6.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0.03, 0)
        })
        local v46 = u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.05, 0)
        })
        local v47 = u6.createElement("UIPadding", {
            ["PaddingRight"] = UDim.new(0.085, 0),
            ["PaddingLeft"] = UDim.new(0.085, 0),
            ["PaddingTop"] = UDim.new(0.055, 0),
            ["PaddingBottom"] = UDim.new(0.055, 0)
        })
        local v48 = u6.createElement
        local v49 = u4
        local v50 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.24)
        }
        local v51 = {}
        local v52 = u6.createElement("UIListLayout", {
            ["FillDirection"] = Enum.FillDirection.Vertical,
            ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
            ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
            ["SortOrder"] = Enum.SortOrder.LayoutOrder,
            ["Padding"] = UDim.new(0.15, 0)
        })
        local v53 = u6.createElement("TextLabel", {
            ["BackgroundTransparency"] = 1,
            ["TextScaled"] = true,
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.39),
            ["Text"] = u8[p15.SelectedKit].name .. " Contract",
            ["TextColor3"] = u3.WHITE,
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextXAlignment"] = Enum.TextXAlignment.Left,
            ["TextYAlignment"] = Enum.TextYAlignment.Center
        })
        local v54 = u6.createElement
        local v55 = u13
        local v56 = {
            ["StatTitle"] = "Level",
            ["LayoutOrder"] = 1
        }
        local v57 = p15.HighestUnlockedTier
        v56.StatValue = tostring(v57)
        v56.Size = UDim2.new(1, -8, 0.545, 0)
        v56.BackgroundColor3 = u11.ProgressColor
        __set_list(v51, 1, {v52, v53, v54(v55, v56)})
        __set_list(v44, 1, {v45, v46, v47, v48(v49, v50, v51)})
        local v58 = #v44
        local v59 = {
            ["LayoutOrder"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.7)
        }
        local v60 = { u6.createElement("UIListLayout", {
                ["FillDirection"] = Enum.FillDirection.Vertical,
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                ["Padding"] = UDim.new(0.05, 0)
            }), u6.createElement("TextLabel", {
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["Text"] = "Kit Stats",
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.fromScale(1, 0.13),
                ["TextColor3"] = u3.WHITE,
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextXAlignment"] = Enum.TextXAlignment.Left,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) }
        local v61 = #v60
        local function v66(p62, p63) --[[ Line: 187 ]]
            --[[
            Upvalues:
                [1] = u14
            --]]
            local v64 = u14[p62.key]
            local v65 = u14[p63.key]
            if v64 ~= "" and v64 then
                if v65 == "" then
                    v65 = false
                end
                v64 = not v65
            end
            return v64 ~= "" and v64 and true or false
        end
        table.sort(u21, v66)
        local function v74(p67) --[[ Line: 201 ]]
            --[[
            Upvalues:
                [1] = u6
                [2] = u13
                [3] = u14
                [4] = u12
            --]]
            local v68 = p67.key
            local v69 = p67.value
            local v70 = u6.createElement
            local v71 = u13
            local v72 = {
                ["BackgroundTransparency"] = 0.3,
                ["StatImage"] = u14[v68],
                ["StatTitle"] = string.upper((string.sub(v68, 0, 1))) .. string.lower((string.sub(v68, 2)))
            }
            local v73 = u12.roundToDecimalPlaces
            v72.StatValue = tostring(v73(v69, 2))
            return v70(v71, v72)
        end
        local v75 = table.create(#u21)
        for v76, v77 in u21 do
            v75[v76] = v74(v77, v76 - 1, u21)
        end
        local v78 = {
            ["BackgroundTransparency"] = 1,
            ["LayoutOrder"] = 1,
            ["ScrollBarThickness"] = 3,
            ["ScrollBarImageTransparency"] = 0.3,
            ["Size"] = UDim2.fromScale(1, 0.845),
            ["CanvasSize"] = UDim2.new(1, -5, 0, 0),
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
            ["VerticalScrollBarInset"] = Enum.ScrollBarInset.Always,
            ["ScrollBarImageColor3"] = u3.WHITE
        }
        local v79 = { u6.createElement("UIGridLayout", {
                ["FillDirection"] = "Horizontal",
                ["CellSize"] = UDim2.new(1, -3, 0.2, 0),
                ["CellPadding"] = UDim2.new(0, 0, 0, 5),
                ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
            }) }
        local v80 = #v79
        for v81, v82 in v75 do
            v79[v80 + v81] = v82
        end
        v60[v61 + 1] = u6.createElement("ScrollingFrame", v78, v79)
        v44[v58 + 1] = u6.createElement(u4, v59, v60)
        return u6.createFragment({
            ["KitContractStatsCard"] = u6.createElement(u4, v41, v44)
        })
    end)
}