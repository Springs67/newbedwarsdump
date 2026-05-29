local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.DeviceUtil
local u5 = v2.Empty
local u6 = v2.TextInputComponent
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-constants").CustomKitConstants
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "custom-kit-game", "custom-kit-util").CustomKitUtil
local u13 = v1.import(script, script.Parent, "custom-kit-creation-ability-slot").CustomKitCreation_AbilitySlot
local u14 = v1.import(script, script.Parent, "custom-kit-creation-stat-slot").CustomKitCreation_StatSlot
return {
    ["CustomKitCreation_KitStatsGUI"] = v10.new(u9)(function(u15, p16) --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u7
            [3] = u9
            [4] = u13
            [5] = u12
            [6] = u4
            [7] = u5
            [8] = u6
            [9] = u11
            [10] = u14
            [11] = u3
        --]]
        local v17 = p16.useState
        local v18 = p16.useEffect
        local u19, u20 = v17(u15.CurrentKit)
        local u21 = u8.new()
        v18(function() --[[ Line: 21 ]]
            --[[
            Upvalues:
                [1] = u21
            --]]
            return function() --[[ Line: 22 ]]
                --[[
                Upvalues:
                    [1] = u21
                --]]
                u21:DoCleaning()
            end
        end, {})
        local function u27(p22) --[[ Line: 34 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u20
                [3] = u15
            --]]
            local v23 = 0
            local v24 = {}
            for v25, v26 in u19.abilities do
                if v25 - 1 ~= p22 == true then
                    v23 = v23 + 1
                    v24[v23] = v26
                end
            end
            u19.abilities = v24
            u20(u19)
            u15.OnDeleteAbilityClicked(p22)
            u15.OnPointsChanged(u19)
        end
        local v28 = {
            ["Size"] = UDim2.fromScale(1, 1)
        }
        local v29 = {}
        local v30 = #v29
        local v31 = u7.entries(u19.abilities)
        local function v35(p32, u33) --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u13
                [3] = u12
                [4] = u19
                [5] = u15
                [6] = u27
            --]]
            local _ = p32[1]
            local _ = p32[2]
            return u9.createElement(u13, {
                ["Index"] = 0,
                ["LayoutOrder"] = u33 + 100,
                ["Ability"] = u12.getAbilityInSlot(u19, u33),
                ["OnClicked"] = function() --[[ Name: OnClicked, Line 67 ]]
                    --[[
                    Upvalues:
                        [1] = u33
                        [2] = u15
                        [3] = u19
                    --]]
                    local v34 = u33
                    u15.OnAbilityClicked(v34)
                    u15.OnPointsChanged(u19)
                end,
                ["OnDeleteClicked"] = function() --[[ Name: OnDeleteClicked, Line 70 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u33
                        [3] = u15
                    --]]
                    u27(u33)
                    u15.OnChangesMade()
                end
            })
        end
        local v36 = table.create(#v31)
        for v37, v38 in v31 do
            v36[v37] = v35(v38, v37 - 1, v31)
        end
        local v39 = {
            ["WaitForAbsoluteSize"] = true,
            ["AdditionalSpace"] = 50,
            ["ScrollingFrameProps"] = {
                ["Size"] = UDim2.fromScale(1, 1),
                ["ScrollingDirection"] = Enum.ScrollingDirection.Y
            }
        }
        local v41 = {
            u9.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 0),
                ["PaddingBottom"] = UDim.new(0, 10),
                ["PaddingLeft"] = UDim.new(0.05, 0),
                ["PaddingRight"] = UDim.new(0.05, 0)
            }),
            u9.createElement("UIListLayout", {
                ["FillDirection"] = "Vertical",
                ["HorizontalAlignment"] = "Center",
                ["SortOrder"] = "LayoutOrder",
                ["Padding"] = UDim.new(0, 8)
            }),
            ["CustomKitCreation_KitStats_NameLabel"] = u9.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = "NAME",
                ["TextTransparency"] = 0,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = -100,
                ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 30 or 45),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextSize"] = u4.isSmallScreen() and 18 or 24,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            }),
            u9.createElement(u5, {
                ["LayoutOrder"] = -99,
                ["Size"] = UDim2.new(1, 0, 0, 45)
            }, {
                ["CustomKitCreation_KitStats_NameInput"] = u9.createElement(u6, {
                    ["MaxCharacters"] = 20,
                    ["TextBox"] = {
                        ["PlaceholderText"] = "Kit Name",
                        ["ClearTextOnFocus"] = false,
                        ["Size"] = UDim2.fromScale(1, 1),
                        ["Text"] = u15.CurrentKit.name,
                        ["TextXAlignment"] = Enum.TextXAlignment.Left,
                        ["TextSize"] = u4.isSmallScreen() and 24 or 28
                    },
                    ["OnFocusLost"] = function(p40) --[[ Name: OnFocusLost, Line 129 ]]
                        --[[
                        Upvalues:
                            [1] = u15
                        --]]
                        u15.CurrentKit.name = p40
                        u15.OnNameChanged(u15.CurrentKit)
                        u15.OnChangesMade()
                    end
                }, { u9.createElement("UIPadding", {
                        ["PaddingTop"] = UDim.new(0.02, 0),
                        ["PaddingBottom"] = UDim.new(0.02, 0),
                        ["PaddingLeft"] = UDim.new(0.02, 0),
                        ["PaddingRight"] = UDim.new(0.02, 0)
                    }) })
            }),
            ["CustomKitCreation_KitStats_Label1"] = u9.createElement("TextLabel", {
                ["AutomaticSize"] = "X",
                ["Text"] = "ABILITY",
                ["TextTransparency"] = 0,
                ["BackgroundTransparency"] = 1,
                ["BorderSizePixel"] = 0,
                ["LayoutOrder"] = 0,
                ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 30 or 45),
                ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
                ["TextSize"] = u4.isSmallScreen() and 18 or 24,
                ["TextXAlignment"] = Enum.TextXAlignment.Left
            })
        }
        local v42 = #v41
        for v43, v44 in v36 do
            v41[v42 + v43] = v44
        end
        local v45 = #v41
        local v46
        if #u19.abilities < u11.MaxAbilities then
            v46 = u9.createElement(u13, {
                ["Index"] = 0,
                ["LayoutOrder"] = 200,
                ["Ability"] = nil,
                ["OnClicked"] = function() --[[ Name: OnClicked, Line 167 ]]
                    --[[
                    Upvalues:
                        [1] = u19
                        [2] = u15
                    --]]
                    local v47 = #u19.abilities
                    u15.OnAbilityClicked(v47)
                    u15.OnPointsChanged(u19)
                    u15.OnChangesMade()
                end,
                ["OnDeleteClicked"] = function() --[[ Name: OnDeleteClicked, Line 171 ]]
                    --[[
                    Upvalues:
                        [1] = u27
                        [2] = u19
                        [3] = u15
                    --]]
                    u27(#u19.abilities)
                    u15.OnChangesMade()
                end
            })
        else
            v46 = false
        end
        if v46 then
            v41[v45 + 1] = v46
        end
        local v48 = #v41
        v41.CustomKitCreation_KitStats_Label2 = u9.createElement("TextLabel", {
            ["AutomaticSize"] = "X",
            ["Text"] = "STATS",
            ["TextTransparency"] = 0,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 300,
            ["Size"] = UDim2.new(1, 0, 0, u4.isSmallScreen() and 30 or 45),
            ["TextColor3"] = Color3.fromRGB(255, 255, 255),
            ["FontFace"] = Font.fromName("Roboto", Enum.FontWeight.Bold),
            ["TextSize"] = u4.isSmallScreen() and 18 or 24,
            ["TextXAlignment"] = Enum.TextXAlignment.Left
        })
        local v49 = u7.entries(u19.stats)
        local function v55(p50, _) --[[ Line: 194 ]]
            --[[
            Upvalues:
                [1] = u9
                [2] = u14
                [3] = u11
                [4] = u19
                [5] = u12
                [6] = u20
                [7] = u15
            --]]
            local v51 = p50[1]
            local u52 = p50[2]
            return u9.createElement(u14, {
                ["LayoutOrder"] = 400 + ((table.find(u11.StatOrder, v51) or 0) - 1),
                ["CustomKit"] = u19,
                ["StatType"] = v51,
                ["StatLevel"] = u52,
                ["OnDecreaseStatLevelClick"] = function(p53) --[[ Name: OnDecreaseStatLevelClick, Line 202 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u19
                        [3] = u52
                        [4] = u20
                        [5] = u15
                    --]]
                    if u12.canDecreaseStat(u19, p53, u52) then
                        u19.stats[p53] = u52 - 1
                        u20(u19)
                        u15.OnPointsChanged(u19)
                        u15.OnChangesMade()
                    end
                end,
                ["OnIncreaseStatLevelClick"] = function(p54) --[[ Name: OnIncreaseStatLevelClick, Line 213 ]]
                    --[[
                    Upvalues:
                        [1] = u12
                        [2] = u19
                        [3] = u52
                        [4] = u20
                        [5] = u15
                    --]]
                    if u12.canIncreaseStat(u19, p54, u52) then
                        u19.stats[p54] = u52 + 1
                        u20(u19)
                        u15.OnPointsChanged(u19)
                        u15.OnChangesMade()
                    end
                end
            })
        end
        local v56 = table.create(#v49)
        for v57, v58 in v49 do
            v56[v57] = v55(v58, v57 - 1, v49)
        end
        for v59, v60 in v56 do
            v41[v48 + v59] = v60
        end
        v29[v30 + 1] = u9.createElement(u3, v39, v41)
        return u9.createFragment({
            ["CustomKitCreation_KitStatsGUI"] = u9.createElement(u5, v28, v29)
        })
    end)
}