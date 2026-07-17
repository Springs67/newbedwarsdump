-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "string-utils");
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local ItemDropController = RuntimeLib.import(script, script.Parent, "item-drop-controller").ItemDropController;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "ItemDropHandController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p6);
    p6.Name = "ItemDropHandController";
end;

function u4.KnitStart(p7) -- Line: 34
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p7);
end;

function u4.isRelevantItem(p8, p9) -- Line: 37
    -- upvalues: u3 (copy), u4 (copy)
    return u3.includes(p9.itemType, "wool") and true or table.find(u4.ITEMS, p9.itemType) ~= nil;
end;

function u4.onEnable(p10, p11) -- Line: 45
    -- upvalues: DeviceUtil (copy), KnitClient (copy), u2 (copy), MobileButton (copy), BedwarsImageId (copy), Flamework (copy), ItemDropController (copy), Players (copy)
    if DeviceUtil.isMobileControls() then
        p10:setupYield(function() -- Line: 47
            -- upvalues: KnitClient (ref), u2 (ref), MobileButton (ref), BedwarsImageId (ref), Flamework (ref), ItemDropController (ref), Players (ref)
            KnitClient.Controllers.MobileLayoutLoadController:onMobileLayoutLoaded():await();
            local u12 = u2.mount(u2.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u2.createElement(MobileButton, {
                    Image = BedwarsImageId.UP_MOBILE,
                    Position = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonPosition("DropItem"),
                    Size = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getMobileButtonSize("DropItem"),

                    OnClick = function() -- Line: 56, Name: OnClick
                        -- upvalues: ItemDropController (ref)
                        ItemDropController:dropItemInHand();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 61
                -- upvalues: u2 (ref), u12 (copy)
                u2.unmount(u12);
            end;
        end);
    end;
end;

function u4.onDisable(p13) -- Line: 67
end;

u4.ITEMS = {
    ItemType.IRON,
    ItemType.DIAMOND,
    ItemType.EMERALD,
    ItemType.ARROW,
    ItemType.TELEPEARL,
    ItemType.TNT,
    ItemType.STONE_BRICK,
    ItemType.BLASTPROOF_CERAMIC,
    ItemType.WOOD_PLANK_OAK,
    ItemType.OBSIDIAN,
    ItemType.SLIME_BLOCK
};

return {
    ItemDropHandController = KnitClient.CreateController(u4.new())
};