-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local WatchCollectionTag = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").WatchCollectionTag;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local CollectionService = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services").CollectionService;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local HVFaction = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "lucky-block", "hero-villain-types").HVFaction;
local u1 = {
    [HVFaction.HERO] = "rbxassetid://16113637804",
    [HVFaction.VILLAIN] = "rbxassetid://16113637996"
};
local u2 = setmetatable({}, {
    __tostring = function() -- Line: 16, Name: __tostring
        return "MagicalHeroLbTextureController";
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
    p4.Name = "MagicalHeroLbTextureController";
end;

function u2.KnitStart(u5) -- Line: 30
    -- upvalues: KnitController (copy), WatchCollectionTag (copy), KnitClient (copy), HVFaction (copy)
    KnitController.KnitStart(u5);
    WatchCollectionTag("MagicalHeroLuckyBlock", function(u6) -- Line: 32
        -- upvalues: u5 (copy), KnitClient (ref), HVFaction (ref)
        if not u6:IsA("Part") then
            return nil;
        end;

        task.delay(0.001, function() -- Line: 36
            -- upvalues: u5 (ref), u6 (copy), KnitClient (ref), HVFaction (ref)
            u5:updateLuckyBlockTexture(u6, KnitClient.Controllers.HeroVillainAssignmentController:getLocalHeroVillainAssignment() or HVFaction.HERO);
        end);
    end);
end;

function u2.updateAllLuckyBlockTextures(u7, u8) -- Line: 41
    -- upvalues: CollectionService (copy)
    local function _(p9) -- Line: 43
        -- upvalues: u7 (copy), u8 (copy)
        if not p9:IsA("Part") then
            return nil;
        end;

        u7:updateLuckyBlockTexture(p9, u8);
    end;

    for i, v in CollectionService:GetTagged("MagicalHeroLuckyBlock") do
        local _ = i - 1;

        if v:IsA("Part") then
            u7:updateLuckyBlockTexture(v, u8);
        end;
    end;
end;

function u2.updateLuckyBlockTexture(p10, p11, u12) -- Line: 53
    -- upvalues: u1 (copy), HVFaction (copy)
    local v13 = p11:GetDescendants();

    local function v15(p14) -- Line: 55
        -- upvalues: u1 (ref), u12 (copy), HVFaction (ref)
        if not p14:IsA("Texture") then
            if p14:IsA("ParticleEmitter") and u12 == HVFaction.VILLAIN then
                p14.Color = ColorSequence.new(Color3.fromRGB(222, 217, 224), Color3.fromRGB(97, 18, 112));
            end;

            return;
        end;

        p14.Texture = u1[u12];
        p14.Color3 = Color3.fromRGB(255, 255, 255);
    end;

    for i, v in v13 do
        v15(v, i - 1, v13);
    end;
end;

KnitClient.CreateController(u2.new());

return nil;