local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MobileButton
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src").StoreProvider
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "rodux", "src")
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u9 = v1.import(script, script.Parent.Parent.Parent.Parent, "hotbar", "ui", "hotbar-app").HotbarApp
local u10 = v1.import(script, script.Parent.Parent.Parent.Parent, "mobile-ui", "ui", "mobile-ui").MobileUI
local u11 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u12 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").CreateRoduxApp
local u13 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "reducers", "games", "game-reducer").GameReducer
local u14 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore
local u15 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType
local u16 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u17 = v1.import(script, script.Parent, "mobile-layout-customization-app").MobileLayoutCustomizationApp
local u18 = {}
local v19
if u3.isSmallScreen() then
    v19 = UDim2.fromScale(0.85, 0.51)
else
    v19 = UDim2.fromScale(0.835, 0.53)
end
local v20
if u3.isSmallScreen() then
    v20 = UDim2.fromScale(0.79, 0.51)
else
    v20 = UDim2.fromScale(0.755, 0.53)
end
local v21
if u3.isSmallScreen() then
    v21 = UDim2.fromScale(0.745, 0.61)
else
    v21 = UDim2.fromScale(0.69, 0.6)
end
local v22
if u3.isSmallScreen() then
    v22 = UDim2.fromScale(0.745, 0.73)
else
    v22 = UDim2.fromScale(0.69, 0.705)
end
local v23
if u3.isSmallScreen() then
    v23 = UDim2.fromScale(0.685, 0.665)
else
    v23 = UDim2.fromScale(0.615, 0.6)
end
local v24
if u3.isSmallScreen() then
    v24 = UDim2.fromScale(0.69, 0.545)
else
    v24 = UDim2.fromScale(0.615, 0.705)
end
__set_list(u18, 1, {v19, v20, v21, v22, v23, v24})
return function(p25) --[[ Line: 20 ]]
    --[[
    Upvalues:
        [1] = u7
        [2] = u13
        [3] = u5
        [4] = u6
        [5] = u17
        [6] = u8
        [7] = u4
        [8] = u16
        [9] = u11
        [10] = u3
        [11] = u18
        [12] = u10
        [13] = u12
        [14] = u9
        [15] = u14
        [16] = u15
    --]]
    local v26 = {
        ["Game"] = u13
    }
    local v27 = {
        ["store"] = u7.Store.new(u7.combineReducers(v26), {})
    }
    local u28 = u5.mount(u5.createElement(u6, v27, { u5.createElement(u17, {
            ["AppId"] = "MobileLayoutCustomizationApp"
        }) }), p25)
    local v29 = u5
    local v30 = {
        ["isMoveMountEnabledSignal"] = u8.new()
    }
    local v31 = { u5.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u5.createElement(u4, {
                ["Image"] = u16.UP_MOBILE,
                ["Position"] = u11:getActionMobileButtonPosition(),
                ["OnClick"] = function() --[[ Name: OnClick, Line 42 ]] end
            }) }) }
    local v32 = #v31
    local v33 = {
        ["Image"] = u16.DOWN_MOBILE,
        ["Position"] = u11:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
        ["OnClick"] = function() --[[ Line: 53 ]] end
    }
    v31[v32 + 1] = u5.createElement(u4, v33)
    local v34 = {
        ["Image"] = u16.EXPLODE_MOBILE,
        ["Position"] = u11:getActionMobileButtonPosition() - UDim2.fromScale(0.04, u3.isSmallScreen() and 0.14 or 0.11),
        ["OnClick"] = function() --[[ Line: 61 ]] end
    }
    v31[v32 + 2] = u5.createElement(u4, v34)
    local v35 = v32 + 3
    local v36 = u5.createElement
    local v37 = u4
    local v38 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u16.HOME
    }
    local v39
    if u3.isSmallScreen() then
        v39 = UDim2.fromScale(0.11, 0.11)
    else
        v39 = UDim2.fromScale(0.09, 0.09)
    end
    v38.Size = v39
    v38.Position = u18[1]
    function v38.OnClick() --[[ Line: 68 ]] end
    v31[v35] = v36(v37, v38)
    local v40 = v32 + 4
    local v41 = u5.createElement
    local v42 = u4
    local v43 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u16.JUGG_BARB_LEAP
    }
    local v44
    if u3.isSmallScreen() then
        v44 = UDim2.fromScale(0.11, 0.11)
    else
        v44 = UDim2.fromScale(0.09, 0.09)
    end
    v43.Size = v44
    v43.Position = u18[2]
    function v43.OnClick() --[[ Line: 75 ]] end
    v31[v40] = v41(v42, v43)
    local v45 = v32 + 5
    local v46 = u5.createElement
    local v47 = u4
    local v48 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u16.JUGG_BARB_SPIN
    }
    local v49
    if u3.isSmallScreen() then
        v49 = UDim2.fromScale(0.11, 0.11)
    else
        v49 = UDim2.fromScale(0.09, 0.09)
    end
    v48.Size = v49
    v48.Position = u18[3]
    function v48.OnClick() --[[ Line: 82 ]] end
    v31[v45] = v46(v47, v48)
    local v50 = v32 + 6
    local v51 = u5.createElement
    local v52 = u4
    local v53 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u16.JUGG_BARB_ULT
    }
    local v54
    if u3.isSmallScreen() then
        v54 = UDim2.fromScale(0.11, 0.11)
    else
        v54 = UDim2.fromScale(0.09, 0.09)
    end
    v53.Size = v54
    v53.Position = u18[4]
    function v53.OnClick() --[[ Line: 89 ]] end
    v31[v50] = v51(v52, v53)
    local u55 = v29.mount(u5.createElement(u10, v30, v31), p25)
    local u56 = u12("hotbar", u9, {}, {}, {
        ["Parent"] = p25
    })
    u14:dispatch({
        ["type"] = "SetShowHotbarPartyControls",
        ["value"] = false
    })
    u14:dispatch({
        ["type"] = "GameSetQueueType",
        ["queueType"] = u15.BEDWARS_TEST
    })
    return function() --[[ Line: 103 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u28
            [3] = u55
            [4] = u56
        --]]
        u5.unmount(u28)
        u5.unmount(u55)
        u5.unmount(u56)
    end
end