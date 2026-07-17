-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "HealingController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "HealingController";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), KnitClient (copy), StatusEffectType (copy), ClientStatusEffectHandler (copy), Players (copy), ReplicatedStorage (copy), CollectionService (copy)
    KnitController.KnitStart(p5);
    local StatusEffectController = KnitClient.Controllers.StatusEffectController;
    local HEAL_OVER_TIME = StatusEffectType.HEAL_OVER_TIME;
    local u6 = ClientStatusEffectHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 37, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 43
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 47
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onApply(p10, p11, p12) -- Line: 50
        -- upvalues: Players (ref), ReplicatedStorage (ref), CollectionService (ref)
        if p11.PrimaryPart == nil then
            return nil;
        end;

        local v13 = p11 == Players.LocalPlayer.Character;
        local UpperTorso = p11:FindFirstChild("UpperTorso");

        if not UpperTorso then
            return nil;
        end;

        local u14 = {};

        for _, child in ReplicatedStorage.Assets.Effects.Healing:GetChildren() do
            local v15 = child:Clone();
            v15.Parent = UpperTorso;

            if v13 and (v15:IsA("ParticleEmitter") or v15:IsA("Beam")) then
                CollectionService:AddTag(v15, "FirstPersonHidden");
            end;

            table.insert(u14, v15);
        end;

        p10.maid:GiveTask(function() -- Line: 72
            -- upvalues: u14 (copy)
            local v16 = u14;

            local function v18(u17) -- Line: 74
                if not u17:IsA("ParticleEmitter") then
                    u17:Destroy();

                    return;
                end;

                u17.Enabled = false;
                task.delay(3, function() -- Line: 77
                    -- upvalues: u17 (copy)
                    u17:Destroy();
                end);
            end;

            for i, v in v16 do
                v18(v, i - 1, v16);
            end;
        end);
    end;

    function u7.onRemove(p19, p20, p21) -- Line: 89
    end;

    StatusEffectController:setHandler(HEAL_OVER_TIME, u7);
end;

KnitClient.CreateController(u2.new());

return nil;