-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local MobileButton = v1.MobileButton;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "log", "out").default;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local getItemMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-meta").getItemMeta;
local GuidedProjectileMeta = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "projectile", "guided-projectile", "guided-projectile-meta").GuidedProjectileMeta;
local v4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "GuidedProjectileSourceController";
    end,

    __index = HandKnitController
});
v4.__index = v4;

function v4.constructor(p5, ...) -- Line: 26
    -- upvalues: HandKnitController (copy), u2 (copy)
    HandKnitController.constructor(p5, ...);
    p5.maid = u2.new();
end;

function v4.KnitStart(p6) -- Line: 30
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p6);
end;

function v4.onEnable(u7, u8, u9) -- Line: 33
    -- upvalues: getItemMeta (copy), GuidedProjectileMeta (copy), KnitClient (copy), default (copy), Flamework (copy), DeviceUtil (copy), u3 (copy), MobileButton (copy), BedwarsUI (copy), Players (copy)
    u7.maid:DoCleaning();

    if GuidedProjectileMeta[getItemMeta(u8.itemType).guidedProjectileSource.guidedProjectile].persistent == true then
        local v10 = KnitClient.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();

        if v10 ~= nil then
            v10 = v10.enabled;
        end;

        if v10 == false then
            KnitClient.Controllers.GuidedProjectileController:enableGuidedProjectile();
        else
            default.Debug("Launching guided projectile");
            u7:launchProjectile(u8.itemType, u9);
        end;

        u7.maid:GiveTask(function() -- Line: 50
            -- upvalues: KnitClient (ref)
            local v11 = KnitClient.Controllers.GuidedProjectileController:getCurrentGuidedProjectile();

            if v11 then
                v11.forces.antiGravity.Force = Vector3.new(0, 0, 0);
            end;

            KnitClient.Controllers.GuidedProjectileController:disableGuidedProjectile(0.5);
        end);

        return nil;
    end;

    local v15 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "launch-guided-projectile",

        boundFunction = function(p12, p13, p14) -- Line: 63, Name: boundFunction
            -- upvalues: u7 (copy), u8 (copy), u9 (copy)
            if p13 == Enum.UserInputState.Begin then
                u7:launchProjectile(u8.itemType, u9);
            end;
        end
    });
    u7.maid:GiveTask(v15);

    if DeviceUtil.isMobileControls() then
        u7:setupYield(function() -- Line: 71
            -- upvalues: u3 (ref), MobileButton (ref), BedwarsUI (ref), u7 (copy), u8 (copy), u9 (copy), Players (ref)
            local u16 = u3.mount(u3.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u3.createElement(MobileButton, {
                    Image = "rbxassetid://6862310392",
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 78, Name: OnClick
                        -- upvalues: u7 (ref), u8 (ref), u9 (ref)
                        u7:launchProjectile(u8.itemType, u9);
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 83
                -- upvalues: u3 (ref), u16 (copy)
                u3.unmount(u16);
            end;
        end);
    end;
end;

function v4.onDisable(p17) -- Line: 89
    p17.maid:DoCleaning();
end;

function v4.launchProjectile(p18, p19, p20) -- Line: 92
    -- upvalues: KnitClient (copy)
    p18:onLaunch(p20);
    KnitClient.Controllers.GuidedProjectileController:launch(p19);
end;

return {
    GuidedProjectileSourceController = v4
};