-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local WatchCollectionTag = v1.WatchCollectionTag;
local WatchPlayerCharacter = v1.WatchPlayerCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ResourcesAccumulatedBillboard = RuntimeLib.import(script, script.Parent, "ui", "resources-accumulated-billboard").ResourcesAccumulatedBillboard;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "PersonalChestResourcesAccumulatedDisplayController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 28
    -- upvalues: KnitController (copy), u3 (copy)
    KnitController.constructor(p6);
    p6.Name = "PersonalChestResourcesAccumulatedDisplayController";
    p6.chestBillboardMap = {};
    p6.updateResourceCountsSignal = u3.new();
    p6.enableBillboardSignal = u3.new();
end;

function u4.KnitStart(u7) -- Line: 35
    -- upvalues: KnitController (copy), default (copy), WatchCollectionTag (copy), ItemType (copy), u2 (copy), ResourcesAccumulatedBillboard (copy), WatchPlayerCharacter (copy), Players (copy)
    KnitController.KnitStart(u7);
    default.Client:Get("GetAccumulatedResourcesFromPersonalChest"):Connect(function(p8) -- Line: 37
        -- upvalues: u7 (copy)
        u7.updateResourceCountsSignal:Fire(p8.items);
        u7.enableBillboardSignal:Fire(true);
    end);
    WatchCollectionTag("chest", function(p9) -- Line: 41
        -- upvalues: ItemType (ref), u7 (copy), u2 (ref), ResourcesAccumulatedBillboard (ref)
        if p9.Name ~= ItemType.PERSONAL_CHEST and p9.Name ~= ItemType.OG_PERSONAL_CHEST then
            return nil;
        end;

        if u7.chestBillboardMap[p9] == nil then
            u7.chestBillboardMap[p9] = u2.mount(u2.createElement(ResourcesAccumulatedBillboard, {
                chest = p9,
                updateResourceCountsSignal = u7.updateResourceCountsSignal,
                enableBillboardSignal = u7.enableBillboardSignal
            }), p9);
        end;
    end);
    WatchPlayerCharacter(Players.LocalPlayer, function(p10, p11) -- Line: 58
        -- upvalues: Players (ref), u7 (copy), default (ref)
        local ObservedChestFolder = p10:WaitForChild("ObservedChestFolder", 3);

        if not ObservedChestFolder then
            return nil;
        end;

        p11:GiveTask(ObservedChestFolder.Changed:Connect(function(p12) -- Line: 64
            -- upvalues: Players (ref), u7 (ref), default (ref)
            if not p12 then
                return nil;
            end;

            if p12:GetAttribute("PersonalChest") ~= Players.LocalPlayer.UserId then
                return nil;
            end;

            u7.enableBillboardSignal:Fire(false);
            default.Client:Get("ClearAccumulatedResourcesFromPersonalChest"):SendToServer();
        end));
    end);
end;

KnitClient.CreateController(u4.new());

return nil;