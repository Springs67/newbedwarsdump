-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v2.CollectionService;
local ReplicatedStorage = v2.ReplicatedStorage;
local RunService = v2.RunService;
local Workspace = v2.Workspace;
local BuildRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local EntityUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "entity", "entity-util").EntityUtil;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local EmberProgressBar = RuntimeLib.import(script, script.Parent, "emberUI", "ember-progress-bar").EmberProgressBar;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 23, Name: __tostring
        return "EmberKitController";
    end,

    __index = BaseKitController
});
u3.__index = u3;

function u3.new(...) -- Line: 29
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 33
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy)
    BaseKitController.constructor(p5, BedwarsKit.EMBER);
    p5.Name = "EmberKitController";
    p5.upgradeRequirement = 10;
    p5.maid = u1.new();
end;

function u3.onKitLocalActivated(p6, p7) -- Line: 39
    -- upvalues: Flamework (copy), BuildRoduxApp (copy), EmberProgressBar (copy)
    p7:GiveTask((Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(BuildRoduxApp(EmberProgressBar))));
end;

function u3.onKitLocalDeactivated(p8) -- Line: 43
end;

function u3.onKitReplicationActivated(u9, u10) -- Line: 45
    -- upvalues: default (copy), ClientStore (copy)
    default.Client:OnEvent("EmberProgress", function(p11) -- Line: 46
        -- upvalues: ClientStore (ref), u9 (copy)
        ClientStore:dispatch({
            type = "KitEmberIncrementProgress",
            progress = p11.incrementProgress / u9.upgradeRequirement
        });
    end):andThen(function(p12) -- Line: 51
        -- upvalues: u10 (copy)
        u10:GiveTask(p12);
    end);
    default.Client:OnEvent("PlayEmberEffect", function(p13) -- Line: 54
        -- upvalues: u9 (copy)
        u9:createEffect(p13.player);
    end):andThen(function(p14) -- Line: 56
        -- upvalues: u10 (copy)
        u10:GiveTask(p14);
    end);
end;

function u3.onKitReplicationDeactivated(p15) -- Line: 60
end;

function u3.onInnateAbilityEnabled(p16, p17, p18) -- Line: 62
end;

function u3.onAbilityUsed(p19, p20, p21) -- Line: 64
end;

function u3.createEffect(p22, p23) -- Line: 66
    -- upvalues: EntityUtil (copy), ReplicatedStorage (copy), GameQueryUtil (copy), CollectionService (copy), Workspace (copy), RunService (copy)
    local u24 = EntityUtil:getEntity(p23);

    if not u24 then
        return nil;
    end;

    p22:playAscendEffect(u24);
    local u25 = ReplicatedStorage.Assets.Effects.EmberUpgrade:Clone();
    local v26 = { u25 };
    local v27 = u25:GetDescendants();
    table.move(v27, 1, #v27, #v26 + 1, v26);

    local function _(p28) -- Line: 78
        -- upvalues: GameQueryUtil (ref)
        GameQueryUtil:setQueryIgnored(p28, true);
    end;

    for i, v in v26 do
        local _ = i - 1;
        GameQueryUtil:setQueryIgnored(v, true);
    end;

    local function _(p29) -- Line: 85
        if p29:IsA("Part") then
            p29:SetAttribute("InitialTransparency", 1);
        end;
    end;

    for i, descendant in u25:GetDescendants() do
        local _ = i - 1;

        if descendant:IsA("Part") then
            descendant:SetAttribute("InitialTransparency", 1);
        end;
    end;

    CollectionService:AddTag(u25, "FirstPersonHidden");
    u25:PivotTo(u24:getInstance():GetPrimaryPartCFrame());
    u25.Parent = Workspace;
    RunService.Heartbeat:Connect(function() -- Line: 96
        -- upvalues: u24 (copy), u25 (copy)
        if not u24:isAlive() or u24:getInstance().PrimaryPart == nil then
            u25:Destroy();

            return nil;
        end;

        u25:PivotTo(u24:getInstance():GetPrimaryPartCFrame());
    end);
end;

function u3.playAscendEffect(p30, u31) -- Line: 104
    -- upvalues: ReplicatedStorage (copy), CollectionService (copy), Workspace (copy), RunService (copy)
    local u32 = ReplicatedStorage.Assets.Effects.EmberAscend:Clone();
    CollectionService:AddTag(u32, "FirstPersonHidden");
    u32:PivotTo(u31:getInstance():GetPrimaryPartCFrame());
    u32.Parent = Workspace;
    local u33 = tick() + 1;
    RunService.Heartbeat:Connect(function() -- Line: 111
        -- upvalues: u33 (copy), u32 (copy), u31 (copy)
        if u33 < tick() then
            u32:Destroy();
        end;

        if tick() < u33 then
            u32:PivotTo(u31:getInstance():GetPrimaryPartCFrame());
        end;
    end);
end;

KnitClient.CreateController(u3.new());

return nil;