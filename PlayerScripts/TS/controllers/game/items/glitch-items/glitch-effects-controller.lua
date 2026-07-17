-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v3.Debris;
local ReplicatedStorage = v3.ReplicatedStorage;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "GlitchEffectsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "GlitchEffectsController";
end;

function u4.KnitStart(p7) -- Line: 35
    -- upvalues: KnitController (copy), default (copy), ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), scalePart (copy), Debris (copy), KnitClient (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p7);
    default.Client:WaitFor("GlitchExplosion"):andThen(function(p8) -- Line: 38
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), scalePart (ref), Debris (ref)
        p8:Connect(function(u9) -- Line: 39
            -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameQueryUtil (ref), scalePart (ref), Debris (ref)
            local v10 = ReplicatedStorage.Assets.Effects.GlitchExplosion:Clone();
            v10.Position = u9.position;
            v10.Parent = Workspace;
            GameQueryUtil:setQueryIgnored(v10, true);
            scalePart(v10, u9.scale);

            local function _(p11) -- Line: 46
                -- upvalues: u9 (copy)
                if p11:IsA("ParticleEmitter") then
                    p11:Emit(u9.numberParticles);
                end;
            end;

            for i, descendant in v10:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant:Emit(u9.numberParticles);
                end;
            end;

            Debris:AddItem(v10, u9.duration);
        end);
    end);
    default.Client:Get("GlitchedExplodeEffect"):Connect(function(p12) -- Line: 58
        -- upvalues: KnitClient (ref), SoundManager (ref), GameSound (ref)
        local entity = p12.entity;
        KnitClient.Controllers.GlitchEffectsController:playGlitchExplosion(entity:GetPivot().Position, {
            entityTarget = p12.entity,
            effectConfig = {
                sizeMultiplier = 0.5
            }
        });
        SoundManager:playSound(GameSound.GLITCH_AMBIENT_1, {
            rollOffMaxDistance = 30,
            parent = entity,
            position = entity:GetPivot().Position
        });
    end);
end;

function u4.playGlitchExplosion(p13, p14, u15) -- Line: 73
    -- upvalues: u2 (copy), ReplicatedStorage (copy), Workspace (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy)
    local v16 = u2.new();
    local u17 = ReplicatedStorage.Assets.Effects.GlitchExplosion:Clone();
    u17.Position = p14;
    local v18;

    if u15 == nil then
        v18 = u15;
    else
        v18 = u15.parent;
    end;

    if v18 == nil then
        v18 = Workspace;
    end;

    u17.Parent = v18;
    local v19;

    if u15 == nil then
        v19 = u15;
    else
        v19 = u15.disableSound;
    end;

    if not v19 then
        local GLITCHED_LUCKY_BLOCK_TELEPORT = GameSound.GLITCHED_LUCKY_BLOCK_TELEPORT;
        local v20 = {
            rollOffMaxDistance = 30,
            position = p14
        };
        local v21;

        if u15 == nil then
            v21 = u15;
        else
            v21 = u15.entityTarget;
        end;

        if v21 == nil then
            if u15 == nil then
                v21 = u15;
            else
                v21 = u15.parent;
            end;
        end;

        v20.parent = v21;
        SoundManager:playSound(GLITCHED_LUCKY_BLOCK_TELEPORT, v20);
    end;

    local v22;

    if u15 == nil then
        v22 = u15;
    else
        v22 = u15.loopConfig;

        if v22 ~= nil then
            v22 = v22.looped;
        end;
    end;

    if v22 then
        local u23 = true;
        local v24 = { u17 };
        local v25;

        if u15 == nil then
            v25 = u15;
        else
            v25 = u15.entityTarget;
        end;

        local v26 = {};
        local v27;

        if u15 == nil then
            v27 = u15;
        else
            v27 = u15.effectConfig;
        end;

        if type(v27) == "table" then
            for i, v in v27 do
                v26[i] = v;
            end;
        end;

        EffectUtil:playEffects(v24, v25, v26);
        local u28 = 0 + 1;
        task.spawn(function() -- Line: 142
            -- upvalues: EffectUtil (ref), u17 (copy), u23 (ref), u15 (copy), u28 (ref)
            task.delay(0.5, function() -- Line: 143
                -- upvalues: EffectUtil (ref), u17 (ref), u23 (ref), u15 (ref), u28 (ref)
                local function _() -- Line: 144
                    -- upvalues: EffectUtil (ref), u17 (ref)
                    EffectUtil:disableEffects({ u17 });
                end;

                while true do
                    local v29 = u23;

                    if v29 then
                        local loopConfig = u15.loopConfig;

                        if loopConfig ~= nil then
                            loopConfig = loopConfig.loopDelay;
                        end;

                        v29 = task.wait(loopConfig);
                    end;

                    if v29 == 0 or (v29 ~= v29 or not v29) then
                        return;
                    end;

                    local loopConfig = u15.loopConfig;

                    if loopConfig ~= nil then
                        loopConfig = loopConfig.numLoops;
                    end;

                    if loopConfig ~= 0 and (loopConfig == loopConfig and loopConfig) then
                        local loopConfig2 = u15.loopConfig;

                        if loopConfig2 ~= nil then
                            loopConfig2 = loopConfig2.numLoops;
                        end;

                        loopConfig = loopConfig2 <= u28;
                    end;

                    if loopConfig ~= 0 and (loopConfig == loopConfig and loopConfig) then
                        u23 = false;

                        return;
                    end;

                    EffectUtil:disableEffects({ u17 });
                    u28 = u28 + 1;
                end;
            end);
        end);
        v16:GiveTask(function() -- Line: 186
            -- upvalues: u23 (ref)
            u23 = false;
        end);
    else
        local v30 = { u17 };
        local v31;

        if u15 == nil then
            v31 = u15;
        else
            v31 = u15.entityTarget;
        end;

        local v32 = {
            destroyAfterSec = 0.5
        };

        if u15 ~= nil then
            u15 = u15.effectConfig;
        end;

        if type(u15) == "table" then
            for i, v in u15 do
                v32[i] = v;
            end;
        end;

        EffectUtil:playEffects(v30, v31, v32);
    end;

    v16:GiveTask(u17);

    return v16;
end;

KnitClient.CreateController(u4.new());

return nil;