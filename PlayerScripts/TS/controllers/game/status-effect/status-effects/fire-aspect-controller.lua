-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local ClientStatusEffectHandler = RuntimeLib.import(script, script.Parent.Parent, "handlers", "client-status-effect-handler").ClientStatusEffectHandler;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "FireAspectController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "FireAspectController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), KnitClient (copy), StatusEffectType (copy), ClientStatusEffectHandler (copy), Players (copy), ReplicatedStorage (copy), CollectionService (copy), SoundManager (copy), GameSound (copy), default (copy)
    KnitController.KnitStart(p5);
    local StatusEffectController = KnitClient.Controllers.StatusEffectController;
    local BURN = StatusEffectType.BURN;
    local u6 = ClientStatusEffectHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 41, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 47
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 51
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onApply(p10, u11, p12) -- Line: 54
        -- upvalues: Players (ref), ReplicatedStorage (ref), CollectionService (ref), SoundManager (ref), GameSound (ref)
        if u11.PrimaryPart == nil then
            return nil;
        end;

        local v13 = u11 == Players.LocalPlayer.Character;
        local UpperTorso = u11:FindFirstChild("UpperTorso");

        if not UpperTorso then
            return nil;
        end;

        local v14 = u11:GetAttribute("BurnStrength");
        local u15 = v14 == nil and 1 or v14;
        local u16 = {};

        for _, child in ReplicatedStorage.Assets.Effects.Burn:GetChildren() do
            local u17 = child:Clone();
            u17.Parent = UpperTorso;

            if u17:IsA("ParticleEmitter") then
                u17.Rate = u15 * 15;
            end;

            p10.maid:GiveTask(u11:GetAttributeChangedSignal("BurnStrength"):Connect(function() -- Line: 76
                -- upvalues: u17 (copy), u11 (copy), u15 (ref)
                if not u17:IsA("ParticleEmitter") then
                    return nil;
                end;

                local v18 = u11:GetAttribute("BurnStrength");
                u15 = v18 == nil and 1 or v18;
                u17.Rate = u15 * 10;
            end));

            if v13 and (u17:IsA("ParticleEmitter") or u17:IsA("Beam")) then
                CollectionService:AddTag(u17, "FirstPersonHidden");
            end;

            table.insert(u16, u17);
        end;

        local BURN_LOOP = GameSound.BURN_LOOP;
        local v19 = {
            looped = true
        };
        local v20;

        if v13 then
            v20 = nil;
        else
            v20 = u11.PrimaryPart.Position;
        end;

        v19.position = v20;
        local v21;

        if v13 then
            v21 = nil;
        else
            v21 = u11.PrimaryPart;
        end;

        v19.parent = v21;
        local u22 = SoundManager:playSound(BURN_LOOP, v19);
        p10.maid:GiveTask(function() -- Line: 101
            -- upvalues: u22 (copy), u16 (copy)
            local v23 = u22;

            if v23 ~= nil then
                v23:Stop();
            end;

            local v24 = u16;

            local function v26(u25) -- Line: 107
                if not u25:IsA("ParticleEmitter") then
                    u25:Destroy();

                    return;
                end;

                u25.Enabled = false;
                task.delay(3, function() -- Line: 110
                    -- upvalues: u25 (copy)
                    u25:Destroy();
                end);
            end;

            for i, v in v24 do
                v26(v, i - 1, v24);
            end;
        end);
    end;

    function u7.onRemove(p27, p28, p29) -- Line: 122
    end;

    StatusEffectController:setHandler(BURN, u7);
    default.Client:OnEvent("FireAspectHit", function(p30, p31) -- Line: 126
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref)
        if p30.PrimaryPart == nil then
            return nil;
        end;

        local v32 = p30 == Players.LocalPlayer.Character;
        local BURN_HIT = GameSound.BURN_HIT;
        local v33 = {};
        local v34;

        if v32 then
            v34 = nil;
        else
            v34 = p30.PrimaryPart.Position;
        end;

        v33.position = v34;
        local v35;

        if v32 then
            v35 = nil;
        else
            v35 = p30.PrimaryPart;
        end;

        v33.parent = v35;
        SoundManager:playSound(BURN_HIT, v33);
        local UpperTorso = p30:FindFirstChild("UpperTorso");

        if not UpperTorso then
            return nil;
        end;

        local BURN_HIT2 = GameSound.BURN_HIT;
        local v36 = {};
        local v37;

        if v32 then
            v37 = nil;
        else
            v37 = UpperTorso.Position;
        end;

        v36.position = v37;
        SoundManager:playSound(BURN_HIT2, v36);
        local u38 = {};

        for _, child in ReplicatedStorage.Assets.Effects.FireHit:Clone():GetChildren() do
            child.Parent = UpperTorso;
            table.insert(u38, child);
        end;

        task.delay(5, function() -- Line: 150
            -- upvalues: u38 (copy)
            local function _(p39) -- Line: 151
                p39:Destroy();
            end;

            for i, v in u38 do
                local _ = i - 1;
                v:Destroy();
            end;
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;