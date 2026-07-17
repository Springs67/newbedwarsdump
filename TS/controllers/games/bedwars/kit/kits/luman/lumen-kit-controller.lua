-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v1.CollectionService;
local ReplicatedStorage = v1.ReplicatedStorage;
local RunService = v1.RunService;
local Workspace = v1.Workspace;
local BuildRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local LumenProgressBar = RuntimeLib.import(script, script.Parent, "ui", "lumen-progress-bar").LumenProgressBar;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 22, Name: __tostring
        return "LumenKitController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 28
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 32
    -- upvalues: BaseKitController (copy), BedwarsKit (copy)
    BaseKitController.constructor(p4, BedwarsKit.LUMEN);
    p4.Name = "LumenKitController";
    p4.upgradeRequirement = 10;
end;

function u2.onKitLocalActivated(p5, p6) -- Line: 37
    -- upvalues: Flamework (copy), BuildRoduxApp (copy), LumenProgressBar (copy)
    p6:GiveTask((Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(BuildRoduxApp(LumenProgressBar))));
end;

function u2.onKitLocalDeactivated(p7) -- Line: 41
end;

function u2.onKitReplicationActivated(u8, u9) -- Line: 43
    -- upvalues: default (copy), ClientStore (copy)
    default.Client:OnEvent("LumenProgress", function(p10) -- Line: 44
        -- upvalues: ClientStore (ref), u8 (copy)
        ClientStore:dispatch({
            type = "KitLumenIncrementProgress",
            progress = p10.incrementProgress / u8.upgradeRequirement
        });
    end):andThen(function(p11) -- Line: 49
        -- upvalues: u9 (copy)
        u9:GiveTask(p11);
    end);
    default.Client:OnEvent("PlayLumenEffect", function(p12) -- Line: 52
        -- upvalues: u8 (copy)
        u8:createEffect(p12);
    end):andThen(function(p13) -- Line: 54
        -- upvalues: u9 (copy)
        u9:GiveTask(p13);
    end);
end;

function u2.onKitReplicationDeactivated(p14) -- Line: 58
end;

function u2.onInnateAbilityEnabled(p15, p16, p17) -- Line: 60
end;

function u2.onAbilityUsed(p18, p19, p20) -- Line: 62
end;

function u2.createEffect(p21, p22) -- Line: 64
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), GameQueryUtil (copy), CollectionService (copy), Workspace (copy), RunService (copy)
    local u23 = EntityUtil:getEntity(p22);

    if not u23 then
        return nil;
    end;

    p21:playAscendEffect(u23);
    local u24 = ReplicatedStorage.Assets.Effects.LumenUpgrade:Clone();
    local v25 = { u24 };
    local v26 = u24:GetDescendants();
    table.move(v26, 1, #v26, #v25 + 1, v25);

    local function _(p27) -- Line: 76
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p27, true);
    end;

    for i, v in v25 do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(v, true);
    end;

    local function _(p28) -- Line: 83
        if p28:IsA("Part") then
            p28:SetAttribute("InitialTransparency", 1);
        end;
    end;

    for i, descendant in u24:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") then
            descendant:SetAttribute("InitialTransparency", 1);
        end;
    end;

    CollectionService:AddTag(u24, "FirstPersonHidden");
    u24:PivotTo(u23:getInstance():GetPrimaryPartCFrame());
    u24.Parent = Workspace;
    RunService.Heartbeat:Connect(function() -- Line: 94
        -- upvalues: u23 (copy), u24 (copy)
        if not u23:isAlive() or u23:getInstance().PrimaryPart == nil then
            return nil;
        end;

        u24:PivotTo(u23:getInstance():GetPivot());
    end);
end;

function u2.playAscendEffect(p29, u30) -- Line: 101
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), RunService (copy)
    local u31 = ReplicatedStorage.Assets.Effects.LumenAscend:Clone();
    CollectionService:AddTag(u31, "FirstPersonHidden");
    u31:PivotTo(u30:getInstance():GetPrimaryPartCFrame());
    u31.Parent = Workspace;
    local u32 = tick() + 1;
    local u33 = nil;
    u33 = RunService.Heartbeat:Connect(function() -- Line: 109
        -- upvalues: u32 (copy), u31 (copy), u33 (ref), u30 (copy)
        if u32 < tick() then
            u31:Destroy();
            u33:Disconnect();
        end;

        if tick() < u32 then
            u31:PivotTo(u30:getInstance():GetPivot());
        end;
    end);
end;

KnitClient.CreateController(u2.new());

return nil;