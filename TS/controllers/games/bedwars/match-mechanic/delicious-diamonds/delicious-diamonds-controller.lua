-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "DeliciousDiamondsController";
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
    p4.Name = "DeliciousDiamondsController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: KnitController (copy), default (copy), EntityUtil (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(p5);
    default.Client:Get("DiamondShieldGet"):Connect(function() -- Line: 34
        -- upvalues: EntityUtil (ref), Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), Workspace (ref), EffectUtil (ref)
        local v6 = EntityUtil:getEntity(Players.LocalPlayer);

        if not v6 then
            return nil;
        end;

        local v7 = v6:getInstance();

        if v7 == nil then
            return nil;
        end;

        SoundManager:playSound(GameSound.DIAMOND_SHIELD, {
            position = v7.HumanoidRootPart.Position
        });
        local u8 = ReplicatedStorage.Assets.Effects.DiamondShieldEffect:Clone();
        u8.Parent = Workspace;
        EffectUtil:playEffects({ u8 }, nil);
        u8.CFrame = CFrame.new(v7.HumanoidRootPart.Position);
        task.delay(2, function() -- Line: 52
            -- upvalues: u8 (copy)
            u8:Destroy();
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;