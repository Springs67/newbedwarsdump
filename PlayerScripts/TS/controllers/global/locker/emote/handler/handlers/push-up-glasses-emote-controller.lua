-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCharacterAnimation = v1.WatchCharacterAnimation;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local ReplicatedStorage = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "PushUpGlassesEmoteController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 27
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "PushUpGlassesEmoteController";
end;

function u3.KnitStart(p6) -- Line: 35
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), ReplicatedStorage (copy), GameQueryUtil (copy), WeldUtil (copy), WatchCharacterAnimation (copy), GameAnimationUtil (copy), AnimationType (copy), u2 (copy), EffectUtil (copy), GameSound (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local PUSH_UP_GLASSSES = EmoteType.PUSH_UP_GLASSSES;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 43, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 49
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 53
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(u11, u12, u13, p14, u15) -- Line: 56
        -- upvalues: ReplicatedStorage (ref), GameQueryUtil (ref), WeldUtil (ref), WatchCharacterAnimation (ref), GameAnimationUtil (ref), AnimationType (ref), u2 (ref), EffectUtil (ref), GameSound (ref)
        local v16 = u13:GetChildren();

        local function v20(u17) -- Line: 59
            -- upvalues: u15 (copy)
            if not u17:IsA("Accessory") then
                return nil;
            end;

            local Handle = u17:FindFirstChild("Handle");

            if Handle ~= nil then
                Handle = Handle:FindFirstChild("FaceFrontAttachment");
            end;

            if not Handle then
                return nil;
            end;

            local function _(p18) -- Line: 72
                if p18:IsA("BasePart") then
                    p18.Transparency = 1;
                end;
            end;

            for i, descendant in u17:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("BasePart") then
                    descendant.Transparency = 1;
                end;
            end;

            u15:GiveTask(function() -- Line: 80
                -- upvalues: u17 (copy)
                local function _(p19) -- Line: 82
                    if p19:IsA("BasePart") then
                        p19.Transparency = 0;
                    end;
                end;

                for i, descendant in u17:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("BasePart") then
                        descendant.Transparency = 0;
                    end;
                end;
            end);
        end;

        for i, v in v16 do
            v20(v, i - 1, v16);
        end;

        local u21 = ReplicatedStorage.Assets.Misc.AnimeGlasses:Clone();
        u21.Parent = u13;

        local function _(p22) -- Line: 99
            -- upvalues: GameQueryUtil (ref)
            if p22:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(p22, true);
            end;
        end;

        for i, descendant in u21:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("BasePart") then
                GameQueryUtil:setQueryIgnored(descendant, true);
            end;
        end;

        u15:GiveTask(function() -- Line: 107
            -- upvalues: u21 (copy)
            local v23 = u21;

            if v23 ~= nil then
                v23:Destroy();
            end;
        end);
        WeldUtil:weldCharacterAccessories(u13);
        u15:GiveTask((WatchCharacterAnimation({ GameAnimationUtil:getAssetId(AnimationType.PUSH_UP_GLASSES) }, function(p24, p25) -- Line: 116
            -- upvalues: u12 (copy), u15 (copy), u21 (copy), u2 (ref), EffectUtil (ref), u11 (copy), GameSound (ref), u13 (copy)
            if p24.UserId ~= u12 then
                return nil;
            end;

            if p25 ~= nil then
                p25 = p25:GetMarkerReachedSignal("PushUp"):Connect(function() -- Line: 124
                    -- upvalues: u21 (ref), u2 (ref), u15 (ref), EffectUtil (ref), u11 (ref), GameSound (ref), u12 (ref), u13 (ref)
                    local LeftGlass = u21.Handle.LeftGlass;
                    local RightGlass = u21.Handle.RightGlass;
                    local Color = LeftGlass.Color;
                    local Material = LeftGlass.Material;
                    LeftGlass.Color = Color3.fromRGB(255, 255, 255);
                    LeftGlass.Material = Enum.Material.Neon;
                    RightGlass.Color = Color3.fromRGB(255, 255, 255);
                    RightGlass.Material = Enum.Material.Neon;
                    local u26 = u2("PointLight", {
                        Brightness = 3,
                        Range = 10,
                        Color = Color3.fromRGB(255, 255, 255),
                        Parent = u21
                    });
                    u15:GiveTask(u26);
                    EffectUtil:playEffects({ u21.Handle.ShineAttachment }, nil);
                    u15:GiveTask((u11:playSound(GameSound.EPIC_SHINE, u12, {
                        rollOffMaxDistance = 55,
                        volumeMultiplier = 1.1,
                        position = u13:GetPivot().Position
                    })));
                    task.delay(0.4, function() -- Line: 150
                        -- upvalues: LeftGlass (copy), Color (copy), Material (copy), RightGlass (copy), u26 (copy)
                        LeftGlass.Color = Color;
                        LeftGlass.Material = Material;
                        RightGlass.Color = Color;
                        RightGlass.Material = Material;
                        u26:Destroy();
                    end);
                end);
            end;

            u15:GiveTask(p25);
        end)));
    end;

    function u8.onDisable(p27, p28, p29, p30) -- Line: 163
    end;

    EmoteHandlerController:registerHandler(PUSH_UP_GLASSSES, u8);
end;

KnitClient.CreateController(u3.new());

return nil;