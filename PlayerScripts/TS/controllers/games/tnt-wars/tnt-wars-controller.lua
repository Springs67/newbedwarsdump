-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local TweenService = v2.TweenService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local QueueType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "game", "queue-type").QueueType;
local CORE_HP = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "tnt-wars", "tnt-wars-constants").CORE_HP;
local MatchState = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "match", "match-state").MatchState;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local TNTWarsHud = RuntimeLib.import(script, script.Parent, "ui", "tnt-wars-hud").TNTWarsHud;
local u3 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, (1 / 0), true, 0);
local u4 = TweenInfo.new(5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, (1 / 0), false, 0);
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "TNTWarsController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 32
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 36
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "TNTWarsController";
    p7.cores = {};
    p7.coreMap = {};
end;

function u5.KnitStart(u8) -- Line: 42
    -- upvalues: KnitController (copy), default (copy), ClientStore (copy), MatchState (copy), QueueType (copy)
    KnitController.KnitStart(u8);
    default.Client:WaitFor("MatchStateEvent"):expect():Connect(function(p9, p10, p11) -- Line: 44
        -- upvalues: ClientStore (ref), MatchState (ref), QueueType (ref), u8 (copy)
        local queueType = ClientStore:getState().Game.queueType;

        if p9 == MatchState.RUNNING and queueType == QueueType.TNT_WARS then
            u8:handleCores();
        end;
    end);
end;

function u5.handleCores(u12) -- Line: 51
    -- upvalues: WatchCollectionTag (copy)
    WatchCollectionTag("tnt-wars-core", function(p13) -- Line: 52
        -- upvalues: u12 (copy)
        u12:animateCore(p13);
        u12:handleCoreSpawned(p13);
        u12:handleCoreDamaged(p13);
    end);
end;

function u5.animateCore(p14, p15) -- Line: 59
    -- upvalues: TweenService (copy), u3 (copy), u4 (copy)
    TweenService:Create(p15, u3, {
        Position = p15.Position + Vector3.new(0, 1, 0)
    }):Play();
    TweenService:Create(p15, u4, {
        Orientation = p15.Orientation + Vector3.new(360, 0, 0)
    }):Play();
end;

function u5.handleCoreSpawned(p16, p17) -- Line: 77
    -- upvalues: CORE_HP (copy)
    local v18 = p17:GetAttribute("TeamId");
    local v19 = p17:GetAttribute("CoreUUID");
    local v20 = p16.coreMap[v18];
    local v21 = {
        hp = CORE_HP,
        teamId = v18,
        position = p17.Position,
        coreUUID = v19,
        corePart = p17
    };
    table.insert(p16.cores, v21);

    if v20 then
        table.insert(v20, v21);
        local _ = #v20;
    else
        p16.coreMap[v18] = { v21 };
    end;

    if #p16.cores == 4 then
        p16:onCoresSpawned();
    end;
end;

function u5.handleCoreDamaged(u22, u23) -- Line: 101
    local u24 = u23:GetAttribute("CoreUUID");
    u23:GetAttributeChangedSignal("Hp"):Connect(function() -- Line: 103
        -- upvalues: u22 (copy), u24 (copy), u23 (copy)
        local v25 = u22:getCoreByUUID(u24);

        if not v25 then
            return nil;
        end;

        local hp = v25.hp;
        local v26 = u23:GetAttribute("Hp");
        v25.hp = v26;
        u22:showDamageNumber(v25, (math.abs(hp - v26)));
    end);
end;

function u5.showDamageNumber(p27, p28, p29) -- Line: 115
    -- upvalues: KnitClient (copy)
    KnitClient.Controllers.DamageIndicatorController:spawnDamageIndicator(p28.position, p29, {
        infiniteRange = true,
        color = Color3.fromRGB(255, 0, 0)
    });
end;

function u5.onCoresSpawned(p30) -- Line: 121
    -- upvalues: Players (copy), u1 (copy), TNTWarsHud (copy)
    local u31 = Players.LocalPlayer:GetAttribute("Team");
    local u32 = {};
    local u33 = {};

    local function _(p34, p35) -- Line: 126
        -- upvalues: u31 (copy), u32 (ref), u33 (ref)
        if u31 == p35 then
            u32 = p34;

            return;
        end;

        u33 = p34;
    end;

    for i, v in p30.coreMap do
        if u31 == i then
            u32 = v;
        else
            u33 = v;
        end;
    end;

    u1.mount(u1.createElement(TNTWarsHud, {
        enemyCores = u33,
        friendlyCores = u32
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
end;

function u5.getCoreByUUID(p36, u37) -- Line: 143
    local function _(p38) -- Line: 145
        -- upvalues: u37 (copy)
        return p38.coreUUID == u37;
    end;

    for i, v in p36.cores do
        local _ = i - 1;

        if v.coreUUID == u37 == true then
            return v;
        end;
    end;

    return nil;
end;

KnitClient.CreateController(u5.new());

return nil;