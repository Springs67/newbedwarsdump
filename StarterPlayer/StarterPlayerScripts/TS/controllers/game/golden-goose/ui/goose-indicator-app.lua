local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src")
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src")
local v4 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-rodux", "src")
local u5 = v1.import(script, script.Parent, "goose-world-indicator-component").GooseWorldIndicatorComponent
local v8 = v3.new(u2)(function(p6, p7) --[[ Line: 7 ]]
    --[[
    Upvalues:
        [1] = u2
        [2] = u5
    --]]
    local _ = p7.useState
    return u2.createElement(u5, {
        ["despawnTime"] = p6.despawnTime,
        ["gooseHolderTeamId"] = p6.holderTeamId,
        ["billboardAdornee"] = p6.billboardAdornee
    })
end)
return {
    ["GooseIndicatorApp"] = v4.connect(function(p9, p10) --[[ Line: 16 ]]
        local v11 = {}
        local v12 = p9.Game.activeGoose
        if v12 ~= nil then
            v12 = v12.despawnTime
        end
        v11.despawnTime = v12 == nil and 0 or v12
        v11.holderTeamId = p9.Game.gooseOwnerTeam
        for v13, v14 in p10 do
            v11[v13] = v14
        end
        return v11
    end)(v8)
}