-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v4.Players;
local RunService = v4.RunService;
local Workspace = v4.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local HudProgressWrapper = RuntimeLib.import(script, script.Parent, "ui", "hud-progress").HudProgressWrapper;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "GunGameController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 28
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 32
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "GunGameController";
    p7.rayMap = {};
end;

function u5.KnitStart(u8) -- Line: 37
    -- upvalues: KnitController (copy), u1 (copy), default (copy), ClientStore (copy), MatchState (copy), QueueType (copy), u3 (copy), HudProgressWrapper (copy), Players (copy), RunService (copy)
    KnitController.KnitStart(u8);
    local u9 = u1.new();
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p10, p11, p12) -- Line: 41
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), u3 (ref), HudProgressWrapper (ref), Players (ref), u9 (copy)
        local queueType = ClientStore:getState().Game.queueType;

        if p10 == MatchState.RUNNING and queueType == QueueType.GUN_GAME then
            local u13 = u3.mount(HudProgressWrapper(), Players.LocalPlayer:WaitForChild("PlayerGui"));
            u9:GiveTask(function() -- Line: 45
                -- upvalues: u3 (ref), u13 (copy)
                u3.unmount(u13);
            end);
        end;

        if p10 == MatchState.POST then
            u9:DoCleaning();
        end;
    end);
    default.Client:WaitFor("GunGameLastWeaponUpdate"):expect():Connect(function(p14) -- Line: 54
        -- upvalues: u8 (copy)
        if p14.onLastWeapon then
            u8:createRay(p14.player);

            return;
        end;

        local v15 = u8.rayMap[p14.player];

        if v15 then
            v15:Destroy();
        end;
    end);
    RunService.Heartbeat:Connect(function() -- Line: 67
        -- upvalues: u8 (copy)
        local function _(p16, p17) -- Line: 69
            local v18;

            if p16 then
                if p17 == nil then
                    v18 = p17;
                else
                    v18 = p17.Character;
                end;
            else
                v18 = p16;
            end;

            if v18 then
                p16.Position = p17.Character:GetPrimaryPartCFrame().Position;
            end;
        end;

        for i, v in u8.rayMap do
            local v19;

            if v then
                if i == nil then
                    v19 = i;
                else
                    v19 = i.Character;
                end;
            else
                v19 = v;
            end;

            if v19 then
                v.Position = i.Character:GetPrimaryPartCFrame().Position;
            end;
        end;
    end);
end;

function u5.createRay(p20, p21) -- Line: 87
    -- upvalues: Workspace (copy), u2 (copy), GameQueryUtil (copy)
    local v22 = {
        Parent = Workspace
    };
    local Character = p21.Character;

    if Character ~= nil then
        Character = Character:GetPrimaryPartCFrame();
    end;

    v22.CFrame = Character;
    v22.Shape = Enum.PartType.Cylinder;
    v22.Color = Color3.fromRGB(230, 255, 0);
    v22.Material = Enum.Material.ForceField;
    v22.CastShadow = false;
    v22.Size = Vector3.new(1200, 6, 6);
    v22.Orientation = Vector3.new(0, 0, 90);
    v22.Transparency = 0.25;
    v22.Anchored = true;
    v22.CanCollide = false;
    v22.CanQuery = false;
    v22.CanTouch = false;
    local v23 = u2("Part", v22);
    GameQueryUtil:setQueryIgnored(v23, true);
    p20.rayMap[p21] = v23;
end;

KnitClient.CreateController(u5.new());

return nil;