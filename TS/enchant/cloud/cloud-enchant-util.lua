local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players
local u4 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 8 ]]
        return "CloudEnchantUtil"
    end
})
u4.__index = u4
function u4.new(...) --[[ Line: 13 ]]
    --[[
    Upvalues:
        [1] = u4
    --]]
    local v5 = u4
    local v6 = setmetatable({}, v5)
    return v6:constructor(...) or v6
end
function u4.constructor(_) --[[ Line: 17 ]] end
function u4.isAboveVoid(_, p7, p8) --[[ Line: 19 ]]
    --[[
    Upvalues:
        [1] = u3
        [2] = u2
    --]]
    local v9 = p8 == nil and 400 or p8
    if not u3:GetPlayerFromCharacter(p7) then
        return false
    end
    local v10 = RaycastParams.new()
    local v11 = p7.PrimaryPart
    if v11 ~= nil then
        v11 = v11.Position
    end
    if not v11 then
        return false
    end
    v10.CollisionGroup = "Blocks"
    v10.FilterType = Enum.RaycastFilterType.Exclude
    local v12 = 0
    local v13 = {}
    for v14, v15 in u3:GetPlayers() do
        local _ = v14 - 1
        local v16 = v15.Character
        if v16 ~= nil then
            v12 = v12 + 1
            v13[v12] = v16
        end
    end
    v10.FilterDescendantsInstances = v13
    local v17 = u2
    local v18 = -v9
    return not v17:serverRaycast(v11, Vector3.new(0, v18, 0), v10)
end
u4.CLOUD_SPEED_MULT = 1.1
u4.CLOUD_MAX_ENERGY = 60
return {
    ["CloudEnchantUtil"] = u4
}