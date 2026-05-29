local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils")
local u4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v5 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v6 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-type-meta").getConsumableMeta
local v8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "consumable", "consumable-types")
local u9 = v8.ConsumableCategory
local u10 = v8.ConsumableStatus
local u11 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil
local u12 = v1.import(script, script.Parent, "consumable-boost").ConsumableBoost
local v26 = v5.new(u4)(function(p13, p14) --[[ Line: 14 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u12
        [3] = u11
        [4] = u2
    --]]
    local _ = p14.useState
    local v15 = {}
    local _ = #v15
    local v16 = p13.activeBoosts
    local v17 = table.create(#v16)
    local v18 = {
        ["ResetOnSpawn"] = false
    }
    for v19, v20 in v16 do
        local _ = v19 - 1
        v17[v19] = u4.createElement(u12, {
            ["Consumable"] = v20
        })
    end
    local v21 = {
        ["AnchorPoint"] = Vector2.new(0, 1),
        ["Position"] = UDim2.fromScale(0.01, 0.99),
        ["Size"] = UDim2.fromScale(0.1, u11.isGameServer() and 0.05 or 0.07)
    }
    local v22 = { u4.createElement("UIListLayout", {
            ["FillDirection"] = "Horizontal",
            ["Padding"] = UDim.new(0.05, 0)
        }) }
    local v23 = #v22
    for v24, v25 in v17 do
        v22[v23 + v24] = v25
    end
    v15.ConsumableBoostList = u4.createElement(u2, v21, v22)
    return u4.createFragment({
        ["ConsumableBoostList"] = u4.createElement("ScreenGui", v18, v15)
    })
end)
return {
    ["ConsumableBoostList"] = v6.connect(function(p27, p28) --[[ Line: 54 ]]
        --[[
        Upvalues:
            [1] = u3
            [2] = u10
            [3] = u9
            [4] = u7
        --]]
        local v29 = u3.entries(p27.Consumable.record)
        local function v34(p30) --[[ Line: 56 ]]
            --[[
            Upvalues:
                [1] = u10
                [2] = u9
                [3] = u7
            --]]
            local _ = p30[1]
            local v31 = p30[2]
            if v31.status ~= u10.ACTIVE then
                return nil
            end
            local v32 = { u9.BATTLE_PASS_XP, u9.ARMOR_TRIM_XP }
            local v33 = u7(v31.consumable).category
            if table.find(v32, v33) ~= nil then
                return v31
            end
        end
        local v35 = 0
        local v36 = {}
        for v37, v38 in v29 do
            local v39 = v34(v38, v37 - 1, v29)
            if v39 ~= nil then
                v35 = v35 + 1
                v36[v35] = v39
            end
        end
        local v40 = {}
        for v41, v42 in p28 do
            v40[v41] = v42
        end
        v40.activeBoosts = v36
        return v40
    end)(v26)
}