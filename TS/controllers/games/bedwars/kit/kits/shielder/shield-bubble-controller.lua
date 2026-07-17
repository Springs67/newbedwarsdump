-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "ShieldBubbleController";
    end,

    __index = HandKnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 22
    -- upvalues: HandKnitController (copy)
    HandKnitController.constructor(p3);
    p3.Name = "ShieldBubbleController";
end;

function u1.KnitStart(u4) -- Line: 26
    -- upvalues: HandKnitController (copy), CollectionService (copy), GameQueryUtil (copy)
    HandKnitController.KnitStart(u4);
    CollectionService:GetInstanceAddedSignal("ShielderBubble"):Connect(function(p5) -- Line: 28
        -- upvalues: u4 (copy), GameQueryUtil (ref)
        if u4:isEnabled() then
            GameQueryUtil:setQueryIgnored(p5, false);
        end;
    end);
end;

function u1.isRelevantItem(p6, p7) -- Line: 34
    -- upvalues: getItemMeta (copy)
    local v8 = getItemMeta(p7.itemType);

    return (v8.block or v8.breakBlock) and true or false;
end;

function u1.onEnable(p9, p10, p11) -- Line: 41
    p9:disableQuery();
end;

function u1.onDisable(p12) -- Line: 44
    p12:enableQuery();
end;

function u1.disableQuery(p13) -- Line: 47
    -- upvalues: CollectionService (copy), GameQueryUtil (copy)
    local function _(p14) -- Line: 49
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p14, true);
    end;

    for i, v in CollectionService:GetTagged("ShielderBubble") do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(v, true);
    end;
end;

function u1.enableQuery(p15) -- Line: 56
    -- upvalues: CollectionService (copy), GameQueryUtil (copy)
    local function _(p16) -- Line: 58
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p16, false);
    end;

    for i, v in CollectionService:GetTagged("ShielderBubble") do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(v, false);
    end;
end;

KnitClient.CreateController(u1.new());

return nil;