-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local DeviceUtil = v1.DeviceUtil;
local GameCoreClientSyncEvents = v1.GameCoreClientSyncEvents;
local getDefaultMobileLayoutDefinition = v1.getDefaultMobileLayoutDefinition;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src");
local KnitClient = v2.KnitClient;
local Signal = v2.Signal;
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local ClientSyncEvents = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "client-sync-events").ClientSyncEvents;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local u3 = {
    [Setting.MOBILE_AUTO_BRIDGE_BUTTON] = "AutoBridge",
    [Setting.MOBILE_BLOCK_BREAK_BUTTON] = "BlockBreak",
    [Setting.MOBILE_INTERACT_BUTTON] = "Interact",
    [Setting.MOBILE_PROJECTILE_BUTTON] = "FireProjectile"
};
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 26, Name: __tostring
        return "MobileLayoutLoadController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 32
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 36
    -- upvalues: KnitController (copy), Signal (copy)
    KnitController.constructor(p6);
    p6.Name = "MobileLayoutLoadController";
    p6.hasLoadedMobileLayout = false;
    p6.hasLoadedMobileLayoutSignal = Signal.new();
end;

function u4.KnitStart(u7) -- Line: 42
    -- upvalues: KnitController (copy), DeviceUtil (copy), default (copy), Flamework (copy), ClientSyncEvents (copy), u3 (copy), getDefaultMobileLayoutDefinition (copy), GameCoreClientSyncEvents (copy)
    KnitController.KnitStart(u7);

    if not DeviceUtil.isMobileControls() then
        return nil;
    end;

    default.Client:Get("RetrieveCustomMobileLayout"):CallServerAsync():andThen(function(p8) -- Line: 47
        -- upvalues: u7 (copy), Flamework (ref)
        local v9;

        if p8 == nil then
            v9 = p8;
        else
            v9 = p8.mobileLayoutDefinition;
        end;

        if not v9 then
            u7.hasLoadedMobileLayout = true;
            u7.hasLoadedMobileLayoutSignal:Fire(true);
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):setIsLegacyMode(false);

            return nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):setIsLegacyMode(false);
        Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(p8.mobileLayoutDefinition);
        u7.hasLoadedMobileLayout = true;
        u7.hasLoadedMobileLayoutSignal:Fire(true);
    end);
    ClientSyncEvents.SettingChanged:connect(function(p10) -- Line: 63
        -- upvalues: u3 (ref), Flamework (ref), getDefaultMobileLayoutDefinition (ref), default (ref)
        if u3[p10.setting] == nil then
            return nil;
        end;

        local v11 = u3[p10.setting];
        local mobileLayoutDefinition = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition;

        if p10.value == true then
            mobileLayoutDefinition[v11] = getDefaultMobileLayoutDefinition()[v11];
        else
            Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController").mobileLayoutDefinition[v11] = nil;
        end;

        Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):registerMoblileLayoutDefinition(mobileLayoutDefinition);
        default.Client:Get("UpdateCustomMobileLayout"):SendToServer({
            mobileLayoutDefinition = mobileLayoutDefinition
        });
    end);
    task.defer(function() -- Line: 87
        -- upvalues: u7 (copy)
        u7:setJumpDefaults();
        u7:loadJumpButtonLayout();
    end);
    GameCoreClientSyncEvents.MobileLayoutRegistered:connect(function(p12) -- Line: 91
        -- upvalues: u7 (copy)
        u7:loadJumpButtonLayout();
    end);
end;

function u4.onMobileLayoutLoaded(p13) -- Line: 95
    -- upvalues: RuntimeLib (copy)
    if p13.hasLoadedMobileLayout then
        return RuntimeLib.Promise.new(function(p14) -- Line: 98
            return p14(true);
        end);
    end;

    return p13.hasLoadedMobileLayoutSignal:WaitPromise();
end;

function u4.loadJumpButtonLayout(p15) -- Line: 104
    -- upvalues: Flamework (copy), Players (copy)
    local v16 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getLayoutDimensions("Jump");
    local v17 = Flamework.resolveDependency("@easy-games/game-core:client/controllers/mobile-layout/mobile-layout-controller@MobileLayoutController"):getIsLegacyMode();
    local JumpButton = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
    local v18;

    if v17 then
        v18 = p15.defaultJumpAnchorPoint;
    else
        v18 = Vector2.new(0.5, 0.5);
    end;

    JumpButton.AnchorPoint = v18;
    local v19;

    if v17 then
        v19 = p15.defaultJumpSize;
    else
        v19 = v16.size;
    end;

    JumpButton.Size = v19;
    local v20;

    if v17 then
        v20 = p15.defaultJumpPosition;
    else
        v20 = v16.position;
    end;

    JumpButton.Position = v20;
    local v21;

    if v17 then
        v21 = Enum.SizeConstraint.RelativeXY;
    else
        v21 = Enum.SizeConstraint.RelativeYY;
    end;

    JumpButton.SizeConstraint = v21;
end;

function u4.setJumpDefaults(p22) -- Line: 113
    -- upvalues: Players (copy)
    local JumpButton = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui"):WaitForChild("TouchControlFrame"):WaitForChild("JumpButton");
    p22.defaultJumpAnchorPoint = JumpButton.AnchorPoint;
    p22.defaultJumpPosition = JumpButton.Position;
    p22.defaultJumpSize = JumpButton.Size;
end;

KnitClient.CreateController(u4.new());

return nil;