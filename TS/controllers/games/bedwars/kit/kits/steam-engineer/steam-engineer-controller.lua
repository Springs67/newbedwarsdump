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
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local SteamEngineerDisplay = RuntimeLib.import(script, script.Parent, "ui", "steam-engineer-ui").SteamEngineerDisplay;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "SteamEngineerController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 26
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 30
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), AnimationType (copy)
    BaseKitController.constructor(p5, BedwarsKit.STEAM_ENGINEER, {
        animations = { AnimationType.STEAM_ENGINEER_OVERCLOCK }
    });
    p5.Name = "SteamEngineerController";
    p5.settingUpGatherBotTextTree = false;
end;

function u3.KnitStart(p6) -- Line: 37
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p6);
end;

function u3.onKitLocalActivated(u7, p8) -- Line: 40
    -- upvalues: Players (copy), KnitClient (copy), u2 (copy), SteamEngineerDisplay (copy)
    if not (u7.gatherBotAmountTree or u7.settingUpGatherBotTextTree) then
        u7.settingUpGatherBotTextTree = true;
        local v9 = Players.LocalPlayer:GetAttribute("GatherBotBasicOwned");
        local v10 = Players.LocalPlayer:GetAttribute("GatherBotProOwned");
        u7.gatherBotAmountTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u2.createElement(SteamEngineerDisplay, {
            gatherBotBasicAmount = v9 == nil and 0 or v9,
            gatherBotProAmount = v10 == nil and 0 or v10
        }));
        p8:GiveTask(function() -- Line: 58
            -- upvalues: u7 (copy), u2 (ref)
            if u7.gatherBotAmountTree then
                u2.unmount(u7.gatherBotAmountTree);
            end;
        end);
        p8:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("GatherBotBasicOwned"):Connect(function(p11) -- Line: 63
            -- upvalues: u7 (copy)
            u7:updateTree();
        end));
        p8:GiveTask(Players.LocalPlayer:GetAttributeChangedSignal("GatherBotProOwned"):Connect(function(p12) -- Line: 66
            -- upvalues: u7 (copy)
            u7:updateTree();
        end));
    end;
end;

function u3.onAbilityUsed(p13, p14, p15) -- Line: 71
    -- upvalues: AbilityId (copy), Players (copy), AnimationUtil (copy), GameAnimationUtil (copy), AnimationType (copy), SoundManager (copy), GameSound (copy)
    if p15.ability == AbilityId.STEAM_ENGINEER_OVERCLOCK and p14 == Players.LocalPlayer.Character then
        AnimationUtil:playAnimation(Players.LocalPlayer, GameAnimationUtil:getAssetId(AnimationType.STEAM_ENGINEER_OVERCLOCK));
        task.delay(0.2, function() -- Line: 74
            -- upvalues: SoundManager (ref), GameSound (ref), Players (ref)
            local STEAM_ENGINEER_OVERCLOCK_ACTIVATE = GameSound.STEAM_ENGINEER_OVERCLOCK_ACTIVATE;
            local v16 = {};
            local Character = Players.LocalPlayer.Character;

            if Character ~= nil then
                Character = Character:GetPivot().Position;
            end;

            v16.position = Character;
            SoundManager:playSound(STEAM_ENGINEER_OVERCLOCK_ACTIVATE, v16);
        end);
    end;
end;

function u3.onKitLocalDeactivated(p17) -- Line: 88
end;

function u3.onKitReplicationActivated(p18, p19) -- Line: 90
end;

function u3.onKitReplicationDeactivated(p20) -- Line: 92
end;

function u3.onInnateAbilityEnabled(p21, p22, p23) -- Line: 94
end;

function u3.updateTree(p24) -- Line: 96
    -- upvalues: Players (copy), u2 (copy), SteamEngineerDisplay (copy)
    if p24.gatherBotAmountTree then
        local v25 = Players.LocalPlayer:GetAttribute("GatherBotBasicOwned");
        local v26 = Players.LocalPlayer:GetAttribute("GatherBotProOwned");
        u2.update(p24.gatherBotAmountTree, u2.createElement(SteamEngineerDisplay, {
            gatherBotBasicAmount = v25 == nil and 0 or v25,
            gatherBotProAmount = v26 == nil and 0 or v26
        }));
    end;
end;

KnitClient.CreateController(u3.new());

return nil;