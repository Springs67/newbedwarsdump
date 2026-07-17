-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Players = v2.Players;
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local SpiritSummonerBalance = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-constants").SpiritSummonerBalance;
local SpiritSummonerUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "spirit-summoner-util").SpiritSummonerUtil;
local SummonedSpiritType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "games", "bedwars", "kit", "kits", "spirit-summoner", "summoned-spirit-type").SummonedSpiritType;
local u3 = setmetatable({}, {
    __tostring = function() -- Line: 17, Name: __tostring
        return "SpiritSummonerIndicatorController";
    end,

    __index = KnitController
});
u3.__index = u3;

function u3.new(...) -- Line: 23
    -- upvalues: u3 (ref)
    local v4 = setmetatable({}, u3);

    return v4:constructor(...) or v4;
end;

function u3.constructor(p5) -- Line: 27
    -- upvalues: KnitController (copy)
    KnitController.constructor(p5);
    p5.Name = "SpiritSummonerIndicatorController";
end;

function u3.KnitStart(p6) -- Line: 31
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p6);
end;

function u3.showHitIndicator(u7, p8, p9) -- Line: 34
    -- upvalues: u1 (copy), SpiritSummonerBalance (copy), ReplicatedStorage (copy), Workspace (copy), Players (copy), SummonedSpiritType (copy), SpiritSummonerUtil (copy)
    if u7.highlight == nil then
        u7.highlight = u1("Highlight", {
            FillTransparency = 1,
            OutlineTransparency = 0.2,
            Parent = nil,
            FillColor = Color3.fromRGB(255, 237, 0),
            OutlineColor = Color3.fromRGB(255, 255, 255)
        });
        p9:GiveTask(function() -- Line: 44
            -- upvalues: u7 (copy)
            local highlight = u7.highlight;

            if highlight ~= nil then
                highlight:Destroy();
            end;

            u7.highlight = nil;
        end);
    end;

    local u10 = SpiritSummonerBalance.DEPLOY_RADIUS * 1.8;

    if u7.hitIndicator == nil then
        u7.hitIndicator = ReplicatedStorage.Assets.Misc.SpiritSummonerIndicator:Clone();
        u7.hitIndicator.Parent = Workspace;
        local v11 = u7.hitIndicator:GetChildren();

        local function v13(p12) -- Line: 58
            -- upvalues: u10 (copy)
            if p12.Name == "PrimaryLayer" and p12:IsA("UnionOperation") then
                p12.Size = Vector3.new(1, u10 * 0.87, u10 * 0.87);
                p12.Transparency = 0.5;
            end;

            if p12.Name == "SecondaryLayer" and p12:IsA("Part") then
                p12.Size = Vector3.new(1, u10 * 0.9, u10 * 0.9);
            end;

            if p12.Name == "TertiaryLayer" and p12:IsA("UnionOperation") then
                p12.Size = Vector3.new(1, u10, u10);
            end;
        end;

        for i, v in v11 do
            v13(v, i - 1, v11);
        end;

        p9:GiveTask(function() -- Line: 73
            -- upvalues: u7 (copy)
            local hitIndicator = u7.hitIndicator;

            if hitIndicator ~= nil then
                hitIndicator:Destroy();
            end;

            u7.hitIndicator = nil;
        end);
    end;

    local v14 = CFrame.new(p8) * CFrame.Angles(0, 0, -1.5707963267948966);
    u7.hitIndicator:PivotTo(v14);

    if Players.LocalPlayer:GetAttribute("SpiritSummonerAffinity") == SummonedSpiritType.ATTACK then
        local v15 = SpiritSummonerUtil.getClosestEntity(p8, Players.LocalPlayer, "attack");

        if v15 then
            u7.highlight.OutlineTransparency = 0.2;
            u7.highlight.Parent = v15;

            return nil;
        end;

        local v16 = SpiritSummonerUtil.getClosestEntity(p8, Players.LocalPlayer, "heal");

        if v16 then
            u7.highlight.OutlineTransparency = 0.2;
            u7.highlight.Parent = v16;

            return nil;
        end;
    end;

    if Players.LocalPlayer:GetAttribute("SpiritSummonerAffinity") == SummonedSpiritType.HEAL then
        local v17 = SpiritSummonerUtil.getClosestEntity(p8, Players.LocalPlayer, "heal");

        if v17 then
            u7.highlight.OutlineTransparency = 0.2;
            u7.highlight.Parent = v17;

            return nil;
        end;

        local v18 = SpiritSummonerUtil.getClosestEntity(p8, Players.LocalPlayer, "attack");

        if v18 then
            u7.highlight.OutlineTransparency = 0.2;
            u7.highlight.Parent = v18;

            return nil;
        end;
    end;

    if SpiritSummonerUtil.getClosestItemDrop(p8) then
        local v19 = SpiritSummonerUtil.getClosestItemDrop(p8);
        local v20;

        if v19 == nil then
            v20 = v19;
        else
            v20 = v19.Handle;
        end;

        if v20 then
            u7.highlight.OutlineTransparency = 0.2;
            u7.highlight.Parent = v19.Handle;

            return nil;
        end;
    end;

    u7.highlight.OutlineTransparency = 1;

    return nil;
end;

KnitClient.CreateController(u3.new());

return nil;