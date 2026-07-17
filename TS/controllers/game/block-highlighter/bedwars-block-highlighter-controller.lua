-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockEngineClientEvents = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "block-engine-client-events").BlockEngineClientEvents;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u1 = Color3.fromRGB(255, 77, 77);
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "BedwarsBlockHighlighter";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 21
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 25
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "BedwarsBlockHighlighter";
end;

function u2.KnitStart(p5) -- Line: 29
    -- upvalues: KnitController (copy), BlockEngineClientEvents (copy), EntityUtil (copy), KnitClient (copy), BlockEngine (copy), Players (copy), u1 (copy), getItemMeta (copy)
    KnitController.KnitStart(p5);
    BlockEngineClientEvents.BeforeHighlightBlock:connect(function(p6) -- Line: 31
        -- upvalues: EntityUtil (ref), KnitClient (ref), BlockEngine (ref), Players (ref), u1 (ref), getItemMeta (ref)
        local v7 = EntityUtil:getLocalPlayerEntity();

        if not v7 then
            return nil;
        end;

        if v7 ~= nil then
            v7 = v7:getHandItemInstanceFromCharacter();
        end;

        if not v7 then
            return nil;
        end;

        if KnitClient.Controllers.BlockBreakController:isBlockBreakEnabled() and (p6.mouseInfo.target and not BlockEngine:isBlockBreakable(p6.mouseInfo.target.blockRef, Players.LocalPlayer)) then
            p6:setHighlightColor(u1);

            return nil;
        end;

        if KnitClient.Controllers.MapController:isInDenyRegion(p6.mouseInfo.placementPosition) or KnitClient.Controllers.MapController:isOutOfBounds(p6.mouseInfo.placementPosition) then
            p6:setHighlightColor(u1);

            return nil;
        end;

        if p6.mouseInfo.target then
            local Name = p6.mouseInfo.target.blockInstance.Name;
            local block = getItemMeta(v7.Name).block;

            if block ~= nil then
                block = block.denyPlaceOnBlockTypes;
            end;

            if block and table.find(block, Name) ~= nil then
                p6:setCancelled(true);

                return nil;
            end;
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;