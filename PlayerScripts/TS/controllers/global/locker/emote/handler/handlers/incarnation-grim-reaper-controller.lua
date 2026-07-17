-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local TweenService = v2.TweenService;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "IncarnationGrimReaperController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 30
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "IncarnationGrimReaperController";
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), AnimationType (copy), EmoteType (copy), EmoteHandler (copy), Players (copy), PlaceUtil (copy), ReplicatedStorage (copy), Workspace (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), TweenService (copy), SoundManager (copy)
    KnitController.KnitStart(p6);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.HEAVENLY_SWORD, {
        animations = { AnimationType.HEAVENLY_SWORD_CHARGE, AnimationType.HEAVENLY_SWORD_SWING }
    });
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local INCARNATION_GRIM_REAPER = EmoteType.INCARNATION_GRIM_REAPER;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 49, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 55
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 59
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(p11, p12, p13, p14, p15) -- Line: 62
        -- upvalues: Players (ref), PlaceUtil (ref)
        local v16 = Players:GetPlayerByUserId(p12);

        if PlaceUtil.isLobbyServer() then
            p11:lobbyEmote(v16, p12, p13, p15);

            return;
        end;

        if not v16 then
            return nil;
        end;

        p11:gameEmote(v16, p13, p15);
    end;

    function u8.lobbyEmote(u17, u18, u19, u20, u21) -- Line: 73
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), GameSound (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), Players (ref), TweenService (ref)
        local u22 = ReplicatedStorage.Assets.Effects.GrimReaperIncarnation:Clone();
        u22.PrimaryPart.Anchored = true;
        u22.Parent = Workspace;
        u21:GiveTask(u22);
        u17:setupInstance(u22);
        local PrimaryPart = u20.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.CFrame;
        end;

        if not PrimaryPart then
            return nil;
        end;

        u17:playSound(GameSound.KEEPER_SUMMON, u19, {
            rollOffMaxDistance = 220,
            position = PrimaryPart.Position
        });
        u22:PivotTo(PrimaryPart + Vector3.new(0, 7, 0));
        local u23 = nil;
        local u24 = AnimationUtil:playAnimation(u22, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_CHARGE));

        if u24 then
            u21:GiveTask(u24);
            u24:GetMarkerReachedSignal("end"):Connect(function() -- Line: 99
                -- upvalues: u24 (ref)
                local v25 = u24;

                if v25 ~= nil then
                    v25:AdjustSpeed(0);
                end;
            end);
        end;

        local v26 = u24;

        if v26 ~= nil then
            v26:AdjustSpeed(0.4);
        end;

        if u19 == Players.LocalPlayer.UserId or u17:isPreview(u19) then
            u23 = AnimationUtil:playAnimation(u20, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_CHARGE));
            local v27 = u23;

            if v27 ~= nil then
                v27:AdjustSpeed(0.4);
            end;

            if u23 then
                u23:GetMarkerReachedSignal("end"):Connect(function() -- Line: 117
                    -- upvalues: u23 (ref)
                    local v28 = u23;

                    if v28 ~= nil then
                        v28:AdjustSpeed(0);
                    end;
                end);
                u21:GiveTask(u23);
            end;
        end;

        local v29 = u22:WaitForChild("3DClothing"):GetChildren();

        local function v32(p30) -- Line: 127
            -- upvalues: TweenService (ref)
            if p30:IsA("MeshPart") then
                TweenService:Create(p30, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {
                    Transparency = 0
                }):Play();

                local function _(p31) -- Line: 134
                    if p31:IsA("ParticleEmitter") then
                        p31.Enabled = true;
                    end;
                end;

                for i, descendant in p30:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("ParticleEmitter") then
                        descendant.Enabled = true;
                    end;
                end;
            end;
        end;

        for i, v in v29 do
            v32(v, i - 1, v29);
        end;

        local ReaperScythe = u22:FindFirstChild("ReaperScythe");
        u21:GiveTask(task.delay(2.5, function() -- Line: 148
            -- upvalues: u18 (copy), Players (ref), u17 (copy), u19 (copy), u23 (ref), AnimationUtil (ref), u20 (copy), GameAnimationUtil (ref), AnimationType (ref), u21 (copy), ReaperScythe (copy), u24 (ref), u22 (copy)
            if u18 == Players.LocalPlayer or u17:isPreview(u19) then
                local v33 = u23;

                if v33 ~= nil then
                    v33:Stop();
                end;

                local v34 = u23;

                if v34 ~= nil then
                    v34:Destroy();
                end;

                u23 = AnimationUtil:playAnimation(u20, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_SWING));
                u21:GiveTask(function() -- Line: 159
                    -- upvalues: u23 (ref)
                    local v35 = u23;

                    if v35 ~= nil then
                        v35:Destroy();
                    end;
                end);
            end;

            if ReaperScythe then
                local function _(p36) -- Line: 168
                    if p36:IsA("MeshPart") then
                        p36.Transparency = 0;
                    end;
                end;

                for i, descendant in ReaperScythe:GetDescendants() do
                    local _ = i - 1;

                    if descendant:IsA("MeshPart") then
                        descendant.Transparency = 0;
                    end;
                end;
            end;

            u24 = AnimationUtil:playAnimation(u22, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_SWING));
            u21:GiveTask(function() -- Line: 178
                -- upvalues: u24 (ref)
                local v37 = u24;

                if v37 ~= nil then
                    v37:Destroy();
                end;
            end);
            local v38 = u23;

            if v38 ~= nil then
                v38:AdjustSpeed(0.25);
            end;

            local v39 = u24;

            if v39 ~= nil then
                v39:AdjustSpeed(0.25);
            end;
        end));
        u21:GiveTask(task.delay(3, function() -- Line: 193
            -- upvalues: u23 (ref), u24 (ref), u17 (copy), GameSound (ref), u19 (copy), PrimaryPart (copy)
            local v40 = u23;

            if v40 ~= nil then
                v40:AdjustSpeed(1);
            end;

            local v41 = u24;

            if v41 ~= nil then
                v41:AdjustSpeed(1);
            end;

            u17:playSound(GameSound.KEEPER_ATTACK, u19, {
                rollOffMaxDistance = 220,
                position = PrimaryPart.Position
            });
        end));
        u21:GiveTask(task.delay(3.5, function() -- Line: 207
            -- upvalues: u21 (copy)
            u21:DoCleaning();
        end));
    end;

    function u8.gameEmote(p42, u43, u44, u45) -- Line: 211
        -- upvalues: Players (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), ReplicatedStorage (ref), Workspace (ref), SoundManager (ref), GameSound (ref)
        local PrimaryPart = u44.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.CFrame;
        end;

        if not PrimaryPart then
            return nil;
        end;

        local u46 = nil;
        local u47;

        if u43 == Players.LocalPlayer then
            u47 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_CHARGE));
            local v48 = u47;

            if v48 ~= nil then
                v48:AdjustSpeed(0.4);
            end;

            if u47 then
                u47:GetMarkerReachedSignal("end"):Connect(function() -- Line: 229
                    -- upvalues: u47 (ref)
                    local v49 = u47;

                    if v49 ~= nil then
                        v49:AdjustSpeed(0);
                    end;
                end);
                u45:GiveTask(u47);
            end;
        else
            u47 = nil;
        end;

        task.delay(2.5, function() -- Line: 238
            -- upvalues: u44 (copy), ReplicatedStorage (ref), u45 (copy), Workspace (ref), u43 (copy), Players (ref), u47 (ref), AnimationUtil (ref), GameAnimationUtil (ref), AnimationType (ref), u46 (ref)
            local PrimaryPart2 = u44.PrimaryPart;

            if PrimaryPart2 ~= nil then
                PrimaryPart2 = PrimaryPart2.CFrame;
            end;

            if not PrimaryPart2 then
                return nil;
            end;

            local v50 = ReplicatedStorage.Assets.Effects.GrimReaperEmote:Clone();
            v50.PrimaryPart.Anchored = true;
            u45:GiveTask(v50);
            v50.Parent = Workspace;
            v50:PivotTo(PrimaryPart2 + Vector3.new(0, 2, 0));

            if u43 == Players.LocalPlayer then
                local v51 = u47;

                if v51 ~= nil then
                    v51:Stop();
                end;

                local v52 = u47;

                if v52 ~= nil then
                    v52:Destroy();
                end;

                u47 = AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_SWING));
                u46 = AnimationUtil:playAnimation(v50, GameAnimationUtil:getAssetId(AnimationType.HEAVENLY_SWORD_SWING));
                u45:GiveTask(function() -- Line: 266
                    -- upvalues: u47 (ref)
                    local v53 = u47;

                    if v53 ~= nil then
                        v53:Destroy();
                    end;
                end);
            end;

            u45:GiveTask(function() -- Line: 273
                -- upvalues: u46 (ref)
                local v54 = u46;

                if v54 ~= nil then
                    v54:Destroy();
                end;
            end);
            local v55 = u47;

            if v55 ~= nil then
                v55:AdjustSpeed(0.5);
            end;

            local v56 = u46;

            if v56 ~= nil then
                v56:AdjustSpeed(0.5);
            end;
        end);
        task.delay(3, function() -- Line: 288
            -- upvalues: u47 (ref), u46 (ref), SoundManager (ref), GameSound (ref), PrimaryPart (copy)
            local v57 = u47;

            if v57 ~= nil then
                v57:AdjustSpeed(1);
            end;

            local v58 = u46;

            if v58 ~= nil then
                v58:AdjustSpeed(1);
            end;

            SoundManager:playSound(GameSound.KEEPER_ATTACK, {
                rollOffMaxDistance = 220,
                position = PrimaryPart.Position
            });
        end);
        task.delay(3.5, function() -- Line: 302
            -- upvalues: u45 (copy)
            u45:DoCleaning();
        end);
    end;

    function u8.onDisable(p59, p60, p61, p62) -- Line: 306
    end;

    EmoteHandlerController:registerHandler(INCARNATION_GRIM_REAPER, u8);
end;

KnitClient.CreateController(u3.new());

return nil;