-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out");
local ColorUtil = v1.ColorUtil;
local ConstantManager = v1.ConstantManager;
local GameQueryUtil = v1.GameQueryUtil;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v2.Linear;
local OutQuad = v2.OutQuad;
local u3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v4 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v4.Debris;
local Players = v4.Players;
local ReplicatedStorage = v4.ReplicatedStorage;
local TweenService = v4.TweenService;
local Workspace = v4.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local v5 = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent, "lib", "network");
local EntityDamageEventZap = v5.EntityDamageEventZap;
local EntityHealEventZap = v5.EntityHealEventZap;
local CustomDamageIndicators = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "custom-damage-indicators").CustomDamageIndicators;
local DamageType = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "damage", "damage-type").DamageType;
local BedwarsImageId = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "image", "image-id").BedwarsImageId;
local Theme = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "theme", "theme").Theme;
local EffectUtil = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "util", "effect", "effect-util").EffectUtil;
local HEALTHBAR_SHIELD_COLOR = RuntimeLib.import(script, script.Parent.Parent, "hotbar", "ui", "healthbar", "shield").HEALTHBAR_SHIELD_COLOR;
local u6 = ConstantManager.registerConstants(script, {
    velX = 5,
    velY = 9,
    velZ = 5,
    gravityDamage = 0.9,
    gravityHeal = 0.98,
    textSize = 28,
    blowUpCompleteDuration = 0.05,
    blowUpDuration = 0.125,
    blowUpSize = 76,
    anchoredDuration = 0.4,
    strokeThickness = 1.5,
    baseColor = Color3.fromRGB(255, 81, 68)
});
local u7 = setmetatable({}, {
    __tostring = function() -- Line: 49, Name: __tostring
        return "DamageIndicatorController";
    end,

    __index = KnitController
});
u7.__index = u7;

function u7.new(...) -- Line: 55
    -- upvalues: u7 (copy)
    local v8 = setmetatable({}, u7);

    return v8:constructor(...) or v8;
end;

function u7.constructor(p9) -- Line: 59
    -- upvalues: KnitController (copy)
    KnitController.constructor(p9);
    p9.Name = "DamageIndicatorController";
end;

function u7.KnitStart(u10) -- Line: 63
    -- upvalues: ReplicatedStorage (copy), Workspace (copy), GameQueryUtil (copy), EntityDamageEventZap (copy), Players (copy), CustomDamageIndicators (copy), BedwarsImageId (copy), DamageType (copy), EffectUtil (copy), EntityHealEventZap (copy)
    task.spawn(function() -- Line: 64
        -- upvalues: ReplicatedStorage (ref), u10 (copy), Workspace (ref), GameQueryUtil (ref)
        ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("HitEffect");
        u10.hitEffectPart = ReplicatedStorage.Assets.Effects.HitEffect:Clone();
        u10.hitEffectPart.Anchored = true;
        u10.hitEffectPart.Parent = Workspace;
        GameQueryUtil:setQueryIgnored(u10.hitEffectPart, true);
    end);
    EntityDamageEventZap.On(function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24) -- Line: 71
        -- upvalues: Workspace (ref), Players (ref), CustomDamageIndicators (ref), BedwarsImageId (ref), u10 (copy), DamageType (ref), EffectUtil (ref)
        if p11.PrimaryPart then
            local v25 = Workspace.CurrentCamera and (Workspace.CurrentCamera.CFrame.Position - p11:GetPrimaryPartCFrame().Position).Magnitude >= 60;

            if v25 then
                if p11 == Players.LocalPlayer.Character then
                    v25 = false;
                else
                    v25 = p15 ~= Players.LocalPlayer.Character;
                end;
            end;

            if v25 then
                return nil;
            end;

            if not p22 then
                local v26 = p11:GetPivot().Position + Vector3.new(0, 2.5, 0);
                local v27 = p15 == Players.LocalPlayer.Character;
                local v28 = (p24 == 0 or (p24 ~= p24 or not p24)) and {} or CustomDamageIndicators[p24];
                local v29;

                if p18 == nil then
                    v29 = p18;
                else
                    v29 = p18.headshot;
                end;

                if v29 then
                    v29 = p24 == nil;
                end;

                local v30 = v29 and {
                    gradientRotation = 45,
                    image = BedwarsImageId.HEADSHOT_ICON,
                    color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 199, 48)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 140, 84)) }),
                    imageColor = Color3.fromRGB(255, 199, 48)
                } or v28;
                local damage = v30.damage;

                if damage == nil then
                    damage = p12;
                end;

                local v31 = {};

                for i, v in v30 do
                    v31[i] = v;
                end;

                v31.damageType = p13;
                v31.shieldHit = p19;
                v31.infiniteRange = v27;

                if p18 ~= nil then
                    p18 = p18.swingTimeRatio;
                end;

                v31.swingTimeRatio = p18;
                u10:spawnDamageIndicator(v26, damage, v31);
            end;

            if (p13 == DamageType.SWORD or p13 == DamageType.PROJECTILE) and u10.hitEffectPart then
                u10.hitEffectPart.CFrame = p11.PrimaryPart.CFrame;
                EffectUtil:playEffects({ u10.hitEffectPart }, p11);
            end;
        end;
    end);
    EntityHealEventZap.On(function(p32, p33, p34, p35) -- Line: 139
        -- upvalues: u10 (copy)
        if p35 then
            return nil;
        end;

        if p32.PrimaryPart then
            u10:spawnDamageIndicator(p32:GetPivot().Position + Vector3.new(0, 2.5, 0), p33, {
                heal = true
            });
        end;
    end);
