-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local GameQueryUtil = v1.GameQueryUtil;
local WatchCollectionTag = v1.WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local InQuint = v2.InQuint;
local OutExpo = v2.OutExpo;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local scaleModel = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "scale-model", "out").scaleModel;
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v5.Players;
local ReplicatedStorage = v5.ReplicatedStorage;
local RunService = v5.RunService;
local Workspace = v5.Workspace;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local GameKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "game", "game-knit-controller").GameKnitController;
local ActionUtil = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "util", "action-util").ActionUtil;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local GameType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "game-type").GameType;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local ModelUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "model-util").ModelUtil;
local BlockInvulnTimer = RuntimeLib.import(script, script.Parent, "ui", "block-invuln-timer").BlockInvulnTimer;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 33, Name: __tostring
        return "LuckyblockTowersController";
    end,

    __index = GameKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 39
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8) -- Line: 43
    -- upvalues: GameKnitController (copy), GameType (copy)
    GameKnitController.constructor(p8, { GameType.LB_ONEBLOCK });
    p8.Name = "LuckyblockTowersController";
end;

function u6.KnitStart(p9) -- Line: 47
    -- upvalues: GameKnitController (copy)
    GameKnitController.KnitStart(p9);
end;

function u6.onGameInit(u10) -- Line: 50
    -- upvalues: WatchCollectionTag (copy), ClientSyncEvents (copy), MatchState (copy), KnitClient (copy), ActionUtil (copy), default3 (copy), EntityUtil (copy), Players (copy)
    WatchCollectionTag("LBT_LuckyBlock", function(p11) -- Line: 51
        -- upvalues: u10 (copy)
        local v12 = p11:GetAttribute("InvulnEndTime");
        local v13 = v12 == nil and 0 or v12;
        local v14 = os.clock();

        if v13 > 0 and v14 < v13 then
            u10:applyBlockShield(p11, v13);
        end;
    end);
    ClientSyncEvents.MatchStateChange:connect(function(p15) -- Line: 63
        -- upvalues: MatchState (ref), KnitClient (ref), u10 (copy), ActionUtil (ref)
        if p15.matchState == MatchState.RUNNING then
            KnitClient.Controllers.MapController:getCFrame("center"):andThen(function(p16) -- Line: 66
                -- upvalues: u10 (ref), ActionUtil (ref)
                if p16 then
                    u10:pointPlayerCameraTo(p16.Position);
                end;

                local u17 = ActionUtil:disableMovementInput();
                task.delay(0.6, function() -- Line: 71
                    -- upvalues: u17 (copy)
                    u17();
                end);
            end);
        end;
    end);
    default3.Client:OnEvent("EntityDeathEvent", function(p18) -- Line: 78
        -- upvalues: KnitClient (ref), MatchState (ref), EntityUtil (ref), Players (ref), u10 (copy)
        if KnitClient.Controllers.MatchController:getMatchState() ~= MatchState.RUNNING then
            return nil;
        end;

        local v19 = EntityUtil:getEntity(p18.entityInstance);

        if v19 ~= nil then
            v19 = v19:getPlayer();
        end;

        if v19 == Players.LocalPlayer then
            KnitClient.Controllers.MapController:getCFrame("center"):andThen(function(p20) -- Line: 90
                -- upvalues: u10 (ref)
                if p20 then
                    u10:pointPlayerCameraTo(p20.Position);
                end;
            end);
        end;
    end);
end;

function u6.pointPlayerCameraTo(p21, p22) -- Line: 99
    -- upvalues: Workspace (copy)
    local CurrentCamera = Workspace.CurrentCamera;

    if not CurrentCamera then
        return nil;
    end;

    CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, p22);
end;

function u6.applyBlockShield(p23, u24, p25) -- Line: 106
    -- upvalues: u3 (copy), u4 (copy), BlockInvulnTimer (copy), ReplicatedStorage (copy), scaleModel (copy), Workspace (copy), default2 (copy), OutExpo (copy), ModelUtil (copy), GameQueryUtil (copy), RunService (copy), default (copy), InQuint (copy)
    local u26 = u3.new();
    local u27 = u4.mount(u4.createElement(BlockInvulnTimer, {
        Adornee = u24,
        EndTime = p25
    }), u24);
    u26:GiveTask(function() -- Line: 113
        -- upvalues: u4 (ref), u27 (copy)
        u4.unmount(u27);
    end);
    local u28 = Color3.fromRGB(46, 46, 46);
    u24.Color = u28;
    u26:GiveTask(function() -- Line: 119
        -- upvalues: u24 (copy)
        u24.Color = Color3.fromRGB(255, 255, 255);
    end);
    task.delay(0.05, function() -- Line: 122
        -- upvalues: u24 (copy), u28 (copy), u26 (copy)
        local v29 = u24;

        if v29 ~= nil then
            local function _(u30) -- Line: 126
                -- upvalues: u28 (ref), u26 (ref)
                if u30:IsA("Texture") or u30:IsA("Decal") then
                    u30.Color3 = u28;
                    u26:GiveTask(function() -- Line: 129
                        -- upvalues: u30 (copy)
                        u30.Color3 = Color3.fromRGB(255, 255, 255);
                    end);
                end;
            end;

            for i, descendant in v29:GetDescendants() do
                local _ = i - 1;

                if descendant:IsA("Texture") or descendant:IsA("Decal") then
                    descendant.Color3 = u28;
                    u26:GiveTask(function() -- Line: 129
                        -- upvalues: descendant (copy)
                        descendant.Color3 = Color3.fromRGB(255, 255, 255);
                    end);
                end;
            end;
        end;
    end);
    local CFrame2 = u24.CFrame;
    local u31 = ReplicatedStorage.Assets.Effects.BedShield:Clone();
    u31:PivotTo(CFrame2);
    scaleModel(u31, 0.05);
    u31.Parent = Workspace;
    default2(1.1, OutExpo, function(p32) -- Line: 145
        -- upvalues: u31 (copy)
        u31.Shields.Transparency = p32;
    end, 1, 0);
    ModelUtil.tweenModelSize(u31, 1.1, OutExpo, 10);

    for _, child in u31:GetChildren() do
        if child:IsA("BasePart") then
            GameQueryUtil:setQueryIgnored(child, true);
        end;
    end;

    local u33 = 0;
    u26:GiveTask(RunService.Heartbeat:Connect(function(p34) -- Line: 155
        -- upvalues: u33 (ref), u31 (copy), default (ref), CFrame2 (copy)
        u33 = u33 + p34;

        if u31.PrimaryPart == nil then
            default.Error("Shield effect has no primary part");

            return nil;
        end;

        local v35 = CFrame.Angles(0, u33 * 0.8, 0);
        u31.Shields.CFrame = CFrame2 * v35;
    end));
    u26:GiveTask(function() -- Line: 164
        -- upvalues: ModelUtil (ref), u31 (copy), InQuint (ref)
        ModelUtil.tweenModelSize(u31, 0.3, InQuint, 0):andThen(function() -- Line: 166
            -- upvalues: u31 (ref)
            u31:Destroy();
        end);
    end);
    u26:GiveTask(function() -- Line: 171
        -- upvalues: u24 (copy), u26 (copy)
        u24.AncestryChanged:Once(function() -- Line: 172
            -- upvalues: u26 (ref)
            u26:DoCleaning();
        end);
    end);
    task.delay(p25 - Workspace:GetServerTimeNow(), function() -- Line: 176
        -- upvalues: u26 (copy)
        u26:DoCleaning();
    end);

    return u26;
end;

KnitClient.CreateController(u6.new());

return nil;