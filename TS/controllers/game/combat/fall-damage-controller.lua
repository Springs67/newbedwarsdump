-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BLOCK_SIZE = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "block", "block-constants").BLOCK_SIZE;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 19, Name: __tostring
        return "FallDamageController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 25
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4, ...) -- Line: 29
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4, ...);
    p4.Name = "FallDamageController";
    p4.additionalRegisteredVelocity = 0;
end;

function u2.KnitStart(u5) -- Line: 34
    -- upvalues: default (copy), WatchCharacter (copy), Players (copy), RunService (copy), BLOCK_SIZE (copy), BlockEngine (copy), Workspace (copy), ClientSyncEvents (copy)
    local u6 = default.Client:Get("GroundHit");
    WatchCharacter(function(p7, u8) -- Line: 36
        -- upvalues: Players (ref), RunService (ref), BLOCK_SIZE (ref), BlockEngine (ref), u5 (copy), u6 (copy), Workspace (ref), ClientSyncEvents (ref)
        if Players.LocalPlayer == p7 then
            local u9 = Vector3.new(0, 0, 0);
            local u10 = false;
            RunService:BindToRenderStep("VelocityTracking", Enum.RenderPriority.Last.Value, function(p11) -- Line: 40
                -- upvalues: u10 (ref), Players (ref), u9 (ref)
                if u10 then
                    local Character = Players.LocalPlayer.Character;

                    if Character ~= nil then
                        Character = Character.PrimaryPart;

                        if Character ~= nil then
                            Character = Character.AssemblyLinearVelocity;
                        end;
                    end;

                    u9 = Character or Vector3.new(0, 0, 0);
                end;
            end);
            local Humanoid = u8:WaitForChild("Humanoid");
            Humanoid.StateChanged:Connect(function(p12, p13) -- Line: 57
                -- upvalues: u8 (copy), u10 (ref), Humanoid (copy), BLOCK_SIZE (ref), BlockEngine (ref), u9 (ref), u5 (ref), u6 (ref), Workspace (ref), ClientSyncEvents (ref)
                if u8.PrimaryPart == nil then
                    return nil;
                end;

                if p13 == Enum.HumanoidStateType.Freefall then
                    u10 = true;

                    return;
                end;

                if p12 == Enum.HumanoidStateType.Freefall and p13 == Enum.HumanoidStateType.Landed then
                    local PrimaryPart = u8.PrimaryPart;
                    local v14;

                    if PrimaryPart then
                        local v15 = PrimaryPart.Position - Vector3.new(0, PrimaryPart.Size.Y / 2 + Humanoid.HipHeight + 0.25 * BLOCK_SIZE, 0);
                        local v16 = false;
                        local v17 = 0;

                        while true do
                            if true then
                                if v16 then
                                    v17 = v17 + 1;
                                else
                                    v16 = true;
                                end;
                            end;

                            if v17 >= 5 or BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(v15)) then
                                break;
                            end;

                            v15 = PrimaryPart.Position - Vector3.new(0, PrimaryPart.Size.Y / 2 + Humanoid.HipHeight + 0.25 * BLOCK_SIZE + v17 * BLOCK_SIZE, 0);
                        end;

                        v14 = BlockEngine:getStore():getBlockAt(BlockEngine:getBlockPosition(v15));
                    else
                        v14 = nil;
                    end;

                    local v18 = u9 + Vector3.new(0, u5.additionalRegisteredVelocity, 0);
                    u5.additionalRegisteredVelocity = 0;
                    u6:SendToServer(v14, v18, Workspace:GetServerTimeNow());
                    ClientSyncEvents.GroundTouch:fire(v14, v18);
                end;
            end);
        end;
    end);
end;

function u2.countCurrentVelocityTowardNextFall(p19) -- Line: 105
end;

return {
    FallDamageController = KnitClient.CreateController(u2.new())
};