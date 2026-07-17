-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v2.Debris;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "PopcornEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PopcornEmoteController";
end;

function u3.KnitStart(p6) -- Line: 36
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy), AnimationType (copy), Debris (copy), Workspace (copy), GameWorldUtil (copy), GameSound (copy), SoundManager (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local POPCORN = EmoteType.POPCORN;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 44, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 50
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 54
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(u11, u12, u13, p14, u15) -- Line: 57
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref), AnimationType (ref), Debris (ref), Workspace (ref), GameWorldUtil (ref), GameSound (ref), SoundManager (ref)
        local u16 = ReplicatedStorage.Assets.Misc.PopcornEmote.PopcornBucket:Clone();
        u16.Parent = u13;

        local function _(p17) -- Line: 61
            -- upvalues: GameQueryUtil (ref)
            if p17:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p17, true);
            end;
        end;

        for i, descendant in u16:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        WeldUtil:weldCharacterAccessories(u13);
        local Kernals = ReplicatedStorage.Assets.Misc.PopcornEmote.Kernals;
        u15:GiveTask((u11:watchEmoteAnimation(u12, u13, AnimationType.EATING_POPCORN, function(p18) -- Line: 72
            -- upvalues: u15 (copy), Kernals (copy), Debris (ref), u16 (copy), Workspace (ref), GameQueryUtil (ref), GameWorldUtil (ref), u11 (copy), GameSound (ref), u12 (copy), u13 (copy), SoundManager (ref)
            local v19;

            if p18 == nil then
                v19 = p18;
            else
                v19 = p18:GetMarkerReachedSignal("Eat"):Connect(function() -- Line: 76
                    -- upvalues: Kernals (ref), Debris (ref), u16 (ref), Workspace (ref), GameQueryUtil (ref), GameWorldUtil (ref), u11 (ref), GameSound (ref), u12 (ref), u13 (ref)
                    local v20 = Kernals:GetChildren();

                    local function v24(p21) -- Line: 79
                        -- upvalues: Debris (ref), u16 (ref), Workspace (ref), GameQueryUtil (ref), GameWorldUtil (ref)
                        if not p21:IsA("BasePart") then
                            return nil;
                        end;

                        local v22 = p21:Clone();
                        Debris:AddItem(v22, 1.5);
                        v22:PivotTo(u16.Handle:GetPivot());
                        v22.Parent = Workspace;
                        v22.Anchored = false;
                        GameQueryUtil:setQueryIgnored(v22, true);
                        local v23 = GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 0.3490658503988659);
                        v22:ApplyImpulse(v23 * (v22.AssemblyMass * 35));
                        v22:ApplyAngularImpulse(v23 * (v22.AssemblyMass * 10));
                    end;

                    for i, v in v20 do
                        v24(v, i - 1, v20);
                    end;

                    u11:playSound(GameSound.POPCORN_EAT, u12, {
                        rollOffMaxDistance = 55,
                        position = u13:GetPivot().Position
                    });
                end);
            end;

            u15:GiveTask(v19);

            if p18 ~= nil then
                p18 = p18:GetMarkerReachedSignal("Grab"):Connect(function() -- Line: 110
                    -- upvalues: SoundManager (ref), GameSound (ref), u11 (ref), u12 (ref), u13 (ref)
                    local POPCORN_GRAB = GameSound.POPCORN_GRAB;
                    local v25 = {
                        rollOffMaxDistance = 55
                    };
                    local v26;

                    if u11:isPreview(u12) then
                        v26 = nil;
                    else
                        v26 = u13:GetPivot().Position;
                    end;

                    v25.position = v26;
                    SoundManager:playSound(POPCORN_GRAB, v25);
                end);
            end;

            u15:GiveTask(p18);
        end)));
        u15:GiveTask(function() -- Line: 120
            -- upvalues: u16 (copy)
            u16:Destroy();
        end);
    end;

    function u8.onDisable(p27, p28, p29, p30) -- Line: 124
    end;

    EmoteHandlerController:registerHandler(POPCORN, u8);
end;

KnitClient.CreateController(u3.new());

return nil;