-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ItemDurabilityController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "ItemDurabilityController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), default (copy), ClientSyncEvents (copy), EntityUtil (copy)
    KnitController.KnitStart(p4);
    default.Client:Get("ItemDurabilityBroken"):Connect(function(p5) -- Line: 28
        -- upvalues: ClientSyncEvents (ref)
        if p5.itemOwner then
            local Position = p5.itemOwner:GetPivot().Position;
            ClientSyncEvents.ItemDurabilityBroken:fire(Position);
        end;
    end);
    ClientSyncEvents.HandItemRendered:connect(function(u6) -- Line: 34
        -- upvalues: EntityUtil (ref), ClientSyncEvents (ref)
        local tool = u6.tool;

        if tool ~= nil then
            tool = tool:GetAttribute("Durability");
        end;

        if tool == 0 or (tool ~= tool or (tool == "" or not (tool and u6.tool))) then
            return nil;
        end;

        u6.tool:GetAttributeChangedSignal("Durability"):Connect(function() -- Line: 43
            -- upvalues: u6 (copy), EntityUtil (ref), ClientSyncEvents (ref)
            if u6.tool then
                local v7 = u6.tool:GetAttribute("Durability");
                local v8 = EntityUtil:getPlayerFromEntityInstance(u6.entity);
                ClientSyncEvents.ItemDurabilityChanged:fire(u6.tool, v7, v8);
            end;
        end);
    end);
end;

KnitClient.CreateController(u1.new());

return nil;