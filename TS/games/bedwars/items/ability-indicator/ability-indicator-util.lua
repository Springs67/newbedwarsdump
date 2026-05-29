local u1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine
local u3 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil
local v4 = u1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u5 = v4.CollectionService
local u6 = v4.Players
local u7 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entities", "player-entity").PlayerEntity
local u8 = u1.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil
local u9 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 13 ]]
        return "AbilityIndicatorUtil"
    end
})
u9.__index = u9
function u9.new(...) --[[ Line: 18 ]]
    --[[
    Upvalues:
        [1] = u9
    --]]
    local v10 = u9
    local v11 = setmetatable({}, v10)
    return v11:constructor(...) or v11
end
function u9.constructor(_) --[[ Line: 22 ]] end
function u9.calculateBlockTargetPoint(_, p12, p13, p14, p15) --[[ Line: 24 ]]
    --[[
    Upvalues:
        [1] = u5
        [2] = u2
    --]]
    local v16 = p14 == nil and 400 or p14
    local v17 = RaycastParams.new()
    v17.FilterType = Enum.RaycastFilterType.Include
    local v18 = {}
    local v19 = #v18
    local v20 = u5:GetTagged("block")
    local v21 = #v20
    table.move(v20, 1, v21, v19 + 1, v18)
    local v22 = v19 + v21
    local v23 = u5:GetTagged("ArenaBarrier")
    table.move(v23, 1, #v23, v22 + 1, v18)
    v17.FilterDescendantsInstances = v18
    local v24 = u2:serverRaycast(p12, p13 * v16, v17)
    if v24 then
        if p15 and v16 < (p15 - v24.Position).Magnitude then
            return nil
        else
            return v24.Position
        end
    else
        return nil
    end
end
function u9.calculatePlayerTargetPoint(p25, p26, p27, p28, p29) --[[ Line: 56 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u6
        [3] = u1
        [4] = u7
        [5] = u3
    --]]
    local v30 = p29 == nil and 400 or p29
    local u31 = u8:getEntity(p26)
    local v32 = RaycastParams.new()
    v32.FilterType = Enum.RaycastFilterType.Exclude
    local v33 = u6:GetPlayers()
    local function v36(p34) --[[ Line: 66 ]]
        --[[
        Upvalues:
            [1] = u8
            [2] = u31
            [3] = u1
            [4] = u7
        --]]
        local v35 = u8:getEntity(p34)
        if v35 then
            if u31 and u31:canAttack(v35) then
                return nil
            elseif v35:getInstance().Name == "archer" or u1.instanceof(v35, u7) then
                return p34.Character
            else
                return nil
            end
        else
            return nil
        end
    end
    local v37 = 0
    local v38 = {}
    for v39, v40 in v33 do
        local v41 = v36(v40, v39 - 1, v33)
        if v41 ~= nil then
            v37 = v37 + 1
            v38[v37] = v41
        end
    end
    v32.FilterDescendantsInstances = v38
    local v42 = u3:raycast(p27, p28 * v30, v32)
    local v43
    if v42 == nil then
        v43 = v42
    else
        v43 = v42.Instance
    end
    if v43 then
        local v44 = u8:getEntityFromDescendant(v42.Instance)
        local v45
        if v44 == nil then
            v45 = v44
        else
            v45 = v44:getInstance().PrimaryPart
        end
        if v44 and v45 then
            local v46 = v45.Position
            local v47 = v44:getHumanoid()
            if v47 ~= nil then
                v47 = v47.HipHeight
            end
            local v48 = -(v47 == nil and 2 or v47) - v45.Size.Y / 2
            local v49 = v46 + Vector3.new(0, v48, 0)
            if v49 then
                return v49
            end
        end
    end
    return p25:calculateBlockTargetPoint(p27, p28, v30)
end
return {
    ["AbilityIndicatorUtil"] = u9
}