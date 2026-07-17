-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local CollectionTagAdded = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "collection", "collection-util").CollectionTagAdded;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "DodoBirdEffectController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 22
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5, ...);
    p5.Name = "DodoBirdEffectController";
    p5.dodoBirdMountMaids = {};
end;

function u3.KnitStart(u6) -- Line: 31
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), Players (copy), u1 (copy), SoundManager (copy), GameSound (copy), CollectionService (copy)
    KnitController.KnitStart(u6);
    CollectionTagAdded("dodo-bird-mount", function(u7) -- Line: 33
        -- upvalues: Players (ref), u1 (ref), u6 (copy), SoundManager (ref), GameSound (ref)
        local Parent = u7.Parent;
        u7.RootPart.ParticleAttachment.FeatherParticles.Enabled = false;

        if Parent ~= nil and Players:GetPlayerFromCharacter(Parent) ~= nil then
            local v8 = u1.new();
            u6.dodoBirdMountMaids[u7] = v8;
            local u9 = 0;
            v8:GiveTask(Parent.Humanoid.StateChanged:Connect(function(p10, p11) -- Line: 43
                -- upvalues: u9 (ref), u7 (copy), SoundManager (ref), GameSound (ref)
                if p10 == Enum.HumanoidStateType.Freefall and (p11 == Enum.HumanoidStateType.Jumping and time() - u9 > 0.2) then
                    u9 = time();
                    u7.RootPart.ParticleAttachment.FeatherParticles:Emit(8);

                    if math.random(0, 1) == 1 then
                        SoundManager:playSound(GameSound.DODO_BIRD_DOUBLE_JUMP, {
                            position = u7:GetPrimaryPartCFrame().Position
                        });

                        return;
                    end;

                    SoundManager:playSound(GameSound.DODO_BIRD_JUMP, {
                        position = u7:GetPrimaryPartCFrame().Position
                    });
                end;
            end));
        end;
    end);
    CollectionService:GetInstanceRemovedSignal("dodo-bird-mount"):Connect(function(p12) -- Line: 60
        -- upvalues: u6 (copy)
        local v13 = u6.dodoBirdMountMaids[p12];

        if v13 ~= nil then
            v13:DoCleaning();
        end;

        u6.dodoBirdMountMaids[p12] = nil;
    end);
end;

function u3.playSquawkSound(p14, p15) -- Line: 69
    -- upvalues: GameSound (copy), SoundManager (copy)
    local v16;

    if math.random(0, 1) == 1 then
        v16 = GameSound.DODO_BIRD_SQUAWK_2;
    else
        v16 = GameSound.DODO_BIRD_SQUAWK_1;
    end;

    SoundManager:playSound(v16, {
        rollOffMaxDistance = 100,
        position = p15:GetPrimaryPartCFrame().Position
    });
end;

KnitClient.CreateController(u3.new());

return nil;