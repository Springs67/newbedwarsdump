-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GamepadAction = v1.GamepadAction;
local MobileButton = v1.MobileButton;
local UIUtil = v1.UIUtil;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local KnitClient2 = v2.KnitClient;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v5 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ContextActionService = v5.ContextActionService;
local Players = v5.Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local HandKnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "hand-knit-controller").HandKnitController;
local BedwarsUI = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "ui", "bedwars-ui").BedwarsUI;
local AnimationType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-type").AnimationType;
local GameAnimationUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "animation", "animation-util").GameAnimationUtil;
local CooldownId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "cooldown", "cooldown-id").CooldownId;
local PyroUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "pyro", "pyro-util").PyroUtil;
local ItemType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "item", "item-type").ItemType;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local FLAMETHROWER_USE = CooldownId.FLAMETHROWER_USE;
local u6 = setmetatable({}, {
    __tostring = function() -- Line: 31, Name: __tostring
        return "FlamethrowerController";
    end,

    __index = HandKnitController
});
u6.__index = u6;

function u6.new(...) -- Line: 37
    -- upvalues: u6 (ref)
    local v7 = setmetatable({}, u6);

    return v7:constructor(...) or v7;
end;

function u6.constructor(p8, ...) -- Line: 41
    -- upvalues: HandKnitController (copy), u3 (copy)
    HandKnitController.constructor(p8, ...);
    p8.Name = "FlamethrowerController";
    p8.maid = u3.new();
    p8.inUse = false;
end;

function u6.KnitStart(p9) -- Line: 47
    -- upvalues: HandKnitController (copy)
    HandKnitController.KnitStart(p9);
end;

function u6.useFlamethrower(u10) -- Line: 50
    -- upvalues: Flamework (copy), FLAMETHROWER_USE (copy), PyroUtil (copy), ClientSyncEvents (copy), default (copy), KnitClient2 (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):isOnCooldown(FLAMETHROWER_USE) then
        if Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):getRemainingCooldown(FLAMETHROWER_USE) < 0.25 then
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):registerBufferedCallback(FLAMETHROWER_USE, "buffer", function() -- Line: 53
                -- upvalues: u10 (copy)
                if u10:isEnabled() then
                    u10:useFlamethrower();
                end;
            end);
        end;

        return nil;
    end;

    local cooldown = ClientSyncEvents.ItemCooldownModifierCheck:fire(PyroUtil.FLAMETHROWER_COOLDOWN_SEC).cooldown;
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):setOnCooldown(FLAMETHROWER_USE, cooldown);

    if u10.inUse then
        return nil;
    end;

    u10.inUse = true;
    task.delay(cooldown, function() -- Line: 68
        -- upvalues: u10 (copy)
        u10.inUse = false;
    end);
    default.Client:Get("UseFlamethrower"):CallServerAsync();
    local u11 = KnitClient2.Controllers.SprintController:getMovementStatusModifier():addModifier({
        moveSpeedMultiplier = 0.2
    });
    u10.maid:GiveTask(u11);
    local v12 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_USE);

    if v12 then
        u10.maid:GiveTask(v12);
        u10.maid:GiveTask(v12.Destroying:Connect(function() -- Line: 79
            -- upvalues: u11 (copy)
            u11.Destroy();
        end));
    end;
end;

function u6.upgrade(p13) -- Line: 84
    -- upvalues: GameAnimationUtil (copy), Players (copy), AnimationType (copy)
    if p13:isEnabled() then
        local u14 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_UPGRADE);
        p13.maid:GiveTask(function() -- Line: 87
            -- upvalues: u14 (copy)
            local v15 = u14;

            if v15 ~= nil then
                v15:Stop();
            end;
        end);
    end;
end;

