-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "PillowFightEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PillowFightEmoteController";
end;

function u3.KnitStart(p6) -- Line: 33
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), WeldUtil (copy), Workspace (copy), SoundManager (copy), RandomUtil (copy), GameSound (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local PILLOW_FIGHT = EmoteType.PILLOW_FIGHT;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 41, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 47
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 51
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, u15) -- Line: 54
        -- upvalues: ReplicatedStorage (ref), WeldUtil (ref), Workspace (ref), SoundManager (ref), RandomUtil (ref), GameSound (ref)
        local u16 = ReplicatedStorage.Assets.Effects.WhiteFeatherEffect:Clone();
        local v17 = ReplicatedStorage.Assets.Effects.Pillow:Clone();
        v17.Parent = p13;
        WeldUtil:weldAccessory(p13, v17);
        u16.Parent = Workspace;
        local PrimaryPart = p13.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.CFrame.LookVector;
        end;

        local PrimaryPart2 = p13.PrimaryPart;

        if PrimaryPart2 ~= nil then
            PrimaryPart2 = PrimaryPart2.Position;
        end;

        u15:GiveTask(v17);
        task.delay(0.5, function() -- Line: 71
            -- upvalues: PrimaryPart (copy), PrimaryPart2 (copy), u16 (copy), SoundManager (ref), RandomUtil (ref), GameSound (ref)
            if PrimaryPart and PrimaryPart2 then
                u16:PivotTo(CFrame.new(PrimaryPart2 + PrimaryPart.Unit * 5));

                local function _(p18) -- Line: 77
                    if p18:IsA("ParticleEmitter") then
                        p18:Emit(30);
                    end;
                end;

                for i, descendant in u16:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant:Emit(30);
                    end;
                end;

                SoundManager:playSound(RandomUtil.fromList(GameSound.PILLOW_HIT_1, GameSound.PILLOW_HIT_2, GameSound.PILLOW_HIT_3), {
                    rollOffMaxDistance = 220,
                    position = PrimaryPart2
                });
            end;
        end);
        u15:GiveTask(function() -- Line: 91
            -- upvalues: u16 (copy)
            u16:Destroy();
        end);
        task.delay(2, function() -- Line: 94
            -- upvalues: u15 (copy)
            u15:DoCleaning();
        end);
    end;

    function u8.onDisable(p19, p20, p21, p22) -- Line: 98
    end;

    EmoteHandlerController:registerHandler(PILLOW_FIGHT, u8);
end;

KnitClient.CreateController(u3.new());

return nil;