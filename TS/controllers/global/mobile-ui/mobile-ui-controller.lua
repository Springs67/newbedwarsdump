-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local DeviceUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").DeviceUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local Players = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").Players;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "signal");
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local MobileUI = RuntimeLib.import(script, script.Parent, "ui", "mobile-ui").MobileUI;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 15, Name: __tostring
        return "MobileUiController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 21
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 25
    -- upvalues: KnitController (copy), u1 (copy), u3 (copy)
    KnitController.constructor(p6);
    p6.Name = "MobileUiController";
    p6.uiMaid = u1.new();
    p6.uiHiddenIds = {};
    p6.isMoveMountEnabledSignal = u3.new();
end;

function u4.KnitStart(u7) -- Line: 32
    -- upvalues: KnitController (copy), DeviceUtil (copy), Players (copy)
    KnitController.KnitStart(u7);

    if not DeviceUtil.isMobileControls() then
        return nil;
    end;

    u7:mountMobileUI();
    task.spawn(function() -- Line: 38
        -- upvalues: u7 (copy), Players (ref)
        u7.touchGui = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("TouchGui");
    end);
end;

function u4.hideUi(p8, p9) -- Line: 42
    table.insert(p8.uiHiddenIds, p9);
    p8:unmountMobileUI();
    p8:disableTouchGui();
end;

function u4.unhideUi(p10, p11) -- Line: 49
    local v12 = (table.find(p10.uiHiddenIds, p11) or 0) - 1;

    if v12 ~= -1 then
        table.remove(p10.uiHiddenIds, v12 + 1);
    end;

    if #p10.uiHiddenIds == 0 then
        p10:mountMobileUI();
        p10:enableTouchGui();
    end;
end;

function u4.toggleMountMovementControls(p13, p14) -- Line: 61
    p13.isMoveMountEnabledSignal:Fire(p14);
end;

function u4.mountMobileUI(p15) -- Line: 64
    -- upvalues: u2 (copy), MobileUI (copy), Players (copy)
    local u16 = u2.mount(u2.createElement(MobileUI, {
        isMoveMountEnabledSignal = p15.isMoveMountEnabledSignal
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    p15.uiMaid:GiveTask(function() -- Line: 68
        -- upvalues: u2 (ref), u16 (copy)
        return u2.unmount(u16);
    end);
end;

function u4.unmountMobileUI(p17) -- Line: 72
    p17.uiMaid:DoCleaning();
end;

function u4.disableTouchGui(p18) -- Line: 75
    if p18.touchGui then
        p18.touchGui.Enabled = false;
    end;
end;

function u4.enableTouchGui(p19) -- Line: 80
    if p19.touchGui then
        p19.touchGui.Enabled = true;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;