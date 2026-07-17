-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "util", "get-team-for-block").default;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 12, Name: __tostring
        return "TeamDoorController";
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
    p3.Name = "TeamDoorController";
end;

function u1.KnitStart(p4) -- Line: 26
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), default (copy), Players (copy)
    KnitController.KnitStart(p4);
    WatchCollectionTag("TeamDoor", function(p5) -- Line: 28
        -- upvalues: default (ref), Players (ref)
        local v6 = p5:IsA("BasePart") and default(p5);

        if v6 then
            p5.Color = v6.color;
            local Team = Players.LocalPlayer.Team;

            if Team ~= nil then
                Team = Team.Name;
            end;

            if Team == v6.name then
                p5.CanCollide = false;

                return;
            end;

            p5.CanCollide = true;
        end;
    end);
end;

KnitClient.CreateController(u1.new());

return nil;