-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local Players = v2.Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "BeeNetController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 25
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5, ...) -- Line: 29
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5, ...);
    p5.Name = "BeeNetController";
    p5.maid = u1.new();
end;

function u3.KnitStart(p6) -- Line: 34
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.isRelevantItem(p7, p8) -- Line: 37
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.BEE_NET;
end;

function u3.trigger(p9, p10, p11) -- Line: 40
    -- upvalues: Players (copy), GameAnimationUtil (copy), AnimationType (copy), KnitClient (copy), SoundManager (copy), GameSound (copy), default (copy)
    if p10 == Players.LocalPlayer then
        GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.NET_CATCH);
        local v12 = KnitClient.Controllers.KitSkinController:getPlayerKitSkinMeta(Players.LocalPlayer);

        if v12 ~= nil then
            v12 = v12.beekeeper;

            if v12 ~= nil then
                v12 = v12.sounds;

                if v12 ~= nil then
                    v12 = v12.beeNetSwing;
                end;
            end;
        end;

        SoundManager:playRandomSound(v12 == nil and { GameSound.BEE_NET_SWING } or v12);
        default.Client:Get("PickUpBee"):SendToServer({
            beeId = p11:GetAttribute("BeeId")
        });
    end;
end;

function u3.onEnable(u13) -- Line: 66
    -- upvalues: CollectionService (copy)
    for _, v in CollectionService:GetTagged("bee") do
        u13:toggleBeehivePrompts(v, true);
    end;

    u13.maid:GiveTask(CollectionService:GetInstanceAddedSignal("bee"):Connect(function(p14) -- Line: 70
        -- upvalues: u13 (copy)
        u13:toggleBeehivePrompts(p14, true);
    end));
end;

function u3.onDisable(p15) -- Line: 74
    -- upvalues: CollectionService (copy)
    for _, v in CollectionService:GetTagged("bee") do
        p15:toggleBeehivePrompts(v, false);
    end;

    p15.maid:DoCleaning();
end;

function u3.toggleBeehivePrompts(p16, p17, p18) -- Line: 80
    local v19 = p17.Root:FindFirstChildOfClass("ProximityPrompt");

    if v19 and v19.Enabled ~= p18 then
        v19.Enabled = p18;
    end;
end;

KnitClient.CreateController(u3.new());

return nil;