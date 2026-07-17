-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local PlaceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "place-util").PlaceUtil;
local SkullCountDisplay = RuntimeLib.import(script, script.Parent, "ui", "skull-count-ui").SkullCountDisplay;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SkullDropWeeklyEventController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 23
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "SkullDropWeeklyEventController";
    p4.settingUpTree = false;
    p4.skullCount = 0;
end;

function u2.KnitStart(u5) -- Line: 33
    -- upvalues: KnitController (copy), GameSound (copy), default (copy), PlaceUtil (copy), SoundManager (copy)
    KnitController.KnitStart(u5);
    local u6 = os.clock();
    local u7 = 0;
    local u8 = {
        GameSound.SKULL_DROP_SKULL_DEPOSIT_01,
        GameSound.SKULL_DROP_SKULL_DEPOSIT_02,
        GameSound.SKULL_DROP_SKULL_DEPOSIT_03,
        GameSound.SKULL_DROP_SKULL_DEPOSIT_04
    };
    default.Client:Get("SkullCollectEffect"):Connect(function(p9) -- Line: 38
        -- upvalues: u6 (ref), PlaceUtil (ref), u5 (copy), u7 (ref), SoundManager (ref), u8 (copy)
        local v10 = os.clock() - u6;

        if PlaceUtil.isGameServer() then
            local v11 = u5;
            v11.skullCount = v11.skullCount + 1;

            if u5.skullCountTree then
                u5:updateStacksUI();
            else
                u5:mountStacksUI();
            end;
        end;

        if v10 < 2 then
            u7 = u7 + 1;
        else
            u7 = 0;
        end;

        u6 = os.clock();
        SoundManager:playSound(u8[math.min(3, u7) + 1], {
            volumeMultiplier = 2,
            playbackSpeedMultiplier = math.clamp(u7 / 10, 0, 1) * 0.15 + 0.95
        });
    end);
end;

function u2.updateStacksUI(p12) -- Line: 60
    -- upvalues: BedwarsImageId (copy), Players (copy), u1 (copy), SkullCountDisplay (copy)
    if p12.skullCountTree then
        local skullCount = p12.skullCount;
        local _ = Players.LocalPlayer.Character;
        u1.update(p12.skullCountTree, u1.createElement(SkullCountDisplay, {
            count = skullCount == nil and 0 or skullCount,
            icon = BedwarsImageId.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER
        }));
    end;
end;

function u2.mountStacksUI(p13) -- Line: 77
    -- upvalues: BedwarsImageId (copy), KnitClient (copy), u1 (copy), SkullCountDisplay (copy)
    if p13.settingUpTree then
        return nil;
    end;

    p13.settingUpTree = true;
    local skullCount = p13.skullCount;
    p13.skullCountTree = KnitClient.Controllers.StatusInfoListController:waitForSetupAddElement(u1.createElement(SkullCountDisplay, {
        count = skullCount == nil and 0 or skullCount,
        icon = BedwarsImageId.GRIM_REAPER_KIT_SHOULDER_BUDDY_UGC_RENDER
    }));
end;

KnitClient.CreateController(u2.new());

return nil;