-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "object-utils");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContentProvider = v2.ContentProvider;
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local getQueueMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-meta").getQueueMeta;
local KillEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "kill-effect", "kill-effect-type").KillEffectType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u3 = RuntimeLib.import(script, script.Parent, "effects", "default-kill-effect");
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "KillEffectController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 28
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 32
    -- upvalues: KnitController (copy), Workspace (copy)
    KnitController.constructor(p6);
    p6.Name = "KillEffectController";
    p6.killEffects = {};
    p6.camera = Workspace.CurrentCamera;
end;

function u4.KnitStart(u7) -- Line: 38
    -- upvalues: u1 (copy), KillEffectType (copy), u3 (copy), default (copy), KnitClient (copy), getQueueMeta (copy), Players (copy), ClientSyncEvents (copy), DamageType (copy), RuntimeLib (copy), ContentProvider (copy), GameAnimationUtil (copy), AnimationType (copy)
    for _, v in u1.values(KillEffectType) do
        local Parent = script.Parent;

        if Parent ~= nil then
            Parent = Parent:FindFirstChild("effects");

            if Parent ~= nil then
                Parent = Parent:FindFirstChild(string.gsub(v, "_", "-") .. "-kill-effect");
            end;
        end;

        if Parent then
            local v8 = require(Parent);
            u7.killEffects[v] = v8;
        else
            local _ = v == KillEffectType.NONE;
            u7.killEffects[v] = u3;
        end;
    end;

    default.Client:OnEvent("EntityDeathEvent", function(u9) -- Line: 57
        -- upvalues: KnitClient (ref), getQueueMeta (ref), Players (ref), ClientSyncEvents (ref), DamageType (ref), u7 (copy), u3 (ref), RuntimeLib (ref)
        local v10 = KnitClient.Controllers.MatchController:getQueueType();

        if v10 and getQueueMeta(v10).disableKillEffects then
            return nil;
        end;

        local v11 = Players:GetPlayerFromCharacter(u9.fromEntity);
        local u12 = Players:GetPlayerFromCharacter(u9.entityInstance);

        if ClientSyncEvents.KillEffect:fire(u9.entityInstance, u9.fromEntity):isCancelled() then
            return nil;
        end;

        if u9.damageType == DamageType.VOID then
            return nil;
        end;

        if u12 and u9.entityInstance then
            local entityInstance = u9.entityInstance;

            if u9.finalKill and v11 then
                local v13 = v11:GetAttribute("KillEffectType");

                if v13 and v11 ~= u12 then
                    local v14 = u7.killEffects[v13].new(v11);
                    v14:onKill(u12, entityInstance, u9.cframe);

                    if v14:isPlayDefaultKillEffect() then
                        local u15 = u3.new(v11);
                        RuntimeLib.try(function() -- Line: 85
                            -- upvalues: u15 (copy), u12 (copy), entityInstance (copy), u9 (copy)
                            u15:onKill(u12, entityInstance, u9.cframe);
                        end, function(p16) -- Line: 87
                            warn(p16);
                        end);
                    end;

                    return nil;
                end;
            end;

            local u17 = u3.new(v11 or u12);
            RuntimeLib.try(function() -- Line: 97
                -- upvalues: u17 (copy), u12 (copy), entityInstance (copy), u9 (copy)
                u17:onKill(u12, entityInstance, u9.cframe);
            end, function(p18) -- Line: 99
                warn(p18);
            end);
        end;
    end);
    ContentProvider:PreloadAsync({ GameAnimationUtil:getAnimation(AnimationType.MIRROR_KILL_EFFECT) });
end;

function u4.getKillEffects(p19) -- Line: 106
    return p19.killEffects;
end;

KnitClient.CreateController(u4.new());

return nil;