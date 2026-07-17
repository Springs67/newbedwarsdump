-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "GamePortalController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (copy)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "GamePortalController";
    p4.teleportTime = 0;
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: Workspace (copy)
    task.spawn(function() -- Line: 30
        -- upvalues: Workspace (ref), u5 (copy)
        local GamePortals = Workspace:WaitForChild("Lobby"):FindFirstChild("GamePortals");

        if GamePortals ~= nil then
            GamePortals = GamePortals:FindFirstChild("Islands");
        end;

        if GamePortals then
            u5:hookPortal(GamePortals);
        end;
    end);
end;

function u2.hookPortal(u6, p7) -- Line: 42
    -- upvalues: Players (copy), u2 (copy), default (copy)
    local Portal = p7:FindFirstChild("Portal");

    if Portal then
        Portal.Touched:Connect(function(p8) -- Line: 45
            -- upvalues: Players (ref), u6 (copy), u2 (ref), default (ref)
            if Players.LocalPlayer.Character and (p8.Parent == Players.LocalPlayer.Character and tick() - u6.teleportTime >= u2.TELEPORT_COOLDOWN) then
                u6.teleportTime = tick();
                default.Client:Get("TeleportToGame"):SendToServer({
                    game = "islands"
                });
            end;
        end);
    end;
end;

u2.TELEPORT_COOLDOWN = 5;

return {
    GamePortalController = KnitClient.CreateController(u2.new())
};