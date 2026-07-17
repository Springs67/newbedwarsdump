-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Reflect = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Reflect;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local Controller = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@flamework", "core", "out").Controller;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "roact", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local BedwarsKit = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "bedwars-kit").BedwarsKit;
local EmoteType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "locker", "emote", "emote-type").EmoteType;
local EmoteHandler = RuntimeLib.import(script, script.Parent.Parent.Parent, "emote-handler").EmoteHandler;
local RageBladeWinCount = RuntimeLib.import(script, script.Parent, "rage-blade-win-count").RageBladeWinCount;
local u3 = nil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "RageBladeEmoteController";
    end
});
u4.__index = u4;

function u4.new(...) -- Line: 23
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 27
end;

function u4.onStart(p7) -- Line: 29
    -- upvalues: KnitClient (copy), EmoteType (copy), u3 (ref)
    KnitClient.Controllers.EmoteHandlerController:registerHandler(EmoteType.RAGE_BLADE, u3);
end;

Reflect.defineMetadata(u4, "identifier", "client/controllers/global/locker/emote/handler/handlers/rage-blade/rage-blade-emote-controller@RageBladeEmoteController");
Reflect.defineMetadata(u4, "flamework:implements", { "$:flamework@OnStart" });
Reflect.decorate(u4, "$:flamework@Controller", Controller, { {} });
u3 = setmetatable({}, {
    __tostring = function() -- Line: 40, Name: __tostring
        return "RageBladeEmoteHandler";
    end,

    __index = EmoteHandler
});
u3.__index = u3;

function u3.new(...) -- Line: 46
    -- upvalues: u3 (ref)
    local v8 = setmetatable({}, u3);

    return v8:constructor(...) or v8;
end;

function u3.constructor(p9, ...) -- Line: 50
    -- upvalues: EmoteHandler (copy)
    EmoteHandler.constructor(p9, ...);
end;

function u3.onEnable(p10, p11, p12, p13, p14) -- Line: 53
    -- upvalues: EmoteType (copy), ReplicatedStorage (copy), KnitClient (copy), BedwarsKit (copy), Players (copy), u1 (copy), RageBladeWinCount (copy)
    if not p12.PrimaryPart or p13 ~= EmoteType.RAGE_BLADE then
        return nil;
    end;

    local u15 = ReplicatedStorage.Assets.Misc.RageBladeEmote:Clone();
    local v16 = (p12.Head.CFrame + Vector3.new(0, 3, 0)) * CFrame.Angles(0, 0, 1.3089969389957472);
    u15.Parent = p12;
    u15:PivotTo(v16);
    p10:setupInstance(u15);
    local v17 = KnitClient.Controllers.KitContractController:getKitStats(BedwarsKit.BARBARIAN):expect();

    if v17 ~= nil then
        v17 = v17.wins;
    end;

    local v18;

    if p10:isPreview(p11) then
        v18 = Players.LocalPlayer;
    else
        v18 = Players:GetPlayerByUserId(p11);
    end;

    local v19 = u1.createElement(RageBladeWinCount, {
        Adornee = u15,
        WinCount = v17 == nil and 0 or v17
    });

    if v18 ~= nil then
        v18 = v18:WaitForChild("PlayerGui");
    end;

    local u20 = u1.mount(v19, v18, "RageBladeWinCount");
    p14:GiveTask(function() -- Line: 87
        -- upvalues: u1 (ref), u20 (copy), u15 (copy)
        u1.unmount(u20);
        u15:Destroy();
    end);
end;

function u3.onDisable(p21, p22, p23, p24) -- Line: 92
end;

return {
    default = u4
};