-- Decompiled with Potassium's decompiler.

local RuntimeLib = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local SoundManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out").SoundManager;
local ConstantManager = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "game-core", "out", "shared", "constant", "constant-manager").ConstantManager;
local KnitClient = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@easy-games", "knit", "src").KnitClient;
local v1 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "easing-functions");
local Linear = v1.Linear;
local OutQuad = v1.OutQuad;
local u2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "make");
local v3 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "services");
local Debris = v3.Debris;
local TweenService = v3.TweenService;
local Workspace = v3.Workspace;
local default = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "rbxts_include", "node_modules", "@rbxts", "tween").default;
local KnitController = RuntimeLib.import(script, script.Parent.Parent.Parent.Parent.Parent, "lib", "knit", "knit-controller").KnitController;
local default2 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "remotes").default;
local GameSound = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "TS", "sound", "game-sound").GameSound;
local u4 = ConstantManager.registerConstants(script, {
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
    strokeThickness = 1.5
});
local u5 = setmetatable({}, {
    __tostring = function() -- Line: 35, Name: __tostring
        return "ScytheDamageBlockController";
    end,

    __index = KnitController
});
u5.__index = u5;

function u5.new(...) -- Line: 41
    -- upvalues: u5 (ref)
    local v6 = setmetatable({}, u5);

    return v6:constructor(...) or v6;
end;

function u5.constructor(p7) -- Line: 45
    -- upvalues: KnitController (copy)
    KnitController.constructor(p7);
    p7.Name = "ScytheDamageBlockController";
end;

function u5.KnitStart(u8) -- Line: 49
    -- upvalues: KnitController (copy), default2 (copy), SoundManager (copy), GameSound (copy)
    KnitController.KnitStart(u8);
    default2.Client:Get("ScytheBlockDamage"):Connect(function(p9) -- Line: 51
        -- upvalues: SoundManager (ref), GameSound (ref), u8 (copy)
        local PrimaryPart = p9.target.PrimaryPart;

        if PrimaryPart ~= nil then
            PrimaryPart = PrimaryPart.Position;
        end;

        if not PrimaryPart then
            return nil;
        end;

        SoundManager:playSound(GameSound.SCYTHE_SPIRIT_STATE);
        u8:spawnDamageIndicator(PrimaryPart);
    end);
end;

