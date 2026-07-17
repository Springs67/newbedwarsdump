-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local AnimationUtil = v1.AnimationUtil;
local SoundManager = v1.SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local JellyfishItemTimerApp = RuntimeLib.import(script, script.Parent, "ui", "jellyfish-item-timer").JellyfishItemTimerApp;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "JellyfishKitController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p5, BedwarsKit.JELLYFISH);
    p5.Name = "JellyfishKitController";
    p5.isPreloaded = false;
end;

function u3.onKitLocalActivated(p6, p7) -- Line: 37
    -- upvalues: KnitClient (copy), BedwarsImageId (copy), GameSound (copy), AnimationType (copy), Players (copy), BedwarsKitSkin (copy), u2 (copy), JellyfishItemTimerApp (copy)
    if not p6.isPreloaded then
        KnitClient.Controllers.PreloadController:runPreload({
            imageIds = { BedwarsImageId.ELECTRIFY_JELLYFISH_ICON },
            sounds = {
                GameSound.JELLYFISH_DEPLOY_1,
                GameSound.JELLYFISH_DEPLOY_2,
                GameSound.JELLYFISH_DEPLOY_3,
                GameSound.JELLYFISH_PULSE_1,
                GameSound.JELLYFISH_PULSE_2,
                GameSound.JELLYFISH_PULSE_3,
                GameSound.JELLYFISH_PULSE_4,
                GameSound.JELLYFISH_PULSE_5,
                GameSound.JELLYFISH_ZAP_1,
                GameSound.JELLYFISH_ZAP_2
            },
            animations = {
                AnimationType.JELLYFISH_ATTACK,
                AnimationType.JELLYFISH_IDLE,
                AnimationType.JELLYFISH_SPAWN,
                AnimationType.JELLYFISH_MOUNT_IDLE
            }
        });
        local Character = Players.LocalPlayer.Character;

        if Character then
            local v8 = KnitClient.Controllers.KitController:getKitSkin(Character);

            if v8 == BedwarsKitSkin.JELLYFISH_HOLIDAY then
                KnitClient.Controllers.PreloadController:runPreload({
                    sounds = {
                        GameSound.HOLIDAY_JELLYFISH_DEPLOY_1,
                        GameSound.HOLIDAY_JELLYFISH_DEPLOY_2,
                        GameSound.HOLIDAY_JELLYFISH_DEPLOY_3,
                        GameSound.HOLIDAY_JELLYFISH_PULSE_1,
                        GameSound.HOLIDAY_JELLYFISH_PULSE_2,
                        GameSound.HOLIDAY_JELLYFISH_PULSE_3,
                        GameSound.HOLIDAY_JELLYFISH_PULSE_4,
                        GameSound.HOLIDAY_JELLYFISH_PULSE_5,
                        GameSound.HOLIDAY_JELLYFISH_ZAP_1,
                        GameSound.HOLIDAY_JELLYFISH_ZAP_2
                    }
                });
            elseif v8 == BedwarsKitSkin.JELLYFISH_DESSERT then
                KnitClient.Controllers.PreloadController:runPreload({
                    sounds = {
                        GameSound.DESSERT_JELLYFISH_DEPLOY_1,
                        GameSound.DESSERT_JELLYFISH_DEPLOY_2,
                        GameSound.DESSERT_JELLYFISH_DEPLOY_3,
                        GameSound.DESSERT_JELLYFISH_PULSE_1,
                        GameSound.DESSERT_JELLYFISH_PULSE_2,
                        GameSound.DESSERT_JELLYFISH_PULSE_3,
                        GameSound.DESSERT_JELLYFISH_PULSE_4,
                        GameSound.DESSERT_JELLYFISH_PULSE_5,
                        GameSound.DESSERT_JELLYFISH_ZAP_1,
                        GameSound.DESSERT_JELLYFISH_ZAP_2
                    }
                });
            end;
        end;

        p6.isPreloaded = true;
    end;

    local u9 = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(JellyfishItemTimerApp));
    p7:GiveTask(function() -- Line: 60
        -- upvalues: u2 (ref), u9 (copy)
        u2.unmount(u9);
    end);
end;

function u3.onAbilityUsed(p10, p11, p12) -- Line: 64
    -- upvalues: AbilityId (copy), Players (copy), SoundManager (copy), GameSound (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy)
    if p12.ability ~= AbilityId.ELECTRIFY_JELLYFISH then
        return nil;
    end;

    local JELLYFISH_PULSE_1 = GameSound.JELLYFISH_PULSE_1;
    local v13 = {};
    local v14;

    if p12.userCharacter == Players.LocalPlayer.Character then
        v14 = nil;
    else
        v14 = p12.userCharacter:GetPivot().Position;
    end;

    v13.position = v14;
    SoundManager:playSound(JELLYFISH_PULSE_1, v13);
    AnimationUtil:playAnimation(p12.userCharacter, GameAnimationUtil:getAssetId(AnimationType.USE_GRAVESTONE), {
        looped = false
    });
end;

function u3.onKitLocalDeactivated(p15) -- Line: 77
end;

function u3.onKitReplicationActivated(p16, p17) -- Line: 79
end;

function u3.onKitReplicationDeactivated(p18) -- Line: 81
end;

function u3.onInnateAbilityEnabled(p19, p20, p21) -- Line: 83
end;

KnitClient.CreateController(u3.new());

return nil;