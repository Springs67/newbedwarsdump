-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v1.Players;
local ReplicatedStorage = v1.ReplicatedStorage;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local WeldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "weld-util").WeldUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 14, Name: __tostring
        return "DetonatedBombController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 20
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 24
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "DetonatedBombController";
    p4.bombMap = {};
end;

function u2.KnitStart(u5) -- Line: 29
    -- upvalues: KnitController (copy), default (copy)
    KnitController.KnitStart(u5);
    default.Client:Get("BombStickEvent"):Connect(function(p6) -- Line: 31
        -- upvalues: u5 (copy)
        if not p6.hitPart then
            return nil;
        end;

        u5:attachBomb(p6.hitPart, p6.cFrame, p6.hitEntity, p6.bombOwner);
    end);
    default.Client:Get("BombExplosion"):Connect(function(p7) -- Line: 37
        -- upvalues: u5 (copy)
        u5:bombExplosion(p7.player);
    end);
end;

function u2.registerBomb(p8, p9, p10) -- Line: 41
    local v11 = p8.bombMap[p9];

    if not v11 then
        p8.bombMap[p9] = { p10 };

        return;
    end;

    local bombMap = p8.bombMap;
    local v12 = {};
    local v13 = #v12;
    local v14 = #v11;
    table.move(v11, 1, v14, v13 + 1, v12);
    v12[v13 + v14 + 1] = p10;
    bombMap[p9] = v12;
end;

function u2.bombExplosion(p15, p16) -- Line: 62
    local v17 = p15.bombMap[p16];

    if not v17 then
        return nil;
    end;

    for _, v in v17 do
        v:Destroy();
    end;

    p15.bombMap[p16] = {};
end;

function u2.attachBomb(p18, p19, p20, p21, p22) -- Line: 78
    -- upvalues: ReplicatedStorage (copy), Players (copy), WeldUtil (copy)
    local v23 = ReplicatedStorage.Assets.Effects.DetonatedBomb:Clone();

    if not v23.PrimaryPart then
        return nil;
    end;

    local Indicator = v23.PrimaryPart:WaitForChild("Indicator", 3);

    if Indicator and p22 == Players.LocalPlayer then
        Indicator.Color = Color3.fromRGB(26, 255, 5);
    elseif Indicator and p22.Team == Players.LocalPlayer.Team then
        Indicator.Color = Color3.fromRGB(217, 252, 23);
    end;

    v23.Parent = p19;
    local v24;

    if p21 then
        v24 = p20:Lerp(CFrame.new(p19.Position), 0.5);
    else
        v24 = p20 * CFrame.Angles(0, 1.5707963267948966, 0);
    end;

    v23:PivotTo(v24);
    WeldUtil:weldParts(p19, v23.PrimaryPart);
    p18:registerBomb(p22, v23);
end;

KnitClient.CreateController(u2.new());

return nil;