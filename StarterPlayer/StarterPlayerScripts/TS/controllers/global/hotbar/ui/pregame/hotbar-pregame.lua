local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.Button
local u5 = v3.DeviceUtil
local u6 = v3.Empty
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "types", "app-config").BedwarsAppIds
local u13 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType
local u14 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit
local u17 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local v18 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weapon-util")
local u19 = v18.KitWithCustomWeapon
local u20 = v18.WeaponType
local u21 = v1.import(script, script.Parent.Parent, "kit", "hotbar-kit-viewport").HotbarKitViewport
local u22 = v1.import(script, script.Parent.Parent, "weapon-selection", "weapon-viewport").WeaponViewport
local v46 = v9.new(u8)(function(p23, p24) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u14
        [3] = u7
        [4] = u15
        [5] = u11
        [6] = u16
        [7] = u19
        [8] = u5
        [9] = u4
        [10] = u13
        [11] = u2
        [12] = u12
        [13] = u21
        [14] = u6
        [15] = u22
        [16] = u20
        [17] = u17
    --]]
    local _ = p24.useState
    local _ = p24.useEffect
    if p23.QueueType == nil then
        return u8.createFragment()
    end
    local u25 = u14(p23.QueueType)
    local v26 = p23.QueueType or u7.Controllers.MatchController:getQueueType()
    local v27
    if v26 == u15.CUSTOM_KIT_CREATION or v26 == u15.CUSTOM_KIT then
        v27 = false
    else
        v27 = v26 ~= u15.TRAINING_ROOM
    end
    local v28 = u11:getState().Bedwars.weapon
    local v29 = u19[u11:getState().Bedwars.kit or u16.NONE] == nil
    local v30 = {
        ["BackgroundTransparency"] = 1,
        ["BorderSizePixel"] = 0,
        ["Modal"] = false,
        ["Size"] = UDim2.fromScale(1, u5.isSmallScreen() and 0.7 or 0.5),
        ["Position"] = UDim2.fromScale(0.5, -0.5),
        ["AnchorPoint"] = Vector2.new(0.5, 1)
    }
    local v31 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = "Vertical",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder",
            ["Padding"] = UDim.new(0, 3)
        }) }
    local _ = #v31
    local v32 = {
        ["LayoutOrder"] = 0,
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v33 = { u8.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["HorizontalAlignment"] = "Center",
            ["VerticalAlignment"] = "Center",
            ["SortOrder"] = "LayoutOrder"
        }) }
    local v34 = #v33
    local v35
    if v27 then
        v35 = u8.createElement(u4, {
            ["Text"] = "<b>KITS</b>",
            ["LayoutOrder"] = 10,
            ["OnClick"] = function() --[[ Name: OnClick, Line 70 ]]
                --[[
                Upvalues:
                    [1] = u25
                    [2] = u13
                    [3] = u7
                    [4] = u2
                    [5] = u12
                    [6] = u11
                --]]
                if u25.game == u13.COMBINED_KIT then
                    u7.Controllers.CombinedKitDraftController:mountUI()
                else
                    u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.KIT_SHOP_APP, {
                        ["SelectedKit"] = u11:getState().Bedwars.kit
                    })
                end
            end,
            ["Size"] = UDim2.fromScale(0.28, 1)
        }, { u8.createElement(u21, {
                ["store"] = p23.store,
                ["Size"] = UDim2.fromScale(1.5, 1.5),
                ["AnchorPoint"] = Vector2.new(0, 0.5),
                ["Position"] = UDim2.fromScale(0.02, 0.48)
            }), u8.createElement("UIAspectRatioConstraint", {
                ["AspectRatio"] = 3.795918367346939,
                ["DominantAxis"] = "Height"
            }) })
    else
        v35 = v27
    end
    if v35 then
        v33[v34 + 1] = v35
    end
    local v36 = #v33
    if v27 then
        v27 = u8.createElement(u6, {
            ["LayoutOrder"] = 10,
            ["Size"] = UDim2.fromScale(0.14, 1)
        })
    end
    if v27 then
        v33[v36 + 1] = v27
    end
    local v37 = #v33
    local v38 = u25.enableWeapons
    if v38 then
        local v39 = {
            ["LayoutOrder"] = 10,
            ["Text"] = v29 and "<b>Weapons</b>" or "<b>Unavailable For Kit</b>",
            ["OnClick"] = function() --[[ Name: OnClick, Line 109 ]]
                --[[
                Upvalues:
                    [1] = u2
                    [2] = u12
                --]]
                u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp(u12.WEAPON_SELECTION_APP, {})
            end,
            ["Size"] = UDim2.fromScale(0.28, 1),
            ["Interactable"] = v29
        }
        local v40 = {}
        local v41 = #v40
        if v29 then
            local v42 = u8.createElement
            local v43 = u22
            local v44 = {
                ["WeaponType"] = v28 or u20.SWORD,
                ["Size"] = UDim2.fromScale(0.4, 1.75),
                ["Position"] = UDim2.fromScale(-0.1, -0.8)
            }
            local v45
            if v29 then
                v45 = nil
            else
                v45 = u17.BLOCK_ICON
            end
            v44.image = v45
            v29 = v42(v43, v44)
        end
        if v29 then
            v40[v41 + 1] = v29
        end
        v40[#v40 + 1] = u8.createElement("UIAspectRatioConstraint", {
            ["AspectRatio"] = 3.795918367346939,
            ["DominantAxis"] = "Height"
        })
        v38 = u8.createElement(u4, v39, v40)
    end
    if v38 then
        v33[v37 + 1] = v38
    end
    v31.SpectatorBar = u8.createElement(u6, v32, v33)
    return u8.createElement("ImageButton", v30, v31)
end)
return {
    ["HotbarPregame"] = v10.connect(function(p47, p48) --[[ Line: 141 ]]
        local v49 = {}
        for v50, v51 in p48 do
            v49[v50] = v51
        end
        v49.store = p47
        v49.QueueType = p47.Game.queueType
        return v49
    end)(v46)
}