-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v1.KnitClient;
local KnitClient2 = v1.KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v4.CollectionService;
local Players = v4.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local ProjectileSourceController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "combat", "projectile", "projectile-source-controller").ProjectileSourceController;
local TripleShotUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "items", "triple-shot", "triple-shot-util").TripleShotUtil;
local BedwarsKitSkinMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit-skin", "bedwars-kit-skin-meta").BedwarsKitSkinMeta;
local InventoryUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "inventory", "inventory-util").InventoryUtil;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TripleShotProgressBar = RuntimeLib.import(script, script.Parent, "triple-shot-progress-bar").TripleShotProgressBar;
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "TripleShotProjectileController";
    end,

    __index = ProjectileSourceController
});
u5.__index = u5;

function u5.new(...) -- Line: 30
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7, ...) -- Line: 34
    -- upvalues: ProjectileSourceController (copy), u2 (copy)
    ProjectileSourceController.constructor(p7, ...);
    p7.Name = "TripleShotProjectileController";
    p7.Client = {};
    p7.chargeMaid = u2.new();
    p7.overchargeStartTime = 0;
end;

function u5.KnitStart(p8) -- Line: 41
    -- upvalues: ProjectileSourceController (copy)
    ProjectileSourceController.KnitStart(p8);
end;

function u5.isRelevantItem(p9, p10) -- Line: 44
    -- upvalues: TripleShotUtil (copy), Players (copy)
    return TripleShotUtil.isTripleShot(p10.itemType, Players.LocalPlayer);
end;

function u5.onStartCharging(p11) -- Line: 47
    p11.overchargeStartTime = 0;
end;

function u5.onStopCharging(p12) -- Line: 50
    p12.chargeMaid:DoCleaning();
end;

function u5.onLaunch(p13, u14) -- Line: 53
    -- upvalues: getItemMeta (copy), InventoryUtil (copy), Players (copy), u2 (copy), KnitClient (copy), RuntimeLib (copy), KnitClient2 (copy)
    local v15 = p13:getChargeTime();
    local v16;

    if v15 == 0 then
        v16 = true;
    elseif p13.overchargeStartTime == 0 then
        v16 = false;
    else
        v16 = v15 <= tick() - p13.overchargeStartTime;
    end;

    if v16 then
        local u17 = p13:getHandItem();
        local u18 = getItemMeta(u17.itemType);
        local u19 = p13:getAmmoType(u17.itemType);
        local u20;

        if u19 then
            local v21 = InventoryUtil.getToolFromInventory(Players.LocalPlayer, u19);

            if v21 ~= nil then
                v21 = v21.amount;
            end;

            u20 = (v21 == nil and 0 or v21) - 1;
        else
            u20 = 0;
        end;

        local projectileHandler = p13.projectileHandler;
        local u22 = p13:getProjectileSource(u17);
        local u23 = u2.new();
        u23:GiveTask(KnitClient.Controllers.SprintController:getMovementStatusModifier():addModifier({
            blockSprint = true,
            moveSpeedMultiplier = u22.walkSpeedMultiplier
        }));
        RuntimeLib.Promise.defer(function() -- Line: 84
            -- upvalues: u18 (copy), u14 (copy), u19 (copy), u20 (ref), KnitClient2 (ref), u17 (copy), projectileHandler (copy), u22 (copy), u23 (copy)
            local projectileSource = u18.projectileSource;

            if projectileSource ~= nil then
                projectileSource = projectileSource.multiShotCount;
            end;

            local v24 = (projectileSource == 0 or (projectileSource ~= projectileSource or not projectileSource)) and 3 or projectileSource;
            local projectileSource2 = u18.projectileSource;

            if projectileSource2 ~= nil then
                projectileSource2 = projectileSource2.multiShotDelay;
            end;

            local v25 = (projectileSource2 == 0 or (projectileSource2 ~= projectileSource2 or not projectileSource2)) and 0.1 or projectileSource2;
            local v26 = false;
            local v27 = 0;

            while true do
                if v26 then
                    v27 = v27 + 1;
                else
                    v26 = true;
                end;

                if v27 >= v24 - 1 then
                    break;
                end;

                task.wait(v25);

                if u14() then
                    if u19 and u20 <= 0 then
                        break;
                    end;

                    u20 = u20 - 1;
                    KnitClient2.Controllers.ProjectileController:launchProjectile(u17.itemType, u19, projectileHandler, u17.tool, u22);
                end;
            end;

            u23:DoCleaning();
        end);
    end;
end;

function u5.onStartReload(p28) -- Line: 130
end;

function u5.getChargeTime(p29) -- Line: 132
    -- upvalues: getItemMeta (copy), ClientSyncEvents (copy)
    local v30 = p29:getHandItem();

    if v30 ~= nil then
        v30 = v30.itemType;
    end;

    if not v30 then
        return 0;
    end;

    local v31 = getItemMeta(v30);

    if v31 ~= nil then
        v31 = v31.projectileSource;

        if v31 ~= nil then
            v31 = v31.multiShotChargeTime;
        end;
    end;

    return (v31 == 0 or (v31 ~= v31 or not v31)) and 0 or ClientSyncEvents.ProjectileMaxChargeTimeModifierCheck:fire(v31).maxChargeTime;
end;

function u5.onMaxCharge(p32) -- Line: 155
    -- upvalues: SoundManager (copy), GameSound (copy), CollectionService (copy), Players (copy), KnitClient2 (copy), BedwarsKitSkinMeta (copy), u3 (copy), TripleShotProgressBar (copy)
    local v33 = p32:getChargeTime();

    if v33 == 0 then
        return nil;
    end;

    p32.overchargeStartTime = tick();
    SoundManager:playSound(GameSound.CHARGE_TRIPLE_SHOT);
    local u34 = true;
    p32.chargeMaid:GiveTask(function() -- Line: 163
        -- upvalues: u34 (ref)
        u34 = false;
    end);
    task.delay(v33, function() -- Line: 166
        -- upvalues: u34 (ref), CollectionService (ref)
        if u34 then
            local function _(p35) -- Line: 169
                p35.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;

            for i, v in CollectionService:GetTagged("projectile-preview-beam") do
                local _ = i - 1;
                v.Color = ColorSequence.new(Color3.fromRGB(112, 219, 255));
            end;
        end;
    end);
    local Character = Players.LocalPlayer.Character;
    local v36;

    if Character then
        v36 = BedwarsKitSkinMeta[KnitClient2.Controllers.KitSkinController:getKitSkin(Character)].multishot;

        if v36 ~= nil then
            v36 = v36.progressBarColor;
        end;
    else
        v36 = nil;
    end;

    local u37 = u3.mount(u3.createElement("ScreenGui", {}, { u3.createElement(TripleShotProgressBar, {
            title = "Triple Shot",
            progressColor = v36,
            chargeTime = v33
        }) }), Players.LocalPlayer:WaitForChild("PlayerGui"), "ChargeMultiShot");
    p32.chargeMaid:GiveTask(function() -- Line: 194
        -- upvalues: u3 (ref), u37 (copy)
        u3.unmount(u37);
    end);
end;

KnitClient.CreateController(u5.new());

return nil;