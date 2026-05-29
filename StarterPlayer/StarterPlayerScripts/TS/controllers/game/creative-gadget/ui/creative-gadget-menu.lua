local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.DeviceUtil
local u6 = v3.DropdownComponent
local u7 = v3.Empty
local u8 = v3.SlideIn
local u9 = v3.SoundManager
local u10 = v3.WidgetComponent
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid")
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v15 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u18 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-setting").HostPanelSetting
local u19 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "creative", "custom-match", "host-panel", "components", "host-panel-textbox").HostPanelTextBox
local u20 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar").AutoCompleteSearchbar
local u21 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local v22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "creative-gadget", "creative-gadget-util")
local u23 = v22.GadgetConfigOptions
local u24 = v22.getCreativeGadgetMeta
local v25 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").items
local u26 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local v27 = v12.entries(v25)
local u28 = {}
for v29 = 1, #v27 do
    local v30 = v27[v29]
    local _ = v29 - 1
    local _ = v30[1]
    local v31 = v30[2]
    if not v31.removeFromCustoms then
        local v32 = string.lower(v31.displayName)
        table.insert(u28, v32)
    end
end
local u33 = UDim2.new(1, 0, 0.2, 0)
local u34 = nil
local function v70(u35, p36) --[[ Line: 50 ]]
    --[[
    Upvalues:
        [1] = u34
        [2] = u5
        [3] = u13
        [4] = u17
        [5] = u2
        [6] = u21
        [7] = u14
        [8] = u7
        [9] = u4
        [10] = u11
        [11] = u9
        [12] = u26
        [13] = u24
        [14] = u10
        [15] = u8
    --]]
    local _ = p36.useState
    local v37 = p36.useEffect
    local v38 = u34(u35.CreativeGadgetBlockInstance.Name, u35)
    v37(function() --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u13
            [3] = u17
            [4] = u2
            [5] = u21
        --]]
        if u5.isHoarceKat() then
            return nil
        end
        local u39 = u13.new()
        local u40 = true
        u39:GiveTask(function() --[[ Line: 60 ]]
            --[[
            Upvalues:
                [1] = u40
            --]]
            u40 = false
            return u40
        end)
        local u41 = u17.LocalPlayer.Character
        task.delay(0.1, function() --[[ Line: 66 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u40
                [3] = u39
                [4] = u2
                [5] = u21
            --]]
            local v42 = u41
            if v42 ~= nil then
                v42 = v42:FindFirstChildWhichIsA("Humanoid")
            end
            if u40 and v42 then
                u39:GiveTask(v42:GetPropertyChangedSignal("MoveDirection"):Connect(function() --[[ Line: 73 ]]
                    --[[
                    Upvalues:
                        [1] = u2
                        [2] = u21
                    --]]
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.CREATIVE_GADGET_MENU)
                end))
            end
        end)
        task.delay(0.1, function() --[[ Line: 79 ]]
            --[[
            Upvalues:
                [1] = u41
                [2] = u40
                [3] = u2
                [4] = u21
            --]]
            local v43 = u41
            if v43 ~= nil then
                v43 = v43.PrimaryPart
                if v43 ~= nil then
                    v43 = v43.Position
                end
            end
            if not v43 then
                return nil
            end
            while true do
                local v44 = task.wait(0.05)
                if v44 ~= 0 and (v44 == v44 and v44) then
                    v44 = u40
                end
                if v44 == 0 or (v44 ~= v44 or not v44) then
                    return
                end
                local v45 = u41.PrimaryPart
                if v45 ~= nil then
                    v45 = v45.Position
                end
                if not v45 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.CREATIVE_GADGET_MENU)
                    return nil
                end
                if ((v45 - v43) * Vector3.new(1, 0.3, 1)).Magnitude > 1 then
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.CREATIVE_GADGET_MENU)
                    return nil
                end
            end
        end)
        return function() --[[ Line: 116 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39:DoCleaning()
        end
    end)
    local v46 = {
        ["DisplayOrder"] = 20,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v47 = {}
    local v48 = #v47
    local v49 = {}
    local _ = #v49
    local v50 = {
        ["LayoutOrder"] = 1,
        ["BorderSizePixel"] = 0,
        ["BackgroundTransparency"] = 1,
        ["Size"] = UDim2.fromScale(0.18, 0.4),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.7, 0.5)
    }
    local v51 = {}
    local v52 = #v51
    local v53 = {
        ["ClipsDescendents"] = false,
        ["Title"] = "Gadget Config",
        ["AppId"] = u35.AppId,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1),
        ["OnClose"] = function() --[[ Name: OnClose, Line 145 ]]
            --[[
            Upvalues:
                [1] = u2
                [2] = u35
            --]]
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u35.AppId)
        end,
        ["ContentUIPadding"] = u14.createElement("UIPadding", {
            ["PaddingTop"] = UDim.new(0, 0),
            ["PaddingBottom"] = UDim.new(0, 0),
            ["PaddingLeft"] = UDim.new(0, 5),
            ["PaddingRight"] = UDim.new(0, 5)
        })
    }
    local v54 = { u14.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Left",
            ["Padding"] = UDim.new(0, 10)
        }), u14.createElement(u7) }
    local v55 = #v54
    for v56, v57 in v38 do
        v54[v55 + v56] = v57
    end
    local v58 = #v54 + 1
    local v59 = u14.createElement
    local v60 = u7
    local v61 = {
        ["Size"] = UDim2.fromScale(1, 0.15),
        ["Position"] = UDim2.fromScale(0, 0)
    }
    local v62 = { (u14.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["SortOrder"] = "LayoutOrder",
            ["HorizontalAlignment"] = "Center",
            ["Padding"] = UDim.new(0, 10)
        })) }
    local v63 = u14.createElement
    local v64 = u4
    local v65 = {
        ["Text"] = "Remove",
        ["ZIndex"] = 2,
        ["CornerRadius"] = UDim.new(0.1, 0),
        ["Size"] = UDim2.fromScale(0.45, 1),
        ["TextLabel"] = {
            ["ZIndex"] = 2,
            ["Font"] = Enum.Font.ArialBold,
            ["Size"] = UDim2.fromScale(0.95, 0.65)
        },
        ["BackgroundColor3"] = Color3.fromRGB(181, 51, 51),
        ["OnClick"] = function() --[[ Name: OnClick, Line 189 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u35
                [3] = u2
                [4] = u21
            --]]
            u11.Controllers.CreativeGadgetController:requestGadgetRemoval(u35.CreativeGadgetBlockInstance)
            u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.CREATIVE_GADGET_MENU)
        end
    }
    v62.GadgetRemoveButton = v63(v64, v65)
    local v66 = u14.createElement
    local v67 = u4
    local v69 = {
        ["Text"] = "Apply",
        ["ZIndex"] = 2,
        ["CornerRadius"] = UDim.new(0.1, 0),
        ["Size"] = UDim2.fromScale(0.45, 1),
        ["TextLabel"] = {
            ["ZIndex"] = 2,
            ["Font"] = Enum.Font.ArialBold,
            ["Size"] = UDim2.fromScale(0.95, 0.65)
        },
        ["BackgroundColor3"] = Color3.fromRGB(44, 184, 96),
        ["OnClick"] = function() --[[ Name: OnClick, Line 205 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u35
                [3] = u9
                [4] = u26
                [5] = u24
                [6] = u2
                [7] = u21
            --]]
            u11.Controllers.CreativeGadgetController:requestGadgetCreation(u35.CreativeGadgetBlockInstance):andThen(function(p68) --[[ Line: 206 ]]
                --[[
                Upvalues:
                    [1] = u9
                    [2] = u26
                    [3] = u24
                    [4] = u35
                    [5] = u2
                    [6] = u21
                --]]
                if p68 then
                    u9:playSound(u26.BEDWARS_UPGRADE_SUCCESS)
                    if u24(u35.CreativeGadgetBlockInstance.Name).removeOnConfig then
                        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u21.CREATIVE_GADGET_MENU)
                        return
                    end
                else
                    u9:playSound(u26.ERROR_NOTIFICATION)
                end
            end)
        end
    }
    v62.GadgetApplyButton = v66(v67, v69)
    v54[v58] = v59(v60, v61, v62)
    v51[v52 + 1] = u14.createElement(u10, v53, v54)
    v49[u35.AppId] = u14.createElement("Frame", v50, v51)
    v47[v48 + 1] = u14.createElement(u8, {}, v49)
    return u14.createElement("ScreenGui", v46, v47)
