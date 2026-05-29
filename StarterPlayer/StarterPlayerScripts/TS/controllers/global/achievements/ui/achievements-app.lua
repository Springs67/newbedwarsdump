local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u4 = v3.DarkBackground
local u5 = v3.DeviceUtil
local u6 = v3.SlideIn
local u7 = v3.WidgetComponent
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v9 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v10 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u11 = v1.import(script, script.Parent, "achievements-core").AchievementsCore
local v34 = v9.new(u8)(function(u12, p13) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u8
        [3] = u5
        [4] = u4
        [5] = u6
        [6] = u7
        [7] = u11
    --]]
    local _ = p13.useState
    UDim.new(0, 10)
    local function u14() --[[ Line: 16 ]]
        --[[
        Upvalues:
            [1] = u2
            [2] = u12
        --]]
        u2.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp(u12.AppId)
    end
    local v15 = u8.createElement
    local v16 = "ScreenGui"
    local v17 = {
        ["DisplayOrder"] = 20,
        ["ResetOnSpawn"] = false,
        ["IgnoreGuiInset"] = u5.isSmallScreen()
    }
    local v18 = {}
    local v19 = u8.createElement(u4, {
        ["AppId"] = u12.AppId
    })
    local v20 = u8.createElement
    local v21 = u6
    local v22 = {}
    local v23 = {}
    local v24 = u8.createElement
    local v25 = "Frame"
    local v26 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5),
        ["Size"] = UDim2.fromScale(1, 1)
    }
    local v27 = {}
    local v28 = u8.createElement("UISizeConstraint", {
        ["MaxSize"] = Vector2.new(1600, 1000)
    })
    local v29 = u8.createElement
    local v30 = "UIPadding"
    local v31 = {
        ["PaddingBottom"] = UDim.new(0, 20),
        ["PaddingTop"] = UDim.new(0, 10)
    }
    local v32
    if u5.isSmallScreen() then
        v32 = UDim.new(0, 10)
    else
        v32 = UDim.new(0.1, 0)
    end
    v31.PaddingLeft = v32
    local v33
    if u5.isSmallScreen() then
        v33 = UDim.new(0, 10)
    else
        v33 = UDim.new(0.1, 0)
    end
    v31.PaddingRight = v33
    __set_list(v27, 1, {v28, v29(v30, v31), u8.createElement(u7, {
    ["Title"] = "Achievements",
    ["AppId"] = u12.AppId,
    ["AnchorPoint"] = Vector2.new(0.5, 0.5),
    ["Position"] = UDim2.fromScale(0.5, 0.5),
    ["Size"] = UDim2.fromScale(1, 1),
    ["OnClose"] = function() --[[ Name: OnClose, Line 49 ]]
        --[[
        Upvalues:
            [1] = u14
        --]]
        return u14()
    end
}, { u8.createElement(u11, {
        ["ViewingAsLocalPlayer"] = true
    }) })})
    __set_list(v23, 1, {v24(v25, v26, v27)})
    __set_list(v18, 1, {v19, v20(v21, v22, v23)})
    return v15(v16, v17, v18)
end)
return {
    ["AchievementsApp"] = v10.connect(function(p35, p36) --[[ Line: 62 ]]
        local v37 = {}
        for v38, v39 in p36 do
            v37[v38] = v39
        end
        v37.store = p35
        return v37
    end)(v34)
}