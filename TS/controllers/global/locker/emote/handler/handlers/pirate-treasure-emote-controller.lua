-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "PirateTreasureEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PirateTreasureEmoteController";
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), Workspace (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local PIRATE_TREASURE = EmoteType.PIRATE_TREASURE;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 42, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 48
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 52
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, u13, p14, u15) -- Line: 55
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), SoundManager (ref), GameSound (ref)
        local u16 = true;
        local v17 = ReplicatedStorage.Assets.Effects.TreasurePile:Clone();
        local u18 = ReplicatedStorage.Assets.Effects.TreasureParts:Clone();
        local PrimaryPart = u13.PrimaryPart;

        if not PrimaryPart then
            return nil;
        end;

        local Unit = (PrimaryPart.CFrame.LookVector * Vector3.new(1, 0, 1)).Unit;

        if Unit ~= nil then
            Unit = Unit * 3;
        end;

        v17:PivotTo(PrimaryPart.CFrame - Vector3.new(0, 1.5, 0) - Unit);
        v17.Parent = Workspace;
        local u19 = AnimationUtil:playAnimation(u13, GameAnimationUtil:getAssetId(AnimationType.PIRATE_TREASURE_EMOTE_SITTING));

        if not u19 then
            return nil;
        end;

        task.delay(1.2, function() -- Line: 82
            -- upvalues: u16 (ref), SoundManager (ref), GameSound (ref), PrimaryPart (copy), u18 (copy), Workspace (ref), u15 (copy), AnimationUtil (ref), u13 (copy), GameAnimationUtil (ref), AnimationType (ref), u19 (copy)
            if not u16 then
                return nil;
            end;

            SoundManager:playSound(GameSound.TREASURE_PILE_EMOTE, {
                rollOffMaxDistance = 220,
                position = PrimaryPart.Position
            });
            u18:PivotTo(CFrame.new(PrimaryPart.Position));
            u18.Parent = Workspace;
            local v20 = u18:GetChildren();

            local function v25(p21) -- Line: 94
                if p21:IsA("MeshPart") then
                    local v22 = math.random(-20, 20);
                    local v23 = math.random(30, 40);
                    local v24 = Vector3.new(v22, v23, math.random(-20, 20)) * p21.Mass;
                    p21.Anchored = false;
                    p21:ApplyImpulse(v24);
                end;
            end;

            for i, v in v20 do
                v25(v, i - 1, v20);
            end;

            u15:GiveTask(u18);
            local u26 = AnimationUtil:playAnimation(u13, GameAnimationUtil:getAssetId(AnimationType.PIRATE_TREASURE_EMOTE_LOOPED), {
                looped = true
            });

            if u26 then
                u15:GiveTask(u26);
                u15:GiveTask(function() -- Line: 113
                    -- upvalues: u26 (copy)
                    local v27 = u26;

                    if v27 ~= nil then
                        v27:Stop();
                    end;

                    local v28 = u26;

                    if v28 ~= nil then
                        v28:Destroy();
                    end;
                end);
            end;

            local v29 = u19;

            if v29 ~= nil then
                v29:Stop();
            end;

            local v30 = u19;

            if v30 ~= nil then
                v30:Destroy();
            end;
        end);
        u15:GiveTask(function() -- Line: 134
            -- upvalues: u16 (ref)
            u16 = false;

            return u16;
        end);
        u15:GiveTask(function() -- Line: 138
            -- upvalues: u19 (copy)
            local v31 = u19;

            if v31 ~= nil then
                v31:Stop();
            end;

            local v32 = u19;

            if v32 ~= nil then
                v32:Destroy();
            end;
        end);
        u15:GiveTask(u19);
        u15:GiveTask(v17);
    end;

    function u8.onDisable(p33, p34, p35, p36) -- Line: 151
    end;

    EmoteHandlerController:registerHandler(PIRATE_TREASURE, u8);
end;

KnitClient.CreateController(u3.new());

return nil;