end
local u71 = nil
local u72 = nil
local u73 = nil
u34 = function(p74, u75) --[[ Name: getConfigEntries, Line 226 ]]
    --[[
    Upvalues:
        [1] = u24
        [2] = u23
        [3] = u71
        [4] = u72
        [5] = u73
    --]]
    local u76 = {}
    local v77 = u24(p74).config
    local function v86(p78, p79) --[[ Line: 230 ]]
        --[[
        Upvalues:
            [1] = u23
            [2] = u71
            [3] = u75
            [4] = u76
            [5] = u72
            [6] = u73
        --]]
        if p78 == u23.Field then
            local v80 = u71(p79, u75)
            local v81 = u76
            table.insert(v81, v80)
            return
        elseif p78 == u23.Team then
            local v82 = u72(p79, u75)
            local v83 = u76
            table.insert(v83, v82)
            return
        elseif p78 == u23.Item then
            local v84 = u73(p79, u75)
            local v85 = u76
            table.insert(v85, v84)
        end
    end
    for v87, v88 in v77 do
        v86(v88, v87, v77)
    end
    return u76
end
u71 = function(u89, u90) --[[ Name: createFieldSetting, Line 254 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u33
        [3] = u14
        [4] = u19
        [5] = u18
    --]]
    local v91 = u11.Controllers.CreativeGadgetController:getSavedDataForGadget(u90.CreativeGadgetBlockInstance, u89)
    local v92 = {
        ["Name"] = u89,
        ["Size"] = u33
    }
    local v93 = {}
    local v94 = #v93
    local v96 = {
        ["Text"] = v91 == nil and "" or v91,
        ["PlaceholderText"] = v91 == nil and "" or v91,
        ["NumbersOnly"] = true,
        ["OnFocusLost"] = function(p95) --[[ Line: 274 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u90
                [3] = u89
            --]]
            u11.Controllers.CreativeGadgetController:saveDataToGadget(u90.CreativeGadgetBlockInstance, u89, p95)
        end
    }
    v93[v94 + 1] = u14.createElement(u19, v96)
    return u14.createElement(u18, v92, v93)
