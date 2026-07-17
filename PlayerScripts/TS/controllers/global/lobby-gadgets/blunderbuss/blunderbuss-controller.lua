-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local GameQueryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").GameQueryUtil;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local HttpService = v3.HttpService;
local Players = v3.Players;
local UserInputService = v3.UserInputService;
local ProjectileHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "combat", "projectile", "projectile-handler").ProjectileHandler;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 21, Name: __tostring
        return "BlunderbussController";
    end,

    __index = HandKnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 27
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 31
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p6);
    p6.Name = "BlunderbussController";
    p6.maid = u2.new();
end;

function u4.KnitStart(p7) -- Line: 36
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p7);
end;

function u4.isRelevantItem(p8, p9) -- Line: 39
    -- upvalues: ItemType (copy)
    return p9.itemType == ItemType.BLUNDERBUSS;
end;

function u4.onEnable(u10, p11, p12) -- Line: 42
    -- upvalues: UserInputService (copy), HttpService (copy), Flamework (copy)
    if UserInputService.TouchEnabled then
        u10.maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p13, p14) -- Line: 45
            -- upvalues: u10 (copy)
            if not p14 then
                u10:fire();
            end;
        end));
    end;

    local v15 = "shoot-blunderbuss:" .. HttpService:GenerateGUID(false);
    local v19 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = v15,

        boundFunction = function(p16, p17, p18) -- Line: 56, Name: boundFunction
            -- upvalues: u10 (copy)
            if p17 == Enum.UserInputState.Begin then
                u10:fire();
            end;
        end
    });
    u10.maid:GiveTask(v19);
end;

function u4.onDisable(p20) -- Line: 64
    p20.maid:DoCleaning();
end;

function u4.fire(u21) -- Line: 67
    -- upvalues: Flamework (copy), getItemMeta (copy), ItemType (copy), Players (copy), GameQueryUtil (copy), ProjectileHandler (copy), KnitClient2 (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown("blunderbuss-shot") then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown("blunderbuss-shot") < 0.2 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback("blunderbuss-shot", "callback", function() -- Line: 70
                -- upvalues: u21 (copy)
                u21:fire();
            end);
        end;

        return nil;
    end;

    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown("blunderbuss-shot", getItemMeta(ItemType.BLUNDERBUSS).projectileSource.fireDelaySec);
    local UnitRay = Players.LocalPlayer:GetMouse().UnitRay;
    local v22 = GameQueryUtil:raycast(UnitRay.Origin, UnitRay.Direction * 600);
    local v23 = UnitRay.Origin + UnitRay.Direction * 100;

    if v22 then
        v23 = v22.Position;
    end;

    local v24 = ProjectileHandler.new(1, 1, "blunderbuss_bullet", nil, v23, Vector3.new(0, 2, 0));
    local v25 = u21:getHandItem();

    if not v25 then
        return nil;
    end;

    local v26 = getItemMeta(v25.itemType);

    if v26.projectileSource then
        KnitClient2.Controllers.ProjectileController:launchProjectile(v25.tool.Name, nil, v24, v25.tool, v26.projectileSource, nil, ItemType.BLUNDERBUSS_BULLET);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;