function u5.spawnDamageIndicator(p10, p11, p12) -- Line: 64
    -- upvalues: Workspace (copy), u4 (copy), u2 (copy), default (copy), Linear (copy), TweenService (copy), RuntimeLib (copy), OutQuad (copy), Debris (copy)
    local v13 = (Workspace.CurrentCamera.CFrame.Position - p11).Magnitude > 200;

    if v13 then
        local v14;

        if p12 == nil then
            v14 = p12;
        else
            v14 = p12.infiniteRange;
        end;

        v13 = not v14;
    end;

    if v13 then
        return nil;
    end;

    local Part = Instance.new("Part");
    Part.Name = "DamageIndicatorPart";
    Part.Size = Vector3.new(1, 1, 1);
    Part.Transparency = 1;
    Part.CanCollide = false;
    Part.CanQuery = false;
    Part.CFrame = CFrame.new(p11);
    Part:SetAttribute("FirstPersonVisible", false);
    Part.Anchored = true;
    task.delay(u4.anchoredDuration, function() -- Line: 88
        -- upvalues: Part (copy)
        Part.Anchored = false;
    end);
    local BodyForce = Instance.new("BodyForce");
    local gravityHeal = u4.gravityHeal;
    local v15 = Part:GetMass() * Workspace.Gravity * gravityHeal;
    BodyForce.Force = Vector3.new(0, v15, 0);
    BodyForce.Parent = Part;
    local v16 = math.random(-50, 50) / 100 * u4.velX;
    local v17 = math.random(-50, 50) / 100 * u4.velZ;
    Part.Velocity = Vector3.new(v16, 0, v17);
    local BillboardGui = Instance.new("BillboardGui");
    BillboardGui.Size = UDim2.new(5.88, 0, 2.8, 0);
    BillboardGui.AlwaysOnTop = true;
    local v18;

    if p12 == nil then
        v18 = p12;
    else
        v18 = p12.infiniteRange;
    end;

    BillboardGui.MaxDistance = v18 and (1 / 0) or 100;
    local u19 = u2("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Parent = BillboardGui
    });
    local u20 = nil;
    local v21;

    if p12 == nil then
        v21 = p12;
    else
        v21 = p12.image;
    end;

    if v21 ~= "" and v21 then
        local v22 = {
            BackgroundTransparency = 1
        };
        local v23;

        if p12 == nil then
            v23 = p12;
        else
            v23 = p12.image;
        end;

        v22.Image = v23;
        v22.ImageColor3 = p12.imageColor;
        v22.Position = UDim2.fromScale(0.25, 0.5);
        v22.AnchorPoint = Vector2.new(0, 0.5);
        v22.Size = UDim2.fromScale(0.25, 1);
        v22.Parent = u19;
        u20 = u2("ImageLabel", v22);
        u2("UIAspectRatioConstraint", {
            AspectRatio = 1,
            DominantAxis = Enum.DominantAxis.Width,
            Parent = u20
        });
    end;

    local TextLabel = Instance.new("TextLabel");
    TextLabel.Text = "Miss";
    TextLabel.Size = UDim2.new(0.5, 0, 1, 0);
    TextLabel.BackgroundTransparency = 1;
    TextLabel.BorderSizePixel = 0;
    TextLabel.Font = Enum.Font.GothamBlack;
    TextLabel.Position = UDim2.fromScale(0.5, 0.5);
    TextLabel.AnchorPoint = Vector2.new(0, 0.5);
    TextLabel.TextSize = 25;
    TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
    TextLabel.TextColor3 = Color3.fromRGB(219, 179, 255);
    TextLabel:SetAttribute("FirstPersonVisible", false);
    local v24 = u2("UIStroke", {
        Parent = TextLabel,
        Thickness = u4.strokeThickness,
        Color = Color3.fromRGB(0, 0, 0)
    });
    TextLabel.Parent = u19;
    BillboardGui.Parent = Part;
    Part.Parent = Workspace;
    task.spawn(function() -- Line: 163
        -- upvalues: TextLabel (copy), u19 (copy), u4 (ref), default (ref), Linear (ref)
        local TextSize = TextLabel.TextSize;
        local Size = u19.Size;

        local function _(p25, p26) -- Line: 166
            return UDim2.new(p25.X.Scale * p26, p25.X.Offset * p26, p25.Y.Scale * p26, p25.Y.Offset * p26);
        end;

        local u27 = u4.blowUpSize / TextSize;
        local v34 = default(u4.blowUpDuration, Linear, function(p28) -- Line: 170
            -- upvalues: TextLabel (ref), TextSize (ref), u4 (ref), Size (ref), u27 (copy), u19 (ref)
            TextLabel.TextSize = TextSize * (1 - p28) + p28 * u4.blowUpSize;
            local v29 = Size;
            local v30 = 1 - p28;
            local v31 = UDim2.new(v29.X.Scale * v30, v29.X.Offset * v30, v29.Y.Scale * v30, v29.Y.Offset * v30);
            local v32 = Size;
            local v33 = p28 * u27;
            u19.Size = v31 + UDim2.new(v32.X.Scale * v33, v32.X.Offset * v33, v32.Y.Scale * v33, v32.Y.Offset * v33);
        end, 0, 1);
        v34:Play();
        v34:Wait();
        TextSize = TextLabel.TextSize;
        Size = u19.Size;
        local u35 = u4.textSize / TextSize;
        default(u4.blowUpCompleteDuration, Linear, function(p36) -- Line: 181
            -- upvalues: TextLabel (ref), TextSize (ref), u4 (ref), Size (ref), u35 (copy), u19 (ref)
            TextLabel.TextSize = TextSize * (1 - p36) + p36 * u4.textSize;
            local v37 = Size;
            local v38 = 1 - p36;
            local v39 = UDim2.new(v37.X.Scale * v38, v37.X.Offset * v38, v37.Y.Scale * v38, v37.Y.Offset * v38);
            local v40 = Size;
            local v41 = p36 * u35;
            u19.Size = v39 + UDim2.new(v40.X.Scale * v41, v40.X.Offset * v41, v40.Y.Scale * v41, v40.Y.Offset * v41);
        end, 0, 1):Play();
    end);
    local u42 = TweenService:Create(v24, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Transparency = 1
    });
    RuntimeLib.Promise.delay(u4.anchoredDuration + 0.3):andThen(function() -- Line: 194
        -- upvalues: default (ref), OutQuad (ref), TextLabel (copy), u20 (ref), u42 (copy)
        default(0.2, OutQuad, function(p43) -- Line: 195
            -- upvalues: TextLabel (ref), u20 (ref)
            TextLabel.TextTransparency = p43;

            if u20 then
                u20.ImageTransparency = p43;
            end;
        end, 0, 1);
        u42:Play();
    end);
    Debris:AddItem(Part, 0.5);
end;

KnitClient.CreateController(u5.new());

return nil;