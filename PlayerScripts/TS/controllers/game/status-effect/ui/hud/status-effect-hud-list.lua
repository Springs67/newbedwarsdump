-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local Empty = v1.Empty;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact-hooks", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local StatusEffectCategory = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-category").StatusEffectCategory;
local StatusEffectMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-meta").StatusEffectMeta;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local StatusEffectHudEnchantTile = RuntimeLib.import(script, script.Parent, "status-effect-hud-enchant-tile").StatusEffectHudEnchantTile;
local StatusEffectHudTile = RuntimeLib.import(script, script.Parent, "status-effect-hud-tile").StatusEffectHudTile;
local u24 = v4.new(u3)(function(p5, p6) -- Line: 16
    -- upvalues: DeviceUtil (copy), u2 (copy), Players (copy), StatusEffectUtil (copy), StatusEffectMeta (copy), ClientSyncEvents (copy), StatusEffectCategory (copy), u3 (copy), StatusEffectHudEnchantTile (copy), StatusEffectHudTile (copy), Empty (copy)
    local useEffect = p6.useEffect;
    local _ = p6.useMemo;
    local v7, u8 = p6.useState(p5.StatusEffects or {});
    useEffect(function() -- Line: 21
        -- upvalues: DeviceUtil (ref), u2 (ref), Players (ref), StatusEffectUtil (ref), StatusEffectMeta (ref), u8 (copy), ClientSyncEvents (ref)
        if DeviceUtil.isHoarceKat() then
            return nil;
        end;

        local u9 = u2.new();

        local function u13() -- Line: 26
            -- upvalues: Players (ref), StatusEffectUtil (ref), StatusEffectMeta (ref), u8 (ref)
            if not Players.LocalPlayer.Character then
                u8({});

                return;
            end;

            local function _(p10) -- Line: 29
                -- upvalues: StatusEffectMeta (ref)
                return not StatusEffectMeta[p10.statusEffect].noDisplay;
            end;

            local v11 = 0;
            local v12 = {};

            for i, v in StatusEffectUtil:getAllActive(Players.LocalPlayer.Character) do
                local _ = i - 1;

                if not StatusEffectMeta[v.statusEffect].noDisplay == true then
                    v11 = v11 + 1;
                    v12[v11] = v;
                end;
            end;

            u8(v12);
        end;

        u9:GiveTask(Players.LocalPlayer.CharacterAdded:Connect(function() -- Line: 50
            -- upvalues: u13 (copy)
            u13();
        end));
        u9:GiveTask(ClientSyncEvents.StatusEffectAdded:connect(function(p14) -- Line: 53
            -- upvalues: Players (ref), u13 (copy)
            if p14.entityInstance == Players.LocalPlayer.Character then
                task.spawn(function() -- Line: 55
                    -- upvalues: u13 (ref)
                    u13();
                end);
            end;
        end));
        u9:GiveTask(ClientSyncEvents.StatusEffectRemoved:connect(function(p15) -- Line: 60
            -- upvalues: Players (ref), u13 (copy)
            if p15.entityInstance == Players.LocalPlayer.Character then
                task.spawn(function() -- Line: 62
                    -- upvalues: u13 (ref)
                    u13();
                end);
            end;
        end));
        u9:GiveTask(ClientSyncEvents.StatusEffectChanged:connect(function(p16) -- Line: 67
            -- upvalues: Players (ref), u13 (copy)
            if p16.entityInstance == Players.LocalPlayer.Character then
                task.spawn(function() -- Line: 69
                    -- upvalues: u13 (ref)
                    u13();
                end);
            end;
        end));

        local function _() -- Line: 74
            -- upvalues: u9 (copy)
            u9:DoCleaning();
        end;
    end, {});

    local function v19(p17, p18) -- Line: 78
        -- upvalues: StatusEffectMeta (ref), StatusEffectCategory (ref), u3 (ref), StatusEffectHudEnchantTile (ref), StatusEffectHudTile (ref)
        if StatusEffectMeta[p17.statusEffect].category == StatusEffectCategory.ENCHANT then
            return u3.createFragment({
                [StatusEffectMeta[p17.statusEffect].displayName] = u3.createElement(StatusEffectHudEnchantTile, {
                    ActiveStatusEffect = p17
                })
            });
        end;

        return u3.createFragment({
            [StatusEffectMeta[p17.statusEffect].displayName] = u3.createElement(StatusEffectHudTile, {
                ActiveStatusEffect = p17
            })
        });
    end;

    local v20 = table.create(#v7);

    for i, v in v7 do
        v20[i] = v19(v, i - 1, v7);
    end;

    local v21 = {
        Size = UDim2.new(0.7, 0, 0.06, 0),
        Position = p5.Position or UDim2.new(0.5, 0, 0, 0),
        AnchorPoint = Vector2.new(0.5, 0)
    };
    local v22 = { u3.createElement("UIListLayout", {
            FillDirection = "Horizontal",
            HorizontalAlignment = "Center",
            VerticalAlignment = "Center",
            Padding = UDim.new(0.012, 0)
        }) };
    local v23 = #v22;

    for i, v in v20 do
        v22[v23 + i] = v;
    end;

    return u3.createFragment({
        StatusEffectHud = u3.createElement(Empty, v21, v22)
    });
end);

return {
    StatusEffectHudList = u24,

    StatusEffectHudListScreen = function(p25) -- Line: 126
        -- upvalues: u3 (copy), u24 (copy)
        local v26 = {};
        local v27 = {};
        local v28 = {
            ResetOnSpawn = false
        };

        for i, v in p25 do
            v27[i] = v;
        end;

        v26[#v26 + 1] = u3.createElement(u24, v27);

        return u3.createFragment({
            StatusEffectHudScreen = u3.createElement("ScreenGui", v28, v26)
        });
    end
};