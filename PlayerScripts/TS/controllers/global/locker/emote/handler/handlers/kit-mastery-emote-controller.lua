-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local OutElastic = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").OutElastic;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local KitContractEmoteDefinitions = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-emote-definitions").KitContractEmoteDefinitions;
local KitContractUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit-contract", "kit-contract-utils").KitContractUtils;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local getPrimaryActiveKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "kit-util").getPrimaryActiveKit;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent, "emote-handler").EmoteHandler;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "KitMasteryEmoteController";
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
    p5.Name = "KitMasteryEmoteController";
end;

function u3.KnitStart(p6) -- Line: 38
    -- upvalues: KnitController (copy), KnitClient (copy), EmoteType (copy), EmoteHandler (copy), Players (copy), getPrimaryActiveKit (copy), KitContractUtils (copy), ReplicatedStorage (copy), GameSound (copy), default (copy), KnitClient2 (copy), KitContractEmoteDefinitions (copy), Workspace (copy), ModelUtil (copy), OutElastic (copy)
    KnitController.KnitStart(p6);
    local EmoteHandlerController = KnitClient.Controllers.EmoteHandlerController;
    local KIT_MASTERY_EMOTE = EmoteType.KIT_MASTERY_EMOTE;
    local u7 = EmoteHandler;
    local u8 = setmetatable({}, {
        __tostring = function() -- Line: 46, Name: __tostring
            return "Anonymous";
        end,

        __index = u7
    });
    u8.__index = u8;

    function u8.new(...) -- Line: 52
        -- upvalues: u8 (ref)
        local v9 = setmetatable({}, u8);

        return v9:constructor(...) or v9;
    end;

    function u8.constructor(p10, ...) -- Line: 56
        -- upvalues: u7 (copy)
        u7.constructor(p10, ...);
    end;

    function u8.onEnable(u11, u12, u13, u14, u15) -- Line: 59
        -- upvalues: Players (ref), getPrimaryActiveKit (ref), KitContractUtils (ref), ReplicatedStorage (ref), GameSound (ref), default (ref), KnitClient2 (ref), KitContractEmoteDefinitions (ref), Workspace (ref), ModelUtil (ref), OutElastic (ref)
        local u16 = Players:GetPlayerByUserId(u12);

        if not u16 then
            return nil;
        end;

        local u17 = getPrimaryActiveKit(u16);

        if not (KitContractUtils.isKitContractAvailable(u17) and KitContractUtils.isKitContractEmoteAvailable(u17)) then
            return nil;
        end;

        local u18 = {
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteBronze,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteSilver,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteGold,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmotePlatinum,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteDiamond,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteEmerald,
            ReplicatedStorage.Assets.Effects.KitMasteryEmotes.KitMasteryEmoteNightmare
        };
        local u19 = {
            GameSound.KIT_MASTERY_EMOTE_BRONZE,
            GameSound.KIT_MASTERY_EMOTE_SILVER,
            GameSound.KIT_MASTERY_EMOTE_GOLD,
            GameSound.KIT_MASTERY_EMOTE_PLATINUM,
            GameSound.KIT_MASTERY_EMOTE_DIAMOND,
            GameSound.KIT_MASTERY_EMOTE_EMERALD,
            GameSound.KIT_MASTERY_EMOTE_NIGHTMARE
        };
        default.Client:GetNamespace("KitStat"):Get("GetActiveKitStats"):CallServerAsync(u16):andThen(function(p20) -- Line: 70
            -- upvalues: KnitClient2 (ref), u16 (copy), u14 (copy), KitContractUtils (ref), u17 (copy), u18 (copy), u15 (copy), KitContractEmoteDefinitions (ref), u13 (copy), u19 (copy), u11 (copy), u12 (copy), Workspace (ref), ModelUtil (ref), OutElastic (ref)
            if KnitClient2.Controllers.EmoteController:getPlayingEmote(u16) ~= u14 then
                return nil;
            end;

            if p20 == nil then
                return nil;
            end;

            local v21 = KitContractUtils.getKitMasteryTierData(u17, p20);
            local v22;

            if v21 == nil then
                v22 = v21;
            else
                v22 = v21.selectedKitMasteryTier;
            end;

            if v22 == nil then
                return nil;
            end;

            if v21 ~= nil then
                v21 = v21.selectedKitMasteryTier;
            end;

            local v23 = v21 - 1;
            local u24 = u18[v23 + 1]:Clone();
            u15:GiveTask(function() -- Line: 93
                -- upvalues: u24 (copy)
                local v25 = u24;

                if v25 ~= nil then
                    v25:Destroy();
                end;
            end);
            local v26 = u24:GetDescendants();

            local function v29(p27) -- Line: 100
                -- upvalues: KitContractEmoteDefinitions (ref), u17 (ref)
                if p27:IsA("BasePart") then
                    p27.CanCollide = false;
                    p27.CanQuery = false;
                    p27.CanTouch = false;
                end;

                if p27:IsA("ParticleEmitter") then
                    p27.Enabled = true;
                end;

                if p27:IsA("ImageLabel") then
                    local v28 = KitContractEmoteDefinitions[u17];

                    if v28 ~= nil then
                        p27.Position = p27.Position + v28.imageLabelOffset;
                        p27.Image = v28.imageId;
                    end;
                end;
            end;

            for i, v in v26 do
                v29(v, i - 1, v26);
            end;

            local PrimaryPart = u24.PrimaryPart;
            local PrimaryPart2 = u13.PrimaryPart;

            if PrimaryPart == nil or PrimaryPart2 == nil then
                return nil;
            end;

            local u30 = u11:playSound(u19[v23 + 1], u12, {
                rollOffMaxDistance = 180,
                looped = false,
                volumeMultiplier = 0.8,
                position = PrimaryPart2.Position
            });
            u15:GiveTask(function() -- Line: 134
                -- upvalues: u30 (copy)
                local v31 = u30;

                if v31 ~= nil then
                    v31:Destroy();
                end;
            end);
            u24.Parent = Workspace;
            PrimaryPart.Anchored = true;
            local v32 = PrimaryPart2.Position + Vector3.new(0, 5, 0);
            local v33 = PrimaryPart2:GetPivot().LookVector * 5;
            PrimaryPart:PivotTo(CFrame.new(v32, v32 + v33));
            ModelUtil.tweenModelSize(u24, 1.2, OutElastic, 2);
            task.delay(5, function() -- Line: 151
                -- upvalues: u15 (ref)
                u15:DoCleaning();
            end);
        end);
    end;

    function u8.onDisable(p34, p35, p36, p37) -- Line: 156
    end;

    EmoteHandlerController:registerHandler(KIT_MASTERY_EMOTE, u8);
end;

KnitClient.CreateController(u3.new());

return nil;