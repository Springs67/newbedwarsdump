local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v2.Padding
local u6 = v2.UIUtil
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").UserInputService
local u11 = v1.import(script, script.Parent.Parent.Parent, "global", "reward", "ui", "reward-showcase").RewardShowcase
local u12 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "item-skin", "item-skin-meta").getItemSkinMeta
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "badge", "badge-type").BadgeType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "locker-item-types").LockerItemCategory
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity").CrateItemRarity
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "reward-crate", "crate-item", "crate-item-rarity-meta").getCrateItemRarityMeta
local u18 = v1.import(script, script.Parent.Parent, "locker", "ui", "locker-util").LockerUtil
local v89 = v8.new(u7)(function(u19, p20) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u12
        [3] = u13
        [4] = u10
        [5] = u6
        [6] = u11
        [7] = u16
        [8] = u17
        [9] = u15
        [10] = u5
        [11] = u14
        [12] = u3
        [13] = u4
    --]]
    local v21 = p20.useState
    local v22 = p20.useEffect
    local u23 = u7.createRef()
    local v24, u25 = v21("")
    v22(function() --[[ Line: 25 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u12
            [3] = u13
            [4] = u25
        --]]
        if u19.BaseItemSkinType then
            local v26
            if u19.ItemSkinType then
                local v27 = u12(u19.ItemSkinType).renderImage
                v26 = v27 == nil and "" or v27
            else
                local v28 = u13(u19.BaseItemSkinType).image
                v26 = v28 == nil and "" or v28
            end
            u25(v26)
        elseif u19.LockerCategory then
            u25(not u19.SelectedLockerItem and "" or u19.SelectedLockerItem.imageId)
        end
    end, { u19.ItemSkinType, u19.SelectedLockerItem })
    v22(function() --[[ Line: 46 ]]
        --[[
        Upvalues:
            [1] = u19
            [2] = u10
            [3] = u6
            [4] = u23
        --]]
        if u19.GamepadShouldAutoSelect and u10.GamepadEnabled then
            u6:selectGui(u23:getValue())
        end
    end, {})
    local function v30(p29) --[[ Line: 51 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u11
        --]]
        return u7.createElement(u11, {
            ["Reward"] = p29.Reward,
            ["Size"] = p29.Size or UDim2.fromScale(1, 1),
            ["Position"] = UDim2.fromScale(0.5, 0.5),
            ["AnchorPoint"] = Vector2.new(0.5, 0.5)
        })
    end
    local v31 = u19.ItemSkinType
    if v31 then
        local v32 = {
            ["Size"] = UDim2.fromScale(1, 0.04),
            ["Position"] = UDim2.fromScale(0, 1),
            ["AnchorPoint"] = Vector2.new(0, 1)
        }
        local v33 = u12(u19.ItemSkinType).rarity
        if v33 == nil then
            v33 = u16.ONE_STAR
        end
        v32.BackgroundColor3 = u17(v33).gradient.colorTop
        v32.BorderSizePixel = 0
        v31 = u7.createFragment({
            ["RarityIndicator"] = u7.createElement("Frame", v32, { u7.createElement("UICorner", {
                    ["CornerRadius"] = UDim.new(0, 12)
                }) })
        })
    end
    local v35 = {
        ["Size"] = u19.Size or UDim2.fromScale(0.25, 1),
        ["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
        ["BackgroundTransparency"] = 0.85,
        ["BorderSizePixel"] = 0,
        [u7.Event.Activated] = function() --[[ Line: 91 ]]
            --[[
            Upvalues:
                [1] = u19
            --]]
            local v34 = u19.OnClick
            if v34 ~= nil then
                v34()
            end
        end,
        [u7.Ref] = u23
    }
    local v36 = { u7.createElement("UICorner", {
            ["CornerRadius"] = UDim.new(0, 6)
        }), u7.createElement("UIGradient", {
            ["Rotation"] = -90,
            ["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(96, 96, 96)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255)) }),
            ["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
        }) }
    local v37 = #v36
    if v31 then
        v36[v37 + 1] = v31
    end
    local v38 = #v36
    local v39 = u19.LockerCategory == u15.TITLE
    if v39 then
        v39 = u19.SelectedLockerItem
        if v39 ~= nil then
            v39 = v39.itemEnum
        end
        if v39 then
            local v40 = {}
            local v41 = {}
            local v42 = u19.SelectedLockerItem
            if v42 ~= nil then
                v42 = v42.itemEnum
            end
            v41.title = v42
            v40.Reward = v41
            v39 = u7.createElement(v30, v40)
        end
    end
    local v43 = {
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v44 = { u7.createElement(u5, {
            ["Padding"] = UDim.new(0.1, 0)
        }) }
    local v45 = #v44
    if v39 then
        v44[v45 + 1] = v39
    end
    local v46 = #v44
    local v47 = u19.LockerCategory == u15.KILL_EFFECT
    if v47 then
        v47 = u19.SelectedLockerItem
        if v47 ~= nil then
            v47 = v47.itemEnum
        end
        if v47 then
            local v48 = {}
            local v49 = {}
            local v50 = u19.SelectedLockerItem
            if v50 ~= nil then
                v50 = v50.itemEnum
            end
            v49.killEffect = v50
            v48.Reward = v49
            v48.Size = UDim2.fromScale(1.35, 1.35)
            v47 = u7.createElement(v30, v48)
        end
    end
    if v47 then
        v44[v46 + 1] = v47
    end
    local v51 = #v44
    local v52 = u19.LockerCategory == u15.WIN_EFFECT
    if v52 then
        v52 = u19.SelectedLockerItem
        if v52 ~= nil then
            v52 = v52.itemEnum
        end
        if v52 then
            local v53 = {}
            local v54 = {}
            local v55 = u19.SelectedLockerItem
            if v55 ~= nil then
                v55 = v55.itemEnum
            end
            v54.winEffect = v55
            v53.Reward = v54
            v53.Size = UDim2.fromScale(1.35, 1.35)
            v52 = u7.createElement(v30, v53)
        end
    end
    if v52 then
        v44[v51 + 1] = v52
    end
    local v56 = #v44
    local v57 = u19.LockerCategory == u15.BED_SKIN
    if v57 then
        v57 = u19.SelectedLockerItem
        if v57 ~= nil then
            v57 = v57.itemEnum
        end
        if v57 then
            local v58 = {}
            local v59 = {}
            local v60 = u19.SelectedLockerItem
            if v60 ~= nil then
                v60 = v60.itemEnum
            end
            v59.bedSkin = v60
            v58.Reward = v59
            v58.Size = UDim2.fromScale(1.35, 1.35)
            v57 = u7.createElement(v30, v58)
        end
    end
    if v57 then
        v44[v56 + 1] = v57
    end
    local v61 = #v44
    local v62 = u19.LockerCategory == u15.BED_BREAK_EFFECT
    if v62 then
        v62 = u19.SelectedLockerItem
        if v62 ~= nil then
            v62 = v62.itemEnum
        end
        if v62 then
            local v63 = {}
            local v64 = {}
            local v65 = u19.SelectedLockerItem
            if v65 ~= nil then
                v65 = v65.itemEnum
            end
            v64.bedBreakEffect = v65
            v63.Reward = v64
            v63.Size = UDim2.fromScale(1.35, 1.35)
            v62 = u7.createElement(v30, v63)
        end
    end
    if v62 then
        v44[v61 + 1] = v62
    end
    local v66 = #v44
    local v67 = u19.LockerCategory == u15.LOBBY_GADGET
    if v67 then
        v67 = u19.SelectedLockerItem
        if v67 ~= nil then
            v67 = v67.itemEnum
        end
        if v67 then
            local v68 = {}
            local v69 = {}
            local v70 = u19.SelectedLockerItem
            if v70 ~= nil then
                v70 = v70.itemEnum
            end
            v69.lobbyGadget = v70
            v68.Reward = v69
            v68.Size = UDim2.fromScale(1.3, 1.3)
            v67 = u7.createElement(v30, v68)
        end
    end
    if v67 then
        v44[v66 + 1] = v67
    end
    local v71 = #v44
    local v72 = u19.LockerCategory == u15.BADGE
    if v72 then
        local v73 = u19.SelectedLockerItem
        if v73 ~= nil then
            v73 = v73.itemEnum
        end
        v72 = v73 ~= u14.NONE
        if v72 then
            local v74 = {}
            local v75 = {}
            local v76 = u19.SelectedLockerItem
            if v76 ~= nil then
                v76 = v76.itemEnum
            end
            v75.achievement = v76
            v74.Reward = v75
            v74.Size = UDim2.fromScale(1.1, 1.1)
            v72 = u7.createElement(v30, v74)
        end
    end
    if v72 then
        v44[v71 + 1] = v72
    end
    local v77 = #v44
    local v78 = u19.SelectedLockerItem
    if v78 ~= nil then
        v78 = v78.itemEnum
    end
    local v79 = v78 == nil
    if v79 then
        if u19.BaseItemSkinType == nil then
            v79 = u7.createFragment({
                ["DefaultLockerItem"] = u7.createElement("TextLabel", {
                    ["Text"] = "NONE",
                    ["TextScaled"] = true,
                    ["BackgroundTransparency"] = 1,
                    ["Size"] = UDim2.fromScale(0.75, 0.75),
                    ["TextColor3"] = Color3.fromRGB(255, 255, 255),
                    ["FontFace"] = Font.new("Roboto", Enum.FontWeight.Bold),
                    ["Position"] = UDim2.fromScale(0.5, 0.5),
                    ["AnchorPoint"] = Vector2.new(0.5, 0.5)
                }, { u7.createElement("UIAspectRatioConstraint", {
                        ["AspectRatio"] = 1
                    }) })
            })
        else
            v79 = false
        end
    end
    if v79 then
        v44[v77 + 1] = v79
    end
    local v80 = #v44 + 1
    local v81
    if u19.ItemSkinType and u19.BaseItemSkinType then
        local v82 = u7.createElement
        local v83 = {}
        local v84 = {}
        local v85
        if u3.isHoarceKat() then
            v85 = nil
        else
            v85 = u19.ItemSkinType
        end
        v84.itemSkin = v85
        v83.Reward = v84
        v81 = v82(v30, v83)
    elseif u19.ItemSkinType == nil and u19.BaseItemSkinType then
        v81 = u7.createFragment({
            ["DefaultItemFrame"] = u7.createElement("ImageLabel", {
                ["ScaleType"] = "Fit",
                ["BackgroundTransparency"] = 1,
                ["Size"] = UDim2.fromScale(1, 1),
                ["Image"] = v24,
                ["Position"] = UDim2.fromScale(0.5, 0.5),
                ["AnchorPoint"] = Vector2.new(0.5, 0.5)
            }, { u7.createElement("UIAspectRatioConstraint", {
                    ["AspectRatio"] = 1
                }) })
        })
    else
        v81 = u7.createFragment()
    end
    v44[v80] = v81
    v36.Content = u7.createElement(u4, v43, v44)
    local v86 = u19[u7.Children]
    if v86 then
        for v87, v88 in v86 do
            if type(v87) == "number" then
                v36[v38 + v87] = v88
            else
                v36[v87] = v88
            end
        end
    end
    return u7.createFragment({
        ["CollectionItemFrame"] = u7.createElement("ImageButton", v35, v36)
    })
end)
return {
    ["CollectionItemFrame"] = v9.connect(function(p90, p91) --[[ Line: 355 ]]
        --[[
        Upvalues:
            [1] = u18
        --]]
        if p91.BaseItemSkinType then
            local v92 = {}
            for v93, v94 in p91 do
                v92[v93] = v94
            end
            v92.ItemSkinType = p90.Locker.selectedItemSkins[p91.BaseItemSkinType]
            return v92
        end
        if not p91.LockerCategory then
            local v95 = {}
            for v96, v97 in p91 do
                v95[v96] = v97
            end
            return v95
        end
        local v98 = {}
        for v99, v100 in p91 do
            v98[v99] = v100
        end
        v98.SelectedLockerItem = u18.getEquippedLockerCosmeticDisplay(p91.LockerCategory, p90.Locker)
        return v98
    end)(v89)
}