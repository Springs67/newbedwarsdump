-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local ActionButton = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").ActionButton;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v4.ContextActionService;
local Players = v4.Players;
local RunService = v4.RunService;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local _ = CooldownId.MASS_HAMMER;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "MassHammerController";
    end,

    __index = HandKnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 34
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p7);
    p7.Name = "MassHammerController";
    p7.maid = u2.new();
    p7.cooldownHasEnded = true;
    p7.hasWeapon = false;
end;

function u5.KnitStart(u8) -- Line: 41
    -- upvalues: HandKnitController (copy), RunService (copy), u2 (copy), Flamework (copy), u3 (copy), ActionButton (copy), ContextActionService (copy), default (copy), Players (copy)
    HandKnitController.KnitStart(u8);
    RunService.Heartbeat:Connect(function() -- Line: 43
        -- upvalues: u8 (copy), u2 (ref), Flamework (ref), u3 (ref), ActionButton (ref), ContextActionService (ref)
        if u8.cooldownHasEnded ~= true or u8.hasWeapon ~= true then
            if u8.useAbilityMaid then
                u8.useAbilityMaid:DoCleaning();
                u8.useAbilityMaid = nil;
            end;

            return;
        end;

        if u8.useAbilityMaid ~= nil then
            return nil;
        end;

        u8.useAbilityMaid = u2.new();
        local v9 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/action-bar/action-bar-controller@ActionBarController"):addComponent(u3.createElement(ActionButton, {
            actionName = "use-mass_hammer",
            text = "Mass Hammer",
            interactionKey = Enum.KeyCode.F,

            onActivated = function() -- Line: 53, Name: onActivated
                -- upvalues: u8 (ref)
                u8:activateAbility();
            end
        }));
        u8.useAbilityMaid:GiveTask(v9);
        u8.useAbilityMaid:GiveTask(function() -- Line: 59
            -- upvalues: ContextActionService (ref)
            ContextActionService:UnbindAction("use-mass_hammer");
        end);
    end);
    default.Client:OnEvent("MassHammerSpeedMod", function(p10) -- Line: 67
        -- upvalues: Players (ref), u8 (copy)
        if not Players.LocalPlayer.Character then
            return nil;
        end;

        u8:speedScale(Players.LocalPlayer.Character, p10.speed);
    end);
    default.Client:OnEvent("EndMassHammerCooldown", function() -- Line: 74
        -- upvalues: u8 (copy)
        u8.cooldownHasEnded = true;
    end);
    default.Client:OnEvent("MassHammerCleanUp", function() -- Line: 77
        -- upvalues: u8 (copy)
        u8:cleanUpDuty();
        u8.cooldownHasEnded = false;
    end);
end;

function u5.activateAbility(p11) -- Line: 83
    -- upvalues: default (copy)
    p11.cooldownHasEnded = false;
    default.Client:Get("UseMassHammer"):SendToServer();
end;

function u5.isRelevantItem(p12, p13) -- Line: 87
    -- upvalues: ItemType (copy)
    return p13.itemType == ItemType.MASS_HAMMER;
end;

function u5.onEnable(p14, p15, p16) -- Line: 90
    p14.hasWeapon = true;
end;

function u5.onDisable(p17) -- Line: 93
    p17.hasWeapon = false;
    p17.maid:DoCleaning();
    p17:cleanUpDuty();
end;

function u5.speedScale(p18, p19, p20) -- Line: 98
    -- upvalues: KnitClient2 (copy)
    local Humanoid = p19:WaitForChild("Humanoid");
    p18.maid:DoCleaning();

    if Humanoid then
        p18.maid:GiveTask(KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
            moveSpeedMultiplier = p20
        }));
    end;
end;

function u5.cleanUpDuty(p21) -- Line: 108
    if p21.useAbilityMaid then
        p21.useAbilityMaid:DoCleaning();
        p21.useAbilityMaid = nil;
    end;
end;

KnitClient.CreateController(u5.new());

return nil;