local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ColorUtil
local u5 = v2.Empty
local u6 = v2.Padding
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-meta").ArmorTrimMeta
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-rank").ArmorTrimEffectRank
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-type").ArmorTrimPackType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-unlock-definition").armorTrimUnlockDefinition
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "armor-trim-util").ArmorTrimUtil
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "armor-trim", "progress", "armor-trim-progress-util").ArmorTrimProgressUtil
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u18 = v1.import(script, script.Parent, "armor-trim-player-viewport").DEFAULT_ARMOR_TRIM_PLAYER_VIEWPORT_SELECTION
local u19 = v1.import(script, script.Parent, "armor-trim-player-viewport-selection-wrapper").ArmorTrimViewportSelectionWrapper
local u20 = v1.import(script, script.Parent, "armor-trim-preview").ArmorTrimPreview
local u21 = v1.import(script, script.Parent, "armor-trim-progress-bar").ArmorTrimProgressBar
return {
    ["ArmorTrimCore"] = v10.new(u9)(function(u22, p23) --[[ Line: 23 ]]
        --[[
        Upvalues:
            [1] = u9
            [2] = u15
            [3] = u13
            [4] = u16
            [5] = u8
            [6] = u7
            [7] = u11
            [8] = u14
            [9] = u20
            [10] = u5
            [11] = u3
            [12] = u17
            [13] = u12
            [14] = u18
            [15] = u19
            [16] = u6
            [17] = u4
            [18] = u21
        --]]
        local v24 = p23.useState
        local v25 = p23.useEffect
        local _ = p23.useMemo
        local u26, u27 = v24(nil)
        local u28, u29 = v24({})
        local u30 = u22.store.ArmorTrim.selectedArmorTrimConfigs[u22.SelectedKit]
        local u31 = u22.store.ArmorTrim.allKitProgress[u22.SelectedKit]
        local v32
        if u31 == nil then
            v32 = u31
        else
            v32 = nil
            for v33, v34 in u31 do
                local _ = v33 - 1
                local v35 = v34.trim
                local v36
                if u30 == nil then
                    v36 = u30
                else
                    v36 = u30.type
                end
                if v35 == v36 == true then
                    v32 = v34
                    break
                end
            end
        end
        local u37 = u22.store.ArmorTrim.allKitXpPotential[u22.SelectedKit]
        local u38 = u9.createRef()
        v25(function() --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u31
                [2] = u30
                [3] = u15
                [4] = u13
                [5] = u16
                [6] = u29
            --]]
            local v39 = u31
            local v40
            if v39 == nil then
                v40 = v39
            else
                v40 = table.create(#v39)
                for v41, v42 in v39 do
                    local _ = v41 - 1
                    local v43 = {
                        ["armorTrimType"] = v42.trim
                    }
                    local v44 = u30
                    if v44 then
                        local v45 = u30
                        if v45 ~= nil then
                            v45 = v45.type
                        end
                        v44 = v45 == v42.trim
                    end
                    v43.state = v44 and "EQUIPPED" or "OWNED"
                    v40[v41] = v43
                end
            end
            local v46 = v40 == nil and {} or v40
            if #u15.getUnlockableArmorTrims(u31 or {}, u13.ALL_RANDOM) ~= 0 then
                local v47 = u31 == nil
                if not v47 then
                    v47 = u31
                    if v47 ~= nil then
                        v47 = true
                        for v48, v49 in v47 do
                            local _ = v48 - 1
                            if not u16.isNextArmorTrimUnlockable(v49.xpEarned) then
                                v47 = false
                                break
                            end
                        end
                    end
                end
                if v47 then
                    table.insert(v46, {
                        ["state"] = "PURCHASE"
                    })
                else
                    table.insert(v46, {
                        ["state"] = "LOCKED"
                    })
                end
            end
            u29(v46)
        end, { u22.store.ArmorTrim })
        v25(function() --[[ Line: 121 ]]
            --[[
            Upvalues:
                [1] = u38
                [2] = u8
                [3] = u27
            --]]
            local u50 = u38:getValue()
            if not u50 then
                return nil
            end
            local u51 = u8.new()
            u51:GiveTask(task.spawn(function() --[[ Line: 127 ]]
                --[[
                Upvalues:
                    [1] = u50
                    [2] = u27
                --]]
                local v52 = 0
                while u50.AbsoluteSize.X <= 0 do
                    v52 = v52 + 1
                    local v53 = task.wait(0.1)
                    if v53 ~= 0 and (v53 == v53 and v53) then
                        v53 = v52 <= 10
                    end
                    if v53 == 0 or (v53 ~= v53 or not v53) then
                        break
                    end
                end
                u27(u50.AbsoluteSize.X)
            end))
            return function() --[[ Line: 143 ]]
                --[[
                Upvalues:
                    [1] = u51
                --]]
                u51:DoCleaning()
            end
        end, {})
        local v54 = u22.ViewAll
        if v54 then
            local v55 = {
                ["Size"] = UDim2.fromScale(1, 0.75)
            }
            local v56 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Vertical,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 20)
                }) }
            local _ = #v56
            local v57 = u7.entries(u11)
            local function v67(p58) --[[ Line: 163 ]]
                --[[
                Upvalues:
                    [1] = u28
                    [2] = u14
                    [3] = u9
                    [4] = u26
                    [5] = u22
                    [6] = u20
                --]]
                local v59 = p58[2]
                local v60 = p58[1]
                local v61 = nil
                for v62, v63 in u28 do
                    local _ = v62 - 1
                    if v63.armorTrimType == v60 == true then
                        v61 = v63
                        break
                    end
                end
                if v61 ~= nil then
                    v61 = v61.state
                end
                if not u14[v60] then
                    return u9.createFragment()
                end
                local v64 = {}
                local v65 = u26
                local v66 = v65 == nil and 600 or v65
                v64.Size = UDim2.new(0, v66 / 4, 1, 0)
                v64.Name = v59.name
                v64.ArmorTrimProgressData = u22.store.ArmorTrim.allKitProgress[u22.SelectedKit]
                v64.ArmorTrimType = v60
                v64.State = v61 or "LOCKED"
                return u9.createElement(u20, v64)
            end
            local v68 = table.create(#v57)
            for v69, v70 in v57 do
                v68[v69] = v67(v70, v69 - 1, v57)
            end
            local v71 = {
                ["ScrollingFrameProps"] = {
                    ["ScrollBarThickness"] = 8,
                    ["Size"] = UDim2.fromScale(1, 0.9),
                    ["ScrollingDirection"] = Enum.ScrollingDirection.X
                }
            }
            local v72 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder,
                    ["Padding"] = UDim.new(0, 20)
                }), u9.createElement(u5, {
                    ["Size"] = UDim2.new(0, 10, 1, 0)
                }) }
            local v73 = #v72
            for v74, v75 in v68 do
                v72[v73 + v74] = v75
            end
            v56.ArmorTrimViewAllList = u9.createElement(u3, v71, v72)
            v54 = u9.createFragment({
                ["ArmorTrimViewAll"] = u9.createElement(u5, v55, v56)
            })
        end
        local v76 = {
            ["BorderSizePixel"] = 0,
            ["ZIndex"] = -10,
            ["Size"] = UDim2.fromScale(1, 0.91),
            ["BackgroundColor3"] = u17.backgroundTertiary
        }
        local v77 = {}
        local v78 = #v77
        if v54 then
            v77[v78 + 1] = v54
        end
        local v79 = #v77
        local v80 = not u22.ViewAll
        if v80 then
            local v81 = {
                ["Size"] = UDim2.fromScale(1, 0.75)
            }
            local v82 = {}
            local _ = #v82
            local v83 = {
                [u9.Ref] = u38,
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScrollingDirection"] = Enum.ScrollingDirection.X,
                ["ScrollBarThickness"] = 8,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 1
            }
            local v84 = u26 == nil and 600 or u26
            v83.CanvasSize = UDim2.new(0, v84 / 4 * #u28, 1, 0)
            v83.BackgroundTransparency = 1
            local function v108(p85) --[[ Line: 265 ]]
                --[[
                Upvalues:
                    [1] = u31
                    [2] = u16
                    [3] = u7
                    [4] = u12
                    [5] = u26
                    [6] = u22
                    [7] = u30
                    [8] = u18
                    [9] = u17
                    [10] = u37
                    [11] = u9
                    [12] = u19
                    [13] = u5
                --]]
                local v86 = u31
                if v86 ~= nil then
                    v86 = nil
                    for v87, v88 in v86 do
                        local _ = v87 - 1
                        if v88.trim == p85.armorTrimType == true then
                            v86 = v88
                            break
                        end
                    end
                end
                local v89 = u16
                local v90
                if v86 == nil then
                    v90 = v86
                else
                    v90 = v86.xpEarned
                end
                local v91 = v90 == nil and 0 or v90
                local v92 = v89.getTier(v91)
                local v93 = u7.values(u12)
                table.sort(v93, function(p94, p95) --[[ Line: 294 ]]
                    return p94 < p95
                end)
                local v96 = #v93 - 1
                local v97 = v93[math.min(v96, v92) + 1]
                local v98 = {}
                local v99 = u26
                local v100 = v99 == nil and 600 or v99
                v98.Size = UDim2.new(0, v100 / 4, 1, 0)
                local v101 = {}
                local _ = #v101
                local v102 = {
                    ["BackgroundTransparency"] = 1,
                    ["BorderSizePixel"] = 0,
                    ["ZIndex"] = -1,
                    ["SelectedKit"] = u22.SelectedKit,
                    ["ArmorTrimType"] = p85.armorTrimType,
                    ["ArmorTrimEffectRank"] = v97,
                    ["SelectionState"] = p85.state
                }
                local v103 = u30
                if v103 then
                    local v104 = u30
                    if v104 ~= nil then
                        v104 = v104.type
                    end
                    v103 = v104 == p85.armorTrimType
                end
                v102.ButtonMode = v103 and "ALWAYS_VISIBLE" or "ON_HOVER"
                local v105 = {}
                local v106 = u30
                if v106 ~= nil then
                    v106 = v106.color
                end
                local v107
                if v106 then
                    v107 = Color3.new(u30.color.r, u30.color.g, u30.color.b)
                else
                    v107 = nil
                end
                v105.armorTrimColor = v107
                v105.armorSet = u18.armorSet
                v105.displayMode = u18.displayMode
                v102.StartingSelection = v105
                v102.ViewportProps = {
                    ["BackgroundTransparency"] = 0.5,
                    ["BackgroundColor3"] = u17.backgroundPrimary
                }
                if v86 ~= nil then
                    v86 = v86.xpEarned
                end
                if v86 == nil then
                    v86 = u37
                end
                v102.xp = v86
                v101.ViewportCard = u9.createElement(u19, v102)
                return u9.createElement(u5, v98, v101)
            end
            local v109 = table.create(#u28)
            for v110, v111 in u28 do
                v109[v110] = v108(v111, v110 - 1, u28)
            end
            local v112 = { u9.createElement("UIListLayout", {
                    ["FillDirection"] = Enum.FillDirection.Horizontal,
                    ["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
                    ["VerticalAlignment"] = Enum.VerticalAlignment.Center,
                    ["SortOrder"] = Enum.SortOrder.LayoutOrder
                }), u9.createElement(u6, {
                    ["Padding"] = {
                        ["Bottom"] = 8
                    }
                }) }
            local v113 = #v112
            for v114, v115 in v109 do
                v112[v113 + v114] = v115
            end
            v82.ArmorTrimSelectionList = u9.createElement("ScrollingFrame", v83, v112)
            v80 = u9.createFragment({
                ["ArmorTrimSelection"] = u9.createElement(u5, v81, v82)
            })
        end
        if v80 then
            v77[v79 + 1] = v80
        end
        local v116 = #v77
        local v117 = {
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["Size"] = UDim2.fromScale(1, 0.25),
            ["Position"] = UDim2.fromScale(0, 0.75)
        }
        local v118 = {}
        local v119 = #v118
        local v120 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v121 = { u9.createElement("TextLabel", {
                ["Text"] = "Armor Effect Progress",
                ["BackgroundTransparency"] = 1,
                ["TextScaled"] = true,
                ["ZIndex"] = 2,
                ["Size"] = UDim2.fromScale(1, 0.2),
                ["Position"] = UDim2.fromScale(0.5, 0.1),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5),
                ["TextColor3"] = u4.WHITE,
                ["Font"] = Enum.Font.SourceSansBold,
                ["TextXAlignment"] = Enum.TextXAlignment.Center,
                ["TextYAlignment"] = Enum.TextYAlignment.Center
            }) }
        local v122 = #v121
        local v123 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v124
        if v32 == nil then
            v124 = v32
        else
            v124 = v32.xpEarned
        end
        v123.unlocked = v124 ~= nil
        local v125
        if v32 == nil then
            v125 = v32
        else
            v125 = v32.xpEarned
        end
        if v125 == nil then
            v125 = u37 == nil and 0 or u37
        end
        v123.xp = v125
        if v32 ~= nil then
            v32 = v32.trim
        end
        v123.ArmorTrimType = v32
        v123.SelectedKit = u22.SelectedKit
        v121[v122 + 1] = u9.createElement(u21, v123)
        v118[v119 + 1] = u9.createElement(u5, v120, v121)
        v77[v116 + 1] = u9.createElement("Frame", v117, v118)
        return u9.createElement("Frame", v76, v77)
    end)
}