-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local MobileTouchType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").MobileTouchType;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local Workspace = v2.Workspace;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local SummonerKitBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-balance").SummonerKitBalance;
local summoner_isItemClaw = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "summoner", "summoner-kit-util").summoner_isItemClaw;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local StatusEffectType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-type").StatusEffectType;
local StatusEffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "status-effect", "status-effect-util").StatusEffectUtil;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "SummonerClawHandController";
    end,

    __index = HandKnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 28
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 32
    -- upvalues: HandKnitController (copy), u1 (copy)
    HandKnitController.constructor(p5);
    p5.Name = "SummonerClawHandController";
    p5.maid = u1.new();
    p5.lastAttackTime = 0;
    p5.enableTime = 0;
end;

function u3.KnitStart(p6) -- Line: 39
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function u3.onEnable(u7, u8) -- Line: 42
    -- upvalues: Workspace (copy), Flamework (copy), MobileTouchType (copy), ClientSyncEvents (copy)
    u7.enableTime = Workspace:GetServerTimeNow();
    local v12 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "Summoner Claw Attack",

        boundFunction = function(p9, p10, p11) -- Line: 48, Name: boundFunction
            -- upvalues: u7 (copy), u8 (copy)
            if p10 == Enum.UserInputState.Begin then
                u7:attack(u8.itemType);
            end;
        end,

        mobile = {
            touchType = MobileTouchType.TouchTap,

            mobileBoundFunction = function() -- Line: 55, Name: mobileBoundFunction
                -- upvalues: u7 (copy), u8 (copy)
                u7:attack(u8.itemType);
            end
        }
    });
    u7.maid:GiveTask(v12);
    u7.maid:GiveTask(ClientSyncEvents.MobileSwordButtonPressed:connect(function(p13) -- Line: 62
        -- upvalues: u7 (copy), u8 (copy)
        u7:attack(u8.itemType);
    end));
end;

function u3.onDisable(p14) -- Line: 66
    p14.maid:DoCleaning();
end;

function u3.isRelevantItem(p15, p16) -- Line: 69
    -- upvalues: summoner_isItemClaw (copy)
    return summoner_isItemClaw(p16.itemType);
end;

function u3.attack(p17, u18) -- Line: 72
    -- upvalues: EntityUtil (copy), Players (copy), StatusEffectUtil (copy), StatusEffectType (copy), Workspace (copy), SummonerKitBalance (copy), KnitClient (copy), default (copy)
    local v19 = EntityUtil:getEntity(Players.LocalPlayer);

    if not v19 then
        return nil;
    end;

    if StatusEffectUtil:isActive(v19:getInstance(), StatusEffectType.FROZEN) then
        return nil;
    end;

    if Workspace:GetServerTimeNow() - p17.enableTime < 0.1 then
        return nil;
    end;

    if Workspace:GetServerTimeNow() - p17.lastAttackTime < SummonerKitBalance.CLAW_COOLDOWN then
        return nil;
    end;

    if KnitClient.Controllers.SummonerKitController:isPlayerCastingSpell(Players.LocalPlayer) then
        return nil;
    end;

    p17.lastAttackTime = Workspace:GetServerTimeNow();
    local LookVector = Workspace.CurrentCamera.CFrame.LookVector;
    local Position = Players.LocalPlayer.Character.PrimaryPart.Position;
    task.spawn(function() -- Line: 94
        -- upvalues: KnitClient (ref), Players (ref), Position (copy), LookVector (copy), u18 (copy)
        KnitClient.Controllers.SummonerClawController:clawAttack(Players.LocalPlayer, Position, LookVector, u18);
    end);
    default.Client:Get("SummonerClawAttackRequest"):SendToServer({
        position = Position,
        direction = LookVector,
        clientTime = Workspace:GetServerTimeNow()
    });
end;

KnitClient.CreateController(u3.new());

return nil;