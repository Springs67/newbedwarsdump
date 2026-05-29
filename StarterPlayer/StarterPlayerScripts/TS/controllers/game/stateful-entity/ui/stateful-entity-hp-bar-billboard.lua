local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "stateful-entity-hp-bar").StatefulEntityHpBar
local v16 = v3.new(u2)(function(p6, p7) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local _ = p7.useState
    local v8 = p6.maxDistance
    local v9 = (v8 == 0 or (v8 ~= v8 or not v8)) and 35 or p6.maxDistance
    local v10 = u2.createFragment
    local v11 = {}
    local v12 = u2.createElement
    local v13 = "BillboardGui"
    local v14 = {
        ["AlwaysOnTop"] = true
    }
    local v15
    if p6.adornee then
        v15 = p6.adornee
    elseif p6.gameEntity:IsA("Model") then
        v15 = p6.gameEntity.PrimaryPart
    else
        v15 = p6.gameEntity
    end
    v14.Adornee = v15
    v14.StudsOffset = p6.hpBarOffset
    v14.Size = p6.size or UDim2.fromScale(5, 0.35)
    v14.MaxDistance = v9
    v14.DistanceLowerLimit = v9
    v14.DistanceUpperLimit = v9
    v11.StatefulEntityHpBar = v12(v13, v14, { u2.createElement(u5, {
            ["AppId"] = "StatefulEntityHpBar_" .. p6.gameEntity.Name,
            ["gameEntity"] = p6.gameEntity,
            ["serverInstance"] = p6.serverInstance,
            ["barColor"] = p6.barColor
        }) })
    return v10(v11)
end)
return {
    ["StatefulEntityHpBarBillboard"] = v4.connect(function(_, p17) --[[ Line: 31 ]]
        local v18 = {}
        for v19, v20 in p17 do
            v18[v19] = v20
        end
        return v18
    end)(v16)
}