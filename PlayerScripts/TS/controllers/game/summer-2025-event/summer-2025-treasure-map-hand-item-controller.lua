-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local u3 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "screen-space");
local _ = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local _ = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local Summer2025TreasureMapGUI = RuntimeLib.import(script, script.Parent, "summer-2025-treasure-map-gui").Summer2025TreasureMapGUI;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "Summer2025TreasureMapHandItemController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "Summer2025TreasureMapHandItemController";
    p6.maid = u1.new();
end;

function u4.isRelevantItem(p7, p8) -- Line: 33
    -- upvalues: ItemType (copy)
    return p8.itemType == ItemType.SUMMER_2025_TREASURE_MAP;
end;

function u4.onEnable(p9, p10, p11) -- Line: 36
    return nil;
end;

function u4.mountMinimapGui(p12) -- Line: 56
    -- upvalues: u3 (copy), KnitClient (copy), u2 (copy), Summer2025TreasureMapGUI (copy), Players (copy)
    local v13 = u3.ViewSizeX();
    local v14 = math.min(v13, u3.ViewSizeY()) * 0.2;
    local u15 = u2.mount(u2.createElement(Summer2025TreasureMapGUI, {
        WorldSize = KnitClient.Controllers.Summer2025TreasureMapController.worldSize,
        CenterWorldPosition = KnitClient.Controllers.Summer2025TreasureMapController.centerWorldPosition,
        MinimapWidth = v14,
        TreasureModel = KnitClient.Controllers.Summer2025TreasureMapController:getCurrentTreasure()
    }), Players.LocalPlayer:WaitForChild("PlayerGui"), "Summer2025TreasureMapGUI");
    p12.maid:GiveTask(function() -- Line: 68
        -- upvalues: u2 (ref), u15 (copy)
        u2.unmount(u15);
    end);
end;

function u4.onDisable(p16) -- Line: 72
    p16.maid:DoCleaning();
end;

function u4.KnitStart(p17) -- Line: 76
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p17);
end;

KnitClient.CreateController(u4.new());

return nil;