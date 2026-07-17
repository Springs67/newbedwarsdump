-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local TweenService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 11, Name: __tostring
        return "SpiritAssassinLobbyController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 17
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 21
    -- upvalues: KnitController (copy)
    KnitController.constructor(p3);
    p3.Name = "SpiritAssassinLobbyController";
end;

function u1.KnitStart(p4) -- Line: 25
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), TweenService (copy)
    KnitController.KnitStart(p4);
    local u5 = {
        Color3.fromRGB(255, 89, 89),
        Color3.fromRGB(218, 133, 65),
        Color3.fromRGB(91, 154, 76),
        Color3.fromRGB(82, 124, 174),
        Color3.fromRGB(180, 128, 255)
    };
    WatchCollectionTag("prismatic-text", function(p6) -- Line: 28
        -- upvalues: TweenService (ref), u5 (copy)
        local v7 = 1;

        while p6.Parent ~= nil do
            local v8 = TweenService:Create(p6, TweenInfo.new(1), {
                TextColor3 = u5[v7 + 1]
            });
            v8:Play();
            v8.Completed:Wait();
            local v9 = v7 + 1;
            v7 = #u5 <= v9 and 0 or v9;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;