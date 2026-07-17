-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Empty = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").Empty;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local StatusEffectTag = RuntimeLib.import(script, script.Parent, "status-effect-tag").StatusEffectTag;
local NametagConfig = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "nametag", "nametag-config").NametagConfig;
local u4 = nil;

local function v22(u5, p6) -- Line: 15
    -- upvalues: u4 (ref), u1 (copy), CollectionService (copy), StatusEffectUtil (copy), StatusEffectType (copy), ClientSyncEvents (copy), u2 (copy), StatusEffectTag (copy), Empty (copy)
    local useEffect = p6.useEffect;
    local v7, u8 = p6.useState({});
    useEffect(function() -- Line: 19
        -- upvalues: u4 (ref), u1 (ref), CollectionService (ref), StatusEffectUtil (ref), u5 (copy), StatusEffectType (ref), u8 (copy), ClientSyncEvents (ref)
        local v9 = u4:getValue();
        local u10 = u1.new();

        if v9 then
            CollectionService:AddTag(v9, "EntityNameTag");
        end;

        local function u14() -- Line: 25
            -- upvalues: StatusEffectUtil (ref), u5 (ref), StatusEffectType (ref), u8 (ref)
            local function _(p11) -- Line: 27
                -- upvalues: StatusEffectType (ref)
                return p11.statusEffect ~= StatusEffectType.INVISIBILITY;
            end;

            local v12 = 0;
            local v13 = {};

            for i, v in StatusEffectUtil:getAllActive(u5.EntityInstance) do
                local _ = i - 1;

                if v.statusEffect ~= StatusEffectType.INVISIBILITY == true then
                    v12 = v12 + 1;
                    v13[v12] = v;
                end;
            end;

            u8(v13);
        end;

        u14();
        u10:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p15) -- Line: 44
            -- upvalues: u5 (ref), u14 (copy)
            if p15.entityInstance == u5.EntityInstance then
                u14();
            end;
        end));
        u10:GiveTask(ClientSyncEvents.StatusEffectRemoved:connect(function(p16) -- Line: 49
            -- upvalues: u5 (ref), u14 (copy)
            if p16.entityInstance == u5.EntityInstance then
                u14();
            end;
        end));

        return function() -- Line: 54
            -- upvalues: u10 (copy)
            u10:DoCleaning();
        end;
    end, {});

    local function _(p17) -- Line: 58
        -- upvalues: u2 (ref), StatusEffectTag (ref), u5 (copy)
        return u2.createElement(StatusEffectTag, {
            ActiveStatusEffect = p17,
            EntityInstance = u5.EntityInstance
        });
    end;

    local v18 = table.create(#v7);

    for i, v in v7 do
        local _ = i - 1;
        v18[i] = u2.createElement(StatusEffectTag, {
            ActiveStatusEffect = v,
            EntityInstance = u5.EntityInstance
        });
    end;

    local v19 = {
        Size = UDim2.fromScale(1, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5)
    };
    local v20 = { u2.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            VerticalAlignment = "Center",
            HorizontalAlignment = "Center",
            Padding = UDim.new(0.05, 0)
        }) };
    local v21 = #v20;

    for i, v in v18 do
        v20[v21 + i] = v;
    end;

    return u2.createFragment({
        StatusEffectTagList = u2.createElement(Empty, v19, v20)
    });
end;

u4 = u2.createRef();
local u23 = nil;

local function v28(p24) -- Line: 93
    -- upvalues: NametagConfig (copy), u2 (copy), u4 (ref), u23 (ref)
    local v25 = {
        Size = UDim2.fromScale(6, 1.25),
        StudsOffsetWorldSpace = Vector3.new(0, 2.15, 0),
        AlwaysOnTop = true,
        MaxDistance = NametagConfig.BillboardMaxDistanceGame,
        ResetOnSpawn = false,
        AutoLocalize = false,
        [u2.Ref] = u4
    };
    local v26 = {};
    local v27 = {};

    for i, v in p24 do
        v27[i] = v;
    end;

    v26[#v26 + 1] = u2.createElement(u23, v27);

    return u2.createFragment({
        StatusEffectTagBillboard = u2.createElement("BillboardGui", v25, v26)
    });
end;

u23 = v3.new(u2)(v22);

return {
    StatusEffectTagListBillboard = v28,
    StatusEffectTagList = u23
};