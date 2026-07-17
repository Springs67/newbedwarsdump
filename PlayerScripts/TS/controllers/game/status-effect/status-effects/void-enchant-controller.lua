-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local SoundManager = v1.SoundManager;
local WatchCharacter = v1.WatchCharacter;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "maid", "Maid");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local CollectionService = v3.CollectionService;
local HttpService = v3.HttpService;
local Players = v3.Players;
local ReplicatedStorage = v3.ReplicatedStorage;
local RunService = v3.RunService;
local Workspace = v3.Workspace;
local VignetteType = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "global", "effect", "vignette", "vignette-meta").VignetteType;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 24, Name: __tostring
        return "VoidEnchantController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 30
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6) -- Line: 34
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6);
    p6.Name = "VoidEnchantController";
end;

function u4.KnitStart(u7) -- Line: 38
    -- upvalues: KnitController (copy), WatchCharacter (copy), Players (copy), KnitClient (copy), VignetteType (copy), CollectionService (copy)
    KnitController.KnitStart(u7);
    WatchCharacter(function(u8, u9, p10) -- Line: 40
        -- upvalues: Players (ref), KnitClient (ref), VignetteType (ref), u7 (copy), CollectionService (ref)
        u9:GetAttributeChangedSignal("VoidEnchantStacks"):Connect(function() -- Line: 41
            -- upvalues: u9 (copy), u8 (copy), Players (ref), KnitClient (ref), VignetteType (ref), u7 (ref)
            local v11 = u9:GetAttribute("VoidEnchantStacks");
            local v12 = v11 == nil and 0 or v11;

            if u8 == Players.LocalPlayer then
                local v13;

                if v12 == 0 or (v12 ~= v12 or not v12) then
                    v13 = v12;
                else
                    v13 = v12 > 0;
                end;

                if v13 == 0 or (v13 ~= v13 or not v13) then
                    KnitClient.Controllers.VignetteController:destroyVignette(VignetteType.EXECUTE);
                else
                    KnitClient.Controllers.VignetteController:createVignette(VignetteType.EXECUTE);
                end;
            end;

            u7:updateStacks(u8, u9, v12);
        end);
        local v14 = u9:GetAttribute("VoidEnchantStacks");

        if v14 ~= nil then
            u7:updateStacks(u8, u9, v14);
        end;

        p10:GiveTask(function() -- Line: 64
            -- upvalues: CollectionService (ref), u8 (copy)
            local function _(p15) -- Line: 66
                p15:Destroy();
            end;

            for i, v in CollectionService:GetTagged(u8.Name .. ":void_enchant_orb") do
                local _ = i - 1;
                v:Destroy();
            end;
        end);
    end);
end;

function u4.updateStacks(p16, p17, u18, p19) -- Line: 75
    -- upvalues: CollectionService (copy), u2 (copy), ReplicatedStorage (copy), Workspace (copy), HttpService (copy), RunService (copy), default (copy), SoundManager (copy), GameSound (copy), Players (copy), KnitClient (copy), EffectUtil (copy)
    local v20 = CollectionService:GetTagged(u18.Name .. ":void_enchant_orb");
    local u21;

    if #v20 > 0 then
        u21 = v20[1];
    else
        u21 = nil;
    end;

    if p19 == 0 and u21 then
        u21:Destroy();

        return nil;
    end;

    if u21 == nil then
        local u22 = u2.new();
        u21 = ReplicatedStorage.Assets.Effects.VoidEnchantOrb:Clone();
        u21.Parent = Workspace;
        CollectionService:AddTag(u21, u18.Name .. ":void_enchant_orb");
        u21:SetAttribute("CurrentSize", 1);
        local v23 = HttpService:GenerateGUID(false);
        local u24 = 0;
        RunService:BindToRenderStep(v23, Enum.RenderPriority.Last.Value, function(p25) -- Line: 96
            -- upvalues: u24 (ref), u18 (copy), u21 (ref)
            u24 = u24 + p25;
            local Head = u18:FindFirstChild("Head");

            if not Head then
                return nil;
            end;

            local v26 = u21;

            if v26 ~= nil then
                v26 = v26.PrimaryPart;
            end;

            if not v26 then
                return nil;
            end;

            local v27 = Head.Position + Vector3.new(0, 5, 0);
            local v28 = CFrame.Angles(6.283185307179586 * (u24 % 2), 6.283185307179586 * (u24 % 3), 6.283185307179586 * (u24 % 1.5));
            u21:PivotTo(CFrame.new(v27) * v28);
        end);
        u22:GiveTask(default.Client:Get("EntityDeathEvent"):Connect(function(p29) -- Line: 118
            -- upvalues: u18 (copy), u21 (ref), SoundManager (ref), GameSound (ref), Players (ref), KnitClient (ref), ReplicatedStorage (ref)
            if p29.entityInstance == u18 and u21 then
                local PrimaryPart = u21.PrimaryPart;

                if PrimaryPart ~= nil then
                    PrimaryPart = PrimaryPart.Position;
                end;

                u21:Destroy();

                if PrimaryPart then
                    local ENCHANT_VOID_EXPLODE = GameSound.ENCHANT_VOID_EXPLODE;
                    local v30 = {};
                    local v31;

                    if u18 == Players.LocalPlayer.Character then
                        v31 = nil;
                    else
                        v31 = PrimaryPart;
                    end;

                    v30.position = v31;
                    SoundManager:playSound(ENCHANT_VOID_EXPLODE, v30);
                    KnitClient.Controllers.FancyExplosionController:createExplosion({
                        radius = 3,
                        randomSizeOffset = 0,
                        randomPositionOffset = 0,
                        inDuration = 0.1,
                        outDuration = 0.3,
                        position = PrimaryPart,
                        model = ReplicatedStorage.Assets.Effects.EnchantVoidOrbExplosion
                    });
                end;
            end;
        end));
        u21.AncestryChanged:Connect(function(p32, p33) -- Line: 142
            -- upvalues: u22 (copy)
            if p33 == nil then
                u22:DoCleaning();
            end;
        end);
    end;

    EffectUtil:playEffects({ u21.Ball.StackBurst }, u18);

    if u21.PrimaryPart then
        local ENCHANT_VOID_HIT = GameSound.ENCHANT_VOID_HIT;
        local v34 = {};
        local v35;

        if u18 == Players.LocalPlayer.Character then
            v35 = nil;
        else
            v35 = u21.PrimaryPart.Position;
        end;

        v34.position = v35;
        SoundManager:playSound(ENCHANT_VOID_HIT, v34);
    end;
end;

KnitClient.CreateController(u4.new());

return nil;