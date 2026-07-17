-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Flamework = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Flamework;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local BattlePassUtils = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "battle-pass", "battle-pass-utils").BattlePassUtils;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local AfkPlaceHud = RuntimeLib.import(script, script.Parent, "ui", "afk-place-hud").AfkPlaceHud;
local u1 = setmetatable({}, {
    __tostring = function() -- Line: 13, Name: __tostring
        return "AfkPlaceUiController";
    end,

    __index = KnitController
});
u1.__index = u1;

function u1.new(...) -- Line: 19
    -- upvalues: u1 (ref)
    local v2 = setmetatable({}, u1);

    return v2:constructor(...) or v2;
end;

function u1.constructor(p3) -- Line: 23
    -- upvalues: KnitController (copy), default (copy)
    KnitController.constructor(p3);
    p3.Name = "AfkPlaceUiController";
    p3.remotes = default.Client:GetNamespace("AfkPlace");
    p3.battlePassRemotes = default.Client:GetNamespace("BattlePass");
end;

function u1.KnitStart(u4) -- Line: 29
    -- upvalues: KnitController (copy), BattlePassUtils (copy)
    KnitController.KnitStart(u4);
    u4.remotes:WaitFor("GetAfkTimes"):andThen(function(p5) -- Line: 32
        -- upvalues: BattlePassUtils (ref), u4 (copy)
        local u6 = p5:CallServer();

        if BattlePassUtils.isActiveBattlePass() then
            u4.battlePassRemotes:WaitFor("GetBattlePass"):andThen(function(p7) -- Line: 36
                -- upvalues: u4 (ref), u6 (copy)
                local v8 = p7:CallServer();
                u4:mountAfkHud(u6[1], u6[2], u6[3], v8);
            end);

            return;
        end;

        u4:mountAfkHud(u6[1], u6[2], u6[3]);
    end);
end;

function u1.mountAfkHud(p9, p10, p11, p12, p13) -- Line: 47
    -- upvalues: Flamework (copy), AfkPlaceHud (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):openApp({
        appId = "AfkPlaceBackground",
        app = AfkPlaceHud
    }, {
        DailyAfkTime = p10,
        MountStartTime = os.time(),
        AfkCoinStart = p11,
        BedCoinStart = p12,
        BattlePassDto = p13
    });
end;

function u1.unmountAfkHud(p14) -- Line: 59
    -- upvalues: Flamework (copy)
    Flamework.resolveDependency("@easy-games/game-core:client/controllers/app-controller@AppController"):closeApp("AfkPlaceBackground");
end;

KnitClient.CreateController(u1.new());

return nil;