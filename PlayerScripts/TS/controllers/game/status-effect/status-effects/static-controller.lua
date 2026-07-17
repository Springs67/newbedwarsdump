-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "StaticController";
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
    p4.Name = "StaticController";
end;

function u2.KnitStart(u5) -- Line: 32
    -- upvalues: KnitController (copy), default (copy), Players (copy), SoundManager (copy), GameSound (copy), ReplicatedStorage (copy), TweenService (copy)
    KnitController.KnitStart(u5);
    default.Client:OnEvent("StaticHit", function(p6, p7) -- Line: 34
        -- upvalues: u5 (copy), Players (ref), SoundManager (ref), GameSound (ref), ReplicatedStorage (ref), TweenService (ref)
        local v8 = {};

        for _, v in p6 do
            v8[v] = {};
        end;

        for _, v in p6 do
            local UpperTorso = v:FindFirstChild("UpperTorso");

            if UpperTorso ~= nil then
                UpperTorso = UpperTorso:FindFirstChild("BodyFrontAttachment");
            end;

            if UpperTorso then
                u5:playHitSpark(v);
                local STATIC_HIT = GameSound.STATIC_HIT;
                local v9 = {};
                local v10;

                if Players.LocalPlayer.Character == p7 then
                    v10 = nil;
                else
                    v10 = v.PrimaryPart;

                    if v10 ~= nil then
                        v10 = v10.Position;
                    end;
                end;

                v9.position = v10;
                v9.rollOffMaxDistance = 80;
                SoundManager:playSound(STATIC_HIT, v9);

                for _, v2 in p6 do
                    if v2 ~= v and (v8[v][v2] == nil and v8[v2][v] == nil) then
                        v8[v][v2] = true;
                        local UpperTorso2 = v2:FindFirstChild("UpperTorso");

                        if UpperTorso2 ~= nil then
                            UpperTorso2 = UpperTorso2:FindFirstChild("BodyFrontAttachment");
                        end;

                        if UpperTorso2 then
                            local StaticConnection = ReplicatedStorage.Assets.Effects.StaticConnection;
                            local u11 = StaticConnection.Beam1:Clone();
                            local u12 = StaticConnection.Beam2:Clone();
                            local u13 = StaticConnection.PointLight:Clone();
                            u11.Parent = UpperTorso;
                            u11.Attachment0 = UpperTorso;
                            u11.Attachment1 = UpperTorso2;
                            u12.Parent = UpperTorso;
                            u12.Attachment0 = UpperTorso;
                            u12.Attachment1 = UpperTorso2;
                            u13.Parent = UpperTorso;
                            task.delay(0.24, function() -- Line: 110
                                -- upvalues: TweenService (ref), u11 (copy), u12 (copy), u13 (copy)
                                TweenService:Create(u11, TweenInfo.new(0.12), {
                                    Width0 = 0,
                                    Width1 = 0
                                }):Play();
                                TweenService:Create(u12, TweenInfo.new(0.12), {
                                    Width0 = 0,
                                    Width1 = 0
                                }):Play();
                                task.wait(0.12);
                                u11:Destroy();
                                u12:Destroy();
                                u13:Destroy();
                            end);
                        end;
                    end;
                end;
            end;
        end;
    end);
end;

function u2.playHitSpark(p14, p15) -- Line: 128
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy)
    local UpperTorso = p15:FindFirstChild("UpperTorso");

    if not UpperTorso then
        return nil;
    end;

    local u16 = ReplicatedStorage.Assets.Effects.StaticHit:Clone();
    u16.Parent = Workspace;
    u16.Anchored = false;
    u16.CFrame = UpperTorso.CFrame;
    u16.Lightning.Anchored = false;
    u16.Lightning.CFrame = UpperTorso.CFrame;
    EffectUtil:playEffects(u16:GetChildren(), p15);
    task.delay(0.2, function() -- Line: 140
        -- upvalues: u16 (copy)
        u16.Attachment.PointLight.Enabled = false;
    end);
    task.delay(5, function() -- Line: 143
        -- upvalues: u16 (copy)
        u16:Destroy();
    end);
end;

KnitClient.CreateController(u2.new());

return nil;