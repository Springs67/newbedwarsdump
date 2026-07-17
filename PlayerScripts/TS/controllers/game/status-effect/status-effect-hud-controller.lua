-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectHudListScreen = RuntimeLib.import(script, script.Parent, "ui", "hud", "status-effect-hud-list").StatusEffectHudListScreen;
local StatusEffectTagListBillboard = RuntimeLib.import(script, script.Parent, "ui", "nametag", "status-effect-tag-list").StatusEffectTagListBillboard;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "StatusEffectHudController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "StatusEffectHudController";
    p4.nametagTrees = {};
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), WatchCharacter (copy), EntityUtil (copy), u1 (copy), ClientSyncEvents (copy), Players (copy), StatusEffectType (copy)
    KnitController.KnitStart(u5);
    u5:mountStatusEffectHud();
    WatchCharacter(function(p6, u7, u8) -- Line: 36
        -- upvalues: EntityUtil (ref), u5 (copy), u1 (ref)
        local u9 = EntityUtil:getEntity(p6);

        if not u9 then
            return nil;
        end;

        local v10 = u5.nametagTrees[u9];

        if v10 then
            u1.unmount(v10);
        end;

        task.spawn(function() -- Line: 45
            -- upvalues: u5 (ref), u7 (copy), u9 (copy), u8 (copy)
            local v11 = u5:mountStatusEffectNametag(u7);

            if v11 then
                u5.nametagTrees[u9] = v11;
                u8:GiveTask(function() -- Line: 49
                    -- upvalues: u5 (ref), u9 (ref)
                    u5.nametagTrees[u9] = nil;
                end);
            end;
        end);
    end);
    ClientSyncEvents.StatusEffectAdded:connect(function(u12) -- Line: 55
        -- upvalues: Players (ref), StatusEffectType (ref), u5 (copy)
        if u12.entityInstance == Players.LocalPlayer.Character then
            return nil;
        end;

        if u12.statusEffect == StatusEffectType.INVISIBILITY then
            task.spawn(function() -- Line: 60
                -- upvalues: u5 (ref), u12 (copy)
                u5:hideStatusEffectNameTag(u12.entityInstance);
            end);
        end;
    end);
    ClientSyncEvents.StatusEffectRemoved:connect(function(u13) -- Line: 65
        -- upvalues: Players (ref), StatusEffectType (ref), u5 (copy)
        if u13.entityInstance == Players.LocalPlayer.Character then
            return nil;
        end;

        if u13.statusEffect == StatusEffectType.INVISIBILITY then
            task.spawn(function() -- Line: 70
                -- upvalues: u5 (ref), u13 (copy)
                u5:showStatusEffectNameTag(u13.entityInstance);
            end);
        end;
    end);
end;

function u2.mountStatusEffectHud(p14) -- Line: 76
    -- upvalues: u1 (copy), StatusEffectHudListScreen (copy), Players (copy)
    u1.mount(u1.createElement(StatusEffectHudListScreen), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u2.mountStatusEffectNametag(p15, p16) -- Line: 79
    -- upvalues: u1 (copy), StatusEffectTagListBillboard (copy)
    local Head = p16:WaitForChild("Head", 1);

    if not Head then
        return nil;
    end;

    if Head:FindFirstChild("StatusEffectTagBillboard") then
        return nil;
    end;

    return u1.mount(u1.createElement(StatusEffectTagListBillboard, {
        EntityInstance = p16
    }), Head);
end;

function u2.hideStatusEffectNameTag(p17, p18) -- Line: 92
    local Head = p18:FindFirstChild("Head");

    if not Head then
        return nil;
    end;

    Head:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = false;
end;

function u2.showStatusEffectNameTag(p19, p20) -- Line: 100
    local Head = p20:FindFirstChild("Head");

    if not Head then
        return nil;
    end;

    Head:WaitForChild("StatusEffectTagBillboard"):WaitForChild("StatusEffectTagList").Visible = true;
end;

KnitClient.CreateController(u2.new());

return nil;