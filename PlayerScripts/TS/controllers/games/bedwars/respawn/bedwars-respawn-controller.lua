-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCharacter = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local Workspace = v3.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local GamePlayerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "player", "player-util").GamePlayerUtil;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local RespawnTimerWrapper = RuntimeLib.import(script, script.Parent, "ui", "respawn-timer").RespawnTimerWrapper;
local CurrentCamera = Workspace.CurrentCamera;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "BedwarsRespawnController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (copy)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "BedwarsRespawnController";
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: default (copy), Players (copy), GamePlayerUtil (copy), Workspace (copy), u1 (copy), CurrentCamera (copy), u2 (copy), RespawnTimerWrapper (copy), WatchCharacter (copy)
    default.Client:OnEvent("EntityDeathEvent", function(p8) -- Line: 35
        -- upvalues: Players (ref), GamePlayerUtil (ref), Workspace (ref), u1 (ref), CurrentCamera (ref), u7 (copy), u2 (ref), RespawnTimerWrapper (ref)
        if p8.customUI then
            return nil;
        end;

        if p8.entityInstance == Players.LocalPlayer.Character then
            if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):isSpectator() then
                return nil;
            end;

            local v9 = Players:GetPlayerFromCharacter(p8.fromEntity);
            local u10;

            if v9 == nil then
                u10 = v9;
            else
                u10 = v9.Character;

                if u10 ~= nil then
                    u10 = u10:FindFirstChildOfClass("Humanoid");
                end;
            end;

            local Head = p8.entityInstance:FindFirstChild("Head");

            if Head ~= nil then
                Head = Head.Position;
            end;

            local RespawnView = Workspace:FindFirstChild("RespawnView");

            if Head then
                RespawnView = u1("Part", {
                    Name = "DeathRespawnView",
                    CanCollide = false,
                    CanQuery = false,
                    Anchored = true,
                    Size = Vector3.new(0.1, 0.1, 0.1),
                    Transparency = 1,
                    Position = Head,
                    Parent = Workspace
                });
            end;

            task.delay(0.1, function() -- Line: 70
                -- upvalues: u10 (copy), CurrentCamera (ref), RespawnView (ref)
                if u10 then
                    CurrentCamera.CameraSubject = u10;

                    return;
                end;

                if RespawnView then
                    CurrentCamera.CameraSubject = RespawnView;
                end;
            end);

            if p8.respawnDuration == 0 then
                return nil;
            end;

            u7.respawnTree = u2.mount(u2.createElement(RespawnTimerWrapper, {
                RespawnDuration = p8.respawnDuration,
                KilledByPlayer = v9,
                DamageType = p8.damageType
            }), Players.LocalPlayer:WaitForChild("PlayerGui"));
        end;
    end);
    Players.LocalPlayer:GetAttributeChangedSignal("Spectator"):Connect(function() -- Line: 87
        -- upvalues: GamePlayerUtil (ref), Players (ref), u7 (copy), u2 (ref)
        if GamePlayerUtil.getGamePlayer(Players.LocalPlayer):isSpectator() and u7.respawnTree then
            u2.unmount(u7.respawnTree);
        end;
    end);
    WatchCharacter(function(p11, p12) -- Line: 94
        -- upvalues: Players (ref), u7 (copy), u2 (ref)
        if p11 == Players.LocalPlayer and u7.respawnTree then
            u2.unmount(u7.respawnTree);
        end;
    end);
end;

return {
    BedwarsRespawnController = KnitClient.CreateController(u4.new())
};