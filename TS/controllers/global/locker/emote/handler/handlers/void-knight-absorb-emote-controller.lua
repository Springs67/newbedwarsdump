-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local scalePart = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scalePart;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local TweenService = v1.TweenService;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-util").ItemUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "VoidKnightDevourEmoteController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 29
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 33
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VoidKnightDevourEmoteController";
end;

function u2.KnitStart(p5) -- Line: 37
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ItemUtil (copy), ItemType (copy), WeldUtil (copy), AnimationType (copy), ReplicatedStorage (copy), scalePart (copy), Workspace (copy), TweenService (copy), SoundManager (copy), GameSound (copy), EffectUtil (copy)
    KnitController.KnitStart(p5);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local VOID_HUNTER_ABSORB = EmoteType.VOID_HUNTER_ABSORB;
    local u6 = EmoteHandler;
    local u7 = setmetatable({}, {
        __tostring = function() -- Line: 45, Name: __tostring
            return "Anonymous";
        end,

        __index = u6
    });
    u7.__index = u7;

    function u7.new(...) -- Line: 51
        -- upvalues: u7 (ref)
        local v8 = setmetatable({}, u7);

        return v8:constructor(...) or v8;
    end;

    function u7.constructor(p9, ...) -- Line: 55
        -- upvalues: u6 (copy)
        u6.constructor(p9, ...);
    end;

    function u7.onEnable(p10, p11, u12, p13, u14) -- Line: 58
        -- upvalues: ItemUtil (ref), ItemType (ref), WeldUtil (ref), AnimationType (ref), ReplicatedStorage (ref), scalePart (ref), Workspace (ref), TweenService (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
        local u15 = ItemUtil.createItemInstance(ItemType.NOCTIUM_BLADE_4, 1);

        local function _(p16) -- Line: 61
            if p16:IsA("MeshPart") then
                p16.Transparency = 1;
            end;

            if p16:IsA("Beam") then
                p16.Enabled = false;
            end;
        end;

        for i, descendant in u15:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("MeshPart") then
                descendant.Transparency = 1;
            end;

            if descendant:IsA("Beam") then
                descendant.Enabled = false;
            end;
        end;

        u15.Parent = u12;
        WeldUtil:weldAccessory(u12, u15);
        u14:GiveTask(u15);
        task.delay(4, function() -- Line: 75
            -- upvalues: u14 (copy)
            u14:DoCleaning();
        end);
        u14:GiveTask(p10:watchEmoteAnimation(p11, u12, AnimationType.WINTER_BOSS_RAISE_AXE, function(u17) -- Line: 80
            -- upvalues: u14 (copy), u15 (copy), u12 (copy), ItemType (ref), ReplicatedStorage (ref), scalePart (ref), Workspace (ref), TweenService (ref), SoundManager (ref), GameSound (ref), EffectUtil (ref)
            u14:GiveTask(task.spawn(function() -- Line: 81
                -- upvalues: u15 (ref), u12 (ref), ItemType (ref), ReplicatedStorage (ref), scalePart (ref), Workspace (ref), u14 (ref), TweenService (ref), SoundManager (ref), GameSound (ref), u17 (copy), EffectUtil (ref)
                local Handle = u15:WaitForChild("Handle", 3);

                if not Handle then
                    return nil;
                end;

                Handle.CanCollide = false;
                task.wait(0.6);
                local u18 = 0;

                while u18 < 10 do
                    local Position = u12.PrimaryPart.Position;
                    local v19 = math.random(-20, 20);
                    local v20 = Position + Vector3.new(v19, -6, math.random(-20, 20));
                    local v21;

                    if u18 % 2 == 0 then
                        v21 = ItemType.EMERALD;
                    else
                        v21 = ItemType.IRON;
                    end;

                    local u22 = ReplicatedStorage:WaitForChild("Items"):FindFirstChild(v21);

                    if u22 ~= nil then
                        u22 = u22:WaitForChild("Handle", 1);

                        if u22 ~= nil then
                            u22 = u22:Clone();
                        end;
                    end;

                    if u22 then
                        scalePart(u22, 0.5);
                        u22.Anchored = true;
                        u22.Parent = Workspace;
                        u22.CanCollide = false;
                        u14:GiveTask(u22);
                        u22:PivotTo(CFrame.new(v20));
                        local v23 = TweenService:Create(u22, TweenInfo.new(0.6), {
                            Position = Handle.Position
                        });
                        v23:Play();
                        v23.Completed:Connect(function() -- Line: 114
                            -- upvalues: u22 (copy), Handle (copy), u18 (ref), SoundManager (ref), GameSound (ref)
                            u22:Destroy();
                            Handle.Transparency = math.max(Handle.Transparency - 0.05, 0);
                            Handle.Transparency = 0;

                            local function _(p24) -- Line: 119
                                -- upvalues: Handle (ref), u18 (ref)
                                if p24:IsA("MeshPart") then
                                    p24.Transparency = math.max(Handle.Transparency - 0.1, 0);

                                    if u18 == 9 then
                                        p24.Transparency = 0;
                                    end;
                                end;

                                if u18 == 9 and p24:IsA("Beam") then
                                    p24.Enabled = true;
                                end;
                            end;

                            for i, descendant in Handle:GetDescendants() do
                                local _ = i - 1;

                                if descendant:IsA("MeshPart") then
                                    descendant.Transparency = math.max(Handle.Transparency - 0.1, 0);

                                    if u18 == 9 then
                                        descendant.Transparency = 0;
                                    end;
                                end;

                                if u18 == 9 and descendant:IsA("Beam") then
                                    descendant.Enabled = true;
                                end;
                            end;

                            if u18 % 3 == 0 and u18 < 9 then
                                SoundManager:playSound(GameSound.VOID_KNIGHT_CONSUME, {
                                    position = Handle.Position
                                });
                            end;
                        end);
                    end;

                    if u18 == 9 then
                        local u25 = ReplicatedStorage.Assets.Effects.VoidKnightLevelUpEffect:Clone();
                        u25.Position = Handle.Position;
                        u25.Parent = Workspace;
                        u17:AdjustSpeed(0);
                        task.delay(0.5, function() -- Line: 147
                            -- upvalues: u17 (ref)
                            u17:AdjustSpeed(1);
                        end);
                        SoundManager:playSound(GameSound.VOID_KNIGHT_LEVEL_UP_4, {
                            position = Handle.Position
                        });
                        EffectUtil:playEffects({ u25 }, nil, {
                            particleMultiplier = 0.5,
                            sizeMultiplier = 0.5
                        });
                        task.delay(3, function() -- Line: 157
                            -- upvalues: u25 (copy)
                            u25:Destroy();
                        end);
                    end;

                    u18 = u18 + 1;
                    task.wait(0.1);
                end;
            end));
        end));
    end;

    function u7.onDisable(p26, p27, p28, p29) -- Line: 167
    end;

    EmoteHandlerController:registerHandler(VOID_HUNTER_ABSORB, u7);
end;

KnitClient.CreateController(u2.new());

return nil;