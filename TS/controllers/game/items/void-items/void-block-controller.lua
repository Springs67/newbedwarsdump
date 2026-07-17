-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Linear = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions").Linear;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "VoidBlockController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 19
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 23
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "VoidBlockController";
    p4.timer = 0;
end;

function u2.KnitStart(p5) -- Line: 28
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), u1 (copy), default (copy), Linear (copy)
    KnitController.KnitStart(p5);
    WatchCollectionTag("void_block", function(u6) -- Line: 30
        -- upvalues: u1 (ref), default (ref), Linear (ref)
        local u7 = u1.new();
        local Part = u6:WaitForChild("Part", 3);

        if Part == nil then
            return nil;
        end;

        local u9 = default(1.5, Linear, function(p8) -- Line: 38
            -- upvalues: Part (copy)
            Part.Transparency = p8;
        end, Part.Transparency, 1);
        local u11 = default(1.5, Linear, function(p10) -- Line: 41
            -- upvalues: u6 (copy)
            u6.Transparency = p10;
        end, u6.Transparency, 1);
        u7:GiveTask(function() -- Line: 44
            -- upvalues: u9 (copy), u11 (copy)
            u9:Cancel();
            u11:Cancel();
        end);
        Part.AncestryChanged:Connect(function(p12, p13) -- Line: 48
            -- upvalues: u7 (copy)
            if p13 == nil then
                u7:DoCleaning();
            end;
        end);
    end);
end;

KnitClient.CreateController(u2.new());

return nil;