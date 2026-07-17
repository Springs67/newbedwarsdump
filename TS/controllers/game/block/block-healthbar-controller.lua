-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local BlockHealthbar = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out", "client", "break", "block-healthbar").BlockHealthbar;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "BlockHealthbarController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 18
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3, ...) -- Line: 22
    -- upvalues: KnitController (copy), BlockHealthbar (copy)
    KnitController.constructor(p3, ...);
    p3.Name = "BlockHealthbarController";
    p3.blockHealthbar = BlockHealthbar.new();
end;

function u1.KnitStart(u4) -- Line: 27
    -- upvalues: KnitController (copy), default (copy), BlockEngine (copy)
    KnitController.KnitStart(u4);
    default.Client:Get("BlockHealthbarUpdate"):Connect(function(p5) -- Line: 29
        -- upvalues: BlockEngine (ref), u4 (copy)
        local v6 = BlockEngine:getStore():getBlockAt(p5.blockPosition);

        if not v6 then
            return nil;
        end;

        u4.blockHealthbar:show({
            blockPosition = p5.blockPosition,
            blockInstance = v6,
            preHitHealth = p5.preHitHealth,
            newHealth = p5.newHealth,
            maxHealth = p5.maxHealth
        });
    end);
end;

KnitClient.CreateController(u1.new());

return nil;