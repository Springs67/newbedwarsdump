-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local CollectionTagAdded = v1.CollectionTagAdded;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "TeleportBlockController";
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
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "TeleportBlockController";
end;

function u4.KnitStart(p7) -- Line: 32
    -- upvalues: KnitController (copy), CollectionTagAdded (copy), Players (copy), default (copy), WatchCollectionTag (copy), u2 (copy), Workspace (copy), RunService (copy)
    KnitController.KnitStart(p7);
    CollectionTagAdded("teleport_block", function(u8) -- Line: 34
        -- upvalues: Players (ref), default (ref), WatchCollectionTag (ref), u2 (ref), Workspace (ref), RunService (ref)
        u8.Touched:Connect(function(p9) -- Line: 41
            -- upvalues: Players (ref), default (ref), u8 (copy)
            if Players.LocalPlayer.Character and p9.Parent == Players.LocalPlayer.Character then
                default.Client:Get("StepOnTeleportBlock"):SendToServer({
                    teleportBlock = u8
                });
            end;
        end);
        WatchCollectionTag("teleport_block", function(u10) -- Line: 48
            -- upvalues: u2 (ref), Workspace (ref), RunService (ref)
            local TeamIndicator = u10:WaitForChild("TeamIndicator");
            local Position = TeamIndicator.Position;
            local u11 = u2.new();
            local u12 = Workspace:GetServerTimeNow();
            u11:GiveTask(RunService.Heartbeat:Connect(function(p13) -- Line: 53
                -- upvalues: u12 (ref), u10 (copy), TeamIndicator (copy), Position (copy)
                u12 = u12 + p13;

                if u10:GetAttribute("spouseIndex") ~= nil and TeamIndicator.Transparency > 0 then
                    local v14 = TeamIndicator;
                    v14.Transparency = v14.Transparency - 0.002;
                end;

                local v15 = math.sin(u12 * 1.2) + 0.2;
                local v16 = Vector3.new(0, v15, 0);
                TeamIndicator.CFrame = CFrame.new(Position + v16);
            end));
            TeamIndicator.AncestryChanged:Connect(function(p17, p18) -- Line: 62
                -- upvalues: u11 (copy)
                if p18 == nil then
                    u11:DoCleaning();
                end;
            end);
        end);
    end);
end;

KnitClient.CreateController(u4.new());

return nil;