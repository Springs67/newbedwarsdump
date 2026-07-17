-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v1.RandomUtil;
local SoundManager = v1.SoundManager;
local SpriteSheetPlayer = v1.SpriteSheetPlayer;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local Workspace = v4.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BalanceFile = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "balance", "balance-file").BalanceFile;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local GlitchedMatchAnnouncement = RuntimeLib.import(script, script.Parent, "glitched-match-announcement").GlitchedMatchAnnouncement;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 29, Name: __tostring
        return "GlitchedLuckyBlockController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 35
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 39
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "GlitchedLuckyBlockController";
    p7.firstAnnouncement = true;
end;

function u5.KnitStart(u8) -- Line: 44
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), GameSound (copy), PlaceUtil (copy), default (copy), u3 (copy), GlitchedMatchAnnouncement (copy), Players (copy), BalanceFile (copy), SoundManager (copy), WatchCollectionTag (copy), ClientSyncEvents (copy)
    KnitController.KnitStart(u8);
    KnitClient.Controllers.PreloadController:preloadForItemType(ItemType.GLITCHED_LUCKY_BLOCK, {
        sounds = {
            GameSound.TV_STATIC,
            GameSound.GLITCHED_LUCKY_BLOCK_DAMAGE,
            GameSound.GLITCHED_LUCKY_BLOCK_TELEPORT,
            GameSound.GLITCH_OVERLAY,
            GameSound.GLITCH_OVERLAY_2
        }
    });

    if PlaceUtil.isGameServer() then
        default.Client:OnEvent("EnableGlitchedMatch", function() -- Line: 50
            -- upvalues: u3 (ref), GlitchedMatchAnnouncement (ref), u8 (copy), Players (ref), BalanceFile (ref), SoundManager (ref), GameSound (ref)
            local u9 = u3.mount(u3.createElement("ScreenGui", {}, { u3.createElement(GlitchedMatchAnnouncement, {
                    tonedDownEffects = not u8.firstAnnouncement
                }) }), Players.LocalPlayer:FindFirstChildOfClass("PlayerGui"));
            task.delay(BalanceFile.GLITCH_LB_ANNOUNCEMENT_DURATION, function() -- Line: 56
                -- upvalues: SoundManager (ref), GameSound (ref), u3 (ref), u9 (copy)
                SoundManager:playSound(GameSound.GLITCH_OVERLAY_2, {
                    volumeMultiplier = 0.7
                });
                u3.unmount(u9);
            end);
            u8.firstAnnouncement = false;
        end);
    end;

    WatchCollectionTag("GlitchedLuckyBlock", function(p10) -- Line: 65
        -- upvalues: u8 (copy)
        u8:playGlitchOverlayEffect(p10);
        u8:loopGlitchParticlesOnBlock(p10);
    end);
    ClientSyncEvents.PlaceBlock:connect(function(p11) -- Line: 69
        -- upvalues: ItemType (ref), u8 (copy), SoundManager (ref), GameSound (ref)
        if p11.blockType ~= ItemType.GLITCHED_LUCKY_BLOCK then
            return nil;
        end;

        u8:playGlitchParticlesOnBlock(p11.blockPosition);
        SoundManager:playSound(GameSound.TV_STATIC, {
            volumeMultiplier = 0.05,
            playbackSpeedMultiplier = math.random(0.5, 1.5)
        });
    end);
    ClientSyncEvents.DamageBlock:connect(function(p12) -- Line: 79
        -- upvalues: ItemType (ref), SoundManager (ref), GameSound (ref), u8 (copy)
        if p12.blockType ~= ItemType.GLITCHED_LUCKY_BLOCK then
            return nil;
        end;

        SoundManager:playSound(GameSound.TV_STATIC, {
            volumeMultiplier = 0.05,
            playbackSpeedMultiplier = math.random(0.5, 1.5)
        });
        SoundManager:playSound(GameSound.GLITCHED_LUCKY_BLOCK_DAMAGE);
        u8:playGlitchParticlesOnBlock(p12.blockPosition);
    end);
end;

