local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.Checkbox
local u4 = v2.ColorUtil
local u5 = v2.DeviceUtil
local u6 = v2.ElementGrid
local u7 = v2.Empty
local u8 = v2.GridElement
local u9 = v2.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "global", "battle-pass", "ui", "RewardShowcase", "emote-showcase").EmoteShowcase
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "screen-space")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-meta").EmoteMeta
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-tab").LockerTab
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u18 = v1.import(script, script.Parent.Parent.Parent, "locker-constants").LockerConstants
return {
    ["LockerEmoteItemsGrid"] = v11.new(u10)(function(u19, p20) --[[ Line: 20 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u18
            [3] = u13
            [4] = u16
            [5] = u15
            [6] = u4
            [7] = u9
            [8] = u17
            [9] = u10
            [10] = u12
            [11] = u8
            [12] = u6
            [13] = u3
            [14] = u14
            [15] = u7
        --]]
        local v21 = p20.useState
        local v22 = p20.useEffect
        local v23 = p20.useMemo
        local u24, u25 = v21(u19.Elements)
        local u26, u27 = v21(u19.Elements)
        local v28, u29 = v21("")
        local u30, u31 = v21(false)
        v22(function() --[[ Line: 32 ]]
            --[[
            Upvalues:
                [1] = u25
                [2] = u19
                [3] = u29
            --]]
            u25(u19.Elements)
            u29("")
        end, { u19.Elements })
        local v32
        if u5.isSmallScreen() then
            v32 = u18.SEARCH_BAR_HEIGHT_SMALL
        else
            v32 = u18.SEARCH_BAR_HEIGHT
        end
        local u33 = {}
        local v62 = v23(function() --[[ Line: 38 ]]
            --[[
            Upvalues:
                [1] = u24
                [2] = u33
                [3] = u19
                [4] = u5
                [5] = u13
                [6] = u16
                [7] = u15
                [8] = u4
                [9] = u18
                [10] = u9
                [11] = u17
                [12] = u10
                [13] = u12
                [14] = u8
                [15] = u6
            --]]
            local v34 = table.create(#u24)
            for v35, v36 in u24 do
                local _ = v35 - 1
                v34[v35] = {
                    ["id"] = v36.itemEnum,
                    ["imageId"] = v36.imageId,
                    ["alt"] = v36.name
                }
            end
            u33 = v34
            local u37 = u19.Elements
            if u37 ~= nil then
                u37 = -1
                for v38, v39 in u37 do
                    local _ = v38 - 1
                    local v40 = v39.itemEnum
                    local v41 = u19.EquippedElement
                    if v41 ~= nil then
                        v41 = v41.itemEnum
                    end
                    if v40 == v41 == true then
                        u37 = v38 - 1
                        break
                    end
                end
            end
            local v42 = {
                ["ElementSize"] = UDim2.new(0.187, 0, 0, 120),
                ["DefaultElement"] = u37,
                ["ScrollingFrameProps"] = {
                    ["ScrollBarThickness"] = 2,
                    ["Size"] = UDim2.new(1, 0, 1, -40),
                    ["Position"] = UDim2.fromOffset(0, 45),
                    ["ScrollBarImageColor3"] = Color3.fromRGB(255, 255, 255),
                    ["VerticalScrollBarPosition"] = Enum.VerticalScrollBarPosition.Left
                },
                ["UIPaddingProps"] = {
                    ["PaddingRight"] = UDim.new(0, 0),
                    ["PaddingLeft"] = UDim.new(0, 10),
                    ["PaddingTop"] = UDim.new(0, 2),
                    ["PaddingBottom"] = UDim.new(0, 60)
                },
                ["UIGridLayoutProps"] = {
                    ["CellSize"] = UDim2.new(u5.isSmallScreen() and 0.33 or 0.25, 0, 0, u5.isSmallScreen() and 70 or u13.ViewSizeX() * 0.54 / 5.5) - UDim2.fromOffset(7, 0)
                }
            }
            local v43 = u33
            local function v54(u44, p45) --[[ Line: 99 ]]
                --[[
                Upvalues:
                    [1] = u19
                    [2] = u16
                    [3] = u15
                    [4] = u37
                    [5] = u4
                    [6] = u5
                    [7] = u18
                    [8] = u9
                    [9] = u17
                    [10] = u10
                    [11] = u12
                    [12] = u8
                --]]
                local v46
                if u19.Tab == u16.EMOTES then
                    v46 = u15[u44.id]
                    if v46 then
                        v46 = v46.animation ~= nil
                    end
                else
                    v46 = false
                end
                local v47 = {
                    ["Index"] = p45,
                    ["CurrentIndex"] = u37,
                    ["Image"] = u44.imageId
                }
                local v48 = {
                    ["TextStrokeTransparency"] = 0.5,
                    ["Text"] = u44.alt,
                    ["TextStrokeColor3"] = u4.BLACK
                }
                local v49
                if u5.isSmallScreen() then
                    v49 = u18.ELEMENT_TEXT_SIZE_SMALL
                else
                    v49 = u18.ELEMENT_TEXT_SIZE
                end
                v48.TextSize = v49
                v47.TextElement = v48
                function v47.OnClick() --[[ Line: 115 ]]
                    --[[
                    Upvalues:
                        [1] = u44
                        [2] = u19
                        [3] = u9
                        [4] = u17
                    --]]
                    local v50 = u44.id
                    if v50 ~= "" and v50 then
                        local v51 = u19.EquippedElement
                        if v51 ~= nil then
                            v51 = v51.itemEnum
                        end
                        if v51 == u44.id then
                            return nil
                        end
                        u19.OnSelectionChange(u44.id, u19.SelectedSlot)
                        u9:playSound(u17.ARMOR_EQUIP)
                    end
                end
                local v52 = {}
                local v53 = #v52
                if v46 then
                    v46 = u10.createElement(u12, {
                        ["Emote"] = u44.id
                    })
                end
                if v46 then
                    v52[v53 + 1] = v46
                end
                return u10.createElement(u8, v47, v52)
            end
            local v55 = table.create(#v43)
            for v56, v57 in v43 do
                v55[v56] = v54(v57, v56 - 1, v43)
            end
            local v58 = {}
            local v59 = #v58
            for v60, v61 in v55 do
                v58[v59 + v60] = v61
            end
            return u10.createFragment({
                [u19.Tab .. "List"] = u10.createElement(u6, v42, v58)
            })
        end, { u24, u19.SelectedSlot })
        local function u70(p63, p64) --[[ Line: 155 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u26
                [3] = u30
                [4] = u15
            --]]
            local v65
            if p63 == nil then
                v65 = p63
            else
                v65 = #p63 == 0
            end
            local v66
            if v65 or p63 == nil then
                v66 = u19.Elements
            else
                v66 = p63 or u26
            end
            if p64 ~= nil then
                p64 = p64.animatedEmotesOnly
            end
            if p64 == nil then
                p64 = u30
            end
            if p64 then
                local v67 = 0
                v66 = {}
                for v68, v69 in v66 do
                    local _ = v68 - 1
                    if u15[v69.itemEnum].animation ~= nil == true then
                        v67 = v67 + 1
                        v66[v67] = v69
                    end
                end
            end
            return v66
        end
        local v71 = {
            ["BackgroundTransparency"] = 1,
            ["ClipsDescendants"] = true,
            ["Size"] = u19.Size or UDim2.fromScale(1, 0),
            ["AutomaticSize"] = Enum.AutomaticSize.Y,
            ["LayoutOrder"] = u19.LayoutOrder
        }
        local v72 = { u10.createElement("UIPadding", {
                ["PaddingTop"] = UDim.new(0, 14)
            }), u10.createElement("UISizeConstraint", {
                ["MinSize"] = u19.MinSize,
                ["MaxSize"] = u19.MaxSize
            }) }
        local v73 = #v72
        local v74 = {
            ["Size"] = UDim2.new(1, 0, 0, v32)
        }
        local v76 = { u10.createElement("UIListLayout", {
                ["FillDirection"] = "Horizontal",
                ["HorizontalAlignment"] = "Right",
                ["VerticalAlignment"] = "Center",
                ["Padding"] = UDim.new(0.1, 0)
            }), u10.createElement(u3, {
                ["Text"] = "<b>Animated</b>",
                ["AspectRatio"] = 4.866666666666666,
                ["Value"] = u30,
                ["SetValue"] = function(p75) --[[ Name: SetValue, Line 229 ]]
                    --[[
                    Upvalues:
                        [1] = u31
                        [2] = u70
                        [3] = u26
                        [4] = u25
                    --]]
                    u31(p75)
                    u25((u70(u26, {
                        ["animatedEmotesOnly"] = p75
                    })))
                end,
                ["Size"] = UDim2.new(0.33, 0, 0.9, 0),
                ["BoxColor"] = Color3.fromRGB(23, 23, 23)
            }) }
        local v77 = #v76
        local v78 = {
            ["Size"] = UDim2.new(0.55, 0, 1, 0)
        }
        local v79 = u19.Elements
        local v80 = u33
        local v81 = {}
        for v82 = 1, #v79 do
            local v83 = v79[v82]
            local _ = v82 - 1
            local v84 = v83.name
            if v84 ~= "" and v84 then
                table.insert(v81, {
                    ["key"] = v84
                })
            end
        end
        v78.Items = v81
        v78.InputText = v28
        function v78.OnTextChange(p85, p86) --[[ Line: 266 ]]
            --[[
            Upvalues:
                [1] = u19
                [2] = u27
                [3] = u70
                [4] = u25
                [5] = u29
            --]]
            local v87 = 0
            local v88 = {}
            for v89, v90 in u19.Elements do
                local _ = v89 - 1
                local v91 = v90.name
                if table.find(p86, v91) ~= nil == true then
                    v87 = v87 + 1
                    v88[v87] = v90
                end
            end
            u27(v88)
            u25((u70(v88)))
            u29(p85)
        end
        local v92 = "Search "
        local v93
        if #v80 == 0 then
            if u30 then
                v93 = #u19.Elements
            else
                v93 = #u19.Elements - 1
            end
        elseif u30 then
            v93 = #v80
        else
            v93 = #v80 - 1
        end
        v78.PlaceHolderText = v92 .. tostring(v93) .. " " .. u19.Tab
        v78.MaxCharLength = 30
        v78.LayoutOrder = 2
        v78.BarColor = u4.BLACK
        v78.BarTransparency = 0.5
        v76[v77 + 1] = u10.createElement(u14, v78)
        v72[v73 + 1] = u10.createElement(u7, v74, v76)
        v72[v73 + 2] = v62
        return u10.createFragment({
            ["Items"] = u10.createElement("Frame", v71, v72)
        })
    end)
}