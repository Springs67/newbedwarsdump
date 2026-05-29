local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local v2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u3 = v2.Players
local u4 = v2.Workspace
local u5 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u6 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 10 ]]
        return "WorldUtil"
    end
})
u6.__index = u6
function u6.new(...) --[[ Line: 15 ]]
    --[[
    Upvalues:
        [1] = u6
    --]]
    local v7 = u6
    local v8 = setmetatable({}, v7)
    return v8:constructor(...) or v8
end
function u6.constructor(_) --[[ Line: 19 ]] end
function u6.getWorldFromPosition(_, p9) --[[ Line: 21 ]]
    --[[
    Upvalues:
        [1] = u4
        [2] = u6
    --]]
    local v10 = u4:WaitForChild("Map", 10)
    if v10 ~= nil then
        v10 = v10:WaitForChild("Worlds", 10)
    end
    if not v10 then
        return v10
    end
    for _, v11 in v10:GetChildren() do
        local v12 = v11:FindFirstChild("Origin")
        local v13
        if v12 == nil then
            v13 = v12
        else
            v13 = v12:IsA("Vector3Value")
        end
        if v13 then
            local v14 = v12.Value - p9
            local v15 = v14.X
            if math.abs(v15) < u6.WORLD_SEPERATION_STUDS / 2 then
                local v16 = v14.Z
                if math.abs(v16) < u6.WORLD_SEPERATION_STUDS / 2 then
                    return v11
                end
            end
        end
    end
end
function u6.getPlayersInWorld(p17, p18) --[[ Line: 47 ]]
    --[[
    Upvalues:
        [1] = u3
    --]]
    local v19 = 0
    local v20 = {}
    for v21, v22 in u3:GetPlayers() do
        local _ = v21 - 1
        local v23 = v22.Character
        if v23 ~= nil then
            v23 = v23.PrimaryPart
        end
        local v24
        if v23 then
            local v25 = p17:getWorldFromPosition(v22.Character.PrimaryPart.Position)
            if v25 ~= nil then
                v25 = v25.Name
            end
            v24 = v25 == p18
        else
            v24 = false
        end
        if v24 == true then
            v19 = v19 + 1
            v20[v19] = v22
        end
    end
    return v20
end
function u6.getEntitiesInWorld(p26, p27) --[[ Line: 78 ]]
    --[[
    Upvalues:
        [1] = u5
    --]]
    local v28 = 0
    local v29 = {}
    for v30, v31 in u5:getAllEntityInstances() do
        local _ = v30 - 1
        local v32
        if v31.PrimaryPart then
            local v33 = p26:getWorldFromPosition(v31.PrimaryPart.Position)
            if v33 ~= nil then
                v33 = v33.Name
            end
            v32 = v33 == p27
        else
            v32 = false
        end
        if v32 == true then
            v28 = v28 + 1
            v29[v28] = v31
        end
    end
    return v29
end
u6.WORLD_SEPERATION_STUDS = 8000
return {
    ["WorldUtil"] = u6
}