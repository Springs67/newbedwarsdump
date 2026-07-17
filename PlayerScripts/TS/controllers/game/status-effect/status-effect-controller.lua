-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local MapUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "data-structure", "out").MapUtil;
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "StatusEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 24
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "StatusEffectController";
    p5.handlerClassDefinitionsMap = {};
    p5.handlerClassInstancesMap = {};
    p5.statusEffectMaids = {};
end;

function u3.KnitStart(u6) -- Line: 35
    -- upvalues: KnitController (copy), Players (copy), EntityUtil (copy), StatusEffectUtil (copy), ClientSyncEvents (copy), WatchCollectionTag (copy), u1 (copy), StatusEffectType (copy)
    KnitController.KnitStart(u6);
    Players.PlayerRemoving:Connect(function(p7) -- Line: 38
        -- upvalues: EntityUtil (ref), StatusEffectUtil (ref), ClientSyncEvents (ref), u6 (copy)
        local v8 = EntityUtil:getEntity(p7);

        if v8 ~= nil then
            v8 = v8:getInstance();
        end;

        if not v8 then
            return nil;
        end;

        for _, v in StatusEffectUtil:getAllActive(v8) do
            ClientSyncEvents.StatusEffectRemoved:fire(v8, v.statusEffect);
            local v9 = u6.statusEffectMaids[v.statusEffect];

            if v9 ~= nil then
                local v10 = v9[v8];

                if v10 ~= nil then
                    v10:DoCleaning();
                end;
            end;
        end;
    end);
    WatchCollectionTag("entity", function(u11) -- Line: 61
        -- upvalues: StatusEffectUtil (ref), u6 (copy), u1 (ref), StatusEffectType (ref)
        local u12 = {};

        local function _(p13) -- Line: 66
            -- upvalues: u6 (ref), u11 (copy), u12 (copy)
            u6:setupStatusEffect(u11, p13.statusEffect, u12);
        end;

        for i, v in StatusEffectUtil:getAllActive(u11) do
            local _ = i - 1;
            u6:setupStatusEffect(u11, v.statusEffect, u12);
        end;

        local function _(u14) -- Line: 74
            -- upvalues: StatusEffectUtil (ref), u11 (copy), u6 (ref), u12 (copy)
            local u15 = StatusEffectUtil:getAttributeName(u14);
            u11:GetAttributeChangedSignal(u15):Connect(function() -- Line: 76
                -- upvalues: u11 (ref), u15 (copy), u6 (ref), u14 (copy), u12 (ref)
                local v16 = u11:GetAttribute(u15);

                if v16 == 0 or (v16 ~= v16 or (v16 == "" or not v16)) then
                    local v17 = u6.statusEffectMaids[u14];

                    if v17 ~= nil then
                        local v18 = v17[u11];

                        if v18 ~= nil then
                            v18:DoCleaning();
                        end;
                    end;
                else
                    u6:setupStatusEffect(u11, u14, u12);
                end;
            end);
        end;

        for i, v in u1.values(StatusEffectType) do
            local _ = i - 1;
            local u19 = StatusEffectUtil:getAttributeName(v);
            u11:GetAttributeChangedSignal(u19):Connect(function() -- Line: 76
                -- upvalues: u11 (copy), u19 (copy), u6 (ref), v (copy), u12 (copy)
                local v20 = u11:GetAttribute(u19);

                if v20 == 0 or (v20 ~= v20 or (v20 == "" or not v20)) then
                    local v21 = u6.statusEffectMaids[v];

                    if v21 ~= nil then
                        local v22 = v21[u11];

                        if v22 ~= nil then
                            v22:DoCleaning();
                        end;
                    end;
                else
                    u6:setupStatusEffect(u11, v, u12);
                end;
            end);
        end;
    end);
end;

function u3.setHandler(p23, p24, p25) -- Line: 100
    p23.handlerClassDefinitionsMap[p24] = p25;
end;

function u3.setupStatusEffect(p26, u27, u28, u29) -- Line: 106
    -- upvalues: StatusEffectUtil (copy), MapUtil (copy), u2 (copy), EntityUtil (copy), ClientSyncEvents (copy)
    local u30 = StatusEffectUtil:getAttributeName(u28);
    local u31 = MapUtil.getOrCreate(p26.statusEffectMaids, u28, {});
    local u32 = MapUtil.getOrCreate(u31, u27, u2.new());
    local v33 = u27:GetAttribute(u30);

    if v33 == 0 or (v33 ~= v33 or not v33) then
        u32:DoCleaning();

        return nil;
    end;

    if not EntityUtil:getEntity(u27) then
        return nil;
    end;

    if u29[u28] ~= nil then
        ClientSyncEvents.StatusEffectReapplied:fire(u27, u28);

        return nil;
    end;

    u29[u28] = true;
    ClientSyncEvents.StatusEffectAdded:fire(u27, u28);
    local u34 = p26.handlerClassInstancesMap[u28];

    if u34 then
        u34:apply(u27, u28);
    else
        local v35 = p26.handlerClassDefinitionsMap[u28];

        if v35 then
            u34 = v35.new();
            p26.handlerClassInstancesMap[u28] = u34;
            u34:apply(u27, u28);
        end;
    end;

    u32:GiveTask(u27:GetAttributeChangedSignal(u30 .. "_stacks"):Connect(function() -- Line: 154
        -- upvalues: u27 (copy), u30 (copy), ClientSyncEvents (ref), u28 (copy)
        if u27:GetAttribute(u30 .. "_stacks") ~= nil then
            ClientSyncEvents.StatusEffectChanged:fire(u27, u28);
        end;
    end));
    u32:GiveTask(u27:GetAttributeChangedSignal(u30):Connect(function() -- Line: 161
        -- upvalues: u27 (copy), u30 (copy), ClientSyncEvents (ref), u28 (copy)
        if u27:GetAttribute(u30) ~= nil then
            ClientSyncEvents.StatusEffectChanged:fire(u27, u28);
        end;
    end));
    u32:GiveTask(function() -- Line: 168
        -- upvalues: ClientSyncEvents (ref), u27 (copy), u28 (copy), u29 (copy), u34 (ref), u31 (copy), u32 (copy)
        ClientSyncEvents.StatusEffectRemoved:fire(u27, u28);
        u29[u28] = nil;
        local v36 = u34;

        if v36 ~= nil then
            v36:remove(u27, u28);
        end;

        u31[u27] = nil;
        u32:Destroy();
    end);
end;

KnitClient.CreateController(u3.new());

return nil;