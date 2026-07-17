-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "BananarangLobbyGadgetController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 22
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "BananarangLobbyGadgetController";
end;

function u1.KnitStart(p4) -- Line: 30
    -- upvalues: KnitController (copy), PlaceUtil (copy), ClientSyncEvents (copy), Players (copy), SoundManager (copy), GameSound (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(p4);

    if not PlaceUtil.isLobbyServer() then
        return nil;
    end;

    ClientSyncEvents.ProjectileLaunched:connect(function(p5) -- Line: 35
        -- upvalues: Players (ref), SoundManager (ref), GameSound (ref), GameAnimationUtil (ref), AnimationType (ref)
        if p5:isCancelled() then
            return nil;
        end;

        if not p5.shooter then
            return nil;
        end;

        if p5.projectileType ~= "bananarang" then
            return nil;
        end;

        local v6 = Players:GetPlayerFromCharacter(p5.shooter);
        local v7;

        if v6 == nil then
            v7 = v6;
        else
            v7 = v6.Character;
        end;

        if not v7 then
            return nil;
        end;

        local v8 = SoundManager:createSound(GameSound.BANANARANG_FLYING_LOOP);

        if v8 then
            v8.Parent = p5.projectile:FindFirstChildWhichIsA("BasePart");
            v8.Looped = true;
            v8.Volume = 2;
            v8:Play();
        end;

        if v6 == Players.LocalPlayer then
            local BANANARANG_THROW = GameSound.BANANARANG_THROW;
            local v9 = {};
            local PrimaryPart = v6.Character.PrimaryPart;

            if PrimaryPart ~= nil then
                PrimaryPart = PrimaryPart.Position;
            end;

            v9.position = PrimaryPart;
            v9.volumeMultiplier = 0.5;
            SoundManager:playSound(BANANARANG_THROW, v9);
            GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.BOOMERANG_THROW);
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;