function u6.onEnable(u16, p17) -- Line: 95
    -- upvalues: u3 (copy), Flamework (copy), FLAMETHROWER_USE (copy), GameAnimationUtil (copy), Players (copy), AnimationType (copy), DeviceUtil (copy), u4 (copy), MobileButton (copy), BedwarsUI (copy), UIUtil (copy), KnitClient (copy), ContextActionService (copy), GamepadAction (copy)
    u16:setupYield(function() -- Line: 96
        -- upvalues: u3 (ref), Flamework (ref), FLAMETHROWER_USE (ref)
        local u18 = u3.new();
        u18:GiveTask(Flamework.resolveDependency("@easy-games/game-core:client/controllers/cooldown/cooldown-controller@CooldownController"):createCooldownBar(FLAMETHROWER_USE));

        return function() -- Line: 99
            -- upvalues: u18 (copy)
            u18:DoCleaning();
        end;
    end);
    u16:setupYield(function() -- Line: 103
        -- upvalues: GameAnimationUtil (ref), Players (ref), AnimationType (ref)
        local u19 = GameAnimationUtil:playAnimation(Players.LocalPlayer, AnimationType.FLAMETHROWER_IDLE, {
            looped = true
        });

        return function() -- Line: 107
            -- upvalues: u19 (copy)
            local v20 = u19;

            if v20 ~= nil then
                v20:Stop();
            end;
        end;
    end);
    local v24 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/keybind/action-binder-controller@ActionBinderController"):bindAction({
        action = "Attack",
        actionId = "use-flamethrower",

        boundFunction = function(p21, p22, p23) -- Line: 118, Name: boundFunction
            -- upvalues: u16 (copy)
            if p22 == Enum.UserInputState.Begin then
                u16:useFlamethrower();
            end;
        end
    });
    u16.maid:GiveTask(v24);

    if DeviceUtil.isMobileControls() then
        u16:setupYield(function() -- Line: 126
            -- upvalues: u4 (ref), MobileButton (ref), BedwarsUI (ref), u16 (copy), Players (ref)
            local u25 = u4.mount(u4.createElement("ScreenGui", {
                ResetOnSpawn = false
            }, { u4.createElement(MobileButton, {
                    Image = "rbxassetid://6862310392",
                    Position = BedwarsUI:getActionMobileButtonPosition(),

                    OnClick = function() -- Line: 133, Name: OnClick
                        -- upvalues: u16 (ref)
                        u16:useFlamethrower();
                    end
                }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

            return function() -- Line: 138
                -- upvalues: u4 (ref), u25 (copy)
                u4.unmount(u25);
            end;
        end);
    end;

    local v26 = DeviceUtil.isGamepadControls() and "[B] " or "[X] ";
    local u27 = DeviceUtil.isMobileControls() and "" or v26;
    u16:setupYield(function() -- Line: 151
        -- upvalues: u4 (ref), UIUtil (ref), KnitClient (ref), u27 (ref), Players (ref)
        local u28 = u4.mount(u4.createElement("ScreenGui", {
            ResetOnSpawn = false
        }, { u4.createElement("ImageButton", {
                Size = UDim2.fromScale(0.08, 0.1),
                Position = UIUtil:getActionBarPosition(),
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,

                [u4.Event.MouseButton1Down] = function() -- Line: 162
                    -- upvalues: KnitClient (ref)
                    KnitClient.Controllers.PyroController:openUpgradeMenu();
                end
            }, { u4.createElement("UIAspectRatioConstraint", {
                    AspectRatio = 4.675675675675675
                }), u4.createElement("TextLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Font = "Roboto",
                    RichText = true,
                    TextScaled = true,
                    Size = UDim2.fromScale(0.8, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Text = "<b>" .. u27 .. "Upgrade Flamethrower</b>",
                    TextColor3 = Color3.fromRGB(255, 255, 255)
                }) }) }), Players.LocalPlayer:WaitForChild("PlayerGui"));

        return function() -- Line: 183
            -- upvalues: u4 (ref), u28 (copy)
            u4.unmount(u28);
        end;
    end);
    ContextActionService:BindAction("open-upgrades", function(p29, p30, p31) -- Line: 187
        -- upvalues: KnitClient (ref)
        if p30 == Enum.UserInputState.Begin then
            KnitClient.Controllers.PyroController:openUpgradeMenu();
        end;
    end, false, Enum.KeyCode.X, GamepadAction.Interact);
    u16.maid:GiveTask(function() -- Line: 192
        -- upvalues: ContextActionService (ref)
        ContextActionService:UnbindAction("open-upgrades");
    end);
end;

function u6.onDisable(p32) -- Line: 196
    p32.maid:DoCleaning();
end;

function u6.isRelevantItem(p33, p34) -- Line: 199
    -- upvalues: ItemType (copy)
    return p34.itemType == ItemType.FLAMETHROWER;
end;

KnitClient.CreateController(u6.new());

return nil;