end;

function u7.spawnDamageIndicator(p36, p37, p38, p39) -- Line: 153
    -- upvalues: Workspace (copy), u6 (copy), u3 (copy), ColorUtil (copy), Theme (copy), HEALTHBAR_SHIELD_COLOR (copy), DamageType (copy), default (copy), Linear (copy), TweenService (copy), RuntimeLib (copy), OutQuad (copy), Debris (copy)
    local v40 = (Workspace.CurrentCamera.CFrame.Position - p37).Magnitude > 200;

    if v40 then
        local v41;

        if p39 == nil then
            v41 = p39;
        else
            v41 = p39.infiniteRange;
        end;

        v40 = not v41;
    end;

    if v40 then
        return nil;
    end;

    local v42 = math.ceil(p38);
    local v43;

    if p39 == nil then
        v43 = p39;
    else
        v43 = p39.heal;
    end;

    if v43 == nil then
        v43 = false;
    end;

    local Part = Instance.new("Part");
    Part.Name = "DamageIndicatorPart";
    Part.Size = Vector3.new(1, 1, 1);
    Part.Transparency = 1;
    Part.CanCollide = false;
    Part.CanQuery = false;
    Part.CFrame = CFrame.new(p37);
    Part.Anchored = true;
    task.delay(u6.anchoredDuration, function() -- Line: 186
        -- upvalues: Part (copy)
        Part.Anchored = false;
    end);
    local BodyForce = Instance.new("BodyForce");
    local v44;

    if v42 < 0 then
        v44 = u6.gravityHeal;
    else
        v44 = u6.gravityDamage;
    end;

    local v45 = Part:GetMass() * Workspace.Gravity * v44;
    BodyForce.Force = Vector3.new(0, v45, 0);
    BodyForce.Parent = Part;
    local v46 = math.random(-50, 50) / 100 * u6.velX;
    local v47 = math.random(-50, 50) / 100 * u6.velZ;
    Part.Velocity = Vector3.new(v46, 0, v47);
    local BillboardGui = Instance.new("BillboardGui");
    local v48 = math.min(v42, 100) / 100 * 0.7 + 2.1;
    BillboardGui.Size = UDim2.new(v48 * 2.1, 0, v48, 0);
    BillboardGui.AlwaysOnTop = true;
    local v49;

    if p39 == nil then
        v49 = p39;
    else
        v49 = p39.infiniteRange;
    end;

    BillboardGui.MaxDistance = v49 and (1 / 0) or 100;
    local v50;

    if p39 == nil then
        v50 = p39;
    else
        v50 = p39.offset;
    end;

    local v51;

    if v50 then
        v51 = p39.offset;
    else
        v51 = BillboardGui.StudsOffset;
    end;

    BillboardGui.StudsOffset = v51;
    local u52 = u3("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = BillboardGui
    });
    local u53 = nil;
    local v54;

    if p39 == nil then
        v54 = p39;
    else
        v54 = p39.image;
    end;

    if v54 ~= "" and v54 then
        local v55 = {
            BackgroundTransparency = 1
        };
        local v56;

        if p39 == nil then
            v56 = p39;
        else
            v56 = p39.image;
        end;

        v55.Image = v56;
        v55.ImageColor3 = p39.imageColor;
        v55.Position = UDim2.fromScale(0.25, 0.5);
        v55.AnchorPoint = Vector2.new(0, 0.5);
        v55.Size = UDim2.fromScale(0.25, 1);
        v55.Parent = u52;
        u53 = u3("ImageLabel", v55);
        u3("UIAspectRatioConstraint", {
            AspectRatio = 1,
            DominantAxis = Enum.DominantAxis.Width,
            Parent = u53
        });
    end;

    local TextLabel = Instance.new("TextLabel");
    local v57;

    if p39 == nil then
        v57 = p39;
    else
        v57 = p39.text;
    end;

    if v57 == nil then
        v57 = v42;
    end;

    TextLabel.Text = tostring(v57);
    TextLabel.Size = UDim2.new(0.5, 0, 1, 0);
    TextLabel.BackgroundTransparency = 1;
    TextLabel.BorderSizePixel = 0;
    TextLabel.Font = Enum.Font.GothamBlack;
    TextLabel.Position = UDim2.fromScale(0.5, 0.5);
    TextLabel.AnchorPoint = Vector2.new(0, 0.5);
    TextLabel.TextSize = 25;
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
    local v58 = nil;
    local v59;

    if p39 == nil then
        v59 = p39;
    else
        v59 = p39.color;
    end;

    if v59 then
        if typeof(p39.color) == "Color3" then
            v58 = p39.color;
        else
            v58 = ColorUtil.WHITE;
        end;
    end;

    local v60;

    if p39 == nil then
        v60 = p39;
    else
        v60 = p39.swingTimeRatioInterpolateColor;
    end;

    if v60 then
        if p39 == nil then
            v60 = p39;
        else
            v60 = p39.swingTimeRatio;
        end;
    end;

    if v60 ~= 0 and (v60 == v60 and v60) then
        local swingTimeRatioInterpolateColor = p39.swingTimeRatioInterpolateColor;
        local minColor = swingTimeRatioInterpolateColor.minColor;
        local maxColor = swingTimeRatioInterpolateColor.maxColor;
        local v61;

        if p39 == nil then
            v61 = p39;
        else
            v61 = p39.swingTimeRatio;
        end;

        v58 = Color3.fromRGB(math.floor(minColor.R * 255 * (1 - v61) + maxColor.R * 255 * v61), math.floor(minColor.G * 255 * (1 - v61) + maxColor.G * 255 * v61), (math.floor(minColor.B * 255 * (1 - v61) + maxColor.B * 255 * v61)));
    end;

    TextLabel.TextColor3 = v58 or u6.baseColor;
    local v62;

    if p39 == nil then
        v62 = p39;
    else
        v62 = p39.color;
    end;

    if v62 then
        v62 = typeof(p39.color) == "ColorSequence";
    end;

    if v62 then
        u3("UIGradient", {
            Color = p39.color,
            Rotation = p39.gradientRotation,
            Parent = TextLabel
        });
    end;

    local v63 = u3("UIStroke", {
        Parent = TextLabel,
        Thickness = u6.strokeThickness,
        Color = Color3.fromRGB(0, 0, 0)
    });
    Color3.fromRGB(255, 255, 255);

    if v43 then
        TextLabel.Text = "+" .. tostring(v42);
        TextLabel.TextColor3 = Theme.mcGreen;
    else
        local v64;

        if p39 == nil then
            v64 = p39;
        else
            v64 = p39.shieldHit;
        end;

        if v64 then
            TextLabel.TextColor3 = HEALTHBAR_SHIELD_COLOR;
        end;
    end;

    local v65;

    if p39 == nil then
        v65 = p39;
    else
        v65 = p39.damageType;
    end;

    if v65 == DamageType.POISON then
        ColorUtil.hexColor(0);
        TextLabel.TextColor3 = ColorUtil.hexColor(5025629);
    end;

    if p39 ~= nil then
        p39 = p39.damageType;
    end;

    if p39 == DamageType.INFECTED_POISON then
        ColorUtil.hexColor(0);
        TextLabel.TextColor3 = ColorUtil.hexColor(5025629);
    end;

    TextLabel.Parent = u52;
    BillboardGui.Parent = Part;
    Part.Parent = Workspace;
    task.spawn(function() -- Line: 357
        -- upvalues: TextLabel (copy), u52 (copy), u6 (ref), default (ref), Linear (ref)
        local TextSize = TextLabel.TextSize;
        local Size = u52.Size;

        local function _(p66, p67) -- Line: 360
            return UDim2.new(p66.X.Scale * p67, p66.X.Offset * p67, p66.Y.Scale * p67, p66.Y.Offset * p67);
        end;

        local u68 = u6.blowUpSize / TextSize;
        local v75 = default(u6.blowUpDuration, Linear, function(p69) -- Line: 364
            -- upvalues: TextLabel (ref), TextSize (ref), u6 (ref), Size (ref), u68 (copy), u52 (ref)
            TextLabel.TextSize = TextSize * (1 - p69) + p69 * u6.blowUpSize;
            local v70 = Size;
            local v71 = 1 - p69;
            local v72 = UDim2.new(v70.X.Scale * v71, v70.X.Offset * v71, v70.Y.Scale * v71, v70.Y.Offset * v71);
            local v73 = Size;
            local v74 = p69 * u68;
            u52.Size = v72 + UDim2.new(v73.X.Scale * v74, v73.X.Offset * v74, v73.Y.Scale * v74, v73.Y.Offset * v74);
        end, 0, 1);
        v75:Play();
        v75:Wait();
        TextSize = TextLabel.TextSize;
        Size = u52.Size;
        local u76 = u6.textSize / TextSize;
        default(u6.blowUpCompleteDuration, Linear, function(p77) -- Line: 375
            -- upvalues: TextLabel (ref), TextSize (ref), u6 (ref), Size (ref), u76 (copy), u52 (ref)
            TextLabel.TextSize = TextSize * (1 - p77) + p77 * u6.textSize;
            local v78 = Size;
            local v79 = 1 - p77;
            local v80 = UDim2.new(v78.X.Scale * v79, v78.X.Offset * v79, v78.Y.Scale * v79, v78.Y.Offset * v79);
            local v81 = Size;
            local v82 = p77 * u76;
            u52.Size = v80 + UDim2.new(v81.X.Scale * v82, v81.X.Offset * v82, v81.Y.Scale * v82, v81.Y.Offset * v82);
        end, 0, 1):Play();
    end);
    local u83 = TweenService:Create(v63, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 1
    });
    RuntimeLib.Promise.delay(u6.anchoredDuration + 0.3):andThen(function() -- Line: 388
        -- upvalues: default (ref), OutQuad (ref), TextLabel (copy), u53 (ref), u83 (copy)
        default(0.2, OutQuad, function(p84) -- Line: 389
            -- upvalues: TextLabel (ref), u53 (ref)
            TextLabel.TextTransparency = p84;

            if u53 then
                u53.ImageTransparency = p84;
            end;
        end, 0, 1);
        u83:Play();
    end);
    Debris:AddItem(Part, 1.5);
end;

return {
    DamageIndicatorController = KnitClient.CreateController(u7.new())
};