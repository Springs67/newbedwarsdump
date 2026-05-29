local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"))
local u2 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil
local v3 = v1.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services")
local u4 = v3.CollectionService
local u5 = v3.Workspace
local u6 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType
local u7 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil
local u8 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta
local u9 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType
local u10 = v1.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil
local u11 = v1.import(script, script.Parent, "golem-boss-client").GolemBossClient
local u12 = setmetatable({}, {
    ["__tostring"] = function() --[[ Name: __tostring, Line 17 ]]
        return "SpiritGolemBossClient"
    end,
    ["__index"] = u11
})
u12.__index = u12
function u12.new(...) --[[ Line: 23 ]]
    --[[
    Upvalues:
        [1] = u12
    --]]
    local v13 = u12
    local v14 = setmetatable({}, v13)
    return v14:constructor(...) or v14
end
function u12.constructor(p15, p16, p17, p18) --[[ Line: 27 ]]
    --[[
    Upvalues:
        [1] = u11
    --]]
    u11.constructor(p15, p16, p17, p18)
end
function u12.handleActionRequest(p19, p20, p21) --[[ Line: 30 ]]
    --[[
    Upvalues:
        [1] = u11
        [2] = u2
        [3] = u7
        [4] = u6
    --]]
    u11.handleActionRequest(p19, p20, p21)
    if p20 == "summon_heal_totems" then
        u2:playAnimation(p19.gameEntity, u7:getAssetId(u6.GOLEM_BOSS_IDLE), {
            ["looped"] = false
        })
    end
end
function u12.createGameEntity(p22, p23) --[[ Line: 38 ]]
    --[[
    Upvalues:
        [1] = u8
        [2] = u9
        [3] = u10
        [4] = u5
        [5] = u4
    --]]
    local v24 = u8(u9.SPIRIT_GOLEM_BOSS).model:Clone()
    v24:WaitForChild("RootPart").Anchored = true
    u10:setEntityIgnoreQuery(v24)
    u10:setClientEntityNotCollidable(v24)
    v24:PivotTo(p23)
    p22.gameEntity = v24
    u10:hideStatefulEntity(p22.gameEntity)
    v24.Parent = u5
    u4:AddTag(v24, "spiritGolem")
    p22:registerClientGameEntity(v24)
end
return {
    ["SpiritGolemBossClient"] = u12
}