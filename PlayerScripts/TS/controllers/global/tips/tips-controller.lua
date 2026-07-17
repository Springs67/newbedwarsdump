-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "sound", "sound-manager").SoundManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v3.Players;
local RunService = v3.RunService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local ClientStore = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "ui", "store").ClientStore;
local Setting = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "settings", "settings-types").Setting;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local TipsUi = RuntimeLib.import(script, script.Parent, "ui", "tips-ui").TipsUi;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 20, Name: __tostring
        return "TipsController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 26
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 30
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "TipsController";
end;

function u4.KnitStart(u7) -- Line: 34
    -- upvalues: KnitController (copy), ClientStore (copy), Setting (copy)
    KnitController.KnitStart(u7);
    ClientStore.changed:connect(function(p8, p9) -- Line: 36
        -- upvalues: Setting (ref), ClientStore (ref), u7 (copy)
        if p8.Settings[Setting.SHOW_TIPS] ~= p9.Settings[Setting.SHOW_TIPS] and not ClientStore:getState().Settings[Setting.SHOW_TIPS] then
            u7:dismissTip();
        end;
    end);
end;

function u4.showTip(u10, u11, u12) -- Line: 44
    -- upvalues: ClientStore (copy), Setting (copy), RunService (copy)
    if not ClientStore:getState().Settings[Setting.SHOW_TIPS] then
        return false;
    end;

    if not u10.currentTipTree then
        u10:mountTip(u11, u12);

        return true;
    end;

    local u13 = nil;
    u13 = RunService.Heartbeat:Connect(function() -- Line: 54
        -- upvalues: u10 (copy), u11 (copy), u12 (copy), u13 (ref)
        if not u10.currentTipTree then
            u10:mountTip(u11, u12);
            u13:Disconnect();
        end;
    end);

    return true;
end;

function u4.mountTip(u14, p15, p16) -- Line: 63
    -- upvalues: ClientStore (copy), Setting (copy), u1 (copy), SoundManager (copy), GameSound (copy), u2 (copy), TipsUi (copy), Players (copy)
    if not ClientStore:getState().Settings[Setting.SHOW_TIPS] then
        return nil;
    end;

    local v17;

    if p16 == nil then
        v17 = p16;
    else
        v17 = p16.duration;
    end;

    local v18 = v17 == nil and 10 or v17;
    u14.tipMaid = u1.new();
    local v19;

    if p16 == nil then
        v19 = p16;
    else
        v19 = p16.onMount;
    end;

    if v19 then
        p16.onMount();
    end;

    SoundManager:playSound(GameSound.UI_OPEN);
    u14.currentTipTree = u2.mount(u2.createElement(TipsUi, {
        Text = p15,
        Lifetime = v18
    }), Players.LocalPlayer:WaitForChild("PlayerGui"));
    u14.tipMaid:GiveTask(task.delay(v18, function() -- Line: 89
        -- upvalues: u14 (copy)
        u14:dismissTip();
    end));
    local v20;

    if p16 == nil then
        v20 = p16;
    else
        v20 = p16.onDismount;
    end;

    if v20 then
        u14.tipMaid:GiveTask(p16.onDismount);
    end;
end;

function u4.dismissTip(p21) -- Line: 100
    -- upvalues: u2 (copy)
    if p21.currentTipTree then
        u2.unmount(p21.currentTipTree);
        p21.currentTipTree = nil;
        local tipMaid = p21.tipMaid;

        if tipMaid ~= nil then
            tipMaid:DoCleaning();
        end;
    end;
end;

KnitClient.CreateController(u4.new());

return nil;