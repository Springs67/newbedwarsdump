-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local BlockEngine = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "block-engine", "out").BlockEngine;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v1.ReplicatedStorage;
local Workspace = v1.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local LuckyBlockRarity = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "lucky-block-drop-enums").LuckyBlockRarity;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "LuckyBlockController";
    end,

    __index = KnitController
});
u2.__index = u2;

function u2.new(...) -- Line: 22
    -- upvalues: u2 (ref)
    local v3 = setmetatable({}, u2);

    return v3:constructor(...) or v3;
end;

function u2.constructor(p4) -- Line: 26
    -- upvalues: KnitController (copy)
    KnitController.constructor(p4);
    p4.Name = "LuckyBlockController";
end;

function u2.KnitStart(p5) -- Line: 30
    -- upvalues: KnitController (copy), default (copy), LuckyBlockRarity (copy), ReplicatedStorage (copy), BlockEngine (copy), Workspace (copy), EffectUtil (copy)
    KnitController.KnitStart(p5);
    default.Client:OnEvent("OpenLuckyBlock", function(p6) -- Line: 32
        -- upvalues: LuckyBlockRarity (ref), ReplicatedStorage (ref), BlockEngine (ref), Workspace (ref), EffectUtil (ref)
        local v7 = nil;
        local rarity = p6.rarity;

        if rarity == LuckyBlockRarity.COMMON then
            v7 = ReplicatedStorage.Assets.Effects.LuckyBlock.OpenCommon:Clone();
        elseif rarity == LuckyBlockRarity.UNCOMMON then
            v7 = ReplicatedStorage.Assets.Effects.LuckyBlock.OpenUncommon:Clone();
        elseif rarity == LuckyBlockRarity.RARE then
            v7 = ReplicatedStorage.Assets.Effects.LuckyBlock.OpenRare:Clone();
        elseif rarity == LuckyBlockRarity.EPIC then
            v7 = ReplicatedStorage.Assets.Effects.LuckyBlock.OpenEpic:Clone();
        elseif rarity == LuckyBlockRarity.LEGENDARY then
            v7 = ReplicatedStorage.Assets.Effects.LuckyBlock.OpenLegendary:Clone();
        end;

        if not v7 then
            return nil;
        end;

        v7.Transparency = 1;
        v7.Anchored = true;
        local v8 = BlockEngine:getWorldPosition(p6.blockPosition);
        v7.CFrame = CFrame.new(v8);
        v7.Parent = Workspace;
        EffectUtil:playEffects({ v7 }, nil, {
            destroyAfterSec = 5,
            disableEffectsAfterSec = 4
        });
    end);
end;

KnitClient.CreateController(u2.new());

return nil;