-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local u1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "lightning-beams", "src");
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local ReplicatedStorage = v2.ReplicatedStorage;
local Workspace = v2.Workspace;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local GameWorldUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "game-world-util").GameWorldUtil;
local u3 = {
    default = Color3.fromRGB(62, 214, 255)
};
local u4 = setmetatable({}, {
    __tostring = function() -- Line: 18, Name: __tostring
        return "LightningController";
    end,

    __index = KnitController
});
u4.__index = u4;

function u4.new(...) -- Line: 24
    -- upvalues: u4 (ref)
    local v5 = setmetatable({}, u4);

    return v5:constructor(...) or v5;
end;

function u4.constructor(p6, ...) -- Line: 28
    -- upvalues: KnitController (copy)
    KnitController.constructor(p6, ...);
    p6.Name = "LightningController";
    p6.random = Random.new();
end;

function u4.updateColor(p7, p8, p9) -- Line: 33
    -- upvalues: u3 (copy)
    local v10 = u3[p9];

    if v10 then
        for _, descendant in p8:GetDescendants() do
            local v11 = descendant:IsA("ParticleEmitter") and descendant:GetAttribute("ColorType");

            if v11 ~= 0 and (v11 == v11 and (v11 ~= "" and v11)) then
                descendant.Color = ColorSequence.new(v10);
            end;
        end;
    end;
end;

function u4.playDefaultExplosion(p12, p13) -- Line: 45
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), GameWorldUtil (copy), u1 (copy)
    local Value = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
    local colorType = p13.colorType;
    local position = p13.position;
    local sparkCount = p13.sparkCount;
    local u14 = ReplicatedStorage.Assets.Effects.DefaultLightningImpact:Clone();

    if colorType ~= "" and colorType then
        p12:updateColor(u14, colorType);
    end;

    local Attachment = u14:FindFirstChild("Attachment");
    u14.Position = position;
    u14.Parent = Workspace;
    EffectUtil:playEffects({ u14 }, nil);

    if Attachment ~= nil and (Attachment:IsA("Attachment") and (Enum.SavedQualitySetting.QualityLevel2.Value <= Value and (sparkCount == 0 or (sparkCount ~= sparkCount or (not sparkCount or sparkCount > 0))))) then
        if sparkCount == 0 or (sparkCount ~= sparkCount or not sparkCount) then
            sparkCount = p12.random:NextNumber(5, 7);
        end;

        local v15 = false;
        local v16 = 0;

        while true do
            if true then
                if v15 then
                    v16 = v16 + 1;
                else
                    v15 = true;
                end;
            end;

            if v16 >= sparkCount then
                break;
            end;

            local v17 = Attachment.WorldPosition + GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 1.5707963267948966) * 20;
            local v18 = u1.new(Attachment, {
                WorldPosition = v17,
                WorldAxis = (Attachment.WorldPosition - v17).Unit
            }, 7);
            v18.Thickness = 1;
            v18.MinThicknessMultiplier = 1;
            v18.MaxThicknessMultiplier = 1;
            v18.AnimationSpeed = 1;
            v18.FadeLength = 0.1;
            v18.PulseSpeed = p12.random:NextNumber(6, 9);
            v18.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255));
            v18.PulseLength = 0.6;
        end;
    end;

    task.delay(3, function() -- Line: 94
        -- upvalues: u14 (copy)
        u14:Destroy();
    end);
end;

function u4.playSpearExplosion(p19, p20) -- Line: 98
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), EffectUtil (copy), GameWorldUtil (copy), u1 (copy)
    local Value = UserSettings():GetService("UserGameSettings").SavedQualityLevel.Value;
    local colorType = p20.colorType;
    local position = p20.position;
    local sparkCount = p20.sparkCount;
    local u21 = ReplicatedStorage.Assets.Effects.SpearLightningImpact:Clone();

    if colorType ~= "" and colorType then
        p19:updateColor(u21, colorType);
    end;

    local Attachment = u21:FindFirstChild("Attachment");
    u21.Position = position;
    u21.Parent = Workspace;
    EffectUtil:playEffects({ u21 }, nil);

    if Attachment ~= nil and (Attachment:IsA("Attachment") and (Enum.SavedQualitySetting.QualityLevel2.Value <= Value and (sparkCount == 0 or (sparkCount ~= sparkCount or (not sparkCount or sparkCount > 0))))) then
        if sparkCount == 0 or (sparkCount ~= sparkCount or not sparkCount) then
            sparkCount = p19.random:NextNumber(5, 7);
        end;

        local v22 = false;
        local v23 = 0;

        while true do
            if true then
                if v22 then
                    v23 = v23 + 1;
                else
                    v22 = true;
                end;
            end;

            if v23 >= sparkCount then
                break;
            end;

            local v24 = Attachment.WorldPosition + GameWorldUtil.randomUnitVector(Vector3.new(0, 1, 0), 2.0943951023931953) * p19.random:NextNumber(3, 7);
            local v25 = u1.new(Attachment, {
                WorldPosition = v24,
                WorldAxis = (Attachment.WorldPosition - v24).Unit
            }, 7);
            v25.Thickness = 0.25;
            v25.MinThicknessMultiplier = 1;
            v25.MaxThicknessMultiplier = 1;
            v25.AnimationSpeed = 3;
            v25.FadeLength = 0.1;
            v25.PulseSpeed = p19.random:NextNumber(5, 7);
            v25.Color = ColorSequence.new(Color3.fromRGB(179, 232, 255), Color3.fromRGB(62, 214, 255));
            v25.PulseLength = 0.45;
        end;
    end;

    task.delay(3, function() -- Line: 148
        -- upvalues: u21 (copy)
        u21:Destroy();
    end);
end;

function u4.KnitStart(p26) -- Line: 152
    -- upvalues: KnitController (copy)
    KnitController.KnitStart(p26);
end;

function u4.createLightningStike(p27, p28) -- Line: 155
    p27:createExplosion(p28.explosionData);
end;

function u4.createExplosion(p29, p30) -- Line: 159
    if p30.explosionType == "spearExplosion" then
        p29:playSpearExplosion(p30);

        return;
    end;

    p29:playDefaultExplosion(p30);
end;

KnitClient.CreateController(u4.new());

return nil;