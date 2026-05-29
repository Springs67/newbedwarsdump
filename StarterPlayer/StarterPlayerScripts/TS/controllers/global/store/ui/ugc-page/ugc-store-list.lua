local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.Empty
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local v10 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "components", "auto-complete-searchbar")
local u11 = v10.AutoCompleteSearchbar
local u12 = v10.SearchbarShowImageFunc
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").MAX_NEW_SKIN_AGE
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "store", "store-consts").RobuxProductType
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "ugc", "ugc-meta").UgcMeta
local u16 = v1.import(script, script.Parent.Parent, "robux-store-item-showcase-card").RobuxStoreItemShowcaseCard
local v93 = v8.new(u7)(function(u17, p18) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u15
        [3] = u3
        [4] = u5
        [5] = u13
        [6] = u7
        [7] = u11
        [8] = u12
        [9] = u16
        [10] = u14
        [11] = u4
    --]]
    local v19 = p18.useState
    local v20 = p18.useEffect
    local v21 = p18.useValue
    local v22, u23 = v19(u6.entries(u15))
    local v24 = os.time()
    v20(function() --[[ Line: 24 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u5
        --]]
        if not (u3.isHoarceKat() or u5.Controllers.UgcController:hasRequestedOwnedUgcData()) then
            u5.Controllers.UgcController:requestOwnedUgcData()
        end
    end, {})
    local v25 = table.create(#v22)
    for v26, v27 in v22 do
        local _ = v26 - 1
        local _ = v27[1]
        local v28 = v27[2]
        v25[v26] = {
            ["key"] = v28.name,
            ["image"] = v28.image.render
        }
    end
    local v29 = v21(v25)
    local v30 = 0
    local u31 = {}
    for v32, v33 in v22 do
        local _ = v32 - 1
        local v34 = v33[2].releaseTime
        if v24 - (v34 == nil and 0 or v34) <= u13 == true then
            v30 = v30 + 1
            u31[v30] = v33
        end
    end
    table.sort(u31, function(p35, p36) --[[ Line: 65 ]]
        local v37 = p35[2].name
        local v38 = v37 == nil and "" or v37
        local v39 = p36[2].name
        return v38 < (v39 == nil and "" or v39)
    end)
    local v40 = 0
    local v41 = {}
    for v42, v43 in v22 do
        local _ = v42 - 1
        local v44 = v43[2].releaseTime
        if u13 < v24 - (v44 == nil and 0 or v44) == true then
            v40 = v40 + 1
            v41[v40] = v43
        end
    end
    table.sort(v41, function(p45, p46) --[[ Line: 96 ]]
        local v47 = p45[2].name
        local v48 = v47 == nil and "" or v47
        local v49 = p46[2].name
        return v48 < (v49 == nil and "" or v49)
    end)
    local v50 = {
        ["Size"] = UDim2.new(1, -16, 1, 0)
    }
    local v57 = { u7.createElement(u11, {
            ["InputText"] = "",
            ["PlaceHolderText"] = "Name",
            ["Size"] = UDim2.fromScale(0.55, 0.08),
            ["Items"] = v29.value,
            ["OnTextChange"] = function(_, p51) --[[ Name: OnTextChange, Line 118 ]]
                --[[
                Upvalues:
                    [1] = u6
                    [2] = u15
                    [3] = u23
                --]]
                local v52 = 0
                local v53 = {}
                for v54, v55 in u6.entries(u15) do
                    local _ = v54 - 1
                    local _ = v55[1]
                    local v56 = v55[2].name
                    if table.find(p51, v56) ~= nil == true then
                        v52 = v52 + 1
                        v53[v52] = v55
                    end
                end
                u23(v53)
            end,
            ["ShowImage"] = u12.MANUAL,
            ["BackgroundColor3"] = Color3.fromRGB(22, 22, 22)
        }) }
    local _ = #v57
    local function v65(p58, p59) --[[ Line: 144 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
            [3] = u14
            [4] = u17
        --]]
        local v60 = p58[1]
        local v61 = p58[2]
        local v62 = u7.createElement
        local v63 = u16
        local v64 = {
            ["AspectRatio"] = 0.74,
            ["New"] = true,
            ["Title"] = v61.name .. (v61.limited and " (LIMITED)" or ""),
            ["Image"] = v61.image.render,
            ["Product"] = {
                ["Price"] = v61.basePrice,
                ["UgcType"] = v60,
                ["ProductType"] = u14.BedwarsUGC
            },
            ["IsOwned"] = table.find(u17.OwnedUGC, v60) ~= nil,
            ["ProductImageProps"] = {
                ["ImageTransparency"] = v61.robuxStoreDisablePurchase and 0.36 or 0
            },
            ["DisablePurchase"] = v61.robuxStoreDisablePurchase,
            ["GamepadShouldAutoSelect"] = p59 == 0
        }
        return v62(v63, v64)
    end
    local v66 = 0
    local v67 = {}
    for v68, v69 in u31 do
        local v70 = v65(v69, v68 - 1, u31)
        if v70 ~= nil then
            v66 = v66 + 1
            v67[v66] = v70
        end
    end
    local v71 = {
        ["Size"] = UDim2.fromScale(1, 0.9),
        ["Position"] = UDim2.fromScale(0, 0.1)
    }
    local v72 = { u7.createElement("UIGridLayout", {
            ["FillDirection"] = "Horizontal",
            ["FillDirectionMaxCells"] = 4,
            ["SortOrder"] = "LayoutOrder",
            ["CellSize"] = UDim2.new(0.25, -9, 0, 200),
            ["CellPadding"] = UDim2.new(0, 12, 0, 10)
        }) }
    local v73 = #v72
    for v74, v75 in v67 do
        v72[v73 + v74] = v75
    end
    local v76 = #v72
    local function v85(p77, p78) --[[ Line: 194 ]]
        --[[
        Upvalues:
            [1] = u7
            [2] = u16
            [3] = u14
            [4] = u17
            [5] = u31
        --]]
        local v79 = p77[1]
        local v80 = p77[2]
        local v81 = u7.createElement
        local v82 = u16
        local v83 = {
            ["AspectRatio"] = 0.74,
            ["Title"] = v80.name .. (v80.limited and " (LIMITED)" or ""),
            ["Image"] = v80.image.render,
            ["Product"] = {
                ["Price"] = v80.basePrice,
                ["UgcType"] = v79,
                ["ProductType"] = u14.BedwarsUGC
            },
            ["IsOwned"] = table.find(u17.OwnedUGC, v79) ~= nil,
            ["ProductImageProps"] = {
                ["ImageTransparency"] = v80.robuxStoreDisablePurchase and 0.36 or 0
            },
            ["DisablePurchase"] = v80.robuxStoreDisablePurchase
        }
        local v84
        if #u31 > 0 then
            v84 = false
        else
            v84 = p78 == 0
        end
        v83.GamepadShouldAutoSelect = v84
        return v81(v82, v83)
    end
    local v86 = 0
    local v87 = {}
    for v88, v89 in v41 do
        local v90 = v85(v89, v88 - 1, v41)
        if v90 ~= nil then
            v86 = v86 + 1
            v87[v86] = v90
        end
    end
    for v91, v92 in v87 do
        v72[v76 + v91] = v92
    end
    v57.ListContainer = u7.createElement(u4, v71, v72)
    return u7.createFragment({
        ["ItemListContainer"] = u7.createElement(u4, v50, v57)
    })
end)
return {
    ["UGCStoreList"] = v9.connect(function(p94, p95) --[[ Line: 234 ]]
        local v96 = {}
        for v97, v98 in p95 do
            v96[v97] = v98
        end
        v96.OwnedUGC = p94.Lobby.ownedUGC
        return v96
    end)(v93)
}