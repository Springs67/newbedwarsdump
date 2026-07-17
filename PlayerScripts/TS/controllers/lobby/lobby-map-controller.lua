-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LobbyMapController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "LobbyMapController";
end;

function u2.KnitStart(p5) -- Line: 32
    -- upvalues: WatchPlayerCharacter (copy), Players (copy), WatchCollectionTag (copy), GameAnimationUtil (copy), AnimationType (copy), GameSound (copy), SoundManager (copy)
    WatchPlayerCharacter(Players.LocalPlayer, function(p6, p7) -- Line: 33
        local function _(p8) -- Line: 35
            if p8:IsA("BasePart") then
                p8.CastShadow = false;
            end;
        end;

        for i, descendant in p6:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                descendant.CastShadow = false;
            end;
        end;

        p7:GiveTask(p6.DescendantAdded:Connect(function(p9) -- Line: 43
            if p9:IsA("BasePart") then
                p9.CastShadow = false;
            end;
        end));
    end);
    WatchCollectionTag("DodoBirdLobby", function(u10) -- Line: 49
        -- upvalues: GameAnimationUtil (ref), AnimationType (ref), GameSound (ref), SoundManager (ref)
        local AnimationController = u10:WaitForChild("AnimationController", 2);

        if AnimationController == nil then
            error("AnimationController was not added to dodoBirdMount in time");
        end;

        local Animator = AnimationController:WaitForChild("Animator", 2);

        if Animator == nil then
            error("Animator was not added to AnimationController in time");
        end;

        local u11 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_SQUAWK));
        u11.Looped = false;
        local v12 = Animator:LoadAnimation(GameAnimationUtil:getAnimation(AnimationType.DODO_BIRD_IDLE));
        v12.Priority = Enum.AnimationPriority.Idle;
        v12:Play();

        local function u14() -- Line: 63
            -- upvalues: GameSound (ref), SoundManager (ref), u10 (copy), u11 (copy)
            local v13;

            if math.random(0, 1) == 1 then
                v13 = GameSound.DODO_BIRD_SQUAWK_2;
            else
                v13 = GameSound.DODO_BIRD_SQUAWK_1;
            end;

            SoundManager:playSound(v13, {
                rollOffMaxDistance = 100,
                position = u10:GetPivot().Position
            });
            u11:Play();
        end;

        local function u16() -- Line: 72
            -- upvalues: u10 (copy), u14 (copy), u16 (ref)
            local v15 = math.random(15, 30);
            task.delay(v15, function() -- Line: 74
                -- upvalues: u10 (ref), u14 (ref), u16 (ref)
                if not u10 then
                    return nil;
                end;

                u14();
                u16();
            end);
        end;

        u16();
    end);
end;

return {
    LobbyMapController = KnitClient.CreateController(u2.new())
};