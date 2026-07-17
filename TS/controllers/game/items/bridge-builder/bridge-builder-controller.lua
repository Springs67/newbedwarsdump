-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out");
local BlockEngine = v1.BlockEngine;
local GreedyBlockHandler = v1.GreedyBlockHandler;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local RandomUtil = v2.RandomUtil;
local SoundManager = v2.SoundManager;
local WatchCharacter = v2.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local InOutSine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").InOutSine;
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local BedwarsKitSkin = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin").BedwarsKitSkin;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local BridgeState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "kit", "builder", "builder-constants").BridgeState;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = {
    [BridgeState.EXTENDED] = { GameSound.BRIDGE_EXPAND_1, GameSound.BRIDGE_EXPAND_2, GameSound.BRIDGE_EXPAND_3 },
    [BridgeState.RETRACTED] = { GameSound.BRIDGE_RETRACT_1, GameSound.BRIDGE_RETRACT_2, GameSound.BRIDGE_RETRACT_3 }
};
local u5 = {
    [BridgeState.EXTENDED] = { GameSound.NUTCRACKER_BUILDER_BRIDGE_EXPAND_1, GameSound.NUTCRACKER_BUILDER_BRIDGE_EXPAND_2, GameSound.NUTCRACKER_BUILDER_BRIDGE_EXPAND_3 },
    [BridgeState.RETRACTED] = { GameSound.NUTCRACKER_BUILDER_BRIDGE_RETRACT_1, GameSound.NUTCRACKER_BUILDER_BRIDGE_RETRACT_2, GameSound.NUTCRACKER_BUILDER_BRIDGE_RETRACT_3 }
};
TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 1, true);
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 44, Name: __tostring
        return "BridgeBuilderController";
    end,

    __index = KnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 50
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 54
    -- upvalues: KnitController (copy)
    KnitController.constructor(p8);
    p8.Name = "BridgeBuilderController";
end;

function u6.KnitStart(u9) -- Line: 58
    -- upvalues: KnitController (copy), KnitClient (copy), ItemType (copy), u4 (copy), BridgeState (copy), GameSound (copy), WatchCharacter (copy), BedwarsKitSkin (copy), u5 (copy), default2 (copy), CollectionService (copy)
    KnitController.KnitStart(u9);
    local PreloadController = KnitClient.Controllers.PreloadController;
    local DRAWBRIDGE = ItemType.DRAWBRIDGE;
    local v10 = {};
    local v11 = {};
    local v12 = #v11;
    local v13 = u4[BridgeState.EXTENDED];
    local v14 = #v13;
    table.move(v13, 1, v14, v12 + 1, v11);
    local v15 = v12 + v14;
    local v16 = u4[BridgeState.RETRACTED];
    local v17 = #v16;
    table.move(v16, 1, v17, v15 + 1, v11);
    local v18 = v15 + v17;
    v11[v18 + 1] = GameSound.BRIDGE_DESTROY_1;
    v11[v18 + 2] = GameSound.BRIDGE_DESTROY_2;
    v11[v18 + 3] = GameSound.BRIDGE_DESTROY_3;
    v10.sounds = v11;
    PreloadController:preloadForItemType(DRAWBRIDGE, v10);
    WatchCharacter(function(p19, p20) -- Line: 79
        -- upvalues: KnitClient (ref), BedwarsKitSkin (ref), ItemType (ref), u5 (ref), BridgeState (ref), GameSound (ref)
        if KnitClient.Controllers.KitController:getKitSkin(p20) == BedwarsKitSkin.NUTCRACKER_BUILDER then
            local PreloadController2 = KnitClient.Controllers.PreloadController;
            local DRAWBRIDGE2 = ItemType.DRAWBRIDGE;
            local v21 = {};
            local v22 = {};
            local v23 = #v22;
            local v24 = u5[BridgeState.EXTENDED];
            local v25 = #v24;
            table.move(v24, 1, v25, v23 + 1, v22);
            local v26 = v23 + v25;
            local v27 = u5[BridgeState.RETRACTED];
            local v28 = #v27;
            table.move(v27, 1, v28, v26 + 1, v22);
            local v29 = v26 + v28;
            v22[v29 + 1] = GameSound.NUTCRACKER_BUILDER_BRIDGE_DESTROY_1;
            v22[v29 + 2] = GameSound.NUTCRACKER_BUILDER_BRIDGE_DESTROY_2;
            v22[v29 + 3] = GameSound.NUTCRACKER_BUILDER_BRIDGE_DESTROY_3;
            v21.sounds = v22;
            PreloadController2:preloadForItemType(DRAWBRIDGE2, v21);
        end;
    end);
    default2.Client:WaitFor("BridgeStateUpdate"):expect():Connect(function(p30) -- Line: 104
        -- upvalues: u9 (copy)
        return u9:handleBridgeStateUpdate(p30.state, p30.position, p30.skin);
    end);
    CollectionService:GetInstanceAddedSignal("scaffold"):Connect(function(p31) -- Line: 108
        -- upvalues: u9 (copy)
        u9:handleBridgeBlockAdded(p31);
    end);
end;

function u6.handleBridgeStateUpdate(p32, p33, p34, p35) -- Line: 113
    p32:playBridgeSound(p33, p34, p35);
end;

function u6.playBridgeSound(p36, p37, p38, p39) -- Line: 116
    -- upvalues: BedwarsKitSkin (copy), u5 (copy), u4 (copy), RandomUtil (copy), SoundManager (copy)
    local v40;

    if p39 == BedwarsKitSkin.NUTCRACKER_BUILDER then
        v40 = u5;
    else
        v40 = u4;
    end;

    SoundManager:playSound(RandomUtil.fromList(unpack(v40[p37])), {
        rollOffMaxDistance = 100,
        position = p38
    });
end;

function u6.handleBridgeBlockAdded(p41, p42) -- Line: 124
    p41:playBridgeBlockAddedEffect(p42);
end;

function u6.playBridgeBlockAddedEffect(p43, p44) -- Line: 127
    -- upvalues: CollectionService (copy), BlockEngine (copy), ItemType (copy), Workspace (copy), BLOCK_SIZE (copy), default (copy), InOutSine (copy), RuntimeLib (copy), GreedyBlockHandler (copy)
    if CollectionService:HasTag(p44, "falling-block") then
        return nil;
    end;

    local u45 = BlockEngine:getHandlerRegistry():getHandler(ItemType.SCAFFOLD);
    local u46 = u45:place(BlockEngine:getBlockPosition(p44.Position), 0);
    u46.Parent = Workspace;
    local u47 = u46.Size / BLOCK_SIZE;
    local u49 = default(0.1, InOutSine, function(p48) -- Line: 140
        -- upvalues: RuntimeLib (ref), u45 (copy), GreedyBlockHandler (ref), u46 (copy), u47 (copy)
        if RuntimeLib.instanceof(u45, GreedyBlockHandler) then
            u45:resize(u46, u47 * (1.1 * p48));
        end;
    end);
    task.spawn(function() -- Line: 147
        -- upvalues: u49 (copy), u46 (copy)
        u49:Wait();
        u46:Destroy();
    end);
end;

KnitClient.CreateController(u6.new());

return nil;