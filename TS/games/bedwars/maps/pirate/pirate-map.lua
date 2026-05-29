local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib")).import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils")
local v2 = {}
local u3 = { "skull-island" }
v2.MAPS = u3
function v2.isValidMap(p4) --[[ Line: 9 ]]
    --[[
    Upvalues:
        [1] = u1
        [2] = u3
    --]]
    local v5 = false
    for v6, v7 in u3 do
        local _ = v6 - 1
        if u1.includes(string.lower(p4), string.lower(v7)) then
            v5 = true
            break
        end
    end
    return v5
end
v2.BarrelPromptMaxDistance = 6
return {
    ["PirateMap"] = v2
}