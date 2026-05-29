local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DeviceUtil
local u4 = v2.MobileButton
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal")
local u7 = v1.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId
local u9 = v1.import(script, script.Parent, "mobile-ui").MobileUI
local u10 = {}
local v11
if u3.isSmallScreen() then
    v11 = UDim2.fromScale(0.85, 0.51)
else
    v11 = UDim2.fromScale(0.835, 0.53)
end
local v12
if u3.isSmallScreen() then
    v12 = UDim2.fromScale(0.79, 0.51)
else
    v12 = UDim2.fromScale(0.755, 0.53)
end
local v13
if u3.isSmallScreen() then
    v13 = UDim2.fromScale(0.745, 0.61)
else
    v13 = UDim2.fromScale(0.69, 0.6)
end
local v14
if u3.isSmallScreen() then
    v14 = UDim2.fromScale(0.745, 0.73)
else
    v14 = UDim2.fromScale(0.69, 0.705)
end
local v15
if u3.isSmallScreen() then
    v15 = UDim2.fromScale(0.685, 0.665)
else
    v15 = UDim2.fromScale(0.615, 0.6)
end
local v16
if u3.isSmallScreen() then
    v16 = UDim2.fromScale(0.69, 0.545)
else
    v16 = UDim2.fromScale(0.615, 0.705)
end
__set_list(u10, 1, {v11, v12, v13, v14, v15, v16})
return function(p17) --[[ Line: 12 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u6
        [3] = u4
        [4] = u8
        [5] = u7
        [6] = u3
        [7] = u10
        [8] = u9
    --]]
    local v18 = u5
    local v19 = {
        ["isMoveMountEnabledSignal"] = u6.new()
    }
    local v20 = { u5.createElement("ScreenGui", {
            ["ResetOnSpawn"] = false
        }, { u5.createElement(u4, {
                ["Image"] = u8.UP_MOBILE,
                ["Position"] = u7:getActionMobileButtonPosition(),
                ["OnClick"] = function() --[[ Name: OnClick, Line 25 ]] end
            }) }) }
    local v21 = #v20
    local v22 = {
        ["Image"] = u8.DOWN_MOBILE,
        ["Position"] = u7:getActionMobileButtonPosition() - UDim2.fromScale(0.08, 0),
        ["OnClick"] = function() --[[ Line: 36 ]] end
    }
    v20[v21 + 1] = u5.createElement(u4, v22)
    local v23 = {
        ["Image"] = u8.EXPLODE_MOBILE,
        ["Position"] = u7:getActionMobileButtonPosition() - UDim2.fromScale(0.04, u3.isSmallScreen() and 0.14 or 0.11),
        ["OnClick"] = function() --[[ Line: 44 ]] end
    }
    v20[v21 + 2] = u5.createElement(u4, v23)
    local v24 = v21 + 3
    local v25 = u5.createElement
    local v26 = u4
    local v27 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.HOME
    }
    local v28
    if u3.isSmallScreen() then
        v28 = UDim2.fromScale(0.11, 0.11)
    else
        v28 = UDim2.fromScale(0.09, 0.09)
    end
    v27.Size = v28
    v27.Position = u10[1]
    function v27.OnClick() --[[ Line: 51 ]] end
    v20[v24] = v25(v26, v27)
    local v29 = v21 + 4
    local v30 = u5.createElement
    local v31 = u4
    local v32 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.JUGG_BARB_LEAP
    }
    local v33
    if u3.isSmallScreen() then
        v33 = UDim2.fromScale(0.11, 0.11)
    else
        v33 = UDim2.fromScale(0.09, 0.09)
    end
    v32.Size = v33
    v32.Position = u10[2]
    function v32.OnClick() --[[ Line: 58 ]] end
    v20[v29] = v30(v31, v32)
    local v34 = v21 + 5
    local v35 = u5.createElement
    local v36 = u4
    local v37 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.JUGG_BARB_SPIN
    }
    local v38
    if u3.isSmallScreen() then
        v38 = UDim2.fromScale(0.11, 0.11)
    else
        v38 = UDim2.fromScale(0.09, 0.09)
    end
    v37.Size = v38
    v37.Position = u10[3]
    function v37.OnClick() --[[ Line: 65 ]] end
    v20[v34] = v35(v36, v37)
    local v39 = v21 + 6
    local v40 = u5.createElement
    local v41 = u4
    local v42 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.JUGG_BARB_ULT
    }
    local v43
    if u3.isSmallScreen() then
        v43 = UDim2.fromScale(0.11, 0.11)
    else
        v43 = UDim2.fromScale(0.09, 0.09)
    end
    v42.Size = v43
    v42.Position = u10[4]
    function v42.OnClick() --[[ Line: 72 ]] end
    v20[v39] = v40(v41, v42)
    local v44 = v21 + 7
    local v45 = u5.createElement
    local v46 = u4
    local v47 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.JUGG_BARB_ULT
    }
    local v48
    if u3.isSmallScreen() then
        v48 = UDim2.fromScale(0.11, 0.11)
    else
        v48 = UDim2.fromScale(0.09, 0.09)
    end
    v47.Size = v48
    v47.Position = u10[5]
    function v47.OnClick() --[[ Line: 79 ]] end
    v20[v44] = v45(v46, v47)
    local v49 = v21 + 8
    local v50 = u5.createElement
    local v51 = u4
    local v52 = {
        ["GenerateCircleBackground"] = true,
        ["Image"] = u8.JUGG_BARB_ULT
    }
    local v53
    if u3.isSmallScreen() then
        v53 = UDim2.fromScale(0.11, 0.11)
    else
        v53 = UDim2.fromScale(0.09, 0.09)
    end
    v52.Size = v53
    v52.Position = u10[6]
    function v52.OnClick() --[[ Line: 86 ]] end
    v20[v49] = v50(v51, v52)
    local u54 = v18.mount(u5.createElement(u9, v19, v20), p17)
    return function() --[[ Line: 89 ]]
        --[[
        Upvalues:
            [1] = u5
            [2] = u54
        --]]
        return u5.unmount(u54)
    end
end