end
u72 = function(u97, u98) --[[ Name: createTeamSetting, Line 280 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u14
        [3] = u6
        [4] = u33
        [5] = u18
    --]]
    local v99 = u11.Controllers.CreativeGadgetController:getSavedDataForGadget(u98.CreativeGadgetBlockInstance, u97)
    local v100 = u11.Controllers.TeamController:getTeamDropdown(false)
    local v101 = v100.map[u98.store.Game.teams[1].name]
    if v99 ~= "" and v99 then
        local v102 = nil
        for v103, v104 in u98.store.Game.teams do
            local _ = v103 - 1
            if v104.id == v99 == true then
                v102 = v104
                break
            end
        end
        if v102 then
            v101 = v100.map[v102.name]
        end
    end
    if v100 then
        local v105 = {
            ["Size"] = UDim2.fromScale(1, 1),
            ["DefaultItem"] = v101
        }
        if v101 ~= nil then
            v101 = v101.text
        end
        v105.PlaceholderText = v101
        v105.Items = v100.dropDownItems
        function v105.OnItemSelected(p106) --[[ Line: 319 ]]
            --[[
            Upvalues:
                [1] = u11
                [2] = u98
                [3] = u97
            --]]
            u11.Controllers.CreativeGadgetController:saveDataToGadget(u98.CreativeGadgetBlockInstance, u97, p106)
        end
        v105.LayoutOrder = 1
        v100 = u14.createElement(u6, v105)
    end
    local v107 = {
        ["Name"] = u97,
        ["Size"] = u33
    }
    local v108 = {
        [#v108 + 1] = v100
    }
    return u14.createElement(u18, v107, v108)
end
local u109 = nil
u73 = function(u110, u111) --[[ Name: createItemSetting, Line 335 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u33
        [3] = u28
        [4] = u109
        [5] = u14
        [6] = u20
        [7] = u18
    --]]
    local v112 = u11.Controllers.CreativeGadgetController:getSavedDataForGadget(u111.CreativeGadgetBlockInstance, u110)
    local v113 = {
        ["Name"] = u110,
        ["Size"] = u33
    }
    local v114 = {}
    local v115 = #v114
    local v116 = {
        ["HideSearchIcon"] = true,
        ["Size"] = UDim2.new(1, 0, 1, 0)
    }
    local v117 = table.create(#u28)
    for v118, v119 in u28 do
        local _ = v118 - 1
        v117[v118] = {
            ["key"] = v119
        }
    end
    v116.Items = v117
    v116.InputText = v112 == nil and "" or v112
    function v116.OnTextChange(p120) --[[ Line: 364 ]]
        --[[
        Upvalues:
            [1] = u109
            [2] = u111
            [3] = u110
        --]]
        u109(u111.CreativeGadgetBlockInstance, u110, p120)
    end
    v116.PlaceHolderText = "Search Items"
    v116.LayoutOrder = 2
    v114[v115 + 1] = u14.createElement(u20, v116)
    return u14.createElement(u18, v113, v114)
end
u109 = function(p121, p122, p123) --[[ Name: filterListWithSearch, Line 372 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.Controllers.CreativeGadgetController:saveDataToGadget(p121, p122, p123)
end
local v124 = v15.new(u14)(v70)
return {
    ["CreativeGadgetMenu"] = v16.connect(function(p125, p126) --[[ Line: 376 ]]
        local v127 = {
            ["store"] = p125
        }
        for v128, v129 in p126 do
            v127[v128] = v129
        end
        return v127
    end)(v124)
}