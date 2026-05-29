local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.AutoCanvasScrollingFrame
local u4 = v2.ButtonComponent
local u5 = v2.ColorUtil
local u6 = v2.DeviceUtil
local u7 = v2.Empty
local u8 = v2.Padding
local u9 = v2.SoundManager
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v12 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v13 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u15 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local v16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta")
local u17 = v16.getItemSkinMeta
local u18 = v16.getItemSkins
local u19 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u20 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u21 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound
local u22 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme
local u23 = v1.import(script, script.Parent, "item-skin-selector-frame").ItemSkinSelectorFrame
local v76 = v12.new(u11)(function(u24, p25) --[[ Line: 25 ]]
    --[[
    Upvalues:
        [1] = u20
        [2] = u17
        [3] = u6
        [4] = u15
        [5] = u9
        [6] = u21
        [7] = u10
        [8] = u11
        [9] = u18
        [10] = u23
        [11] = u5
        [12] = u3
        [13] = u7
        [14] = u14
        [15] = u19
        [16] = u4
        [17] = u22
        [18] = u8
    --]]
    local v26 = p25.useState
    local _ = p25.useEffect
    local u27, u28 = v26(u24.EquippedItemSkinType)
    local v29 = u20(u24.BaseItemSkinType)
    local v30
    if u27 then
        v30 = u17(u27).name
    else
        v30 = v29.displayName
    end
    local v31
    if u27 then
        v31 = u17(u27).renderImage
    else
        v31 = v29.image
    end
    local v32 = u24.OwnedItemSkins
    local v33 = table.create(#v32)
    local u34 = {}
    for v35, v36 in v32 do
        local _ = v35 - 1
        v33[v35] = v36.skin
    end
    for _, v37 in v33 do
        u34[v37] = true
    end
    local v38 = u24.EquippedItemSkinType == u27
    local function u39() --[[ Line: 53 ]]
        --[[
        Upvalues:
            [1] = u6
            [2] = u15
            [3] = u24
            [4] = u27
            [5] = u9
            [6] = u21
            [7] = u10
        --]]
        if u6.isHoarceKat() then
            u15:dispatch({
                ["type"] = "LockerSetItemSkin",
                ["itemType"] = u24.BaseItemSkinType,
                ["itemSkin"] = u27
            })
            u9:playSound(u21.EQUIP_DEFAULT)
        elseif u10.Controllers.LockerController:setItemSkin(u24.BaseItemSkinType, u27) then
            u9:playSound(u21.EQUIP_DEFAULT)
        end
    end
    local v40 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v41 = {}
    local v42 = #v41
    local v43 = {
        ["Size"] = UDim2.fromScale(0.3, 1)
    }
    local v44 = { u11.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 8)
        }) }
    local _ = #v44
    local v45 = u18(u24.BaseItemSkinType)
    local v46
    if v45 == nil then
        v46 = v45
    else
        table.sort(v45, function(p47, p48) --[[ Line: 86 ]]
            --[[
            Upvalues:
                [1] = u34
            --]]
            local v49 = u34[p47] ~= nil
            local v50 = u34[p48] ~= nil
            if v49 == v50 then
                return false
            end
            if v49 then
                v49 = not v50
            end
            return v49
        end)
        local function v53(p51) --[[ Line: 99 ]]
            --[[
            Upvalues:
                [1] = u17
                [2] = u24
                [3] = u27
                [4] = u28
                [5] = u34
                [6] = u11
                [7] = u23
            --]]
            if u17(p51).kitSkinOnly then
                return nil
            end
            local v52 = {
                ["ItemSkinType"] = p51,
                ["BaseItemSkinType"] = u24.BaseItemSkinType,
                ["SelectedItemSkin"] = u27,
                ["SetSelectedItemSkin"] = u28,
                ["EquipedItemSkin"] = u24.EquippedItemSkinType,
                ["IsOwned"] = u34[p51] ~= nil
            }
            return u11.createElement(u23, v52)
        end
        local v54 = 0
        v46 = {}
        for v55, v56 in v45 do
            local v57 = v53(v56, v55 - 1, v45)
            if v57 ~= nil then
                v54 = v54 + 1
                v46[v54] = v57
            end
        end
    end
    local v58 = {
        ["ScrollingFrameProps"] = {
            ["ScrollBarThickness"] = 4,
            ["ScrollBarImageTransparency"] = 0.3,
            ["BackgroundTransparency"] = 1,
            ["BorderSizePixel"] = 0,
            ["LayoutOrder"] = 2,
            ["Size"] = UDim2.fromScale(1, 0.9),
            ["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
            ["ScrollingDirection"] = Enum.ScrollingDirection.Y,
            ["ScrollBarImageColor3"] = u5.WHITE
        }
    }
    local v59 = { u11.createElement("UIGridLayout", {
            ["FillDirectionMaxCells"] = 3,
            ["VerticalAlignment"] = "Top",
            ["HorizontalAlignment"] = "Left",
            ["CellSize"] = UDim2.fromScale(0.31, 0.33),
            ["CellPadding"] = UDim2.new(0.01, 0, 0.01, 0)
        }), u11.createElement(u23, {
            ["ItemSkinType"] = nil,
            ["IsOwned"] = true,
            ["GamepadShouldAutoSelect"] = true,
            ["BaseItemSkinType"] = u24.BaseItemSkinType,
            ["SelectedItemSkin"] = u27,
            ["SetSelectedItemSkin"] = u28,
            ["EquipedItemSkin"] = u24.EquippedItemSkinType
        }) }
    local v60 = #v59
    if v46 then
        for v61, v62 in v46 do
            v59[v60 + v61] = v62
        end
    end
    v44.List = u11.createElement(u3, v58, v59)
    v41.SkinListContainer = u11.createElement(u7, v43, v44)
    local v63 = {
        ["Size"] = UDim2.fromScale(0.4, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5)
    }
    local v64 = {}
    local v65 = #v64
    local v66 = {
        ["Size"] = UDim2.fromScale(0.8, 0.2),
        ["Position"] = UDim2.fromScale(0.5, 0),
        ["AnchorPoint"] = Vector2.new(0.5, 0)
    }
    local v67 = {}
    local _ = #v67
    local v68 = {
        ["Text"] = v30 == nil and "" or v30,
        ["TextScaled"] = true,
        ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
        ["TextColor3"] = Color3.fromRGB(255, 255, 255),
        ["TextXAlignment"] = "Center",
        ["Size"] = UDim2.fromScale(1, 1),
        ["Position"] = UDim2.fromScale(0.5, 0.1),
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["BackgroundTransparency"] = 1
    }
    v67.Title = u11.createElement("TextLabel", v68)
    v64.TitleContainer = u11.createElement(u7, v66, v67)
    local v69
    if u6.isHoarceKat() or not u27 then
        local v70 = {}
        if v31 == nil then
            v31 = u19.RANDOM_KIT_RENDER
        end
        v70.Image = v31
        v70.Size = UDim2.fromScale(0.7, 0.7)
        v70.Position = UDim2.fromScale(0.5, 0.5)
        v70.AnchorPoint = Vector2.new(0.5, 0.5)
        v70.BackgroundTransparency = 1
        v69 = u11.createFragment({
            ["DefaultSkin"] = u11.createElement("ImageLabel", v70, { u11.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        })
    else
        v69 = u11.createElement(u14, {
            ["Reward"] = {
                ["itemSkin"] = u27
            }
        })
    end
    v64[v65 + 1] = v69
    v41.DisplayContainer = u11.createElement(u7, v63, v64)
    local v71 = v42 + 1
    local v72 = u11.createElement
    local v73 = u4
    local v74 = {
        ["TextScaled"] = true,
        ["Size"] = UDim2.fromScale(1, u6.isSmallScreen() and 0.15 or 0.12),
        ["Position"] = UDim2.fromScale(1, 0.9),
        ["AnchorPoint"] = Vector2.new(1, 1),
        ["OnClick"] = function() --[[ Name: OnClick, Line 228 ]]
            --[[
            Upvalues:
                [1] = u39
            --]]
            u39()
        end
    }
    local v75
    if v38 then
        v75 = Color3.fromRGB(96, 96, 96)
    else
        v75 = u5.darken(u22.mcGreen, 0.8)
    end
    v74.BackgroundColor3 = v75
    v74.Text = u34 and (v38 and "EQUIPPED" or "EQUIP") or "NOT OWNED"
    v74.Disabled = v38 or not u34
    v41[v71] = v72(v73, v74, { u11.createElement(u8, {
            ["Padding"] = UDim.new(0.15, 0)
        }), u11.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.375
        }) })
    return u11.createFragment({
        ["Container"] = u11.createElement(u7, v40, v41)
    })
end)
return {
    ["ItemSkinSelector"] = v13.connect(function(p77, p78) --[[ Line: 248 ]]
        --[[
        Upvalues:
            [1] = u17
        --]]
        local v79 = {}
        for v80, v81 in p78 do
            v79[v80] = v81
        end
        local v82 = p77.Locker.itemSkins
        if v82 ~= nil then
            local v83 = 0
            v82 = {}
            for v84, v85 in v82 do
                local _ = v84 - 1
                local v86 = u17(v85)
                local v87 = v86.itemType == p78.BaseItemSkinType and {
                    ["skin"] = v85,
                    ["metadata"] = v86
                } or nil
                if v87 ~= nil then
                    v83 = v83 + 1
                    v82[v83] = v87
                end
            end
        end
        v79.OwnedItemSkins = v82 == nil and {} or v82
        v79.EquippedItemSkinType = p77.Locker.selectedItemSkins[p78.BaseItemSkinType]
        return v79
    end)(v76)
}