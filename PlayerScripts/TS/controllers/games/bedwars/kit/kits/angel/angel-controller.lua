-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local BuildRoduxApp = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "rodux", "create-rodux-app").BuildRoduxApp;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local AbilityId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-id").AbilityId;
local AbilityMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "ability", "ability-meta").AbilityMeta;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local BaseKitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "base-kit-controller").BaseKitController;
local AngelKitApp = RuntimeLib.import(script, script.Parent, "ui", "angel-ui").AngelKitApp;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "AngelController";
    end,

    __index = BaseKitController
});
u2.__index = u2;

function u2.new(...) -- Line: 24
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 28
    -- upvalues: BaseKitController (copy), BedwarsKit (copy), u1 (copy)
    BaseKitController.constructor(p4, BedwarsKit.ANGEL);
    p4.Name = "AngelController";
    p4.maid = u1.new();
    p4.didFirstLevelUp = false;
end;

function u2.KnitStart(p5) -- Line: 34
    -- upvalues: BaseKitController (copy)
    BaseKitController.KnitStart(p5);
end;

function u2.onKitLocalActivated(u6, p7) -- Line: 37
    -- upvalues: Flamework (copy), BuildRoduxApp (copy), AngelKitApp (copy)
    p7:GiveTask(task.defer(function() -- Line: 38
        -- upvalues: Flamework (ref), BuildRoduxApp (ref), AngelKitApp (ref), u6 (copy)
        local v8 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(BuildRoduxApp(AngelKitApp, {
            undefined = nil
        }));
        u6.maid:GiveTask(v8);
    end));
end;

function u2.onKitLocalDeactivated(p9) -- Line: 45
end;

function u2.onKitReplicationActivated(u10, u11) -- Line: 47
    -- upvalues: default (copy), ClientStore (copy), Flamework (copy), AbilityId (copy), AbilityMeta (copy)
    default.Client:OnEvent("AngelProgress", function(p12) -- Line: 48
        -- upvalues: ClientStore (ref), u10 (copy), Flamework (ref), AbilityId (ref), AbilityMeta (ref)
        ClientStore:dispatch({
            type = "KitAngelIncrementProgress",
            progress = p12.newProgress
        });

        if p12.levelUp and not u10.didFirstLevelUp then
            u10.didFirstLevelUp = true;
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/ability/ability-controller@AbilityController"):enableAbility(AbilityId.TRINITY_SWAP_FORM, AbilityMeta[AbilityId.TRINITY_SWAP_FORM].triggerConfig):andThen(function(p13) -- Line: 57
                -- upvalues: u10 (ref)
                u10.maid:GiveTask(p13);
            end);
        end;
    end):andThen(function(p14) -- Line: 63
        -- upvalues: u11 (copy)
        u11:GiveTask(p14);
    end);
end;

function u2.onKitReplicationDeactivated(p15) -- Line: 68
end;

function u2.onInnateAbilityEnabled(p16, p17, p18) -- Line: 70
end;

function u2.onAbilityUsed(p19, p20, p21) -- Line: 72
end;

function u2.onKitDisabled(p22) -- Line: 74
    p22.maid:DoCleaning();
end;

KnitClient.CreateController(u2.new());

return nil;