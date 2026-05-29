local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out")
local u3 = v2.DarkBackground
local u4 = v2.DeviceUtil
local u5 = v2.SlideIn
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v7 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u9 = v1.import(script, script.Parent, "contract-select-component").ContractSelectComponent
local v27 = v7.new(u6)(function(p10, p11) --[[ Line: 11 ]]
    --[[
    Upvalues:
        [1] = u6
        [2] = u3
        [3] = u5
        [4] = u4
        [5] = u9
    --]]
    local _ = p11.useState
    local v12 = u6.createFragment
    local v13 = {}
    local v14 = u6.createElement
    local v15 = "ScreenGui"
    local v16 = {}
    local v17 = {}
    local v18 = u6.createElement(u3, {
        ["AppId"] = p10.AppId
    })
    local v19 = u6.createElement
    local v20 = u5
    local v21 = {}
    local v22 = {}
    local v23 = u6.createElement
    local v24 = "Frame"
    local v25 = {
        ["BackgroundTransparency"] = 1,
        ["AnchorPoint"] = Vector2.new(0.5, 0.5),
        ["Position"] = UDim2.fromScale(0.5, 0.5)
    }
    local v26
    if u4.isSmallScreen() then
        v26 = UDim2.fromScale(0.9, 0.9)
    else
        v26 = UDim2.fromScale(0.7, 0.7)
    end
    v25.Size = v26
    __set_list(v22, 1, {v23(v24, v25, { u6.createElement("UIAspectRatioConstraint", {
        ["AspectRatio"] = 1.9878640776699028
    }), u6.createElement(u9, {
        ["bloodUpgrades"] = p10.bloodUpgrades,
        ["activeContract"] = p10.activeContract,
        ["availableContracts"] = p10.availableContracts
    }) })})
    __set_list(v17, 1, {v18, v19(v20, v21, v22)})
    v13.ContractSelect = v14(v15, v16, v17)
    return v12(v13)
end)
return {
    ["ContractSelectApp"] = v8.connect(function(p28, p29) --[[ Line: 39 ]]
        local v30 = {}
        for v31, v32 in p29 do
            v30[v31] = v32
        end
        v30.bloodUpgrades = p28.Kit.bloodUpgrades
        v30.activeContract = p28.Kit.activeContract
        v30.availableContracts = p28.Kit.availableContracts
        return v30
    end)(v27)
}