function u5.playGlitchOverlayEffect(p13, u14) -- Line: 91
    -- upvalues: u2 (copy), SpriteSheetPlayer (copy), RandomUtil (copy)
    local u15 = { {
            image = "rbxassetid://10844183211",
            imageWidth = 1024,
            imageHeight = 769,
            rows = 8,
            columns = 4,
            sprites = 31,
            config = {
                framesPerSecond = 30,
                loopDelay = 5
            }
        }, {
            image = "rbxassetid://10844183471",
            imageWidth = 807,
            imageHeight = 1023,
            rows = 4,
            columns = 3,
            sprites = 12,
            config = {
                framesPerSecond = 30,
                loopDelay = 5
            }
        } };
    local u16 = Random.new();
    local v17 = Enum.NormalId:GetEnumItems();

    local function v22(p18) -- Line: 118
        -- upvalues: u2 (ref), u14 (copy), SpriteSheetPlayer (ref), RandomUtil (ref), u15 (copy), u16 (copy)
        local v19 = u2("SurfaceGui", {
            Brightness = 3,
            Name = "SpriteSheet_Player_" .. p18.Name,
            Face = p18,
            Parent = u14
        });
        local v20 = u2("ImageLabel", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1),
            Parent = v19
        });
        local u21 = SpriteSheetPlayer.new(v20, RandomUtil.randomArraySelectN(u15, 1)[1]);
        task.delay(u16:NextNumber(0, 2), function() -- Line: 132
            -- upvalues: u21 (copy)
            u21:play();
        end);
    end;

    for i, v in v17 do
        v22(v, i - 1, v17);
    end;

    local u23 = u2("Part", {
        Name = "Floating_Pixels_Layer",
        Size = Vector3.new(3.2, 3.2, 3.2),
        Transparency = 1,
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        Position = u14.Position,
        Parent = u14
    });
    local v24 = Enum.NormalId:GetEnumItems();

    local function v31(p25) -- Line: 153
        -- upvalues: u2 (ref), u23 (copy), u16 (copy)
        local v26 = u2("SurfaceGui", {
            PixelsPerStud = 3,
            Name = "Floating_Layer_" .. p25.Name,
            Face = p25,
            Parent = u23,
            SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
        });
        local v27 = {
            Color3.fromHex("#3ca7bf"),
            Color3.fromHex("#62197c"),
            Color3.fromHex("#163050"),
            Color3.fromHex("#1e546f"),
            Color3.fromHex("#44125d"),
            Color3.fromHex("#26073e"),
            Color3.fromHex("#f2f2fe")
        };
        local v28 = u16:NextInteger(2, 4);
        local v29 = false;
        local v30 = 0;

        while true do
            if v29 then
                v30 = v30 + 1;
            else
                v29 = true;
            end;

            if v30 >= v28 then
                return;
            end;

            u2("ImageLabel", {
                BorderSizePixel = 0,
                Size = UDim2.new(0, u16:NextInteger(1, 3), 0, 1),
                Position = UDim2.fromOffset(u16:NextInteger(0, 8), u16:NextInteger(0, 8)),
                BackgroundColor3 = v27[u16:NextInteger(0, #v27 - 1) + 1],
                Parent = v26
            });
        end;
    end;

    for i, v in v24 do
        v31(v, i - 1, v24);
    end;
end;

function u5.playGlitchParticlesOnBlock(p32, u33, u34, u35) -- Line: 189
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), BlockEngine (copy), EffectUtil (copy)
    task.spawn(function() -- Line: 190
        -- upvalues: ReplicatedStorage (ref), Workspace (ref), BlockEngine (ref), u33 (copy), EffectUtil (ref), u34 (copy), u35 (copy)
        local v36 = ReplicatedStorage.Assets.Effects.GlitchedLuckyBlockEffect:Clone();
        v36.Name = "GlitchedLuckyBlockEffect";
        v36.Parent = Workspace;
        v36.Transparency = 1;
        local v37 = BlockEngine:getWorldPosition(u33);
        v36.CFrame = CFrame.new(v37);
        local v38 = {
            destroyAfterSec = 1.5
        };
        local v39 = u34;
        v38.sizeMultiplier = v39 == nil and 1.3 or v39;
        local v40 = u35;
        v38.particleMultiplier = v40 == nil and 1.3 or v40;
        EffectUtil:playEffects({ v36 }, nil, v38);
    end);
end;

function u5.loopGlitchParticlesOnBlock(u41, u42) -- Line: 217
    task.spawn(function() -- Line: 218
        -- upvalues: u42 (copy), u41 (copy)
        while true do
            local v43 = task.wait(math.random(8, 17));

            if v43 ~= 0 and (v43 == v43 and v43) then
                v43 = u42.Parent ~= nil;
            end;

            if v43 == 0 or (v43 ~= v43 or not v43) then
                return;
            end;

            u41:playGlitchParticlesOnBlock(u42.Position);
        end;
    end);
end;

KnitClient.CreateController(u5.new());

return nil;