-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local UIUtil = v1.UIUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local TweenService = v4.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local IceFishingUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "winter-event", "ice-fishing-fish").IceFishingUtil;
local MinigameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "minigame", "minigame-meta").MinigameType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 25, Name: __tostring
        return "IceFishingMinigameController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 31
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 35
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "IceFishingMinigameController";
end;

function u5.KnitStart(u8) -- Line: 39
    -- upvalues: KnitController (copy), default (copy), MinigameType (copy), TweenService (copy), CollectionService (copy), KnitClient2 (copy), IceFishingUtil (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), Players (copy), UIUtil (copy), u3 (copy), GameAnimationUtil (copy), AnimationType (copy)
    KnitController.KnitStart(u8);
    default.Client:WaitFor("MinigameStarted"):expect():Connect(function(p9) -- Line: 42
        -- upvalues: MinigameType (ref), u8 (copy)
        if p9.minigame.type == MinigameType.ICE_FISHING then
            u8:onMinigameStart();
        end;
    end);
    default.Client:WaitFor("MinigameEnded"):expect():Connect(function(p10) -- Line: 48
        -- upvalues: MinigameType (ref), u8 (copy)
        if p10.minigame.type == MinigameType.ICE_FISHING then
            u8:onMinigameEnded();
        end;
    end);
    default.Client:OnEvent("IceFishingFishSpotUpdate", function(u11) -- Line: 54
        -- upvalues: TweenService (ref)
        local v12 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In);

        if u11.open then
            u11.spot.Transparency = 0;
            u11.spot.Color = u11.effectColor;
            TweenService:Create(u11.spot, v12, {
                Size = Vector3.new(2.863, 11.65, 11.65)
            }):Play();

            if u11.showEffect then
                local v13 = u11.spot:GetDescendants();

                local function v15(p14) -- Line: 66
                    -- upvalues: u11 (copy)
                    if p14:IsA("ParticleEmitter") then
                        p14.Enabled = true;
                        p14.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, u11.effectColor), ColorSequenceKeypoint.new(1, u11.effectColor) });
                    end;
                end;

                for i, v in v13 do
                    v15(v, i - 1, v13);
                end;
            end;
        else
            TweenService:Create(u11.spot, v12, {
                Size = Vector3.new(2.863, 0, 0)
            }):Play();

            local function _(p16) -- Line: 81
                if p16:IsA("ParticleEmitter") then
                    p16.Enabled = false;
                end;
            end;

            for i, descendant in u11.spot:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("ParticleEmitter") then
                    descendant.Enabled = false;
                end;
            end;

            task.delay(0.5, function() -- Line: 89
                -- upvalues: u11 (copy)
                u11.spot.Transparency = 1;
            end);
        end;
    end);
    CollectionService:GetInstanceAddedSignal("ice-fishing-spot"):Connect(function(u17) -- Line: 95
        -- upvalues: KnitClient2 (ref), u8 (copy), IceFishingUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), Players (ref), default (ref), UIUtil (ref), u3 (ref), GameAnimationUtil (ref), AnimationType (ref)
        local u18 = KnitClient2.Controllers.ProximityPromptController:createProximityPrompt({
            Name = "IceFishingPrompt",
            HoldDuration = 0.01,
            RequiresLineOfSight = false,
            MaxActivationDistance = 10,
            ActionText = "Catch Fish",
            ClickablePrompt = false,
            Enabled = true,
            Parent = u17
        });
        u18:AddTag("FishingPrompt");
        u18.Triggered:Connect(function(u19) -- Line: 107
            -- upvalues: u8 (ref), u17 (copy), IceFishingUtil (ref), KnitClient (ref), SoundManager (ref), GameSound (ref), Players (ref), default (ref), UIUtil (ref)
            u8:disableFishingPrompts();
            local v20 = u17:GetAttribute("FishType");
            local v21;

            if v20 then
                v21 = IceFishingUtil.getFishMetadata(v20);
            else
                v21 = nil;
            end;

            local FishingMinigameController = KnitClient.Controllers.FishingMinigameController;
            local v22 = {
                id = "ice_fishing_fish",
                drops = {}
            };
            local v23;

            if v21 == nil then
                v23 = v21;
            else
                v23 = v21.rarity;
            end;

            v22.weight = (v23 == 0 or (v23 ~= v23 or not v23)) and 1 or v21.rarity / 100;

            if v21 ~= nil then
                v21 = v21.fishModel;
            end;

            v22.fishModel = v21 == nil and "fish_iron" or v21;
            FishingMinigameController:startMinigame(v22, function(p24) -- Line: 136
                -- upvalues: SoundManager (ref), GameSound (ref), Players (ref), u19 (copy), default (ref), u17 (ref), u8 (ref)
                if p24.win then
                    local FISHERMAN_GAME_FISH_MOVE = GameSound.FISHERMAN_GAME_FISH_MOVE;
                    local v25 = {};
                    local v26;

                    if Players.LocalPlayer.Character == u19.Character then
                        v26 = nil;
                    else
                        v26 = u19.Character;

                        if v26 ~= nil then
                            v26 = v26:GetPivot().Position;
                        end;
                    end;

                    v25.position = v26;
                    v25.volumeMultiplier = 5;
                    SoundManager:playSound(FISHERMAN_GAME_FISH_MOVE, v25);
                    default.Client:Get("IceFishingFishCaught"):SendToServer({
                        player = u19,
                        spot = u17
                    });
                end;

                u8:enableFishingPrompts();
            end, {
                interactionRangeLimit = 15,
                customUI = {
                    size = UDim2.fromScale(0.3, 0.3),
                    position = UIUtil:getActionBarPosition(),
                    anchorPoint = Vector2.new(0.5, 1)
                }
            });
        end);
        u18.PromptButtonHoldBegan:Connect(function(u27) -- Line: 171
            -- upvalues: u3 (ref), SoundManager (ref), GameSound (ref), Players (ref), GameAnimationUtil (ref), AnimationType (ref), KnitClient (ref), u18 (copy)
            local u28 = u3.new();
            local FISHING_ROD_CAST = GameSound.FISHING_ROD_CAST;
            local v29 = {};
            local v30;

            if Players.LocalPlayer.Character == u27.Character then
                v30 = nil;
            else
                v30 = u27.Character;

                if v30 ~= nil then
                    v30 = v30:GetPivot().Position;
                end;
            end;

            v29.position = v30;
            v29.volumeMultiplier = 1.75;
            local v31 = SoundManager:playSound(FISHING_ROD_CAST, v29):getInstance();

            if v31 ~= nil then
                v31.Ended:Once(function() -- Line: 192
                    -- upvalues: SoundManager (ref), GameSound (ref), Players (ref), u27 (copy)
                    local FISHING_ROD_SPLASH = GameSound.FISHING_ROD_SPLASH;
                    local v32 = {};
                    local v33;

                    if Players.LocalPlayer.Character == u27.Character then
                        v33 = nil;
                    else
                        v33 = u27.Character;

                        if v33 ~= nil then
                            v33 = v33:GetPivot().Position;
                        end;
                    end;

                    v32.position = v33;
                    v32.volumeMultiplier = 2;
                    SoundManager:playSound(FISHING_ROD_SPLASH, v32);
                end);
            end;

            local u34 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_CAST, {
                fadeInTime = 0
            });
            local u35 = KnitClient.Controllers.ViewmodelController:playAnimation(AnimationType.FP_SWING_SWORD, {
                fadeTime = 0
            });
            task.delay(0.0005, function() -- Line: 218
                -- upvalues: u35 (copy)
                local v36 = u35;

                if v36 ~= nil then
                    v36:AdjustSpeed(0);
                end;
            end);

            if u34 ~= nil then
                u34.Stopped:Connect(function() -- Line: 226
                    -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref), u28 (copy)
                    local u37 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FISHING_ROD_CATCH_SUCCESS, {
                        fadeInTime = 0
                    });
                    u28:GiveTask(function() -- Line: 230
                        -- upvalues: u37 (copy)
                        local v38 = u37;

                        if v38 ~= nil then
                            v38:Stop();
                        end;

                        local v39 = u37;

                        if v39 ~= nil then
                            v39:Destroy();
                        end;
                    end);
                end);
            end;

            u28:GiveTask(function() -- Line: 242
                -- upvalues: u35 (copy), u34 (copy)
                local v40 = u35;

                if v40 ~= nil then
                    v40:Stop();
                end;

                local v41 = u35;

                if v41 ~= nil then
                    v41:Destroy();
                end;

                local v42 = u34;

                if v42 ~= nil then
                    v42:Stop();
                end;

                local v43 = u34;

                if v43 ~= nil then
                    v43:Destroy();
                end;
            end);
            u18.PromptButtonHoldEnded:Connect(function() -- Line: 260
                -- upvalues: u28 (copy)
                u28:DoCleaning();
            end);
        end);
    end);
    CollectionService:GetInstanceRemovedSignal("ice-fishing-spot"):Connect(function(p44) -- Line: 266
        local function _(p45) -- Line: 268
            if p45:IsA("ProximityPrompt") then
                p45:Destroy();
            end;
        end;

        for i, descendant in p44:GetDescendants() do
            local _ = i - 1;

            if descendant:IsA("ProximityPrompt") then
                descendant:Destroy();
            end;
        end;
    end);
end;

function u5.disableFishingPrompts(p46) -- Line: 278
    -- upvalues: CollectionService (copy)
    local function _(p47) -- Line: 280
        if p47:IsA("ProximityPrompt") then
            p47.Enabled = false;
        end;
    end;

    for i, v in CollectionService:GetTagged("FishingPrompt") do
        local _ = i - 1;

        if v:IsA("ProximityPrompt") then
            v.Enabled = false;
        end;
    end;
end;

function u5.enableFishingPrompts(p48) -- Line: 289
    -- upvalues: CollectionService (copy)
    local function _(p49) -- Line: 291
        if p49:IsA("ProximityPrompt") then
            p49.Enabled = true;
        end;
    end;

    for i, v in CollectionService:GetTagged("FishingPrompt") do
        local _ = i - 1;

        if v:IsA("ProximityPrompt") then
            v.Enabled = true;
        end;
    end;
end;

function u5.onMinigameStart(p50) -- Line: 300
end;

function u5.onMinigameEnded(p51) -- Line: 302
end;

KnitClient.CreateController(u5.new());

return nil;