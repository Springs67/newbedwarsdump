-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local AnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").AnimationUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Workspace = v1.Workspace;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local getCurrentStatefulEntitySkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-skin-theme-meta").getCurrentStatefulEntitySkinMeta;
local StatefulEntityType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "stateful-entity-skin", "stateful-entity-type").StatefulEntityType;
local StatefulEntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "stateful-entity", "stateful-entity-util").StatefulEntityUtil;
local GolemBossClient = RuntimeLib.import(script, script.Parent, "golem-boss-client").GolemBossClient;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpiritGolemBossClient";
    end,

    __index = GolemBossClient
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, p5, p6, p7) -- Line: 27
    -- upvalues: GolemBossClient (copy)
    GolemBossClient.constructor(p4, p5, p6, p7);
end;

function u2.handleActionRequest(p8, p9, p10) -- Line: 30
    -- upvalues: GolemBossClient (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    GolemBossClient.handleActionRequest(p8, p9, p10);

    if p9 == "summon_heal_totems" then
        AnimationUtil:playAnimation(p8.gameEntity, GameAnimationUtil:getAssetId(AnimationType.GOLEM_BOSS_IDLE), {
            looped = false
        });
    end;
end;

function u2.createGameEntity(p11, p12) -- Line: 38
    -- upvalues: getCurrentStatefulEntitySkinMeta (copy), StatefulEntityType (copy), StatefulEntityUtil (copy), Workspace (copy), CollectionService (copy)
    local v13 = getCurrentStatefulEntitySkinMeta(StatefulEntityType.SPIRIT_GOLEM_BOSS).model:Clone();
    v13:WaitForChild("RootPart").Anchored = true;
    StatefulEntityUtil:setEntityIgnoreQuery(v13);
    StatefulEntityUtil:setClientEntityNotCollidable(v13);
    v13:PivotTo(p12);
    p11.gameEntity = v13;
    StatefulEntityUtil:hideStatefulEntity(p11.gameEntity);
    v13.Parent = Workspace;
    CollectionService:AddTag(v13, "spiritGolem");
    p11:registerClientGameEntity(v13);
end;

return {
    SpiritGolemBossClient = u2
};